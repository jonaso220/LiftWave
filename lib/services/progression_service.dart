import '../models/models.dart';

enum ProgressionAction {
  increaseLoad,
  addRepetition,
  consolidateLoad,
  bodyweightRepetition,
}

class ProgressionRecommendation {
  final double previousWeight;
  final int previousReps;
  final double suggestedWeight;
  final int suggestedReps;
  final ProgressionAction action;

  const ProgressionRecommendation({
    required this.previousWeight,
    required this.previousReps,
    required this.suggestedWeight,
    required this.suggestedReps,
    required this.action,
  });
}

/// Conservative double-progression recommendations based on the latest
/// completed session for an exercise.
class ProgressionService {
  const ProgressionService._();

  static const int targetMinReps = 8;
  static const int targetMaxReps = 12;

  static ProgressionRecommendation? recommend({
    required String exerciseName,
    required String equipment,
    required List<Workout> workouts,
  }) {
    final normalizedName = _normalize(exerciseName);
    WorkoutExercise? latestExercise;
    DateTime? latestDate;

    for (final workout in workouts) {
      for (final exercise in workout.exercises) {
        if (_normalize(exercise.name) != normalizedName) continue;

        final hasCompletedSet = exercise.sets.any(
          (set) => set.completed && set.reps > 0,
        );
        if (!hasCompletedSet) continue;

        if (latestDate == null || workout.date.isAfter(latestDate)) {
          latestExercise = exercise;
          latestDate = workout.date;
        }
      }
    }

    if (latestExercise == null) return null;

    final completed = latestExercise.sets
        .where((set) => set.completed && set.reps > 0)
        .toList();
    final weighted = completed.where((set) => set.weight > 0).toList();
    if (weighted.isEmpty) {
      final previousReps = completed
          .map((set) => set.reps)
          .reduce((a, b) => a < b ? a : b);
      return ProgressionRecommendation(
        previousWeight: 0,
        previousReps: previousReps,
        suggestedWeight: 0,
        suggestedReps: previousReps + 1,
        action: ProgressionAction.bodyweightRepetition,
      );
    }

    final workingWeight = weighted
        .map((set) => set.weight)
        .reduce((a, b) => a > b ? a : b);
    final workingSets = weighted
        .where((set) => (set.weight - workingWeight).abs() < 0.001)
        .toList();
    final previousReps = workingSets
        .map((set) => set.reps)
        .reduce((a, b) => a < b ? a : b);

    if (previousReps >= targetMaxReps) {
      return ProgressionRecommendation(
        previousWeight: workingWeight,
        previousReps: previousReps,
        suggestedWeight: workingWeight + _incrementFor(equipment),
        suggestedReps: targetMinReps,
        action: ProgressionAction.increaseLoad,
      );
    }

    if (previousReps >= targetMinReps) {
      return ProgressionRecommendation(
        previousWeight: workingWeight,
        previousReps: previousReps,
        suggestedWeight: workingWeight,
        suggestedReps: previousReps + 1,
        action: ProgressionAction.addRepetition,
      );
    }

    return ProgressionRecommendation(
      previousWeight: workingWeight,
      previousReps: previousReps,
      suggestedWeight: workingWeight,
      suggestedReps: previousReps,
      action: ProgressionAction.consolidateLoad,
    );
  }

  static double _incrementFor(String equipment) {
    final normalized = _normalize(equipment);
    if (normalized.contains('mancuerna') ||
        normalized.contains('dumbbell') ||
        normalized.contains('kettlebell')) {
      return 2;
    }
    return 2.5;
  }

  static String _normalize(String value) =>
      value.trim().toLowerCase().replaceAll(RegExp(r'\s+'), ' ');
}
