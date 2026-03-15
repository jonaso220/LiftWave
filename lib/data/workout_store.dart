import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import '../models/models.dart';
import '../services/firebase_service.dart';

/// Singleton that holds all completed workout sessions.
/// Loads automatically when a user signs in, clears on sign-out.
class WorkoutStore extends ChangeNotifier {
  WorkoutStore._() {
    // Listen to auth state: reload on login, clear on logout
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        _load();
      } else {
        _workouts.clear();
        _loaded = false;
        notifyListeners();
      }
    });
  }
  static final WorkoutStore instance = WorkoutStore._();

  final List<Workout> _workouts = [];
  bool _loaded = false;

  /// Workouts sorted newest-first.
  List<Workout> get workouts =>
      List.unmodifiable(_workouts.reversed.toList());

  bool get isLoaded => _loaded;

  // ── Load ─────────────────────────────────────────────────────────────────

  Future<void> _load() async {
    try {
      final snap = await FirebaseService.instance.workoutsRef
          .orderBy('date', descending: false)
          .get();

      _workouts.clear();
      for (final doc in snap.docs) {
        final data = Map<String, dynamic>.from(doc.data());
        if (data['date'] is Timestamp) {
          data['date'] =
              (data['date'] as Timestamp).toDate().toIso8601String();
        }
        _workouts.add(Workout.fromJson(data));
      }
    } catch (e) {
      debugPrint('WorkoutStore._load error: $e');
    }
    _loaded = true;
    notifyListeners();
  }

  // ── Add ──────────────────────────────────────────────────────────────────

  Future<void> add(Workout workout) async {
    _workouts.add(workout);
    notifyListeners();

    try {
      await FirebaseService.instance.workoutsRef
          .doc(workout.id)
          .set(workout.toJson());
    } catch (e) {
      debugPrint('WorkoutStore.add error: $e');
    }
  }

  // ── Delete ───────────────────────────────────────────────────────────────

  Future<void> remove(String id) async {
    _workouts.removeWhere((w) => w.id == id);
    notifyListeners();

    try {
      await FirebaseService.instance.workoutsRef.doc(id).delete();
    } catch (e) {
      debugPrint('WorkoutStore.remove error: $e');
    }
  }
}
