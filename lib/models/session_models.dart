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

  SessionSet({this.reps = 10, this.weight = 0, this.completed = false});

  SessionSet copyWith({int? reps, double? weight, bool? completed}) {
    return SessionSet(
      reps: reps ?? this.reps,
      weight: weight ?? this.weight,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toJson() => {
    'reps': reps,
    'weight': weight,
    'completed': completed,
  };

  factory SessionSet.fromJson(Map<String, dynamic> j) => SessionSet(
    reps: (j['reps'] as num?)?.toInt() ?? 10,
    weight: (j['weight'] as num?)?.toDouble() ?? 0,
    completed: j['completed'] as bool? ?? false,
  );
}

class SessionExercise {
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

  SessionExercise({
    required this.id,
    required this.name,
    required this.muscleGroup,
    required this.equipment,
    required this.sets,
    this.notes,
    this.routineBlockName,
    this.restSeconds,
  });

  /// Training volume for sets the user actually completed.
  ///
  /// Planned or partially entered sets must not affect workout summaries,
  /// history totals, achievements, or progression suggestions.
  int get totalVolume => sets
      .where((s) => s.completed)
      .fold(0, (sum, s) => sum + (s.reps * s.weight).round());

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

    for (var i = index + 1; i < sets.length; i++) {
      final set = sets[i];
      if (set.completed) continue;
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
  );
}
