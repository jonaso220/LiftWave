import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/models.dart';
import '../services/firebase_service.dart';

/// User-created exercises.
/// Primary storage: Firestore (cloud sync, survives device changes).
/// Secondary storage: SharedPreferences (local cache / offline fallback).
class CustomExerciseStore extends ChangeNotifier {
  CustomExerciseStore._() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        _uid = user.uid;
        _syncWithCloud();
      } else {
        _uid = null;
        _exercises.clear();
        notifyListeners();
      }
    });
  }
  static final instance = CustomExerciseStore._();

  /// Pre-cloud builds stored exercises under a single device-global key.
  /// We migrate those into the signed-in user's space on first sync.
  static const _legacyKey = 'custom_exercises';

  final List<Exercise> _exercises = [];
  String? _uid;
  bool _loaded = false;

  String get _localKey => _uid == null ? _legacyKey : 'custom_exercises_$_uid';

  List<Exercise> get exercises => List.unmodifiable(_exercises);

  /// Loads the local cache immediately at startup (before auth resolves).
  Future<void> load() async {
    if (_loaded) return;
    _loaded = true;
    await _loadLocal();
  }

  Future<void> _loadLocal() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_localKey);
      _exercises.clear();
      if (raw != null) {
        final list = jsonDecode(raw) as List;
        for (final j in list) {
          _exercises.add(_fromJson(j as Map<String, dynamic>));
        }
      }
      notifyListeners();
    } catch (e) {
      debugPrint('CustomExerciseStore._loadLocal error: $e');
    }
  }

  Future<void> _syncWithCloud() async {
    // 1. Show this user's local cache immediately.
    await _loadLocal();

    // 2. Pull legacy device-global exercises into this user's space.
    await _migrateLegacy();

    // 3. Merge with Firestore.
    try {
      final snap = await FirebaseService.instance.customExercisesRef.get();
      final cloud = snap.docs.map((d) => _fromJson(d.data())).toList();
      final cloudIds = cloud.map((e) => e.id).toSet();

      // Local items not yet in the cloud (first-time sync / offline adds).
      final localOnly = _exercises
          .where((e) => !cloudIds.contains(e.id))
          .toList();

      final byId = <String, Exercise>{for (final e in _exercises) e.id: e};
      for (final e in cloud) {
        byId[e.id] = e;
      }
      _exercises
        ..clear()
        ..addAll(byId.values);

      await Future.wait([_persistLocal(), ...localOnly.map(_saveToFirestore)]);
      notifyListeners();
    } catch (e) {
      debugPrint('CustomExerciseStore._syncWithCloud error: $e');
    }
  }

  Future<void> _migrateLegacy() async {
    if (_uid == null) return;
    try {
      final prefs = await SharedPreferences.getInstance();
      final legacy = prefs.getString(_legacyKey);
      if (legacy == null) return;
      final list = jsonDecode(legacy) as List;
      for (final j in list) {
        final e = _fromJson(j as Map<String, dynamic>);
        if (!_exercises.any((x) => x.id == e.id)) _exercises.add(e);
      }
      await prefs.remove(_legacyKey);
      await _persistLocal();
    } catch (e) {
      debugPrint('CustomExerciseStore._migrateLegacy error: $e');
    }
  }

  Future<void> add(Exercise exercise) async {
    _exercises.add(exercise);
    notifyListeners();
    await Future.wait([_persistLocal(), _saveToFirestore(exercise)]);
  }

  Future<void> remove(String id) async {
    _exercises.removeWhere((e) => e.id == id);
    notifyListeners();
    await Future.wait([_persistLocal(), _deleteFromFirestore(id)]);
  }

  // ── Persistence helpers ─────────────────────────────────────────────────

  Future<void> _persistLocal() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        _localKey,
        jsonEncode(_exercises.map(_toJson).toList()),
      );
    } catch (e) {
      debugPrint('CustomExerciseStore._persistLocal error: $e');
    }
  }

  Future<void> _saveToFirestore(Exercise e) async {
    if (_uid == null) return;
    try {
      await FirebaseService.instance.customExercisesRef
          .doc(e.id)
          .set(_toJson(e));
    } catch (err) {
      debugPrint('CustomExerciseStore._saveToFirestore error: $err');
    }
  }

  Future<void> _deleteFromFirestore(String id) async {
    if (_uid == null) return;
    try {
      await FirebaseService.instance.customExercisesRef.doc(id).delete();
    } catch (e) {
      debugPrint('CustomExerciseStore._deleteFromFirestore error: $e');
    }
  }

  static Map<String, dynamic> _toJson(Exercise e) => {
    'id': e.id,
    'name': e.name,
    'muscleGroup': e.muscleGroup,
    'equipment': e.equipment,
    'difficulty': e.difficulty,
    'description': e.description,
  };

  static Exercise _fromJson(Map<String, dynamic> j) => Exercise(
    id: j['id'] as String,
    name: j['name'] as String,
    muscleGroup: j['muscleGroup'] as String,
    equipment: j['equipment'] as String,
    difficulty: j['difficulty'] as String? ?? 'Intermedio',
    description: j['description'] as String? ?? '',
  );
}
