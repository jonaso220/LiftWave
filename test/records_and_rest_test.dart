import 'package:flutter_test/flutter_test.dart';
import 'package:liftwave/models/models.dart';
import 'package:liftwave/services/exercise_records.dart';
import 'package:liftwave/services/rest_timer_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Workout workout(
    DateTime date,
    List<WorkoutSet> sets, {
    String name = 'Sentadilla',
  }) => Workout(
    id: 'w-${date.millisecondsSinceEpoch}',
    name: 'Piernas',
    date: date,
    duration: const Duration(minutes: 45),
    totalVolume: 0,
    exercises: [
      WorkoutExercise(id: name, name: name, muscleGroup: 'Piernas', sets: sets),
    ],
  );

  group('estimated 1RM', () {
    test('follows Epley within the range it is meant for', () {
      expect(estimatedOneRepMax(100, 1), 100);
      expect(estimatedOneRepMax(100, 5), closeTo(116.67, 0.01));
      expect(estimatedOneRepMax(60, 10), closeTo(80, 0.001));
      expect(estimatedOneRepMax(60, 12), closeTo(84, 0.001));
    });

    test('gives no estimate for high repetitions, zero load or no reps', () {
      expect(estimatedOneRepMax(40, 13), isNull);
      expect(estimatedOneRepMax(40, 30), isNull);
      expect(estimatedOneRepMax(0, 5), isNull);
      expect(estimatedOneRepMax(80, 0), isNull);
    });

    test('picks the best set of a session', () {
      expect(
        bestEstimatedOneRepMax(const [
          WorkoutSet(setNumber: 1, reps: 10, weight: 60, completed: true),
          WorkoutSet(setNumber: 2, reps: 3, weight: 90, completed: true),
          WorkoutSet(setNumber: 3, reps: 20, weight: 40, completed: true),
        ]),
        closeTo(99, 0.001),
      );
      expect(
        bestEstimatedOneRepMax(const [
          WorkoutSet(setNumber: 1, reps: 20, weight: 40, completed: true),
        ]),
        isNull,
      );
    });
  });

  group('exercise records', () {
    final history = [
      workout(DateTime(2026, 9, 15), const [
        WorkoutSet(setNumber: 1, reps: 5, weight: 100, completed: true),
        // Planned but never done: must not count.
        WorkoutSet(setNumber: 2, reps: 1, weight: 140, completed: false),
      ]),
      workout(DateTime(2026, 9, 1), const [
        WorkoutSet(setNumber: 1, reps: 10, weight: 80, completed: true),
      ]),
      workout(DateTime(2026, 9, 22), const [
        // Ties the heaviest set later: the first day keeps the record.
        WorkoutSet(setNumber: 1, reps: 3, weight: 100, completed: true),
        WorkoutSet(setNumber: 2, reps: 8, weight: 95, completed: true),
      ]),
      workout(DateTime(2026, 9, 23), const [
        WorkoutSet(setNumber: 1, reps: 5, weight: 200, completed: true),
      ], name: 'Peso muerto'),
    ];

    test(
      'finds the heaviest set and the best estimated 1RM with their days',
      () {
        final records = ExerciseRecords.of('Sentadilla', history);

        expect(records.heaviest!.weight, 100);
        expect(records.heaviest!.reps, 5);
        expect(records.heaviest!.date, DateTime(2026, 9, 15));

        // 95 × 8 → 120.33 beats 100 × 5 → 116.67.
        expect(records.bestOneRm, closeTo(120.33, 0.01));
        expect(records.bestOneRmLift!.weight, 95);
        expect(records.bestOneRmLift!.reps, 8);
        expect(records.bestOneRmLift!.date, DateTime(2026, 9, 22));
      },
    );

    test('is empty for an exercise never logged', () {
      expect(ExerciseRecords.of('Press militar', history).isEmpty, isTrue);
    });
  });

  group('preferred rest', () {
    final timer = RestTimerController.instance;

    tearDown(() {
      timer.dismiss();
      timer.selectPreset(RestTimerController.defaultRestSeconds);
    });

    test(
      'the chosen duration is saved and restored on the next launch',
      () async {
        SharedPreferences.setMockInitialValues({});
        timer.dismiss();
        timer.setCustom(150);
        await Future<void>.delayed(Duration.zero);
        final prefs = await SharedPreferences.getInstance();
        expect(prefs.getInt('rest_preferred_seconds'), 150);

        // A fresh launch starts from the default and then loads the choice.
        timer.selectPreset(RestTimerController.defaultRestSeconds);
        await Future<void>.delayed(Duration.zero);
        SharedPreferences.setMockInitialValues({
          'rest_preferred_seconds': 150,
          'rest_preferred_is_custom': true,
        });
        await timer.load();
        expect(timer.total, 150);
        expect(timer.isCustom, isTrue);

        timer.startWithDefault();
        expect(timer.total, 150);
        expect(timer.deadline, isNotNull);
      },
    );

    test('a rest already running is not changed by loading', () async {
      SharedPreferences.setMockInitialValues({'rest_preferred_seconds': 150});
      timer.startWithDefault(seconds: 45);
      await timer.load();
      expect(timer.total, 45);
      timer.pause();
      expect(timer.deadline, isNull);
    });
  });
}
