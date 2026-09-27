import 'package:flutter_test/flutter_test.dart';
import 'package:liftwave/data/workout_templates.dart';
import 'package:liftwave/models/session_models.dart';
import 'package:liftwave/services/rest_timer_controller.dart';
import 'package:liftwave/widgets/rest_picker.dart';

void main() {
  test('routine exercises keep their rest through JSON', () {
    const squat = TemplateExercise(
      name: 'Sentadilla',
      muscleGroup: 'Piernas',
      equipment: 'Barra',
      sets: 4,
      reps: 5,
      weight: 0,
      restSeconds: 180,
    );
    final restored = TemplateExercise.fromJson(squat.toJson());
    expect(restored.restSeconds, 180);
  });

  test('routines saved before this change load with the default rest', () {
    final legacy = TemplateExercise.fromJson({
      'name': 'Curl',
      'muscleGroup': 'Brazos',
      'equipment': 'Mancuernas',
      'sets': 3,
      'reps': 12,
      'weight': 0,
    });
    expect(legacy.restSeconds, isNull);
    expect(legacy.toJson().containsKey('restSeconds'), isFalse);
  });

  test('an active workout remembers each exercise rest', () {
    final exercise = SessionExercise(
      id: 'curl',
      name: 'Curl',
      muscleGroup: 'Brazos',
      equipment: 'Mancuernas',
      sets: [SessionSet()],
      restSeconds: 60,
    );
    expect(SessionExercise.fromJson(exercise.toJson()).restSeconds, 60);
  });

  test('rest labels read naturally', () {
    expect(formatRest(45), '45 s');
    expect(formatRest(60), '1:00');
    expect(formatRest(90), '1:30');
    expect(formatRest(240), '4:00');
  });

  testWidgets('an exercise rest does not change the timer default', (
    tester,
  ) async {
    final timer = RestTimerController.instance;
    var now = DateTime(2026, 9, 27, 12);
    timer.setClockForTesting(() => now);
    timer.dismiss();

    timer.startWithDefault(seconds: 180);
    expect(timer.total, 180);

    timer.dismiss();
    timer.startWithDefault();
    expect(timer.total, RestTimerController.defaultRestSeconds);

    timer.dismiss();
    timer.setClockForTesting(null);
  });
}
