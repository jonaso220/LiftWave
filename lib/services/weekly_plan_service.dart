import 'package:flutter/material.dart';

import '../data/workout_templates.dart';
import '../models/models.dart';
import '../models/training_preferences.dart';
import '../theme/app_theme.dart';

class WeeklyTrainingPlan {
  final DateTime weekStart;
  final int targetWorkouts;
  final int completedWorkouts;
  final Duration trainingTime;
  final Map<String, int> completedSetsByMuscle;
  final Map<String, int> volumeByMuscle;
  final WorkoutTemplate? nextWorkout;
  final List<String> focusMuscles;

  const WeeklyTrainingPlan({
    required this.weekStart,
    required this.targetWorkouts,
    required this.completedWorkouts,
    required this.trainingTime,
    required this.completedSetsByMuscle,
    required this.volumeByMuscle,
    required this.nextWorkout,
    required this.focusMuscles,
  });

  int get remainingWorkouts =>
      (targetWorkouts - completedWorkouts).clamp(0, targetWorkouts);

  double get adherence => targetWorkouts == 0
      ? 0
      : (completedWorkouts / targetWorkouts).clamp(0, 1);

  bool get targetReached => completedWorkouts >= targetWorkouts;
}

class WeeklyPlanService {
  const WeeklyPlanService._();

  static const _muscles = [
    'Piernas',
    'Pecho',
    'Espalda',
    'Hombros',
    'Brazos',
    'Core',
  ];

  static WeeklyTrainingPlan build({
    required TrainingPreferences preferences,
    required List<Workout> workouts,
    required List<Exercise> exerciseLibrary,
    required DateTime now,
    required String planName,
  }) {
    final weekStart = _weekStart(now);
    final weekEnd = weekStart.add(const Duration(days: 7));
    final weekWorkouts = workouts
        .where(
          (workout) =>
              workout.hasCompletedWork &&
              !workout.date.isBefore(weekStart) &&
              workout.date.isBefore(weekEnd),
        )
        .toList();
    final completedSets = <String, int>{};
    final volume = <String, int>{};

    for (final workout in weekWorkouts) {
      for (final exercise in workout.exercises) {
        final explicitlyCompleted = exercise.sets
            .where((set) => set.completed)
            .toList();
        // Completed workouts from old app versions did not persist the flag.
        final hasCompletionData = exercise.sets.any(
          (set) => set.completionRecorded,
        );
        final effectiveSets = hasCompletionData
            ? explicitlyCompleted
            : exercise.sets;
        completedSets.update(
          exercise.muscleGroup,
          (value) => value + effectiveSets.length,
          ifAbsent: () => effectiveSets.length,
        );
        final exerciseVolume = effectiveSets.fold<int>(
          0,
          (sum, set) => sum + (set.reps * set.weight).round(),
        );
        volume.update(
          exercise.muscleGroup,
          (value) => value + exerciseVolume,
          ifAbsent: () => exerciseVolume,
        );
      }
    }

    final nextWorkout = weekWorkouts.length >= preferences.daysPerWeek
        ? null
        : _buildNextWorkout(
            preferences: preferences,
            exerciseLibrary: exerciseLibrary,
            completedSets: completedSets,
            completedWorkouts: weekWorkouts.length,
            weekStart: weekStart,
            planName: planName,
          );
    final focusMuscles = nextWorkout?.muscleGroups ?? const <String>[];

    return WeeklyTrainingPlan(
      weekStart: weekStart,
      targetWorkouts: preferences.daysPerWeek,
      completedWorkouts: weekWorkouts.length,
      trainingTime: weekWorkouts.fold(
        Duration.zero,
        (total, workout) => total + workout.duration,
      ),
      completedSetsByMuscle: Map.unmodifiable(completedSets),
      volumeByMuscle: Map.unmodifiable(volume),
      nextWorkout: nextWorkout,
      focusMuscles: List.unmodifiable(focusMuscles),
    );
  }

