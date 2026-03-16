import 'package:flutter/material.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';

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

  Achievement({
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

  static List<Achievement> all(S l10n) => [
    Achievement(
      type: AchievementType.firstWorkout,
      title: l10n.achievement_firstWorkout_title,
      description: l10n.achievement_firstWorkout_description,
      icon: Icons.star_rounded,
      color: const Color(0xFFFFD700),
    ),
    Achievement(
      type: AchievementType.streak7,
      title: l10n.achievement_streak7_title,
      description: l10n.achievement_streak7_description,
      icon: Icons.local_fire_department_rounded,
      color: const Color(0xFFFF6B35),
    ),
    Achievement(
      type: AchievementType.streak30,
      title: l10n.achievement_streak30_title,
      description: l10n.achievement_streak30_description,
      icon: Icons.whatshot_rounded,
      color: const Color(0xFFFF4444),
    ),
    Achievement(
      type: AchievementType.volume1000,
      title: l10n.achievement_volume1000_title,
      description: l10n.achievement_volume1000_description,
      icon: Icons.fitness_center_rounded,
      color: const Color(0xFF4ECDC4),
    ),
    Achievement(
      type: AchievementType.volume5000,
      title: l10n.achievement_volume5000_title,
      description: l10n.achievement_volume5000_description,
      icon: Icons.fitness_center_rounded,
      color: const Color(0xFF3B82F6),
    ),
    Achievement(
      type: AchievementType.volume10000,
      title: l10n.achievement_volume10000_title,
      description: l10n.achievement_volume10000_description,
      icon: Icons.fitness_center_rounded,
      color: const Color(0xFF8B5CF6),
    ),
    Achievement(
      type: AchievementType.personalRecord,
      title: l10n.achievement_personalRecord_title,
      description: l10n.achievement_personalRecord_description,
      icon: Icons.emoji_events_rounded,
      color: const Color(0xFFF59E0B),
    ),
  ];
}
