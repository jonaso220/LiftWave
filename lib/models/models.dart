// ── Workout models ────────────────────────────────────────────────────────────

class WorkoutSet {
  final int setNumber;
  final int reps;
  final double weight;
  final bool completed;

  const WorkoutSet({
    required this.setNumber,
    required this.reps,
    required this.weight,
    this.completed = false,
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
      );
}

class WorkoutExercise {
  final String id;
  final String name;
  final String muscleGroup;
  final List<WorkoutSet> sets;
  final String? notes;

  const WorkoutExercise({
    required this.id,
    required this.name,
    required this.muscleGroup,
    required this.sets,
    this.notes,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'muscleGroup': muscleGroup,
        'sets': sets.map((s) => s.toJson()).toList(),
        'notes': notes,
      };

  factory WorkoutExercise.fromJson(Map<String, dynamic> j) => WorkoutExercise(
        id: j['id'] as String,
        name: j['name'] as String,
        muscleGroup: j['muscleGroup'] as String,
        sets: (j['sets'] as List)
            .map((s) => WorkoutSet.fromJson(s as Map<String, dynamic>))
            .toList(),
        notes: j['notes'] as String?,
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

  const Workout({
    required this.id,
    required this.name,
    required this.date,
    required this.duration,
    required this.exercises,
    required this.totalVolume,
    this.notes,
  });

  int get totalSets =>
      exercises.fold(0, (sum, e) => sum + e.sets.length);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'date': date.toIso8601String(),
        'durationSeconds': duration.inSeconds,
        'exercises': exercises.map((e) => e.toJson()).toList(),
        'totalVolume': totalVolume,
        'notes': notes,
      };

  factory Workout.fromJson(Map<String, dynamic> j) => Workout(
        id: j['id'] as String,
        name: j['name'] as String,
        date: DateTime.parse(j['date'] as String),
        duration: Duration(seconds: (j['durationSeconds'] as num).toInt()),
        exercises: (j['exercises'] as List)
            .map((e) => WorkoutExercise.fromJson(e as Map<String, dynamic>))
            .toList(),
        totalVolume: (j['totalVolume'] as num).toInt(),
        notes: j['notes'] as String?,
      );
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
