import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/session_models.dart';

// ── Template models ───────────────────────────────────────────────────────────

class TemplateExercise {
  final String name;
  final String muscleGroup;
  final String equipment;
  final int sets;
  final int reps;
  final double weight;

  const TemplateExercise({
    required this.name,
    required this.muscleGroup,
    required this.equipment,
    required this.sets,
    required this.reps,
    required this.weight,
  });

  /// Builds the mutable SessionSets for an active workout.
  List<SessionSet> buildSets() =>
      List.generate(sets, (_) => SessionSet(reps: reps, weight: weight));
}

class WorkoutTemplate {
  final String id;
  final String name;
  final String subtitle;
  final IconData icon;
  final Color color;
  final List<TemplateExercise> exercises;

  const WorkoutTemplate({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.exercises,
  });

  List<String> get muscleGroups =>
      exercises.map((e) => e.muscleGroup).toSet().toList();
}

// ── Template data ─────────────────────────────────────────────────────────────

const List<WorkoutTemplate> workoutTemplates = [
  WorkoutTemplate(
    id: 'tpl_fullbody',
    name: 'Full Body',
    subtitle: 'Todos los grupos musculares en una sesión',
    icon: Icons.accessibility_new_rounded,
    color: AppColors.primary,
    exercises: [
      TemplateExercise(
        name: 'Sentadilla con barra',
        muscleGroup: 'Piernas',
        equipment: 'Barra',
        sets: 4,
        reps: 8,
        weight: 60,
      ),
      TemplateExercise(
        name: 'Press de banca',
        muscleGroup: 'Pecho',
        equipment: 'Barra',
        sets: 4,
        reps: 8,
        weight: 60,
      ),
      TemplateExercise(
        name: 'Peso muerto',
        muscleGroup: 'Espalda',
        equipment: 'Barra',
        sets: 3,
        reps: 6,
        weight: 80,
      ),
      TemplateExercise(
        name: 'Press militar',
        muscleGroup: 'Hombros',
        equipment: 'Barra',
        sets: 3,
        reps: 10,
        weight: 40,
      ),
      TemplateExercise(
        name: 'Plancha',
        muscleGroup: 'Core',
        equipment: 'Sin material',
        sets: 3,
        reps: 60,
        weight: 0,
      ),
    ],
  ),

  WorkoutTemplate(
    id: 'tpl_push',
    name: 'Push',
    subtitle: 'Pecho · Hombros · Tríceps',
    icon: Icons.arrow_circle_up_rounded,
    color: AppColors.accentOrange,
    exercises: [
      TemplateExercise(
        name: 'Press de banca',
        muscleGroup: 'Pecho',
        equipment: 'Barra',
        sets: 4,
        reps: 8,
        weight: 70,
      ),
      TemplateExercise(
        name: 'Press inclinado con mancuernas',
        muscleGroup: 'Pecho',
        equipment: 'Mancuernas',
        sets: 3,
        reps: 10,
        weight: 24,
      ),
      TemplateExercise(
        name: 'Fondos en paralelas',
        muscleGroup: 'Pecho',
        equipment: 'Paralelas',
        sets: 3,
        reps: 10,
        weight: 0,
      ),
      TemplateExercise(
        name: 'Press Arnold',
        muscleGroup: 'Hombros',
        equipment: 'Mancuernas',
        sets: 3,
        reps: 12,
        weight: 16,
      ),
      TemplateExercise(
        name: 'Elevaciones laterales',
        muscleGroup: 'Hombros',
        equipment: 'Mancuernas',
        sets: 3,
        reps: 15,
        weight: 8,
      ),
      TemplateExercise(
        name: 'Extensión de tríceps en polea',
        muscleGroup: 'Brazos',
        equipment: 'Polea',
        sets: 3,
        reps: 15,
        weight: 15,
      ),
    ],
  ),

  WorkoutTemplate(
    id: 'tpl_pull',
    name: 'Pull',
    subtitle: 'Espalda · Bíceps',
    icon: Icons.arrow_circle_down_rounded,
    color: AppColors.accent,
    exercises: [
      TemplateExercise(
        name: 'Peso muerto',
        muscleGroup: 'Espalda',
        equipment: 'Barra',
        sets: 4,
        reps: 5,
        weight: 100,
      ),
      TemplateExercise(
        name: 'Dominadas',
        muscleGroup: 'Espalda',
        equipment: 'Barra fija',
        sets: 4,
        reps: 8,
        weight: 0,
      ),
      TemplateExercise(
        name: 'Remo con barra',
        muscleGroup: 'Espalda',
        equipment: 'Barra',
        sets: 3,
        reps: 10,
        weight: 60,
      ),
      TemplateExercise(
        name: 'Jalón al pecho',
        muscleGroup: 'Espalda',
        equipment: 'Polea',
        sets: 3,
        reps: 12,
        weight: 50,
      ),
      TemplateExercise(
        name: 'Curl de bíceps con mancuernas',
        muscleGroup: 'Brazos',
        equipment: 'Mancuernas',
        sets: 3,
        reps: 12,
        weight: 12,
      ),
      TemplateExercise(
        name: 'Curl martillo',
        muscleGroup: 'Brazos',
        equipment: 'Mancuernas',
        sets: 3,
        reps: 12,
        weight: 12,
      ),
    ],
  ),

  WorkoutTemplate(
    id: 'tpl_torso',
    name: 'Torso',
    subtitle: 'Pecho · Espalda · Hombros',
    icon: Icons.sports_gymnastics_rounded,
    color: AppColors.accentYellow,
    exercises: [
      TemplateExercise(
        name: 'Press de banca',
        muscleGroup: 'Pecho',
        equipment: 'Barra',
        sets: 4,
        reps: 8,
        weight: 70,
      ),
      TemplateExercise(
        name: 'Peso muerto',
        muscleGroup: 'Espalda',
        equipment: 'Barra',
        sets: 4,
        reps: 6,
        weight: 100,
      ),
      TemplateExercise(
        name: 'Press militar',
        muscleGroup: 'Hombros',
        equipment: 'Barra',
        sets: 3,
        reps: 10,
        weight: 40,
      ),
      TemplateExercise(
        name: 'Remo con mancuerna',
        muscleGroup: 'Espalda',
        equipment: 'Mancuernas',
        sets: 3,
        reps: 10,
        weight: 20,
      ),
      TemplateExercise(
        name: 'Face pull',
        muscleGroup: 'Hombros',
        equipment: 'Polea',
        sets: 3,
        reps: 15,
        weight: 20,
      ),
      TemplateExercise(
        name: 'Aperturas con mancuernas',
        muscleGroup: 'Pecho',
        equipment: 'Mancuernas',
        sets: 3,
        reps: 12,
        weight: 14,
      ),
    ],
  ),

  WorkoutTemplate(
    id: 'tpl_legs',
    name: 'Piernas',
    subtitle: 'Cuádriceps · Isquios · Glúteos · Core',
    icon: Icons.directions_run_rounded,
    color: AppColors.legs,
    exercises: [
      TemplateExercise(
        name: 'Sentadilla con barra',
        muscleGroup: 'Piernas',
        equipment: 'Barra',
        sets: 5,
        reps: 5,
        weight: 80,
      ),
      TemplateExercise(
        name: 'Prensa de piernas',
        muscleGroup: 'Piernas',
        equipment: 'Máquina',
        sets: 4,
        reps: 10,
        weight: 100,
      ),
      TemplateExercise(
        name: 'Hip thrust',
        muscleGroup: 'Piernas',
        equipment: 'Barra',
        sets: 4,
        reps: 10,
        weight: 80,
      ),
      TemplateExercise(
        name: 'Zancadas',
        muscleGroup: 'Piernas',
        equipment: 'Mancuernas',
        sets: 3,
        reps: 12,
        weight: 20,
      ),
      TemplateExercise(
        name: 'Curl de isquiotibiales',
        muscleGroup: 'Piernas',
        equipment: 'Máquina',
        sets: 3,
        reps: 15,
        weight: 40,
      ),
      TemplateExercise(
        name: 'Plancha',
        muscleGroup: 'Core',
        equipment: 'Sin material',
        sets: 3,
        reps: 60,
        weight: 0,
      ),
    ],
  ),
];
