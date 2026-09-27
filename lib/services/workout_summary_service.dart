import '../models/models.dart';
import '../models/session_models.dart';

/// A heavier load than ever before for an exercise.
class PersonalRecord {
  final String exerciseName;
  final double weight;
  final double previousBest;

  const PersonalRecord({
    required this.exerciseName,
    required this.weight,
    required this.previousBest,
  });
}

/// Volume of this session against the last time the same workout was done.
class VolumeComparison {
  final int delta;
  final DateTime previousDate;

  const VolumeComparison({required this.delta, required this.previousDate});
}

/// What the end-of-workout summary celebrates, computed before the session
/// is added to [history].
class WorkoutSummaryService {
  const WorkoutSummaryService._();

  /// Exercises whose heaviest completed set beats every earlier session.
  /// A first-ever session of an exercise is not a record: there is nothing
  /// to beat yet.
  static List<PersonalRecord> personalRecords({
    required List<SessionExercise> exercises,
    required List<Workout> history,
  }) {
    final records = <PersonalRecord>[];
    final seen = <String>{};
    for (final exercise in exercises) {
      final key = _normalize(exercise.name);
      if (!seen.add(key)) continue;
      final best = exercises
          .where((e) => _normalize(e.name) == key)
          .expand((e) => e.sets)
          .where((set) => set.completed && set.reps > 0)
          .fold<double>(0, (max, set) => set.weight > max ? set.weight : max);
      if (best <= 0) continue;

      double? previousBest;
      for (final workout in history) {
        for (final past in workout.exercises) {
          if (_normalize(past.name) != key) continue;
          for (final set in past.effectiveCompletedSets) {
            if (set.reps <= 0) continue;
            if (previousBest == null || set.weight > previousBest) {
              previousBest = set.weight;
            }
          }
        }
      }
      if (previousBest != null && previousBest > 0 && best > previousBest) {
        records.add(
          PersonalRecord(
            exerciseName: exercise.name,
            weight: best,
            previousBest: previousBest,
          ),
        );
      }
    }
    return records;
  }

  /// Compares with the latest earlier session of the same workout: the same
  /// routine day and block, or else the same name. Free sessions
  /// ([workoutName] null) have nothing comparable.
  static VolumeComparison? compareWithPrevious({
    required String? workoutName,
    required String? routineDay,
    required int? routineOrder,
    required int volume,
    required List<Workout> history,
  }) {
    if (workoutName == null) return null;
    Workout? previous;
    for (final workout in history) {
      if (!workout.hasCompletedWork) continue;
      final sameRoutine =
          routineDay != null &&
          workout.routineDay == routineDay &&
          workout.routineOrder == routineOrder;
      final sameName = _normalize(workout.name) == _normalize(workoutName);
      if (!sameRoutine && !sameName) continue;
      if (previous == null || workout.date.isAfter(previous.date)) {
        previous = workout;
      }
    }
    if (previous == null) return null;
    return VolumeComparison(
      delta: volume - previous.calculatedVolume,
      previousDate: previous.date,
    );
  }

  static String _normalize(String value) =>
      value.trim().toLowerCase().replaceAll(RegExp(r'\s+'), ' ');
}
