import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/session_models.dart';

/// Persists the workout currently in progress to SharedPreferences so the
/// user doesn't lose data if the OS kills the app mid-session.
///
/// State persisted:
///   - workoutName (nullable — null for free session)
///   - launchSource (controls whether this plan can be saved as a routine)
///   - startedAt (absolute timestamp, so elapsed seconds recompute correctly
///     after a relaunch)
///   - timerWasRunning (bool — restores running/paused state)
///   - exercises (full list with sets, reps, weight, completed, notes)
class ActiveWorkoutStore {
  ActiveWorkoutStore._();
  static final ActiveWorkoutStore instance = ActiveWorkoutStore._();

  static const _legacyKey = 'active_workout_state';

  String get _key {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    return uid == null ? _legacyKey : '${_legacyKey}_$uid';
  }

  Future<void> save({
    required bool workoutStarted,
    required bool timerRunning,
    required DateTime? startedAt,
    required int elapsedSeconds,
    required String? workoutName,
    required String? routineDay,
    required int? routineOrder,
    required WorkoutLaunchSource launchSource,
    required List<SessionExercise> exercises,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    if (!workoutStarted) {
      await prefs.remove(_key);
      return;
    }
    final json = jsonEncode({
      'workoutStarted': workoutStarted,
      'timerRunning': timerRunning,
      'startedAt': startedAt?.toIso8601String(),
      'elapsedSeconds': elapsedSeconds,
      'workoutName': workoutName,
      'routineDay': routineDay,
      'routineOrder': routineOrder,
      'launchSource': launchSource.storageKey,
      'exercises': exercises.map((e) => e.toJson()).toList(),
    });
    await prefs.setString(_key, json);
  }

  Future<ActiveWorkoutSnapshot?> load() async {
    final prefs = await SharedPreferences.getInstance();
    var raw = prefs.getString(_key);
    if (raw == null && _key != _legacyKey) {
      raw = prefs.getString(_legacyKey);
      if (raw != null) {
        await prefs.setString(_key, raw);
        await prefs.remove(_legacyKey);
      }
    }
    if (raw == null) return null;
    try {
      final map = jsonDecode(raw) as Map<String, dynamic>;
      final exercisesJson = (map['exercises'] as List?) ?? const [];
      final exercises = exercisesJson
          .map(
            (e) =>
                SessionExercise.fromJson(Map<String, dynamic>.from(e as Map)),
          )
          .toList();
      final startedAt = map['startedAt'] as String?;
      return ActiveWorkoutSnapshot(
        timerRunning: map['timerRunning'] as bool? ?? false,
        startedAt: startedAt != null ? DateTime.parse(startedAt) : null,
        elapsedSeconds: (map['elapsedSeconds'] as num?)?.toInt() ?? 0,
        workoutName: map['workoutName'] as String?,
        routineDay: map['routineDay'] as String?,
        routineOrder: (map['routineOrder'] as num?)?.toInt(),
        launchSource: WorkoutLaunchSource.fromStorage(
          map['launchSource'] as String?,
        ),
        exercises: exercises,
      );
    } catch (e) {
      debugPrint('ActiveWorkoutStore.load error: $e');
      await prefs.remove(_key);
      return null;
    }
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}

class ActiveWorkoutSnapshot {
  final bool timerRunning;
  final DateTime? startedAt;
  final int elapsedSeconds;
  final String? workoutName;
  final String? routineDay;
  final int? routineOrder;
  final WorkoutLaunchSource launchSource;
  final List<SessionExercise> exercises;

  ActiveWorkoutSnapshot({
    required this.timerRunning,
    required this.startedAt,
    required this.elapsedSeconds,
    required this.workoutName,
    required this.routineDay,
    required this.routineOrder,
    required this.launchSource,
    required this.exercises,
  });

  /// Rebuilds the visible elapsed time without advancing a paused session.
  int elapsedAt(DateTime now) {
    final started = startedAt;
    if (!timerRunning || started == null) return elapsedSeconds;
    return now.difference(started).inSeconds.clamp(0, 86400);
  }
}
