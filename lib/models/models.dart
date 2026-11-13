import 'set_type.dart';

export 'set_type.dart';

// ── Workout models ────────────────────────────────────────────────────────────

class WorkoutSet {
  final int setNumber;
  final int reps;
  final double weight;
  final bool completed;
  final bool completionRecorded;
  final SetType type;

  const WorkoutSet({
    required this.setNumber,
    required this.reps,
    required this.weight,
    this.completed = false,
    this.completionRecorded = true,
    this.type = SetType.normal,
  });

  Map<String, dynamic> toJson() => {
    'setNumber': setNumber,
    'reps': reps,
    'weight': weight,
    'completed': completed,
    if (type != SetType.normal) 'type': type.storageKey,
  };

  factory WorkoutSet.fromJson(Map<String, dynamic> j) => WorkoutSet(
    setNumber: (j['setNumber'] as num).toInt(),
    reps: (j['reps'] as num).toInt(),
    weight: (j['weight'] as num).toDouble(),
    completed: j['completed'] as bool? ?? false,
    completionRecorded: j.containsKey('completed'),
    type: SetType.fromStorage(j['type']),
  );
}

class WorkoutExercise {
  final String id;
  final String name;
  final String muscleGroup;
  final List<WorkoutSet> sets;
  final String? notes;
  final String? routineBlockName;

  /// Set when the user measured this exercise differently from its default
  /// (see [timed]); null otherwise, and for every record saved before timed
  /// exercises existed.
  final bool? timedOverride;

  /// Shared by the exercises done back to back as one superset; null for
  /// an exercise done on its own.
  final String? supersetId;

  const WorkoutExercise({
    required this.id,
    required this.name,
    required this.muscleGroup,
    required this.sets,
    this.notes,
    this.routineBlockName,
    this.timedOverride,
    this.supersetId,
  });

  /// Whether the sets were held for a time: their `reps` are then seconds.
  bool get timed => timedOverride ?? isTimedByDefault(name);

  bool get hasCompletionData => sets.any((set) => set.completionRecorded);

  bool isSetEffectivelyCompleted(WorkoutSet set) =>
      hasCompletionData ? set.completed : true;

  /// Sets that count as performed. Records created before completion flags
  /// existed represent finished workouts, so their sets remain valid.
  Iterable<WorkoutSet> get effectiveCompletedSets =>
      sets.where(isSetEffectivelyCompleted);

  int get completedSetCount => effectiveCompletedSets.length;

  /// Performed sets that are training work: everything but warm-ups. Volume,
  /// records, weekly sets and progression are computed from these.
  Iterable<WorkoutSet> get workingSets =>
      effectiveCompletedSets.where((set) => set.type.countsAsWork);

  /// Load × repetitions. A hold has no repetitions (its `reps` are
  /// seconds), so it adds no volume.
  int get completedVolume => timed
      ? 0
      : workingSets.fold(
          0,
          (sum, set) => sum + (set.reps * set.weight).round(),
        );

  /// The number shown for [set]: its position among the working sets, since
  /// warm-ups carry a letter instead of a number.
  int workingNumberOf(WorkoutSet set) => sets
      .where((s) => s.setNumber <= set.setNumber && s.type.countsAsWork)
      .length;

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'muscleGroup': muscleGroup,
    'sets': sets.map((s) => s.toJson()).toList(),
    'notes': notes,
    'routineBlockName': routineBlockName,
    if (timedOverride != null) 'timed': timedOverride,
    if (supersetId != null) 'supersetId': supersetId,
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
    timedOverride: j['timed'] as bool?,
    supersetId: j['supersetId'] as String?,
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

/// Whether [weight] is a genuinely heavier lift than [previousBest], both in
/// kilograms. Loads typed in pounds come back from the kg they are stored in
/// a hair off (60 kg shows as 132.28 lb, which is 60.0012 kg), so a tie must
/// not count as a record. The margin is far below the smallest real plate.
bool beatsPersonalRecord(double weight, double previousBest) =>
    weight - previousBest >= 0.05;
