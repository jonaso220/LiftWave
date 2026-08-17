import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:liftwave/data/active_workout_store.dart';
import 'package:liftwave/data/persistent_sync_queue.dart';
import 'package:liftwave/data/custom_template_store.dart';
import 'package:liftwave/data/workout_templates.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';
import 'package:liftwave/l10n/generated/app_localizations_en.dart';
import 'package:liftwave/l10n/generated/app_localizations_es.dart';
import 'package:liftwave/models/models.dart';
import 'package:liftwave/models/progress_models.dart';
import 'package:liftwave/models/session_models.dart';
import 'package:liftwave/models/training_preferences.dart';
import 'package:liftwave/services/progression_service.dart';
import 'package:liftwave/services/rest_timer_controller.dart';
import 'package:liftwave/services/user_data_deletion_service.dart';
import 'package:liftwave/services/weekly_plan_service.dart';
import 'package:liftwave/screens/onboarding/training_preferences_screen.dart';
import 'package:liftwave/screens/history/workout_edit_screen.dart';
import 'package:liftwave/screens/train/routine_builder_screen.dart';
import 'package:liftwave/theme/app_theme.dart';
import 'package:liftwave/utils/csv_exporter.dart';
import 'package:liftwave/utils/exercise_localization.dart';
import 'package:liftwave/utils/routine_days.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test('session volume counts only completed sets', () {
    final exercise = SessionExercise(
      id: 'bench',
      name: 'Bench press',
      muscleGroup: 'Chest',
      equipment: 'Barbell',
      sets: [
        SessionSet(reps: 10, weight: 50, completed: true),
        SessionSet(reps: 8, weight: 60, completed: false),
        SessionSet(reps: 6, weight: 70, completed: true),
      ],
    );

    expect(exercise.totalVolume, 920);
    expect(exercise.completedSets, 2);
  });

  test('only sessions without a saved routine can be saved as one', () {
    expect(WorkoutLaunchSource.freeSession.canSaveAsRoutine, isTrue);
    expect(WorkoutLaunchSource.workoutHistory.canSaveAsRoutine, isTrue);
    expect(WorkoutLaunchSource.savedRoutine.canSaveAsRoutine, isFalse);
    expect(
      WorkoutLaunchSource.fromStorage('savedRoutine'),
      WorkoutLaunchSource.savedRoutine,
    );
    expect(
      WorkoutLaunchSource.fromStorage(null),
      WorkoutLaunchSource.freeSession,
    );
  });

  test('active workout restoration advances only a running timer', () {
    final startedAt = DateTime(2026, 8, 17, 10);
    ActiveWorkoutSnapshot snapshot({required bool running}) =>
        ActiveWorkoutSnapshot(
          timerRunning: running,
          startedAt: startedAt,
          elapsedSeconds: 75,
          workoutName: 'Rutina',
          routineDay: RoutineDay.monday.storageKey,
          routineOrder: 1,
          launchSource: WorkoutLaunchSource.savedRoutine,
          exercises: const [],
        );

    expect(
      snapshot(
        running: true,
      ).elapsedAt(startedAt.add(const Duration(minutes: 3))),
      180,
    );
    expect(
      snapshot(
        running: false,
      ).elapsedAt(startedAt.add(const Duration(minutes: 3))),
      75,
    );
  });

  test('history metrics and CSV ignore unfinished sets', () {
    final workout = Workout(
      id: 'completed-only',
      name: 'Session',
      date: DateTime(2026, 7, 13),
      duration: const Duration(minutes: 30),
      exercises: const [
        WorkoutExercise(
          id: 'bench',
          name: 'Press de banca',
          muscleGroup: 'Pecho',
          sets: [
            WorkoutSet(setNumber: 1, reps: 10, weight: 50, completed: true),
            WorkoutSet(setNumber: 2, reps: 8, weight: 80, completed: false),
          ],
        ),
        WorkoutExercise(
          id: 'row',
          name: 'Remo con barra',
          muscleGroup: 'Espalda',
          sets: [
            WorkoutSet(setNumber: 1, reps: 10, weight: 60, completed: false),
          ],
        ),
      ],
      totalVolume: 500,
    );

    expect(workout.totalSets, 1);
    expect(workout.completedExerciseCount, 1);
    final csv = CsvExporter.buildCsv([workout], 'header');
    expect(csv, contains(',1,10,50.0,500'));
    expect(csv, isNot(contains(',2,8,80.0,640')));
  });

  test('legacy workouts still treat their stored sets as completed', () {
    final workout = Workout.fromJson({
      'id': 'legacy',
      'name': 'Legacy',
      'date': '2026-07-13T10:00:00.000',
      'durationSeconds': 1200,
      'totalVolume': 1000,
      'exercises': [
        {
          'id': 'legacy-exercise',
          'name': 'Press de banca',
          'muscleGroup': 'Pecho',
          'sets': [
            {'setNumber': 1, 'reps': 10, 'weight': 100},
          ],
        },
      ],
    });

    expect(workout.totalSets, 1);
    expect(workout.totalVolume, 1000);
    expect(
      workout.exercises.single.isSetEffectivelyCompleted(
        workout.exercises.single.sets.single,
      ),
      isTrue,
    );
  });

  test('legacy routine names are grouped by weekday and ordinal', () {
    expect(routineDayFromName('1er biserie Martes julio'), RoutineDay.tuesday);
    expect(
      routineDayFromName('4ta bi serie jueves julio'),
      RoutineDay.thursday,
    );
    expect(routineOrderFromName('2do. Circuito martes'), 2);
    expect(routineOrderFromName('Rutina sin número'), 999);
  });

  test('explicit routine day wins over legacy name and completion date', () {
    final resolved = routineDayForWorkout(
      storedDay: RoutineDay.thursday.storageKey,
      name: 'Circuito martes',
      date: DateTime(2026, 7, 27),
    );

    expect(resolved, RoutineDay.thursday);
  });

  test('history day groups routines but leaves free sessions unassigned', () {
    expect(
      routineDayForHistoryGrouping(
        storedDay: RoutineDay.tuesday.storageKey,
        name: 'Entrenamiento libre',
      ),
      RoutineDay.tuesday,
    );
    expect(
      routineDayForHistoryGrouping(storedDay: null, name: 'Rutina del jueves'),
      RoutineDay.thursday,
    );
    expect(
      routineDayForHistoryGrouping(
        storedDay: null,
        name: 'Entrenamiento libre',
      ),
      isNull,
    );
  });

  test('routine progress marks only blocks with completed sets', () {
    final workout = Workout(
      id: 'partial-monday',
      name: 'Rutina del lunes',
      date: DateTime(2026, 8, 17),
      duration: const Duration(minutes: 30),
      routineDay: RoutineDay.monday.storageKey,
      exercises: const [
        WorkoutExercise(
          id: 'completed-block',
          name: 'Press de banca',
          muscleGroup: 'Pecho',
          routineBlockName: 'Rutina 1',
          sets: [
            WorkoutSet(setNumber: 1, reps: 10, weight: 40, completed: true),
          ],
        ),
        WorkoutExercise(
          id: 'pending-block',
          name: 'Remo con barra',
          muscleGroup: 'Espalda',
          routineBlockName: 'Rutina 2',
          sets: [
            WorkoutSet(setNumber: 1, reps: 10, weight: 40, completed: false),
          ],
        ),
      ],
      totalVolume: 400,
    );

    expect(
      routineBlockWasCompleted(
        day: RoutineDay.monday,
        blockName: 'Rutina 1',
        blockOrder: 1,
        workouts: [workout],
        now: DateTime(2026, 8, 20),
      ),
      isTrue,
    );
    expect(
      routineBlockWasCompleted(
        day: RoutineDay.monday,
        blockName: 'Rutina 2',
        blockOrder: 2,
        workouts: [workout],
        now: DateTime(2026, 8, 20),
      ),
      isFalse,
    );
  });

  test('routine progress supports legacy single-block workout metadata', () {
    final workout = Workout(
      id: 'legacy-block',
      name: 'Nombre anterior',
      date: DateTime(2026, 8, 17),
      duration: const Duration(minutes: 20),
      routineDay: RoutineDay.monday.storageKey,
      routineOrder: 2,
      exercises: const [
        WorkoutExercise(
          id: 'legacy-exercise',
          name: 'Sentadilla',
          muscleGroup: 'Piernas',
          sets: [
            WorkoutSet(setNumber: 1, reps: 8, weight: 50, completed: true),
          ],
        ),
      ],
      totalVolume: 400,
    );

    expect(
      routineBlockWasCompleted(
        day: RoutineDay.monday,
        blockName: 'Rutina 2',
        blockOrder: 2,
        workouts: [workout],
        now: DateTime(2026, 8, 20),
      ),
      isTrue,
    );
  });

  test('routine progress resets at Monday calendar-week boundaries', () {
    Workout completedOn(DateTime date) => Workout(
      id: date.toIso8601String(),
      name: 'Rutina 1',
      date: date,
      duration: const Duration(minutes: 20),
      routineDay: RoutineDay.monday.storageKey,
      routineOrder: 1,
      exercises: const [
        WorkoutExercise(
          id: 'exercise',
          name: 'Sentadilla',
          muscleGroup: 'Piernas',
          sets: [
            WorkoutSet(setNumber: 1, reps: 8, weight: 50, completed: true),
          ],
        ),
      ],
      totalVolume: 400,
    );

    final previousSunday = completedOn(DateTime(2026, 8, 16, 23, 59));
    final currentMonday = completedOn(DateTime(2026, 8, 17));
    final currentSunday = completedOn(DateTime(2026, 8, 23, 23, 59));
    final nextMonday = completedOn(DateTime(2026, 8, 24));

    bool wasCompleted(Iterable<Workout> workouts) => routineBlockWasCompleted(
      day: RoutineDay.monday,
      blockName: 'Rutina 1',
      blockOrder: 1,
      workouts: workouts,
      now: DateTime(2026, 8, 20),
    );

    expect(wasCompleted([previousSunday, nextMonday]), isFalse);
    expect(wasCompleted([currentMonday]), isTrue);
    expect(wasCompleted([currentSunday]), isTrue);
    expect(wasCompleted([previousSunday, currentMonday, nextMonday]), isTrue);
  });

  testWidgets('empty routine call to action is fully tappable', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.dark,
        localizationsDelegates: S.localizationsDelegates,
        supportedLocales: S.supportedLocales,
        home: const RoutineBuilderScreen(initialName: 'Rutina nueva'),
      ),
    );

    final emptyHint = find.text(SEn().train_addFirstExerciseHint);
    final tappableArea = find.ancestor(
      of: emptyHint,
      matching: find.byType(InkWell),
    );

    expect(emptyHint, findsOneWidget);
    expect(tappableArea, findsOneWidget);
    expect(tester.widget<InkWell>(tappableArea).onTap, isNotNull);
  });

  testWidgets('editing a routine preserves its id and planned values', (
    tester,
  ) async {
    final template = CustomTemplate(
      id: 'saved-routine',
      name: 'Rutina original',
      routineDay: RoutineDay.monday.storageKey,
      routineOrder: 2,
      exercises: const [
        TemplateExercise(
          name: 'Press de banca',
          muscleGroup: 'Pecho',
          equipment: 'Barra',
          sets: 4,
          reps: 8,
          weight: 20,
        ),
      ],
    );
    CustomTemplate? result;

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('es'),
        theme: AppTheme.dark,
        localizationsDelegates: S.localizationsDelegates,
        supportedLocales: S.supportedLocales,
        home: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () async {
              result = await Navigator.push<CustomTemplate>(
                context,
                MaterialPageRoute(
                  builder: (_) => RoutineBuilderScreen(
                    initialName: template.name,
                    initialDay: RoutineDay.monday,
                    routineOrder: template.routineOrder,
                    initialTemplate: template,
                  ),
                ),
              );
            },
            child: const Text('Abrir'),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Abrir'));
    await tester.pumpAndSettle();
    expect(find.text(SEs().train_editRoutine), findsOneWidget);
    expect(find.text('4'), findsOneWidget);
    expect(find.text('8'), findsOneWidget);

    await tester.enterText(find.byType(TextField).first, 'Rutina actualizada');
    await tester.tap(find.widgetWithText(ElevatedButton, SEs().common_save));
    await tester.pumpAndSettle();

    expect(result, isNotNull);
    expect(result!.id, template.id);
    expect(result!.name, 'Rutina actualizada');
    expect(result!.routineOrder, 2);
    expect(result!.exercises.single.sets, 4);
    expect(result!.exercises.single.reps, 8);
  });

  testWidgets('routine builder confirms before discarding changes', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('es'),
        theme: AppTheme.dark,
        localizationsDelegates: S.localizationsDelegates,
        supportedLocales: S.supportedLocales,
        home: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () => Navigator.push<void>(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    const RoutineBuilderScreen(initialName: 'Rutina nueva'),
              ),
            ),
            child: const Text('Abrir'),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Abrir'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField).first, 'Rutina cambiada');

    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.text(SEs().common_discardChangesTitle), findsOneWidget);
    await tester.tap(find.text(SEs().common_keepEditing));
    await tester.pumpAndSettle();
    expect(find.text(SEs().train_createRoutine), findsOneWidget);
  });

  testWidgets('history editor confirms before discarding changes', (
    tester,
  ) async {
    final workout = Workout(
      id: 'history-edit',
      name: 'Rutina',
      date: DateTime(2026, 8, 17),
      duration: const Duration(minutes: 20),
      totalVolume: 400,
      exercises: const [
        WorkoutExercise(
          id: 'bench',
          name: 'Press de banca',
          muscleGroup: 'Pecho',
          sets: [
            WorkoutSet(setNumber: 1, reps: 10, weight: 40, completed: true),
          ],
        ),
      ],
    );
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('es'),
        theme: AppTheme.dark,
        localizationsDelegates: S.localizationsDelegates,
        supportedLocales: S.supportedLocales,
        home: Builder(
          builder: (context) => ElevatedButton(
            onPressed: () => Navigator.push<void>(
              context,
              MaterialPageRoute(
                builder: (_) => WorkoutEditScreen(workout: workout),
              ),
            ),
            child: const Text('Abrir'),
          ),
        ),
      ),
    );
    await tester.tap(find.text('Abrir'));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField).first, 'Nota corregida');

    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.text(SEs().common_discardChangesTitle), findsOneWidget);
  });

  test('routine metadata and block names survive workout serialization', () {
    final workout = Workout(
      id: 'routine-workout',
      name: 'Rutina del martes',
      date: DateTime(2026, 7, 28),
      duration: const Duration(minutes: 40),
      routineDay: RoutineDay.tuesday.storageKey,
      exercises: const [
        WorkoutExercise(
          id: 'squat',
          name: 'Sentadilla',
          muscleGroup: 'Piernas',
          routineBlockName: '1er biserie',
          sets: [
            WorkoutSet(setNumber: 1, reps: 10, weight: 20, completed: true),
          ],
        ),
      ],
      totalVolume: 200,
    );

    final restored = Workout.fromJson(workout.toJson());
    expect(restored.routineDay, RoutineDay.tuesday.storageKey);
    expect(restored.exercises.single.routineBlockName, '1er biserie');
  });

  test('custom routine organization remains backward compatible', () {
    final legacy = CustomTemplate.fromJson({
      'id': 'legacy-template',
      'name': '2do circuito martes',
      'exercises': <Map<String, Object>>[],
    });
    final organized = legacy.copyWith(
      routineDay: RoutineDay.tuesday.storageKey,
      routineOrder: 2,
    );
    final restored = CustomTemplate.fromJson(organized.toJson());

    expect(legacy.routineDay, isNull);
    expect(restored.routineDay, RoutineDay.tuesday.storageKey);
    expect(restored.routineOrder, 2);
  });

  test('planned routines can be saved without completing a workout', () {
    final planned = CustomTemplate(
      id: 'planned-tuesday',
      name: 'Martes fuerza',
      routineDay: RoutineDay.tuesday.storageKey,
      routineOrder: 3,
      exercises: const [
        TemplateExercise(
          name: 'Press de banca',
          muscleGroup: 'Pecho',
          equipment: 'Barra',
          sets: 4,
          reps: 8,
          weight: 0,
        ),
      ],
    );

    final restored = CustomTemplate.fromJson(planned.toJson());
    expect(restored.routineDay, RoutineDay.tuesday.storageKey);
    expect(restored.routineOrder, 3);
    expect(restored.exercises.single.sets, 4);
    expect(restored.exercises.single.reps, 8);
  });

  test('exercise content uses localized display values', () {
    final l10n = SEn();
    expect(ExerciseLocalization.name(l10n, 'Press de banca'), 'Bench Press');
    expect(
      ExerciseLocalization.name(l10n, 'Sentadilla búlgara'),
      'Bulgarian Split Squat',
    );
    expect(ExerciseLocalization.muscle(l10n, 'Piernas'), 'Legs');
    expect(ExerciseLocalization.equipment(l10n, 'Cajón'), 'Plyo Box');
    expect(
      ExerciseLocalization.description(
        l10n,
        'Descripción escrita por el usuario',
        id: 'custom-user-exercise',
      ),
      'Descripción escrita por el usuario',
    );
  });

  test('built-in routines never prescribe an unverified starting weight', () {
    final weights = workoutTemplates
        .expand((template) => template.exercises)
        .map((exercise) => exercise.weight);
    expect(weights, everyElement(0));
  });

  testWidgets('rest timer finishes on the zero tick', (tester) async {
    final timer = RestTimerController.instance;
    var now = DateTime(2026, 7, 13, 12);
    timer.setClockForTesting(() => now);
    timer.dismiss();
    timer.startWithDefault(seconds: 1);
    now = now.add(const Duration(seconds: 1));
    await tester.pump(const Duration(seconds: 1));

    expect(timer.remaining, 0);
    expect(timer.isRunning, isFalse);
    expect(timer.hasFinished, isTrue);
    timer.dismiss();
    timer.setClockForTesting(null);
  });

  test('account cleanup removes user caches and referenced photos', () async {
    SharedPreferences.setMockInitialValues({});
    final directory = await Directory.systemTemp.createTemp('liftwave-delete');
    final photo = File('${directory.path}/progress.jpg');
    await photo.writeAsString('private');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('body_measurements_user-1', [
      jsonEncode({'id': 'm1', 'photoPath': photo.path}),
    ]);
    await prefs.setString('workouts_cache_user-1', '[]');
    await prefs.setString('workouts_sync_queue_user-1', '[]');

    await UserDataDeletionService.deleteLocalData('user-1');

    expect(await photo.exists(), isFalse);
    expect(prefs.containsKey('body_measurements_user-1'), isFalse);
    expect(prefs.containsKey('workouts_cache_user-1'), isFalse);
    expect(prefs.containsKey('workouts_sync_queue_user-1'), isFalse);
    await directory.delete(recursive: true);
  });

  test('authoritative cloud merge does not resurrect cache-only records', () {
    final resolved = mergeAuthoritativeCloudWithPending<String>(
      cloud: const {'cloud': 'remote value'},
      pending: const [],
      decode: (payload) => payload['value'] as String,
    );

    expect(resolved, {'cloud': 'remote value'});
    expect(resolved.containsKey('stale-local-record'), isFalse);
  });

  test('saved workout volume can be recalculated from completed sets', () {
    final workout = Workout(
      id: 'workout-1',
      name: 'Push',
      date: DateTime(2026, 7, 13),
      duration: const Duration(minutes: 45),
      exercises: const [
        WorkoutExercise(
          id: 'bench',
          name: 'Bench press',
          muscleGroup: 'Chest',
          sets: [
            WorkoutSet(setNumber: 1, reps: 10, weight: 50, completed: true),
            WorkoutSet(setNumber: 2, reps: 8, weight: 60, completed: false),
          ],
        ),
      ],
      totalVolume: 500,
    );

    expect(workout.calculatedVolume, 500);
  });

  test('incorrect stored volume is repaired when completion data exists', () {
    final workout = Workout.fromJson({
      'id': 'workout-2',
      'name': 'Pull',
      'date': '2026-07-13T12:00:00.000',
      'durationSeconds': 1800,
      'totalVolume': 9999,
      'exercises': [
        {
          'id': 'row',
          'name': 'Row',
          'muscleGroup': 'Back',
          'sets': [
            {'setNumber': 1, 'reps': 10, 'weight': 40, 'completed': true},
            {'setNumber': 2, 'reps': 10, 'weight': 50, 'completed': false},
          ],
        },
      ],
    });

    expect(workout.totalVolume, 400);
  });

  test('legacy workout volume is retained without completion flags', () {
    final workout = Workout.fromJson({
      'id': 'legacy-workout',
      'name': 'Legacy',
      'date': '2025-01-01T12:00:00.000',
      'durationSeconds': 1800,
      'totalVolume': 1200,
      'exercises': [
        {
          'id': 'squat',
          'name': 'Squat',
          'muscleGroup': 'Legs',
          'sets': [
            {'setNumber': 1, 'reps': 10, 'weight': 60},
          ],
        },
      ],
    });

    expect(workout.totalVolume, 1200);
    expect(workout.exercises.single.sets.single.completionRecorded, isFalse);
  });

  test('progress photos stay local and local paths are not sent to cloud', () {
    final legacy = BodyMeasurement.fromJson({
      'id': 'measurement-1',
      'date': '2026-07-13T12:00:00.000',
      'weight': 80,
      'photoPath': '/local/photo.jpg',
    });

    expect(legacy.hasPhoto, isTrue);
    expect(legacy.toCloudJson().containsKey('photoPath'), isFalse);
  });

  test(
    'sync queue keeps the latest mutation and protects newer writes',
    () async {
      SharedPreferences.setMockInitialValues({});
      final queue = PersistentSyncQueue('test_sync_queue');

      await queue.enqueueUpsert('workout-1', {'value': 1});
      final stale = (await queue.load()).single;
      await queue.enqueueUpsert('workout-1', {'value': 2});
      await queue.removeIfCurrent(stale);

      var current = (await queue.load()).single;
      expect(current.payload?['value'], 2);

      await queue.enqueueDelete('workout-1');
      current = (await queue.load()).single;
      expect(current.type, PendingMutationType.delete);
    },
  );

  group('progression recommendations', () {
    Workout workout({
      required String id,
      required DateTime date,
      required List<WorkoutSet> sets,
    }) {
      return Workout(
        id: id,
        name: 'Push',
        date: date,
        duration: const Duration(minutes: 45),
        exercises: [
          WorkoutExercise(
            id: 'bench',
            name: 'Bench Press',
            muscleGroup: 'Chest',
            sets: sets,
          ),
        ],
        totalVolume: 0,
      );
    }

    test('uses the latest completed working sets and ignores warmups', () {
      final older = workout(
        id: 'older',
        date: DateTime(2026, 7, 1),
        sets: const [
          WorkoutSet(setNumber: 1, reps: 8, weight: 40, completed: true),
        ],
      );
      final latest = workout(
        id: 'latest',
        date: DateTime(2026, 7, 12),
        sets: const [
          WorkoutSet(setNumber: 1, reps: 10, weight: 20, completed: true),
          WorkoutSet(setNumber: 2, reps: 12, weight: 50, completed: true),
          WorkoutSet(setNumber: 3, reps: 12, weight: 50, completed: true),
          WorkoutSet(setNumber: 4, reps: 15, weight: 60, completed: false),
        ],
      );

      final result = ProgressionService.recommend(
        exerciseName: '  bench   press ',
        equipment: 'Barbell',
        workouts: [older, latest],
      );

      expect(result, isNotNull);
      expect(result!.previousWeight, 50);
      expect(result.suggestedWeight, 52.5);
      expect(result.suggestedReps, ProgressionService.targetMinReps);
      expect(result.action, ProgressionAction.increaseLoad);
    });

    test('adds one repetition while inside the target range', () {
      final result = ProgressionService.recommend(
        exerciseName: 'Bench Press',
        equipment: 'Dumbbells',
        workouts: [
          workout(
            id: 'latest',
            date: DateTime(2026, 7, 12),
            sets: const [
              WorkoutSet(setNumber: 1, reps: 10, weight: 30, completed: true),
              WorkoutSet(setNumber: 2, reps: 9, weight: 30, completed: true),
            ],
          ),
        ],
      );

      expect(result!.suggestedWeight, 30);
      expect(result.suggestedReps, 10);
      expect(result.action, ProgressionAction.addRepetition);
    });

    test('keeps the load when the target minimum was not reached', () {
      final result = ProgressionService.recommend(
        exerciseName: 'Bench Press',
        equipment: 'Dumbbells',
        workouts: [
          workout(
            id: 'latest',
            date: DateTime(2026, 7, 12),
            sets: const [
              WorkoutSet(setNumber: 1, reps: 7, weight: 30, completed: true),
              WorkoutSet(setNumber: 2, reps: 6, weight: 30, completed: true),
            ],
          ),
        ],
      );

      expect(result!.suggestedWeight, 30);
      expect(result.suggestedReps, 6);
      expect(result.action, ProgressionAction.consolidateLoad);
    });

    test('skips sessions without completed sets and handles bodyweight', () {
      final result = ProgressionService.recommend(
        exerciseName: 'Bench Press',
        equipment: 'Bodyweight',
        workouts: [
          workout(
            id: 'incomplete',
            date: DateTime(2026, 7, 12),
            sets: const [
              WorkoutSet(setNumber: 1, reps: 20, weight: 0, completed: false),
            ],
          ),
          workout(
            id: 'completed',
            date: DateTime(2026, 7, 10),
            sets: const [
              WorkoutSet(setNumber: 1, reps: 10, weight: 0, completed: true),
              WorkoutSet(setNumber: 2, reps: 12, weight: 0, completed: true),
            ],
          ),
        ],
      );

      expect(result!.suggestedWeight, 0);
      expect(result.suggestedReps, 11);
      expect(result.action, ProgressionAction.bodyweightRepetition);
    });
  });

  group('training preferences', () {
    test('round-trips stable values for per-user persistence', () {
      const preferences = TrainingPreferences(
        goal: TrainingGoal.muscleGain,
        experience: ExperienceLevel.intermediate,
        daysPerWeek: 4,
        equipment: {TrainingEquipment.dumbbells, TrainingEquipment.barbell},
      );

      final restored = TrainingPreferences.fromJson(preferences.toJson());

      expect(restored.goal, TrainingGoal.muscleGain);
      expect(restored.experience, ExperienceLevel.intermediate);
      expect(restored.daysPerWeek, 4);
      expect(restored.equipment, {
        TrainingEquipment.dumbbells,
        TrainingEquipment.barbell,
      });
    });

    test('repairs unsupported or incomplete preference data safely', () {
      final restored = TrainingPreferences.fromJson({
        'goal': 'unknown',
        'experience': 'unknown',
        'daysPerWeek': 12,
        'equipment': ['unknown'],
      });

      expect(restored.goal, TrainingGoal.generalFitness);
      expect(restored.experience, ExperienceLevel.beginner);
      expect(restored.daysPerWeek, 7);
      expect(restored.equipment, {TrainingEquipment.noEquipment});
    });

    testWidgets('onboarding exposes each preference step', (tester) async {
      const initial = TrainingPreferences(
        goal: TrainingGoal.generalFitness,
        experience: ExperienceLevel.beginner,
        daysPerWeek: 3,
        equipment: {TrainingEquipment.noEquipment},
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: AppTheme.dark,
          locale: const Locale('es'),
          localizationsDelegates: S.localizationsDelegates,
          supportedLocales: S.supportedLocales,
          home: const TrainingPreferencesScreen(initialPreferences: initial),
        ),
      );

      expect(find.text('¿Cuál es tu objetivo principal?'), findsOneWidget);
      await tester.tap(find.text('Continuar'));
      await tester.pumpAndSettle();
      expect(find.text('¿Cuál es tu experiencia?'), findsOneWidget);

      await tester.tap(find.text('Continuar'));
      await tester.pumpAndSettle();
      expect(find.text('¿Cuántos días puedes entrenar?'), findsOneWidget);

      await tester.tap(find.text('Continuar'));
      await tester.pumpAndSettle();
      expect(find.text('¿Qué equipamiento tienes?'), findsOneWidget);
      expect(find.text('Guardar y empezar'), findsOneWidget);
    });
  });

  group('adaptive weekly plan', () {
    const preferences = TrainingPreferences(
      goal: TrainingGoal.generalFitness,
      experience: ExperienceLevel.beginner,
      daysPerWeek: 3,
      equipment: {TrainingEquipment.noEquipment},
    );

    Workout workout({
      required String id,
      required DateTime date,
      required List<WorkoutExercise> exercises,
    }) {
      return Workout(
        id: id,
        name: 'Session',
        date: date,
        duration: const Duration(minutes: 40),
        exercises: exercises,
        totalVolume: 0,
      );
    }

    test('calculates adherence and muscle sets from the current week', () {
      final current = workout(
        id: 'current',
        date: DateTime(2026, 7, 14),
        exercises: const [
          WorkoutExercise(
            id: 'pushups',
            name: 'Push-ups',
            muscleGroup: 'Pecho',
            sets: [
              WorkoutSet(setNumber: 1, reps: 12, weight: 0, completed: true),
              WorkoutSet(setNumber: 2, reps: 10, weight: 0, completed: false),
            ],
          ),
        ],
      );
      final previous = workout(
        id: 'previous',
        date: DateTime(2026, 7, 10),
        exercises: const [
          WorkoutExercise(
            id: 'squat',
            name: 'Squat',
            muscleGroup: 'Piernas',
            sets: [
              WorkoutSet(setNumber: 1, reps: 10, weight: 20, completed: true),
            ],
          ),
        ],
      );

      final plan = WeeklyPlanService.build(
        preferences: preferences,
        workouts: [previous, current],
        exerciseLibrary: const [
          Exercise(
            id: 'bodyweight-chest',
            name: 'Push-ups',
            muscleGroup: 'Pecho',
            equipment: 'Peso corporal',
            difficulty: 'Principiante',
            description: '',
          ),
        ],
        now: DateTime(2026, 7, 15),
        planName: 'Adaptive session',
      );

      expect(plan.completedWorkouts, 1);
      expect(plan.remainingWorkouts, 2);
      expect(plan.adherence, closeTo(1 / 3, 0.001));
      expect(plan.completedSetsByMuscle['Pecho'], 1);
      expect(plan.completedSetsByMuscle.containsKey('Piernas'), isFalse);
    });

    test('creates a conservative session compatible with equipment', () {
      final plan = WeeklyPlanService.build(
        preferences: preferences,
        workouts: const [],
        exerciseLibrary: const [
          Exercise(
            id: 'bodyweight-chest',
            name: 'Push-ups',
            muscleGroup: 'Pecho',
            equipment: 'Peso corporal',
            difficulty: 'Principiante',
            description: '',
          ),
          Exercise(
            id: 'advanced-back',
            name: 'Advanced row',
            muscleGroup: 'Espalda',
            equipment: 'Peso corporal',
            difficulty: 'Avanzado',
            description: '',
          ),
          Exercise(
            id: 'barbell-legs',
            name: 'Squat',
            muscleGroup: 'Piernas',
            equipment: 'Barra',
            difficulty: 'Principiante',
            description: '',
          ),
          Exercise(
            id: 'bodyweight-core',
            name: 'Plancha',
            muscleGroup: 'Core',
            equipment: 'Peso corporal',
            difficulty: 'Principiante',
            description: '',
          ),
        ],
        now: DateTime(2026, 7, 15),
        planName: 'Adaptive session',
      );

      expect(plan.nextWorkout, isNotNull);
      expect(
        plan.nextWorkout!.exercises.map((exercise) => exercise.name),
        containsAll(['Push-ups', 'Plancha']),
      );
      expect(
        plan.nextWorkout!.exercises.every(
          (exercise) =>
              exercise.equipment == 'Peso corporal' &&
              exercise.sets == 2 &&
              exercise.weight == 0,
        ),
        isTrue,
      );
      expect(
        plan.nextWorkout!.exercises.any(
          (exercise) => exercise.name == 'Advanced row',
        ),
        isFalse,
      );
    });

    test('stops recommending sessions after reaching the weekly target', () {
      final completed = List.generate(
        3,
        (index) => workout(
          id: 'workout-$index',
          date: DateTime(2026, 7, 13 + index),
          exercises: const [
            WorkoutExercise(
              id: 'completed-set',
              name: 'Push-ups',
              muscleGroup: 'Pecho',
              sets: [
                WorkoutSet(setNumber: 1, reps: 10, weight: 0, completed: true),
              ],
            ),
          ],
        ),
      );

      final plan = WeeklyPlanService.build(
        preferences: preferences,
        workouts: completed,
        exerciseLibrary: const [],
        now: DateTime(2026, 7, 15),
        planName: 'Adaptive session',
      );

      expect(plan.targetReached, isTrue);
      expect(plan.remainingWorkouts, 0);
      expect(plan.nextWorkout, isNull);
    });

    test('does not count workouts without a completed set', () {
      final empty = workout(
        id: 'empty',
        date: DateTime(2026, 7, 15),
        exercises: const [
          WorkoutExercise(
            id: 'planned',
            name: 'Push-ups',
            muscleGroup: 'Pecho',
            sets: [WorkoutSet(setNumber: 1, reps: 10, weight: 0)],
          ),
        ],
      );

      final plan = WeeklyPlanService.build(
        preferences: preferences,
        workouts: [empty],
        exerciseLibrary: const [],
        now: DateTime(2026, 7, 15),
        planName: 'Adaptive session',
      );

      expect(plan.completedWorkouts, 0);
      expect(plan.remainingWorkouts, 3);
    });

    test('adapts sets and repetitions to goal and experience', () {
      const strengthPreferences = TrainingPreferences(
        goal: TrainingGoal.strength,
        experience: ExperienceLevel.advanced,
        daysPerWeek: 2,
        equipment: {TrainingEquipment.barbell},
      );

      final plan = WeeklyPlanService.build(
        preferences: strengthPreferences,
        workouts: const [],
        exerciseLibrary: const [
          Exercise(
            id: 'barbell-squat',
            name: 'Squat',
            muscleGroup: 'Piernas',
            equipment: 'Barra',
            difficulty: 'Intermedio',
            description: '',
          ),
        ],
        now: DateTime(2026, 7, 15),
        planName: 'Adaptive session',
      );

      final exercise = plan.nextWorkout!.exercises.single;
      expect(exercise.sets, 4);
      expect(exercise.reps, 5);
      expect(exercise.weight, 0);
    });
  });
}
