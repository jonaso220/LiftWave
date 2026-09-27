import '../models/models.dart';
import '../models/training_preferences.dart';

enum ProgressionAction {
  increaseLoad,
  addRepetition,
  consolidateLoad,
  bodyweightRepetition,
}

/// Target repetitions for double progression: add reps inside the range,
/// add load once the top is reached.
class RepRange {
  final int min;
  final int max;

  const RepRange(this.min, this.max);

  @override
  bool operator ==(Object other) =>
      other is RepRange && other.min == min && other.max == max;

  @override
  int get hashCode => Object.hash(min, max);

  @override
  String toString() => 'RepRange($min-$max)';
}

class ProgressionRecommendation {
  final double previousWeight;
  final int previousReps;
  final double suggestedWeight;
  final int suggestedReps;
  final ProgressionAction action;

  /// The range the suggestion was computed against, so the UI can explain it.
  final RepRange range;

  const ProgressionRecommendation({
    required this.previousWeight,
    required this.previousReps,
    required this.suggestedWeight,
    required this.suggestedReps,
    required this.action,
    this.range = ProgressionService.defaultRange,
  });
}

/// Conservative double-progression recommendations based on the latest
/// completed session for an exercise.
class ProgressionService {
  const ProgressionService._();

  static const int targetMinReps = 8;
  static const int targetMaxReps = 12;
  static const RepRange defaultRange = RepRange(targetMinReps, targetMaxReps);

  /// Rep range for the user's goal. Matches the reps the adaptive weekly
  /// plan prescribes (5 for strength, 10 for hypertrophy, 12 for fat loss).
  static RepRange repRangeFor(TrainingGoal? goal) => switch (goal) {
    TrainingGoal.strength => const RepRange(3, 6),
    TrainingGoal.fatLoss => const RepRange(12, 15),
    TrainingGoal.muscleGain ||
    TrainingGoal.generalFitness ||
    null => defaultRange,
  };

  static ProgressionRecommendation? recommend({
    required String exerciseName,
    required String equipment,
    required List<Workout> workouts,
    TrainingGoal? goal,
    double? loadIncrementKg,
  }) {
    final latestExercise = _latestExercise(exerciseName, workouts);
    if (latestExercise == null) return null;
    return _recommendFrom(
      latestExercise,
      loadIncrementKg ?? loadIncrementFor(equipment),
      repRangeFor(goal),
    );
  }

  /// Sets the user completed the last time they logged [exerciseName], in
  /// the order they were performed. Empty when there is no previous session.
  static List<WorkoutSet> previousSets({
    required String exerciseName,
    required List<Workout> workouts,
  }) {
    final latestExercise = _latestExercise(exerciseName, workouts);
    if (latestExercise == null) return const [];
    return latestExercise.sets
        .where((set) => set.completed && set.reps > 0)
        .toList();
  }

  static WorkoutExercise? _latestExercise(
    String exerciseName,
    List<Workout> workouts,
  ) {
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

    return latestExercise;
  }

  static ProgressionRecommendation _recommendFrom(
    WorkoutExercise latestExercise,
    double loadIncrementKg,
    RepRange range,
  ) {
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
        range: range,
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

    if (previousReps >= range.max) {
      return ProgressionRecommendation(
        previousWeight: workingWeight,
        previousReps: previousReps,
        suggestedWeight: workingWeight + loadIncrementKg,
        suggestedReps: range.min,
        action: ProgressionAction.increaseLoad,
        range: range,
      );
    }

    if (previousReps >= range.min) {
      return ProgressionRecommendation(
        previousWeight: workingWeight,
        previousReps: previousReps,
        suggestedWeight: workingWeight,
        suggestedReps: previousReps + 1,
        action: ProgressionAction.addRepetition,
        range: range,
      );
    }

    return ProgressionRecommendation(
      previousWeight: workingWeight,
      previousReps: previousReps,
      suggestedWeight: workingWeight,
      suggestedReps: previousReps,
      action: ProgressionAction.consolidateLoad,
      range: range,
    );
  }

  /// Smallest practical load jump: 2 kg for dumbbells and kettlebells
  /// (sold in 2 kg steps), 2.5 kg otherwise.
  static double loadIncrementFor(String equipment) {
    final normalized = _normalize(equipment);
    if (normalized.contains('mancuerna') ||
        normalized.contains('dumbbell') ||
        normalized.contains('kettlebell')) {
      return 2;
    }
    return 2.5;
  }

  /// Exercises done without external load, where only reps change.
  static bool isBodyweight(String equipment) {
    final normalized = _normalize(equipment);
    return normalized == 'peso corporal' ||
        normalized == 'sin material' ||
        normalized == 'bodyweight';
  }

  static String _normalize(String value) =>
      value.trim().toLowerCase().replaceAll(RegExp(r'\s+'), ' ');
}
