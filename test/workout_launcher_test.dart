import 'package:flutter_test/flutter_test.dart';
import 'package:liftwave/data/mock_data.dart';
import 'package:liftwave/data/workout_templates.dart';
import 'package:liftwave/services/workout_launcher.dart';

void main() {
  final launcher = WorkoutLauncher.instance;

  tearDown(() {
    launcher.consumeExercises();
    launcher.consumeTemplate();
    launcher.consumeWorkout();
  });

  test('library additions queued before training mounts are consumed once', () {
    launcher.queueExercise(mockExercises[0]);
    launcher.queueExercise(mockExercises[1]);
    expect(launcher.hasPending, isTrue);
    expect(launcher.consumeExercises(), [mockExercises[0], mockExercises[1]]);
    expect(launcher.consumeExercises(), isEmpty);
    expect(launcher.hasPending, isFalse);
  });

  test('explicit template launch replaces an unconsumed library request', () {
    launcher.queueExercise(mockExercises[0]);
    launcher.queue(workoutTemplates.first);
    expect(launcher.consumeExercises(), isEmpty);
    expect(launcher.consumeTemplate(), workoutTemplates.first);
  });
}
