// ── Workout models ────────────────────────────────────────────────────────────

class WorkoutSet {
  final int setNumber;
  final int reps;
  final double weight;
  final bool completed;
  final bool completionRecorded;

  const WorkoutSet({
    required this.setNumber,
    required this.reps,
    required this.weight,
    this.completed = false,
    this.completionRecorded = true,
  });

  Map<String, dynamic> toJson() => {
    'setNumber': setNumber,
    'reps': reps,
    'weight': weight,
    'completed': completed,
  };

  factory WorkoutSet.fromJson(Map<String, dynamic> j) => WorkoutSet(
    setNumber: (j['setNumber'] as num).toInt(),
    reps: (j['reps'] as num).toInt(),
    weight: (j['weight'] as num).toDouble(),
    completed: j['completed'] as bool? ?? false,
    completionRecorded: j.containsKey('completed'),
  );
}

class WorkoutExercise {
  final String id;
  final String name;
  final String muscleGroup;
  final List<WorkoutSet> sets;
  final String? notes;
  final String? routineBlockName;

  const WorkoutExercise({
    required this.id,
    required this.name,
    required this.muscleGroup,
    required this.sets,
    this.notes,
    this.routineBlockName,
  });

  bool get hasCompletionData => sets.any((set) => set.completionRecorded);

  bool isSetEffectivelyCompleted(WorkoutSet set) =>
      hasCompletionData ? set.completed : true;

  /// Sets that count as performed. Records created before completion flags
  /// existed represent finished workouts, so their sets remain valid.
  Iterable<WorkoutSet> get effectiveCompletedSets =>
      sets.where(isSetEffectivelyCompleted);

  int get completedSetCount => effectiveCompletedSets.length;

  int get completedVolume => effectiveCompletedSets.fold(
    0,
    (sum, set) => sum + (set.reps * set.weight).round(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'muscleGroup': muscleGroup,
    'sets': sets.map((s) => s.toJson()).toList(),
    'notes': notes,
    'routineBlockName': routineBlockName,
  };

  factory WorkoutExercise.fromJson(Map<String, dynamic> j) => WorkoutExercise(
    id: j['id'] as String,
    name: j['name'] as String,
    muscleGroup: j['muscleGroup'] as String,
    sets: (j['sets'] as List)
        .map((s) => WorkoutSet.fromJson(s as Map<String, dynamic>))
        .toList(),
    notes: j['notes'] as String?,
    routineBlockName: j['routineBlockName'] as String?,
  );
}

class Workout {
  final String id;
  final String name;
  final DateTime date;
  final Duration duration;
  final List<WorkoutExercise> exercises;
  final int totalVolume;
  final String? notes;
  final String? routineDay;
  final int? routineOrder;

  const Workout({
    required this.id,
    required this.name,
    required this.date,
    required this.duration,
    required this.exercises,
    required this.totalVolume,
    this.notes,
    this.routineDay,
    this.routineOrder,
  });

  int get totalSets =>
      exercises.fold(0, (sum, exercise) => sum + exercise.completedSetCount);

  int get completedExerciseCount =>
      exercises.where((exercise) => exercise.completedSetCount > 0).length;

  bool get hasCompletedWork => totalSets > 0;

  int get calculatedVolume =>
      exercises.fold(0, (sum, exercise) => sum + exercise.completedVolume);

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'date': date.toIso8601String(),
    'durationSeconds': duration.inSeconds,
    'exercises': exercises.map((e) => e.toJson()).toList(),
    'totalVolume': totalVolume,
    'notes': notes,
    'routineDay': routineDay,
    'routineOrder': routineOrder,
  };

  factory Workout.fromJson(Map<String, dynamic> j) {
    final rawExercises = j['exercises'] as List;
    final exercises = rawExercises
        .map(
          (exercise) => WorkoutExercise.fromJson(
            Map<String, dynamic>.from(exercise as Map),
          ),
        )
        .toList();
    final hasCompletionData = rawExercises.any((exercise) {
      final map = Map<String, dynamic>.from(exercise as Map);
      return (map['sets'] as List).any(
        (set) => Map<String, dynamic>.from(set as Map).containsKey('completed'),
      );
    });
    final storedVolume = (j['totalVolume'] as num).toInt();
    final completedVolume = exercises.fold<int>(
      0,
      (sum, exercise) => sum + exercise.completedVolume,
    );

    return Workout(
      id: j['id'] as String,
      name: j['name'] as String,
      date: DateTime.parse(j['date'] as String),
      duration: Duration(seconds: (j['durationSeconds'] as num).toInt()),
      exercises: exercises,
      // Very old records did not persist completion flags; retain their stored
      // total because recalculating would incorrectly turn it into zero.
      totalVolume: hasCompletionData ? completedVolume : storedVolume,
      notes: j['notes'] as String?,
      routineDay: j['routineDay'] as String?,
      routineOrder: (j['routineOrder'] as num?)?.toInt(),
    );
  }
}

// ── Exercise library models ───────────────────────────────────────────────────

class MuscleGroup {
  final String id;
  final String name;

  const MuscleGroup({required this.id, required this.name});
}

class Equipment {
  final String id;
  final String name;

  const Equipment({required this.id, required this.name});
}

class Exercise {
  final String id;
  final String name;
  final String muscleGroup;
  final String equipment;
  final String difficulty;
  final String description;
  final List<String> secondaryMuscles;
  final List<String> benefits;

  const Exercise({
    required this.id,
    required this.name,
    required this.muscleGroup,
    required this.equipment,
    required this.difficulty,
    required this.description,
    this.secondaryMuscles = const [],
    this.benefits = const [],
  });
}
