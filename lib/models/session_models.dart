class SessionSet {
  int reps;
  double weight;
  bool completed;

  SessionSet({
    this.reps = 10,
    this.weight = 0,
    this.completed = false,
  });

  SessionSet copyWith({int? reps, double? weight, bool? completed}) {
    return SessionSet(
      reps: reps ?? this.reps,
      weight: weight ?? this.weight,
      completed: completed ?? this.completed,
    );
  }
}

class SessionExercise {
  final String id;
  final String name;
  final String muscleGroup;
  final String equipment;
  final List<SessionSet> sets;
  String? notes;

  SessionExercise({
    required this.id,
    required this.name,
    required this.muscleGroup,
    required this.equipment,
    required this.sets,
    this.notes,
  });

  int get totalVolume => sets.fold(
        0,
        (sum, s) => sum + (s.reps * s.weight).round(),
      );

  int get completedSets => sets.where((s) => s.completed).length;
}
