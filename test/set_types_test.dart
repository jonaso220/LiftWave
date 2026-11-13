import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';
import 'package:liftwave/models/models.dart';
import 'package:liftwave/models/session_models.dart';
import 'package:liftwave/services/exercise_records.dart';
import 'package:liftwave/services/progression_service.dart';
import 'package:liftwave/services/workout_summary_service.dart';
import 'package:liftwave/widgets/session_set_row.dart';

void main() {
  Workout workout(DateTime date, List<WorkoutSet> sets) => Workout(
    id: 'w-${date.millisecondsSinceEpoch}',
    name: 'Empuje',
    date: date,
    duration: const Duration(minutes: 40),
    totalVolume: 0,
    exercises: [
      WorkoutExercise(
        id: 'bench',
        name: 'Press banca',
        muscleGroup: 'Pecho',
        sets: sets,
      ),
    ],
  );

  group('storage', () {
    test('a normal set stores no type and old records read as normal', () {
      const normal = WorkoutSet(
        setNumber: 1,
        reps: 8,
        weight: 60,
        completed: true,
      );
      expect(normal.toJson().containsKey('type'), isFalse);
      expect(WorkoutSet.fromJson(normal.toJson()).type, SetType.normal);
      expect(SessionSet(reps: 8).toJson().containsKey('type'), isFalse);
    });

    test(
      'special types round-trip, and an unknown one falls back to normal',
      () {
        for (final type in [SetType.warmup, SetType.drop, SetType.failure]) {
          final set = WorkoutSet(
            setNumber: 1,
            reps: 8,
            weight: 60,
            completed: true,
            type: type,
          );
          expect(WorkoutSet.fromJson(set.toJson()).type, type);
          final session = SessionSet(reps: 8, weight: 60, type: type);
          expect(SessionSet.fromJson(session.toJson()).type, type);
          expect(session.copyWith(reps: 9).type, type);
        }
        expect(
          WorkoutSet.fromJson({
            'setNumber': 1,
            'reps': 8,
            'weight': 60,
            'completed': true,
            'type': 'from-a-newer-build',
          }).type,
          SetType.normal,
        );
      },
    );
  });

  group('warm-ups are logged but are not training work', () {
    const exercise = WorkoutExercise(
      id: 'bench',
      name: 'Press banca',
      muscleGroup: 'Pecho',
      sets: [
        WorkoutSet(
          setNumber: 1,
          reps: 10,
          weight: 40,
          completed: true,
          type: SetType.warmup,
        ),
        WorkoutSet(setNumber: 2, reps: 8, weight: 80, completed: true),
        WorkoutSet(
          setNumber: 3,
          reps: 6,
          weight: 80,
          completed: true,
          type: SetType.failure,
        ),
        WorkoutSet(
          setNumber: 4,
          reps: 10,
          weight: 60,
          completed: true,
          type: SetType.drop,
        ),
      ],
    );

    test('volume counts drop and failure sets, not the warm-up', () {
      expect(exercise.completedSetCount, 4);
      expect(exercise.workingSets, hasLength(3));
      expect(exercise.completedVolume, 80 * 8 + 80 * 6 + 60 * 10);
    });

    test('working sets are numbered from one after the warm-up', () {
      expect(exercise.workingNumberOf(exercise.sets[1]), 1);
      expect(exercise.workingNumberOf(exercise.sets[2]), 2);
      expect(exercise.workingNumberOf(exercise.sets[3]), 3);
    });

    test('the live session follows the same rules', () {
      final session = SessionExercise(
        id: 'bench',
        name: 'Press banca',
        muscleGroup: 'Pecho',
        equipment: 'Barra',
        sets: [
          SessionSet(
            reps: 10,
            weight: 40,
            completed: true,
            type: SetType.warmup,
          ),
          SessionSet(reps: 8, weight: 80, completed: true),
          SessionSet(reps: 8, weight: 80),
        ],
      );
      expect(session.totalVolume, 640);
      expect(session.completedSets, 2);
      expect(session.workingNumberOf(1), 1);
      expect(session.workingNumberOf(2), 2);
    });

    test('a warm-up heavier than the best lift is not a record', () {
      final history = [
        workout(DateTime(2026, 9, 1), const [
          WorkoutSet(setNumber: 1, reps: 5, weight: 80, completed: true),
        ]),
        workout(DateTime(2026, 9, 8), const [
          WorkoutSet(
            setNumber: 1,
            reps: 5,
            weight: 100,
            completed: true,
            type: SetType.warmup,
          ),
          WorkoutSet(setNumber: 2, reps: 5, weight: 70, completed: true),
        ]),
      ];
      expect(ExerciseRecords.of('Press banca', history).heaviest!.weight, 80);

      final records = WorkoutSummaryService.personalRecords(
        exercises: [
          SessionExercise(
            id: 'bench',
            name: 'Press banca',
            muscleGroup: 'Pecho',
            equipment: 'Barra',
            sets: [
              SessionSet(
                reps: 5,
                weight: 120,
                completed: true,
                type: SetType.warmup,
              ),
              SessionSet(reps: 5, weight: 75, completed: true),
            ],
          ),
        ],
        history: history,
      );
      expect(records, isEmpty);
    });

    test('the next-session suggestion is built from the working sets', () {
      final history = [
        workout(DateTime(2026, 9, 8), const [
          WorkoutSet(
            setNumber: 1,
            reps: 3,
            weight: 100,
            completed: true,
            type: SetType.warmup,
          ),
          WorkoutSet(setNumber: 2, reps: 9, weight: 60, completed: true),
          WorkoutSet(setNumber: 3, reps: 9, weight: 60, completed: true),
        ]),
      ];
      final suggestion = ProgressionService.recommend(
        exerciseName: 'Press banca',
        equipment: 'Barra',
        workouts: history,
      );
      expect(suggestion!.previousWeight, 60);
      expect(suggestion.previousReps, 9);

      // A session where the exercise was only warmed up gives no suggestion.
      final onlyWarmup = [
        workout(DateTime(2026, 9, 9), const [
          WorkoutSet(
            setNumber: 1,
            reps: 10,
            weight: 20,
            completed: true,
            type: SetType.warmup,
          ),
        ]),
      ];
      expect(
        ProgressionService.recommend(
          exerciseName: 'Press banca',
          equipment: 'Barra',
          workouts: onlyWarmup,
        ),
        isNull,
      );
    });
  });

  group('editing loads around a warm-up', () {
    SessionExercise session() => SessionExercise(
      id: 'bench',
      name: 'Press banca',
      muscleGroup: 'Pecho',
      equipment: 'Barra',
      sets: [
        SessionSet(reps: 8, weight: 0, type: SetType.warmup),
        SessionSet(reps: 8, weight: 0),
        SessionSet(reps: 8, weight: 0),
      ],
    );

    test('the warm-up load does not spread to the working sets', () {
      final exercise = session();
      exercise.sets[0].weight = 30;
      exercise.propagateEdit(0, previousReps: 8, previousWeight: 0);
      expect(exercise.sets[1].weight, 0);
      expect(exercise.sets[2].weight, 0);
    });

    test('a working load spreads to the working sets only', () {
      final exercise = SessionExercise(
        id: 'bench',
        name: 'Press banca',
        muscleGroup: 'Pecho',
        equipment: 'Barra',
        sets: [
          SessionSet(reps: 8, weight: 0),
          SessionSet(reps: 8, weight: 0, type: SetType.warmup),
          SessionSet(reps: 8, weight: 0),
        ],
      );
      exercise.sets[0].weight = 70;
      exercise.propagateEdit(0, previousReps: 8, previousWeight: 0);
      expect(exercise.sets[1].weight, 0);
      expect(exercise.sets[2].weight, 70);
    });
  });

  testWidgets('the set badge opens the type menu and shows the type letter', (
    tester,
  ) async {
    final set = SessionSet(reps: 8, weight: 60);
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('es'),
        localizationsDelegates: S.localizationsDelegates,
        supportedLocales: S.supportedLocales,
        home: Scaffold(
          body: StatefulBuilder(
            builder: (context, update) => SessionSetRow(
              set: set,
              index: 0,
              number: 1,
              onToggle: () {},
              onChanged: () {},
              onTypeChanged: (type) => update(() => set.type = type),
            ),
          ),
        ),
      ),
    );

    expect(find.text('1'), findsOneWidget);
    await tester.tap(find.text('1'));
    await tester.pumpAndSettle();
    expect(find.text('Calentamiento'), findsOneWidget);
    expect(find.text('Drop set'), findsOneWidget);
    expect(find.text('Al fallo'), findsOneWidget);

    await tester.tap(find.text('Calentamiento'));
    await tester.pumpAndSettle();
    expect(set.type, SetType.warmup);
    expect(find.text('C'), findsOneWidget);
  });
}
