import 'package:flutter/material.dart';

enum AchievementType {
  firstWorkout,
  streak7,
  streak30,
  volume1000,
  volume5000,
  volume10000,
  personalRecord,
}

class Achievement {
  final AchievementType type;
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final DateTime? unlockedAt;

  const Achievement({
    required this.type,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    this.unlockedAt,
  });

  bool get isUnlocked => unlockedAt != null;

  Achievement unlock(DateTime date) => Achievement(
        type: type,
        title: title,
        description: description,
        icon: icon,
        color: color,
        unlockedAt: date,
      );

  static const List<Achievement> all = [
    Achievement(
      type: AchievementType.firstWorkout,
      title: 'Primera sesión',
      description: 'Completa tu primer entrenamiento',
      icon: Icons.star_rounded,
      color: Color(0xFFFFD700),
    ),
    Achievement(
      type: AchievementType.streak7,
      title: 'Racha de 7 días',
      description: 'Entrena al menos 1 vez en 7 días consecutivos',
      icon: Icons.local_fire_department_rounded,
      color: Color(0xFFFF6B35),
    ),
    Achievement(
      type: AchievementType.streak30,
      title: 'Racha de 30 días',
      description: 'Entrena al menos 1 vez por semana durante 30 días',
      icon: Icons.whatshot_rounded,
      color: Color(0xFFFF4444),
    ),
    Achievement(
      type: AchievementType.volume1000,
      title: '1.000 kg levantados',
      description: 'Acumula 1.000 kg de volumen total',
      icon: Icons.fitness_center_rounded,
      color: Color(0xFF4ECDC4),
    ),
    Achievement(
      type: AchievementType.volume5000,
      title: '5.000 kg levantados',
      description: 'Acumula 5.000 kg de volumen total',
      icon: Icons.fitness_center_rounded,
      color: Color(0xFF3B82F6),
    ),
    Achievement(
      type: AchievementType.volume10000,
      title: '10.000 kg levantados',
      description: 'Acumula 10.000 kg de volumen total',
      icon: Icons.fitness_center_rounded,
      color: Color(0xFF8B5CF6),
    ),
    Achievement(
      type: AchievementType.personalRecord,
      title: 'Nuevo récord personal',
      description: 'Supera tu peso máximo en un ejercicio',
      icon: Icons.emoji_events_rounded,
      color: Color(0xFFF59E0B),
    ),
  ];
}
