import 'set_type.dart';
import 'superset.dart';

export 'set_type.dart';
export 'superset.dart';

enum WorkoutLaunchSource {
  freeSession('freeSession'),
  savedRoutine('savedRoutine'),
  workoutHistory('workoutHistory');

  const WorkoutLaunchSource(this.storageKey);

  final String storageKey;

  bool get canSaveAsRoutine => this != savedRoutine;

  static WorkoutLaunchSource fromStorage(String? value) {
    for (final source in values) {
      if (source.storageKey == value) return source;
    }
    return freeSession;
  }
}

class SessionSet {
  int reps;
  double weight;
  bool completed;
  SetType type;

  SessionSet({
    this.reps = 10,
    this.weight = 0,
    this.completed = false,
    this.type = SetType.normal,
  });

  SessionSet copyWith({
    int? reps,
    double? weight,
    bool? completed,
    SetType? type,
  }) {
    return SessionSet(
      reps: reps ?? this.reps,
      weight: weight ?? this.weight,
      completed: completed ?? this.completed,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toJson() => {
    'reps': reps,
    'weight': weight,
    'completed': completed,
    if (type != SetType.normal) 'type': type.storageKey,
  };

  factory SessionSet.fromJson(Map<String, dynamic> j) => SessionSet(
    reps: (j['reps'] as num?)?.toInt() ?? 10,
    weight: (j['weight'] as num?)?.toDouble() ?? 0,
    completed: j['completed'] as bool? ?? false,
    type: SetType.fromStorage(j['type']),
  );
}

class SessionExercise implements MutableSupersetMember {
  final String id;
  final String name;
  final String muscleGroup;
  final String equipment;
  final List<SessionSet> sets;
  String? notes;
  final String? routineBlockName;

  /// Rest after each completed set. Null uses the rest timer's current
  /// duration.
  int? restSeconds;

  @override
  String? supersetId;

  /// Held for a time instead of counted: the sets' `reps` are seconds.
  /// Starts from the exercise's default and can be switched in the session.
  bool timed;

  /// What to save with the workout: the choice only when it differs from
  /// the exercise's default.
  bool? get timedOverride => timed == isTimedByDefault(name) ? null : timed;

  SessionExercise({
    required this.id,
    required this.name,
    required this.muscleGroup,
    required this.equipment,
    required this.sets,
    this.notes,
    this.routineBlockName,
    this.restSeconds,
    this.supersetId,
    bool? timed,
  }) : timed = timed ?? isTimedByDefault(name);

  /// Training volume for sets the user actually completed.
  ///
  /// Planned or partially entered sets must not affect workout summaries,
  /// history totals, achievements, or progression suggestions.
  int get totalVolume => timed
      ? 0
      : sets
            .where((s) => s.completed && s.type.countsAsWork)
            .fold(0, (sum, s) => sum + (s.reps * s.weight).round());

  /// The number shown on a working set: warm-ups are labelled, not numbered,
  /// so the first working set is always "1".
  int workingNumberOf(int index) {
    var number = 0;
    for (var i = 0; i <= index && i < sets.length; i++) {
      if (sets[i].type.countsAsWork) number++;
    }
    return number;
  }

  int get completedSets => sets.where((s) => s.completed).length;

  /// Replaces the values of the set at [index] (e.g. copying the previous
  /// session) and carries the change onto the pending sets after it.
  void fillSet(int index, {required int reps, required double weight}) {
    final previous = sets[index];
    sets[index] = previous.copyWith(reps: reps, weight: weight);
    propagateEdit(
      index,
      previousReps: previous.reps,
      previousWeight: previous.weight,
    );
  }

  /// Carries an edit made to the set at [index] onto the pending sets after
  /// it that still held the value it replaced, so changing the first set's
  /// load updates the rest without overwriting a deliberate pyramid.
  ///
  /// Updated sets are replaced with new instances so their rows re-read the
  /// values; the edited set itself is left untouched.
  void propagateEdit(int index, {int? previousReps, double? previousWeight}) {
    final source = sets[index];
    final repsChanged = previousReps != null && previousReps != source.reps;
    final weightChanged =
        previousWeight != null && previousWeight != source.weight;
    if (!repsChanged && !weightChanged) return;
    // A warm-up is lighter on purpose: its load must not spread to the
    // working sets, nor theirs back onto a pending warm-up.
    if (!source.type.countsAsWork) return;

    for (var i = index + 1; i < sets.length; i++) {
      final set = sets[i];
      if (set.completed || !set.type.countsAsWork) continue;
      final followReps = repsChanged && set.reps == previousReps;
      final followWeight = weightChanged && set.weight == previousWeight;
      if (!followReps && !followWeight) continue;
      sets[i] = set.copyWith(
        reps: followReps ? source.reps : null,
        weight: followWeight ? source.weight : null,
      );
    }
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'muscleGroup': muscleGroup,
    'equipment': equipment,
    'sets': sets.map((s) => s.toJson()).toList(),
    'notes': notes,
    'routineBlockName': routineBlockName,
    if (restSeconds != null) 'restSeconds': restSeconds,
    'timed': timed,
    if (supersetId != null) 'supersetId': supersetId,
  };

  factory SessionExercise.fromJson(Map<String, dynamic> j) => SessionExercise(
    id: j['id'] as String,
    name: j['name'] as String,
    muscleGroup: j['muscleGroup'] as String,
    equipment: j['equipment'] as String? ?? '',
    sets: (j['sets'] as List)
        .map((s) => SessionSet.fromJson(Map<String, dynamic>.from(s as Map)))
        .toList(),
    notes: j['notes'] as String?,
    routineBlockName: j['routineBlockName'] as String?,
    restSeconds: (j['restSeconds'] as num?)?.toInt(),
    timed: j['timed'] as bool?,
    supersetId: j['supersetId'] as String?,
  );
}

/// Whether the rest should start after a set of the exercise at [index] is
/// completed: always on its own, and in a superset once every other member
/// has done as many sets (or has none left).
bool supersetRoundComplete(List<SessionExercise> exercises, int index) {
  final done = exercises[index].completedSets;
  return supersetMembers(exercises, index).every((member) {
    final exercise = exercises[member];
    return exercise.completedSets >= done ||
        exercise.completedSets == exercise.sets.length;
  });
}
