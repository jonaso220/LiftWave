import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';
import 'package:liftwave/models/models.dart';
import 'package:liftwave/models/session_models.dart';
import 'package:liftwave/services/progression_service.dart';
import 'package:liftwave/services/rest_timer_controller.dart';
import 'package:liftwave/widgets/session_set_row.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('which exercises are timed', () {
    test('holds and carries by default, everything else by repetitions', () {
      expect(isTimedByDefault('Plancha'), isTrue);
      expect(isTimedByDefault('Plancha lateral'), isTrue);
      expect(isTimedByDefault('Hollow hold'), isTrue);
      expect(isTimedByDefault("Farmer's Carry"), isTrue);
      expect(isTimedByDefault('Press de banca'), isFalse);
      expect(isTimedByDefault('Mi ejercicio'), isFalse);
    });

    test('a saved exercise follows its default unless the user chose', () {
      const plank = WorkoutExercise(
        id: 'p',
        name: 'Plancha',
        muscleGroup: 'Core',
        sets: [WorkoutSet(setNumber: 1, reps: 60, weight: 0, completed: true)],
      );
      expect(plank.timed, isTrue);
      expect(plank.toJson().containsKey('timed'), isFalse);

      const wallSit = WorkoutExercise(
        id: 'w',
        name: 'Sentadilla isométrica',
        muscleGroup: 'Piernas',
        timedOverride: true,
        sets: [WorkoutSet(setNumber: 1, reps: 45, weight: 0, completed: true)],
      );
      expect(wallSit.timed, isTrue);
      expect(WorkoutExercise.fromJson(wallSit.toJson()).timed, isTrue);

      const countedPlank = WorkoutExercise(
        id: 'p',
        name: 'Plancha',
        muscleGroup: 'Core',
        timedOverride: false,
        sets: [WorkoutSet(setNumber: 1, reps: 20, weight: 0, completed: true)],
      );
      expect(WorkoutExercise.fromJson(countedPlank.toJson()).timed, isFalse);
    });

    test(
      'the live exercise saves the choice only when it is not the default',
      () {
        final plank = SessionExercise(
          id: 'p',
          name: 'Plancha',
          muscleGroup: 'Core',
          equipment: 'Sin material',
          sets: [SessionSet(reps: 60)],
        );
        expect(plank.timed, isTrue);
        expect(plank.timedOverride, isNull);
        plank.timed = false;
        expect(plank.timedOverride, isFalse);

        final bench = SessionExercise(
          id: 'b',
          name: 'Press de banca',
          muscleGroup: 'Pecho',
          equipment: 'Barra',
          sets: [SessionSet(reps: 8)],
        );
        expect(bench.timed, isFalse);
        bench.timed = true;
        expect(bench.timedOverride, isTrue);
        expect(SessionExercise.fromJson(bench.toJson()).timed, isTrue);
      },
    );
  });

  test('a weighted hold adds no volume: its seconds are not repetitions', () {
    const weightedPlank = WorkoutExercise(
      id: 'p',
      name: 'Plancha',
      muscleGroup: 'Core',
      sets: [WorkoutSet(setNumber: 1, reps: 60, weight: 10, completed: true)],
    );
    expect(weightedPlank.completedVolume, 0);

    final session = SessionExercise(
      id: 'p',
      name: 'Plancha',
      muscleGroup: 'Core',
      equipment: 'Sin material',
      sets: [SessionSet(reps: 60, weight: 10, completed: true)],
    );
    expect(session.totalVolume, 0);
    session.timed = false;
    expect(session.totalVolume, 600);
  });

  test('the suggestion for a hold is a few seconds more, same load', () {
    final history = [
      Workout(
        id: 'w1',
        name: 'Core',
        date: DateTime(2026, 9, 8),
        duration: const Duration(minutes: 20),
        totalVolume: 0,
        exercises: const [
          WorkoutExercise(
            id: 'p',
            name: 'Plancha',
            muscleGroup: 'Core',
            sets: [
              WorkoutSet(setNumber: 1, reps: 60, weight: 0, completed: true),
              WorkoutSet(setNumber: 2, reps: 45, weight: 0, completed: true),
              WorkoutSet(setNumber: 3, reps: 90, weight: 0, completed: false),
            ],
          ),
        ],
      ),
    ];
    final suggestion = ProgressionService.recommend(
      exerciseName: 'Plancha',
      equipment: 'Sin material',
      workouts: history,
      timed: true,
    );
    expect(suggestion!.action, ProgressionAction.holdLonger);
    // The shortest completed hold is the one to beat.
    expect(suggestion.previousReps, 45);
    expect(suggestion.suggestedReps, 50);
    expect(suggestion.suggestedWeight, 0);
  });

  group('hold countdown', () {
    final timer = RestTimerController.instance;
    late DateTime now;

    setUp(() {
      now = DateTime(2026, 11, 12, 10);
      timer.setClockForTesting(() => now);
      timer.dismiss();
      timer.selectPreset(RestTimerController.defaultRestSeconds);
    });

    tearDown(() {
      timer.dismiss();
      timer.setClockForTesting(null);
    });

    test('hands the set back when the time is up', () {
      var finished = 0;
      timer.startHold(30, onFinished: () => finished++);
      expect(timer.isHold, isTrue);
      expect(timer.total, 30);
      expect(timer.deadline, now.add(const Duration(seconds: 30)));

      now = now.add(const Duration(seconds: 20));
      timer.syncFromClock();
      expect(finished, 0);
      expect(timer.remaining, 10);

      now = now.add(const Duration(seconds: 11));
      timer.syncFromClock();
      expect(finished, 1);
      expect(timer.isHold, isFalse);
      // The bar is free for the rest that follows, at the usual duration.
      expect(timer.isVisible, isFalse);
      expect(timer.total, RestTimerController.defaultRestSeconds);
    });

    test('closing the bar or starting a rest cancels the hold', () {
      var finished = 0;
      timer.startHold(30, onFinished: () => finished++);
      timer.dismiss();
      now = now.add(const Duration(minutes: 1));
      timer.syncFromClock();
      expect(finished, 0);

      timer.startHold(30, onFinished: () => finished++);
      timer.startWithDefault(seconds: 60);
      expect(timer.isHold, isFalse);
      now = now.add(const Duration(minutes: 2));
      timer.syncFromClock();
      expect(finished, 0);
    });
  });

  testWidgets('a timed set steps in seconds and offers the countdown', (
    tester,
  ) async {
    final set = SessionSet(reps: 60);
    var started = 0;
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
              timed: true,
              showSteppers: true,
              weightStep: 0,
              previous: const WorkoutSet(
                setNumber: 1,
                reps: 55,
                weight: 0,
                completed: true,
              ),
              onToggle: () {},
              onChanged: () => update(() {}),
              onStartHold: () => started++,
            ),
          ),
        ),
      ),
    );

    expect(find.text('55 s'), findsOneWidget);
    expect(find.text('−1 rep'), findsNothing);
    await tester.tap(find.text('+5 s'));
    await tester.pump();
    expect(set.reps, 65);
    await tester.tap(find.text('−5 s'));
    await tester.tap(find.text('−5 s'));
    await tester.pump();
    expect(set.reps, 55);

    await tester.tap(find.text('Iniciar'));
    expect(started, 1);
  });
}
