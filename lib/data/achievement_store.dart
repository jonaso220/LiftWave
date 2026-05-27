import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/achievement_models.dart';
import '../models/models.dart';
import 'workout_store.dart';

class AchievementStore extends ChangeNotifier {
  AchievementStore._() {
    _authSub = FirebaseAuth.instance.authStateChanges().listen(_onAuthChanged);
  }
  static final instance = AchievementStore._();

  static const _legacyKey = 'achievements_unlocked';
  final Map<AchievementType, DateTime> _unlocked = {};
  StreamSubscription<User?>? _authSub;
  String? _currentUid;

  String get _key {
    final uid = _currentUid;
    return uid == null ? _legacyKey : 'achievements_unlocked_$uid';
  }

  void _onAuthChanged(User? user) {
    final newUid = user?.uid;
    if (newUid == _currentUid) return;
    _currentUid = newUid;
    _unlocked.clear();
    // Reload for the new user; fire-and-forget.
    load();
    notifyListeners();
  }

  List<Achievement> getAll(S l10n) => Achievement.all(l10n).map((a) {
        final date = _unlocked[a.type];
        return date != null ? a.unlock(date) : a;
      }).toList();

  List<Achievement> getUnlocked(S l10n) =>
      getAll(l10n).where((a) => a.isUnlocked).toList();