  static WorkoutTemplate? _buildNextWorkout({
    required TrainingPreferences preferences,
    required List<Exercise> exerciseLibrary,
    required Map<String, int> completedSets,
    required int completedWorkouts,
    required DateTime weekStart,
    required String planName,
  }) {
    final targets = _targetSets(preferences.goal);
    final priority = [..._muscles]
      ..sort((a, b) {
        final ratioA = (completedSets[a] ?? 0) / targets[a]!;
        final ratioB = (completedSets[b] ?? 0) / targets[b]!;
        final comparison = ratioA.compareTo(ratioB);
        if (comparison != 0) return comparison;
        final rotatedA =
            (_muscles.indexOf(a) - completedWorkouts) % _muscles.length;
        final rotatedB =
            (_muscles.indexOf(b) - completedWorkouts) % _muscles.length;
        return rotatedA.compareTo(rotatedB);
      });

    final compatible = exerciseLibrary.where((exercise) {
      if (!supportsEquipment(exercise.equipment, preferences.equipment)) {
        return false;
      }
      if (preferences.experience == ExperienceLevel.beginner &&
          _normalize(exercise.difficulty) == 'avanzado') {
        return false;
      }
      return _muscles.contains(exercise.muscleGroup);
    }).toList();
    if (compatible.isEmpty) return null;

    final maxExercises = switch (preferences.experience) {
      ExperienceLevel.beginner => 4,
      ExperienceLevel.intermediate => 5,
      ExperienceLevel.advanced => 6,
    };
    final selected = <Exercise>[];
    final selectedNames = <String>{};

    void selectFromMuscle(String muscle) {
      if (selected.length >= maxExercises) return;
      final options = compatible
          .where(
            (exercise) =>
                exercise.muscleGroup == muscle &&
                !selectedNames.contains(_normalize(exercise.name)),
          )
          .toList();
      if (options.isEmpty) return;
      final exercise = options[completedWorkouts % options.length];
      selected.add(exercise);
      selectedNames.add(_normalize(exercise.name));
    }

    for (final muscle in priority) {
      selectFromMuscle(muscle);
    }
    var pass = 0;
    while (selected.length < maxExercises && pass < 2) {
      final before = selected.length;
      for (final muscle in priority) {
        selectFromMuscle(muscle);
      }
      if (selected.length == before) break;
      pass++;
    }

    if (selected.isEmpty) return null;
    final prescription = _prescription(preferences);
    final exercises = selected.map((exercise) {
      final isTimed = _normalize(exercise.name).contains('plancha');
      return TemplateExercise(
        name: exercise.name,
        muscleGroup: exercise.muscleGroup,
        equipment: exercise.equipment,
        sets: prescription.$1,
        reps: isTimed ? prescription.$3 : prescription.$2,
        // P1 supplies a historical recommendation when available. A generated
        // plan never guesses a load for a new user.
        weight: 0,
      );
    }).toList();

    return WorkoutTemplate(
      id: 'adaptive_${weekStart.toIso8601String()}_$completedWorkouts',
      name: planName,
      subtitle: selected
          .map((exercise) => exercise.muscleGroup)
          .toSet()
          .join(' · '),
      icon: Icons.auto_awesome_rounded,
      color: AppColors.primary,
      exercises: exercises,
    );
  }

  static Map<String, double> _targetSets(TrainingGoal goal) {
    return switch (goal) {
      TrainingGoal.muscleGain => const {
        'Piernas': 10,
        'Pecho': 10,
        'Espalda': 10,
        'Hombros': 8,
        'Brazos': 6,
        'Core': 4,
      },
      TrainingGoal.strength => const {
        'Piernas': 8,
        'Pecho': 8,
        'Espalda': 8,
        'Hombros': 5,
        'Brazos': 3,
        'Core': 3,
      },
      TrainingGoal.fatLoss || TrainingGoal.generalFitness => const {
        'Piernas': 6,
        'Pecho': 6,
        'Espalda': 6,
        'Hombros': 5,
        'Brazos': 4,
        'Core': 4,
      },
    };
  }

  /// Returns (sets, reps, seconds for timed core work).
  static (int, int, int) _prescription(TrainingPreferences preferences) {
    final sets = switch (preferences.experience) {
      ExperienceLevel.beginner => 2,
      ExperienceLevel.intermediate => 3,
      ExperienceLevel.advanced => 4,
    };
    final reps = switch (preferences.goal) {
      TrainingGoal.strength => 5,
      TrainingGoal.muscleGain => 10,
      TrainingGoal.fatLoss => 12,
      TrainingGoal.generalFitness => 10,
    };
    final seconds = switch (preferences.experience) {
      ExperienceLevel.beginner => 30,
      ExperienceLevel.intermediate => 45,
      ExperienceLevel.advanced => 60,
    };
    return (sets, reps, seconds);
  }

  static bool supportsEquipment(
    String equipment,
    Set<TrainingEquipment> available,
  ) {
    final normalized = _normalize(equipment);
    if (normalized == 'peso corporal' || normalized == 'sin material') {
      return true;
    }
    if (normalized == 'mancuernas' || normalized == 'kettlebell') {
      return available.contains(TrainingEquipment.dumbbells);
    }
    if (normalized == 'barra') {
      return available.contains(TrainingEquipment.barbell);
    }
    if (normalized == 'maquina') {
      return available.contains(TrainingEquipment.machines);
    }
    if (normalized == 'polea') {
      return available.contains(TrainingEquipment.cable);
    }
    if (normalized == 'barra fija') {
      return available.contains(TrainingEquipment.pullUpBar);
    }
    if (normalized == 'paralelas' || normalized == 'anillas') {
      return available.contains(TrainingEquipment.pullUpBar);
    }
    return false;
  }

  static DateTime _weekStart(DateTime value) {
    final day = DateTime(value.year, value.month, value.day);
    return day.subtract(Duration(days: day.weekday - DateTime.monday));
  }

  static String _normalize(String value) => value
      .trim()
      .toLowerCase()
      .replaceAll('á', 'a')
      .replaceAll('é', 'e')
      .replaceAll('í', 'i')
      .replaceAll('ó', 'o')
      .replaceAll('ú', 'u')
      .replaceAll(RegExp(r'\s+'), ' ');
}
