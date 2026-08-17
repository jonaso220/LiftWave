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

  SessionExercise({
    required this.id,
    required this.name,
    required this.muscleGroup,
    required this.equipment,
    required this.sets,
    this.notes,
    this.routineBlockName,
  });

  /// Training volume for sets the user actually completed.
  ///
  /// Planned or partially entered sets must not affect workout summaries,
  /// history totals, achievements, or progression suggestions.
  int get totalVolume => sets
      .where((s) => s.completed)
      .fold(0, (sum, s) => sum + (s.reps * s.weight).round());

  int get completedSets => sets.where((s) => s.completed).length;

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'muscleGroup': muscleGroup,
    'equipment': equipment,
    'sets': sets.map((s) => s.toJson()).toList(),
    'notes': notes,
    'routineBlockName': routineBlockName,
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
  );
}
