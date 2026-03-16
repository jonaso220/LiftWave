import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/achievement_models.dart';
import 'workout_store.dart';

class AchievementStore extends ChangeNotifier {
  AchievementStore._();
  static final instance = AchievementStore._();

  static const _key = 'achievements_unlocked';
  final Map<AchievementType, DateTime> _unlocked = {};

  List<Achievement> get all => Achievement.all.map((a) {
        final date = _unlocked[a.type];
        return date != null ? a.unlock(date) : a;
      }).toList();

  List<Achievement> get unlocked =>
      all.where((a) => a.isUnlocked).toList();

  int get unlockedCount => _unlocked.length;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw != null) {
      final map = jsonDecode(raw) as Map<String, dynamic>;
      _unlocked.clear();
      for (final entry in map.entries) {
        final type = AchievementType.values.firstWhere(
          (t) => t.name == entry.key,
          orElse: () => AchievementType.firstWorkout,
        );
        _unlocked[type] = DateTime.parse(entry.value as String);
      }
    }
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    final map = <String, String>{};
    for (final entry in _unlocked.entries) {
      map[entry.key.name] = entry.value.toIso8601String();
    }
    await prefs.setString(_key, jsonEncode(map));
  }

  /// Check all achievements after a workout is completed.
  /// Returns list of newly unlocked achievements.
  List<Achievement> checkAfterWorkout() {
    final newlyUnlocked = <Achievement>[];
    final workouts = WorkoutStore.instance.workouts;
    final now = DateTime.now();

    // First workout
    if (!_unlocked.containsKey(AchievementType.firstWorkout) &&
        workouts.isNotEmpty) {
      _unlocked[AchievementType.firstWorkout] = now;
      newlyUnlocked.add(Achievement.all
          .firstWhere((a) => a.type == AchievementType.firstWorkout)
          .unlock(now));
    }

    // Volume milestones
    final totalVolume =
        workouts.fold<int>(0, (sum, w) => sum + w.totalVolume);
    if (!_unlocked.containsKey(AchievementType.volume1000) &&
        totalVolume >= 1000) {
      _unlocked[AchievementType.volume1000] = now;
      newlyUnlocked.add(Achievement.all
          .firstWhere((a) => a.type == AchievementType.volume1000)
          .unlock(now));
    }
    if (!_unlocked.containsKey(AchievementType.volume5000) &&
        totalVolume >= 5000) {
      _unlocked[AchievementType.volume5000] = now;
      newlyUnlocked.add(Achievement.all
          .firstWhere((a) => a.type == AchievementType.volume5000)
          .unlock(now));
    }
    if (!_unlocked.containsKey(AchievementType.volume10000) &&
        totalVolume >= 10000) {
      _unlocked[AchievementType.volume10000] = now;
      newlyUnlocked.add(Achievement.all
          .firstWhere((a) => a.type == AchievementType.volume10000)
          .unlock(now));
    }

    // Streak 7 days: at least one workout in each of the last 7 days
    if (!_unlocked.containsKey(AchievementType.streak7)) {
      if (_checkDayStreak(workouts, 7)) {
        _unlocked[AchievementType.streak7] = now;
        newlyUnlocked.add(Achievement.all
            .firstWhere((a) => a.type == AchievementType.streak7)
            .unlock(now));
      }
    }

    // Streak 30 days: at least one workout per week for 4 weeks
    if (!_unlocked.containsKey(AchievementType.streak30)) {
      if (_checkWeeklyStreak(workouts, 4)) {
        _unlocked[AchievementType.streak30] = now;
        newlyUnlocked.add(Achievement.all
            .firstWhere((a) => a.type == AchievementType.streak30)
            .unlock(now));
      }
    }

    // Personal record: check if latest workout has a new max weight
    if (workouts.length >= 2) {
      final latest = workouts.first;
      for (final ex in latest.exercises) {
        final maxWeightNow =
            ex.sets.fold<double>(0, (m, s) => s.weight > m ? s.weight : m);
        if (maxWeightNow <= 0) continue;

        // Check previous workouts for same exercise
        double previousMax = 0;
        for (final w in workouts.skip(1)) {
          for (final e in w.exercises) {
            if (e.name == ex.name) {
              for (final s in e.sets) {
                if (s.weight > previousMax) previousMax = s.weight;
              }
            }
          }
        }
        if (previousMax > 0 && maxWeightNow > previousMax) {
          if (!_unlocked.containsKey(AchievementType.personalRecord)) {
            _unlocked[AchievementType.personalRecord] = now;
            newlyUnlocked.add(Achievement.all
                .firstWhere(
                    (a) => a.type == AchievementType.personalRecord)
                .unlock(now));
          }
          break;
        }
      }
    }

    if (newlyUnlocked.isNotEmpty) {
      _save();
      notifyListeners();
    }
    return newlyUnlocked;
  }

  bool _checkDayStreak(List<dynamic> workouts, int days) {
    final now = DateTime.now();
    for (int i = 0; i < days; i++) {
      final day = DateTime(now.year, now.month, now.day)
          .subtract(Duration(days: i));
      final hasWorkout = WorkoutStore.instance.workouts.any((w) =>
          w.date.year == day.year &&
          w.date.month == day.month &&
          w.date.day == day.day);
      if (!hasWorkout) return false;
    }
    return true;
  }

  bool _checkWeeklyStreak(List<dynamic> workouts, int weeks) {
    final now = DateTime.now();
    for (int i = 0; i < weeks; i++) {
      final weekEnd = now.subtract(Duration(days: 7 * i));
      final weekStart = weekEnd.subtract(const Duration(days: 7));
      final hasWorkout = WorkoutStore.instance.workouts.any(
          (w) => w.date.isAfter(weekStart) && w.date.isBefore(weekEnd));
      if (!hasWorkout) return false;
    }
    return true;
  }
}
