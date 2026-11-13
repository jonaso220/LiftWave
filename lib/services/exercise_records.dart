import '../models/models.dart';

/// Estimated one-rep max in kilograms, by the Epley formula
/// (weight × (1 + reps / 30)).
///
/// A single is its own 1RM. Above 12 repetitions the estimate stops being
/// meaningful, so there is none.
double? estimatedOneRepMax(double weightKg, int reps) {
  if (weightKg <= 0 || reps <= 0 || reps > 12) return null;
  if (reps == 1) return weightKg;
  return weightKg * (1 + reps / 30);
}

/// The best estimated 1RM among [sets], or null when none qualifies.
double? bestEstimatedOneRepMax(Iterable<WorkoutSet> sets) {
  double? best;
  for (final set in sets) {
    final estimate = estimatedOneRepMax(set.weight, set.reps);
    if (estimate != null && (best == null || estimate > best)) best = estimate;
  }
  return best;
}

/// A record set and the day it was done.
class RecordLift {
  final double weight;
  final int reps;
  final DateTime date;

  const RecordLift({
    required this.weight,
    required this.reps,
    required this.date,
  });
}

/// All-time bests for one exercise.
class ExerciseRecords {
  /// The heaviest completed set.
  final RecordLift? heaviest;

  /// The set with the highest estimated 1RM, and that estimate.
  final RecordLift? bestOneRmLift;
  final double? bestOneRm;

  const ExerciseRecords({this.heaviest, this.bestOneRmLift, this.bestOneRm});

  bool get isEmpty => heaviest == null && bestOneRm == null;

  /// Scans [workouts] (any order) for [exerciseName]. When a record was
  /// matched later, the first time it was reached is the one kept.
  factory ExerciseRecords.of(String exerciseName, Iterable<Workout> workouts) {
    final chronological = workouts.toList()
      ..sort((a, b) => a.date.compareTo(b.date));
    RecordLift? heaviest;
    RecordLift? bestOneRmLift;
    double? bestOneRm;
    for (final workout in chronological) {
      for (final exercise in workout.exercises) {
        if (exercise.name != exerciseName) continue;
        for (final set in exercise.workingSets) {
          if (set.reps <= 0 || set.weight <= 0) continue;
          final lift = RecordLift(
            weight: set.weight,
            reps: set.reps,
            date: workout.date,
          );
          if (heaviest == null ||
              beatsPersonalRecord(set.weight, heaviest.weight)) {
            heaviest = lift;
          }
          final estimate = estimatedOneRepMax(set.weight, set.reps);
          if (estimate != null &&
              (bestOneRm == null || beatsPersonalRecord(estimate, bestOneRm))) {
            bestOneRm = estimate;
            bestOneRmLift = lift;
          }
        }
      }
    }
    return ExerciseRecords(
      heaviest: heaviest,
      bestOneRmLift: bestOneRmLift,
      bestOneRm: bestOneRm,
    );
  }
}
