import 'package:flutter_test/flutter_test.dart';
import 'package:liftwave/l10n/generated/app_localizations_en.dart';
import 'package:liftwave/l10n/generated/app_localizations_es.dart';
import 'package:liftwave/models/models.dart';
import 'package:liftwave/models/training_preferences.dart';
import 'package:liftwave/services/progression_service.dart';

void main() {
  List<Workout> lastSession(int reps, {double weight = 60}) => [
    Workout(
      id: 'last',
      name: 'Pierna',
      date: DateTime(2026, 9, 21),
      duration: const Duration(minutes: 45),
      totalVolume: 0,
      exercises: [
        WorkoutExercise(
          id: 'squat',
          name: 'Sentadilla',
          muscleGroup: 'Piernas',
          sets: [
            WorkoutSet(
              setNumber: 1,
              reps: reps,
              weight: weight,
              completed: true,
            ),
            WorkoutSet(
              setNumber: 2,
              reps: reps,
              weight: weight,
              completed: true,
            ),
          ],
        ),
      ],
    ),
  ];

  ProgressionRecommendation recommend(int reps, TrainingGoal? goal) =>
      ProgressionService.recommend(
        exerciseName: 'Sentadilla',
        equipment: 'Barra',
        workouts: lastSession(reps),
        goal: goal,
      )!;

  test('each goal has its own rep range', () {
    expect(
      ProgressionService.repRangeFor(TrainingGoal.strength),
      const RepRange(3, 6),
    );
    expect(
      ProgressionService.repRangeFor(TrainingGoal.muscleGain),
      const RepRange(8, 12),
    );
    expect(
      ProgressionService.repRangeFor(TrainingGoal.generalFitness),
      const RepRange(8, 12),
    );
    expect(
      ProgressionService.repRangeFor(TrainingGoal.fatLoss),
      const RepRange(12, 15),
    );
    expect(ProgressionService.repRangeFor(null), const RepRange(8, 12));
  });

  test('strength adds load at 6 reps and restarts at 3', () {
    final result = recommend(6, TrainingGoal.strength);
    expect(result.action, ProgressionAction.increaseLoad);
    expect(result.suggestedWeight, 62.5);
    expect(result.suggestedReps, 3);
    expect(result.range, const RepRange(3, 6));
  });

  test('the same 6 reps only consolidate for hypertrophy', () {
    final result = recommend(6, TrainingGoal.muscleGain);
    expect(result.action, ProgressionAction.consolidateLoad);
    expect(result.suggestedWeight, 60);
  });

  test('fat loss keeps adding reps until 15', () {
    final twelve = recommend(12, TrainingGoal.fatLoss);
    expect(twelve.action, ProgressionAction.addRepetition);
    expect(twelve.suggestedReps, 13);

    final fifteen = recommend(15, TrainingGoal.fatLoss);
    expect(fifteen.action, ProgressionAction.increaseLoad);
    expect(fifteen.suggestedReps, 12);
  });

  test('without preferences the classic 8-12 range applies', () {
    final result = recommend(12, null);
    expect(result.action, ProgressionAction.increaseLoad);
    expect(result.suggestedReps, ProgressionService.targetMinReps);
  });

  test('explanations quote last session and the range', () {
    expect(
      SEs().train_reasonIncreaseLoad(12, '60', 8, 12),
      'Hiciste 12 reps con 60 kg, el tope de tu rango (8–12). '
      'Toca subir el peso.',
    );
    expect(
      SEn().train_reasonConsolidate(5, '80', 8, 12),
      'You did 5 reps, below your range (8–12). '
      'Stay at 80 kg until you reach 8.',
    );
  });
}
