import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/models.dart';
import '../services/firebase_service.dart';

/// Singleton that holds all completed workout sessions.
/// Primary storage: Firestore (cloud sync).
/// Secondary storage: SharedPreferences (local cache so the history is
/// visible instantly on cold start and while offline).
/// Loads automatically when a user signs in, clears on sign-out.
class WorkoutStore extends ChangeNotifier {
  WorkoutStore._() {
    // Listen to auth state: reload on login, clear on logout
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        _uid = user.uid;
        _load();
      } else {
        _uid = null;
        _workouts.clear();
        _loaded = false;
        notifyListeners();
      }
    });
  }
  static final WorkoutStore instance = WorkoutStore._();

  final List<Workout> _workouts = [];
  bool _loaded = false;
  String? _uid;

  String get _localKey => 'workouts_cache_${_uid ?? 'anon'}';

  /// Workouts sorted newest-first.
  List<Workout> get workouts => List.unmodifiable(_workouts.reversed.toList());

  bool get isLoaded => _loaded;

  // ── Load ─────────────────────────────────────────────────────────────────

  Future<void> _load() async {
    // 1. Show the local cache immediately (instant + offline).
    await _loadLocal();

    // 2. Fetch from Firestore and replace the cache.
    try {
      final snap = await FirebaseService.instance.workoutsRef
          .orderBy('date', descending: false)
          .get();

      _workouts.clear();
      for (final doc in snap.docs) {
        final data = Map<String, dynamic>.from(doc.data());
        if (data['date'] is Timestamp) {
          data['date'] = (data['date'] as Timestamp).toDate().toIso8601String();
        }
        _workouts.add(Workout.fromJson(data));
      }
      await _persistLocal();
    } catch (e) {
      // Offline / fetch failed: keep whatever the local cache gave us.
      debugPrint('WorkoutStore._load error: $e');
    }
    _loaded = true;
    notifyListeners();
  }

  Future<void> _loadLocal() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_localKey);
      if (raw == null) return;
      final list = jsonDecode(raw) as List;
      _workouts
        ..clear()
        ..addAll(
          list.map(
            (e) => Workout.fromJson(Map<String, dynamic>.from(e as Map)),
          ),
        )
        ..sort((a, b) => a.date.compareTo(b.date));
      notifyListeners();
    } catch (e) {
      debugPrint('WorkoutStore._loadLocal error: $e');
    }
  }

  Future<void> _persistLocal() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        _localKey,
        jsonEncode(_workouts.map((w) => w.toJson()).toList()),
      );
    } catch (e) {
      debugPrint('WorkoutStore._persistLocal error: $e');
    }
  }

  // ── Add ──────────────────────────────────────────────────────────────────

  Future<void> add(Workout workout) async {
    _workouts.add(workout);
    notifyListeners();

    await _persistLocal();
    try {
      await FirebaseService.instance.workoutsRef
          .doc(workout.id)
          .set(workout.toJson());
    } catch (e) {
      debugPrint('WorkoutStore.add error: $e');
    }
  }

  // ── Update ───────────────────────────────────────────────────────────────

  /// Replace an existing workout with [updated] (keyed by id). Persists to
  /// Firestore. Used by the History edit flow.
  Future<void> update(Workout updated) async {
    final idx = _workouts.indexWhere((w) => w.id == updated.id);
    if (idx == -1) return;
    _workouts[idx] = updated;
    notifyListeners();

    await _persistLocal();
    try {
      await FirebaseService.instance.workoutsRef
          .doc(updated.id)
          .set(updated.toJson());
    } catch (e) {
      debugPrint('WorkoutStore.update error: $e');
    }
  }

  // ── Delete ───────────────────────────────────────────────────────────────

  Future<void> remove(String id) async {
    _workouts.removeWhere((w) => w.id == id);
    notifyListeners();

    await _persistLocal();
    try {
      await FirebaseService.instance.workoutsRef.doc(id).delete();
    } catch (e) {
      debugPrint('WorkoutStore.remove error: $e');
    }
  }
}
