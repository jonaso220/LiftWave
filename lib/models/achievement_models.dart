import 'package:flutter/material.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';

enum AchievementType {
  firstWorkout,
  streak7,
  streak14,
  streak30,
  streak100,
  streak365,
  volume1000,
  volume5000,
  volume10000,
  personalRecord,
  // Lift PRs
  bench50,
  bench100,
  squat100,
  squat150,
  deadlift100,
  deadlift150,
  deadlift200,
  // Variedad
  explorer10,
  master25,
  fullBodyGroups,
  crossfitFan,
  // Tiempo acumulado
  time1h,
  time10h,
  time50h,
  time100h,
  // Fun / contextuales
  earlyBird,
  nightOwl,
  comeback,
  marathoner,
  efficient,
  weekendWarrior,
  weeklyVariety,
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

    // ── Rachas intermedias ────────────────────────────────────────────────
    Achievement(
      type: AchievementType.streak14,
      title: l10n.achievement_streak14_title,
      description: l10n.achievement_streak14_description,
      icon: Icons.local_fire_department_rounded,
      color: const Color(0xFFFF8C42),
    ),
    Achievement(
      type: AchievementType.streak100,
      title: l10n.achievement_streak100_title,
      description: l10n.achievement_streak100_description,
      icon: Icons.whatshot_rounded,
      color: const Color(0xFFE63946),
    ),
    Achievement(
      type: AchievementType.streak365,
      title: l10n.achievement_streak365_title,
      description: l10n.achievement_streak365_description,
      icon: Icons.emoji_events_rounded,
      color: const Color(0xFFFFD700),
    ),

    // ── PRs por levantamiento ─────────────────────────────────────────────
    Achievement(
      type: AchievementType.bench50,
      title: l10n.achievement_bench50_title,
      description: l10n.achievement_bench50_description,
      icon: Icons.fitness_center_rounded,
      color: const Color(0xFFFF6B35),
    ),
    Achievement(
      type: AchievementType.bench100,
      title: l10n.achievement_bench100_title,
      description: l10n.achievement_bench100_description,
      icon: Icons.fitness_center_rounded,
      color: const Color(0xFFE63946),
    ),
    Achievement(
      type: AchievementType.squat100,
      title: l10n.achievement_squat100_title,
      description: l10n.achievement_squat100_description,
      icon: Icons.fitness_center_rounded,
      color: const Color(0xFF00D4AA),
    ),
    Achievement(
      type: AchievementType.squat150,
      title: l10n.achievement_squat150_title,
      description: l10n.achievement_squat150_description,
      icon: Icons.fitness_center_rounded,
      color: const Color(0xFF008F76),
    ),
    Achievement(
      type: AchievementType.deadlift100,
      title: l10n.achievement_deadlift100_title,
      description: l10n.achievement_deadlift100_description,
      icon: Icons.fitness_center_rounded,
      color: const Color(0xFF6C63FF),
    ),
    Achievement(
      type: AchievementType.deadlift150,
      title: l10n.achievement_deadlift150_title,
      description: l10n.achievement_deadlift150_description,
      icon: Icons.fitness_center_rounded,
      color: const Color(0xFF4A42D6),
    ),
    Achievement(
      type: AchievementType.deadlift200,
      title: l10n.achievement_deadlift200_title,
      description: l10n.achievement_deadlift200_description,
      icon: Icons.military_tech_rounded,
      color: const Color(0xFFFFD700),
    ),

    // ── Variedad ──────────────────────────────────────────────────────────
    Achievement(
      type: AchievementType.explorer10,
      title: l10n.achievement_explorer10_title,
      description: l10n.achievement_explorer10_description,
      icon: Icons.explore_rounded,
      color: const Color(0xFF4ECDC4),
    ),
    Achievement(
      type: AchievementType.master25,
      title: l10n.achievement_master25_title,
      description: l10n.achievement_master25_description,
      icon: Icons.school_rounded,
      color: const Color(0xFF8B5CF6),
    ),
    Achievement(
      type: AchievementType.fullBodyGroups,
      title: l10n.achievement_fullBodyGroups_title,
      description: l10n.achievement_fullBodyGroups_description,
      icon: Icons.accessibility_new_rounded,
      color: const Color(0xFF3B82F6),
    ),
    Achievement(
      type: AchievementType.crossfitFan,
      title: l10n.achievement_crossfitFan_title,
      description: l10n.achievement_crossfitFan_description,
      icon: Icons.bolt_rounded,
      color: const Color(0xFFE63946),
    ),

    // ── Tiempo acumulado ──────────────────────────────────────────────────
    Achievement(
      type: AchievementType.time1h,
      title: l10n.achievement_time1h_title,
      description: l10n.achievement_time1h_description,
      icon: Icons.access_time_rounded,
      color: const Color(0xFF4ECDC4),
    ),
    Achievement(
      type: AchievementType.time10h,
      title: l10n.achievement_time10h_title,
      description: l10n.achievement_time10h_description,
      icon: Icons.timelapse_rounded,
      color: const Color(0xFF3B82F6),
    ),
    Achievement(
      type: AchievementType.time50h,
      title: l10n.achievement_time50h_title,
      description: l10n.achievement_time50h_description,
      icon: Icons.hourglass_top_rounded,
      color: const Color(0xFF8B5CF6),
    ),
    Achievement(
      type: AchievementType.time100h,
      title: l10n.achievement_time100h_title,
      description: l10n.achievement_time100h_description,
      icon: Icons.diamond_rounded,
      color: const Color(0xFFFFD700),
    ),

    // ── Fun / contextuales ────────────────────────────────────────────────
    Achievement(
      type: AchievementType.earlyBird,
      title: l10n.achievement_earlyBird_title,
      description: l10n.achievement_earlyBird_description,
      icon: Icons.wb_sunny_rounded,
      color: const Color(0xFFFFD166),
    ),
    Achievement(
      type: AchievementType.nightOwl,
      title: l10n.achievement_nightOwl_title,
      description: l10n.achievement_nightOwl_description,
      icon: Icons.nightlight_round,
      color: const Color(0xFF6C63FF),
    ),
    Achievement(
      type: AchievementType.comeback,
      title: l10n.achievement_comeback_title,
      description: l10n.achievement_comeback_description,
      icon: Icons.refresh_rounded,
      color: const Color(0xFF00D4AA),
    ),
    Achievement(
      type: AchievementType.marathoner,
      title: l10n.achievement_marathoner_title,
      description: l10n.achievement_marathoner_description,
      icon: Icons.directions_run_rounded,
      color: const Color(0xFFFF6B35),
    ),
    Achievement(
      type: AchievementType.efficient,
      title: l10n.achievement_efficient_title,
      description: l10n.achievement_efficient_description,
      icon: Icons.flash_on_rounded,
      color: const Color(0xFFFFD166),
    ),
    Achievement(
      type: AchievementType.weekendWarrior,
      title: l10n.achievement_weekendWarrior_title,
      description: l10n.achievement_weekendWarrior_description,
      icon: Icons.shield_rounded,
      color: const Color(0xFFE63946),
    ),
    Achievement(
      type: AchievementType.weeklyVariety,
      title: l10n.achievement_weeklyVariety_title,
      description: l10n.achievement_weeklyVariety_description,
      icon: Icons.dashboard_rounded,
      color: const Color(0xFF4ECDC4),
    ),
  ];
}