  int get unlockedCount => _unlocked.length;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    var raw = prefs.getString(_key);
    // First run after upgrade: migrate from the legacy global key to the
    // per-user key so existing achievements aren't lost.
    if (raw == null && _currentUid != null) {
      final legacy = prefs.getString(_legacyKey);
      if (legacy != null) {
        await prefs.setString(_key, legacy);
        await prefs.remove(_legacyKey);
        raw = legacy;
      }
    }
    _unlocked.clear();
    if (raw != null) {
      final map = jsonDecode(raw) as Map<String, dynamic>;
      for (final entry in map.entries) {
        final type = AchievementType.values.firstWhere(
          (t) => t.name == entry.key,
          orElse: () => AchievementType.firstWorkout,
        );
        _unlocked[type] = DateTime.parse(entry.value as String);
      }
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _authSub?.cancel();
    super.dispose();
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
  List<Achievement> checkAfterWorkout(S l10n) {
    final newlyUnlocked = <Achievement>[];
    final workouts = WorkoutStore.instance.workouts;
    final now = DateTime.now();
    final achievements = Achievement.all(l10n);

    // First workout
    if (!_unlocked.containsKey(AchievementType.firstWorkout) &&
        workouts.isNotEmpty) {
      _unlocked[AchievementType.firstWorkout] = now;
      newlyUnlocked.add(achievements
          .firstWhere((a) => a.type == AchievementType.firstWorkout)
          .unlock(now));
    }

    // Volume milestones
    final totalVolume =
        workouts.fold<int>(0, (sum, w) => sum + w.totalVolume);
    if (!_unlocked.containsKey(AchievementType.volume1000) &&
        totalVolume >= 1000) {
      _unlocked[AchievementType.volume1000] = now;
      newlyUnlocked.add(achievements
          .firstWhere((a) => a.type == AchievementType.volume1000)
          .unlock(now));
    }
    if (!_unlocked.containsKey(AchievementType.volume5000) &&
        totalVolume >= 5000) {
      _unlocked[AchievementType.volume5000] = now;
      newlyUnlocked.add(achievements
          .firstWhere((a) => a.type == AchievementType.volume5000)
          .unlock(now));
    }
    if (!_unlocked.containsKey(AchievementType.volume10000) &&
        totalVolume >= 10000) {
      _unlocked[AchievementType.volume10000] = now;
      newlyUnlocked.add(achievements
          .firstWhere((a) => a.type == AchievementType.volume10000)
          .unlock(now));
    }

    // Streak 7 days: at least one workout in each of the last 7 days
    if (!_unlocked.containsKey(AchievementType.streak7)) {
      if (_checkDayStreak(workouts, 7)) {
        _unlocked[AchievementType.streak7] = now;
        newlyUnlocked.add(achievements
            .firstWhere((a) => a.type == AchievementType.streak7)
            .unlock(now));
      }
    }

    // Streak 30 days: at least one workout per week for 4 weeks
    if (!_unlocked.containsKey(AchievementType.streak30)) {
      if (_checkWeeklyStreak(workouts, 4)) {
        _unlocked[AchievementType.streak30] = now;
        newlyUnlocked.add(achievements
            .firstWhere((a) => a.type == AchievementType.streak30)
            .unlock(now));
      }
    }

    // Personal record: check if latest workout has a new max weight.
    // Only completed sets count.
    if (workouts.length >= 2) {
      final latest = workouts.first;
      for (final ex in latest.exercises) {
        final maxWeightNow = ex.sets
            .where((s) => s.completed)
            .fold<double>(0, (m, s) => s.weight > m ? s.weight : m);
        if (maxWeightNow <= 0) continue;

        // Check previous workouts for same exercise (completed sets only)
        double previousMax = 0;
        for (final w in workouts.skip(1)) {
          for (final e in w.exercises) {
            if (e.name == ex.name) {
              for (final s in e.sets) {
                if (s.completed && s.weight > previousMax) {
                  previousMax = s.weight;
                }
              }
            }
          }
        }
        if (previousMax > 0 && maxWeightNow > previousMax) {
          if (!_unlocked.containsKey(AchievementType.personalRecord)) {
            _unlocked[AchievementType.personalRecord] = now;
            newlyUnlocked.add(achievements
                .firstWhere(
                    (a) => a.type == AchievementType.personalRecord)
                .unlock(now));
          }
          break;
        }
      }
    }

    // ── New achievements ────────────────────────────────────────────────────

    final latest = workouts.isNotEmpty ? workouts.first : null;

    // Streak intermediate (14 / 100 / 365 days)
    if (!_unlocked.containsKey(AchievementType.streak14) &&
        _checkDayStreak(workouts, 14)) {
      _unlocked[AchievementType.streak14] = now;
      newlyUnlocked.add(achievements
          .firstWhere((a) => a.type == AchievementType.streak14)
          .unlock(now));
    }
    if (!_unlocked.containsKey(AchievementType.streak100) &&
        _checkWeeklyStreak(workouts, 14)) {
      // 14 weeks ~ 100 days with at least one workout per week
      _unlocked[AchievementType.streak100] = now;
      newlyUnlocked.add(achievements
          .firstWhere((a) => a.type == AchievementType.streak100)
          .unlock(now));
    }
    if (!_unlocked.containsKey(AchievementType.streak365) &&
        _checkWeeklyStreak(workouts, 52)) {
      _unlocked[AchievementType.streak365] = now;
      newlyUnlocked.add(achievements
          .firstWhere((a) => a.type == AchievementType.streak365)
          .unlock(now));
    }

    // Lift PRs — max weight reached across all workouts for the specific lift
    void checkLiftPR(
        AchievementType type, List<String> exerciseNames, double threshold) {
      if (_unlocked.containsKey(type)) return;
      final maxWeight = _maxWeightFor(workouts, exerciseNames);
      if (maxWeight >= threshold) {
        _unlocked[type] = now;
        newlyUnlocked.add(achievements
            .firstWhere((a) => a.type == type)
            .unlock(now));
      }
    }

    // Aliases cover Spanish, English and Portuguese variants so users on
    // any locale (or with custom exercises named in another language) still
    // unlock the lift PRs. Match is case-insensitive.
    const benchAliases = [
      'Press de banca',
      'Bench press',
      'Bench Press',
      'Supino reto',
    ];
    const squatAliases = [
      'Sentadilla con barra',
      'Sentadilla',
      'Squat',
      'Back squat',
      'Agachamento',
      'Agachamento com barra',
    ];
    const deadliftAliases = [
      'Peso muerto',
      'Deadlift',
      'Levantamento terra',
      'Conventional deadlift',
    ];

    checkLiftPR(AchievementType.bench50, benchAliases, 50);
    checkLiftPR(AchievementType.bench100, benchAliases, 100);
    checkLiftPR(AchievementType.squat100, squatAliases, 100);
    checkLiftPR(AchievementType.squat150, squatAliases, 150);
    checkLiftPR(AchievementType.deadlift100, deadliftAliases, 100);
    checkLiftPR(AchievementType.deadlift150, deadliftAliases, 150);
    checkLiftPR(AchievementType.deadlift200, deadliftAliases, 200);

    // Variedad
    final distinctExercises = <String>{};
    final muscleGroupsHit = <String>{};
    int crossfitDistinct = 0;
    {
      final crossfitSet = <String>{};
      for (final w in workouts) {
        for (final e in w.exercises) {
          distinctExercises.add(e.name);
          muscleGroupsHit.add(e.muscleGroup);
          if (e.muscleGroup == 'CrossFit') crossfitSet.add(e.name);
        }
      }
      crossfitDistinct = crossfitSet.length;
    }

    if (!_unlocked.containsKey(AchievementType.explorer10) &&
        distinctExercises.length >= 10) {
      _unlocked[AchievementType.explorer10] = now;
      newlyUnlocked.add(achievements
          .firstWhere((a) => a.type == AchievementType.explorer10)
          .unlock(now));
    }
    if (!_unlocked.containsKey(AchievementType.master25) &&
        distinctExercises.length >= 25) {
      _unlocked[AchievementType.master25] = now;
      newlyUnlocked.add(achievements
          .firstWhere((a) => a.type == AchievementType.master25)
          .unlock(now));
    }
    const requiredGroups = {
      'Pecho',
      'Espalda',
      'Piernas',
      'Hombros',
      'Brazos',
      'Core'
    };
    if (!_unlocked.containsKey(AchievementType.fullBodyGroups) &&
        requiredGroups.every(muscleGroupsHit.contains)) {
      _unlocked[AchievementType.fullBodyGroups] = now;
      newlyUnlocked.add(achievements
          .firstWhere((a) => a.type == AchievementType.fullBodyGroups)
          .unlock(now));
    }
    if (!_unlocked.containsKey(AchievementType.crossfitFan) &&
        crossfitDistinct >= 10) {
      _unlocked[AchievementType.crossfitFan] = now;
      newlyUnlocked.add(achievements
          .firstWhere((a) => a.type == AchievementType.crossfitFan)
          .unlock(now));
    }

    // Tiempo acumulado
    final totalMinutes = workouts.fold<int>(
        0, (sum, w) => sum + w.duration.inMinutes);
    void checkTime(AchievementType type, int thresholdMinutes) {
      if (_unlocked.containsKey(type)) return;
      if (totalMinutes >= thresholdMinutes) {
        _unlocked[type] = now;
        newlyUnlocked.add(achievements
            .firstWhere((a) => a.type == type)
            .unlock(now));
      }
    }

    checkTime(AchievementType.time1h, 60);
    checkTime(AchievementType.time10h, 600);
    checkTime(AchievementType.time50h, 3000);
    checkTime(AchievementType.time100h, 6000);

    // Fun / contextuales — based on the just-finished workout
    if (latest != null) {
      final start = latest.date.subtract(latest.duration);
      final end = latest.date;

      // Madrugador
      if (!_unlocked.containsKey(AchievementType.earlyBird) &&
          start.hour < 7) {
        _unlocked[AchievementType.earlyBird] = now;
        newlyUnlocked.add(achievements
            .firstWhere((a) => a.type == AchievementType.earlyBird)
            .unlock(now));
      }

      // Búho nocturno
      if (!_unlocked.containsKey(AchievementType.nightOwl) &&
          end.hour >= 22) {
        _unlocked[AchievementType.nightOwl] = now;
        newlyUnlocked.add(achievements
            .firstWhere((a) => a.type == AchievementType.nightOwl)
            .unlock(now));
      }

      // Comeback — current workout after 30+ days no workout
      if (!_unlocked.containsKey(AchievementType.comeback) &&
          workouts.length >= 2) {
        final prev = workouts[1];
        final daysSincePrev = start.difference(prev.date).inDays;
        if (daysSincePrev >= 30) {
          _unlocked[AchievementType.comeback] = now;
          newlyUnlocked.add(achievements
              .firstWhere((a) => a.type == AchievementType.comeback)
              .unlock(now));
        }
      }

      // Maratoniano
      if (!_unlocked.containsKey(AchievementType.marathoner) &&
          latest.duration.inMinutes >= 90) {
        _unlocked[AchievementType.marathoner] = now;
        newlyUnlocked.add(achievements
            .firstWhere((a) => a.type == AchievementType.marathoner)
            .unlock(now));
      }

      // Eficiente — 3+ exercises and <= 30 min
      final completedExercises = latest.exercises
          .where((e) => e.sets.any((s) => s.completed))
          .length;
      if (!_unlocked.containsKey(AchievementType.efficient) &&
          completedExercises >= 3 &&
          latest.duration.inMinutes <= 30 &&
          latest.duration.inMinutes > 0) {
        _unlocked[AchievementType.efficient] = now;
        newlyUnlocked.add(achievements
            .firstWhere((a) => a.type == AchievementType.efficient)
            .unlock(now));
      }

      // Weekend warrior — last 3 weekends with workouts on Saturday AND Sunday
      if (!_unlocked.containsKey(AchievementType.weekendWarrior) &&
          _checkWeekendWarrior(workouts, 3)) {
        _unlocked[AchievementType.weekendWarrior] = now;
        newlyUnlocked.add(achievements
            .firstWhere((a) => a.type == AchievementType.weekendWarrior)
            .unlock(now));
      }

      // Weekly variety — current week has 5+ distinct muscle groups
      if (!_unlocked.containsKey(AchievementType.weeklyVariety) &&
          _checkWeeklyVariety(workouts, end, 5)) {
        _unlocked[AchievementType.weeklyVariety] = now;
        newlyUnlocked.add(achievements
            .firstWhere((a) => a.type == AchievementType.weeklyVariety)
            .unlock(now));
      }
    }

    if (newlyUnlocked.isNotEmpty) {
      _save();
      notifyListeners();
    }
    return newlyUnlocked;
  }

  double _maxWeightFor(List<Workout> workouts, List<String> exerciseNames) {
    final aliases =
        exerciseNames.map((n) => n.toLowerCase().trim()).toSet();
    double max = 0;
    for (final w in workouts) {
      for (final e in w.exercises) {
        if (!aliases.contains(e.name.toLowerCase().trim())) continue;
        for (final s in e.sets) {
          if (s.completed && s.weight > max) max = s.weight;
        }
      }
    }
    return max;
  }

  bool _checkWeekendWarrior(List<Workout> workouts, int requiredWeekends) {
    final now = DateTime.now();
    // Iterate the last requiredWeekends weekends
    for (int i = 0; i < requiredWeekends; i++) {
      // Find the Saturday of week (now - i weeks)
      final daysSinceSaturday =
          (now.weekday - DateTime.saturday + 7) % 7;
      final saturday = DateTime(now.year, now.month, now.day)
          .subtract(Duration(days: daysSinceSaturday + 7 * i));
      final sunday = saturday.add(const Duration(days: 1));
      final hasSat = workouts.any((w) =>
          w.date.year == saturday.year &&
          w.date.month == saturday.month &&
          w.date.day == saturday.day);
      final hasSun = workouts.any((w) =>
          w.date.year == sunday.year &&
          w.date.month == sunday.month &&
          w.date.day == sunday.day);
      if (!hasSat || !hasSun) return false;
    }
    return true;
  }

  bool _checkWeeklyVariety(
      List<Workout> workouts, DateTime reference, int requiredGroups) {
    // Calendar week containing `reference` (Mon-Sun)
    final weekday = reference.weekday; // 1 = Mon
    final monday = DateTime(reference.year, reference.month, reference.day)
        .subtract(Duration(days: weekday - 1));
    final nextMonday = monday.add(const Duration(days: 7));
    final groups = <String>{};
    for (final w in workouts) {
      if (w.date.isBefore(monday) || !w.date.isBefore(nextMonday)) continue;
      for (final e in w.exercises) {
        groups.add(e.muscleGroup);
      }
    }
    return groups.length >= requiredGroups;
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
