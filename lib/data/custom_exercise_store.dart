import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/models.dart';
import 'persistent_sync_queue.dart';

/// User-created exercises with per-user caching and retryable cloud mutations.
class CustomExerciseStore extends ChangeNotifier {
  CustomExerciseStore._() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        _uid = user.uid;
        _syncQueue = PersistentSyncQueue(
          'custom_exercises_sync_queue_${user.uid}',
        );
        _syncWithCloud(user.uid);
      } else {
        _uid = null;
        _syncQueue = null;
        _exercises.clear();
        notifyListeners();
      }
    });
  }

  static final instance = CustomExerciseStore._();

  static const _legacyKey = 'custom_exercises';

  final List<Exercise> _exercises = [];
  String? _uid;
  bool _loaded = false;
  PersistentSyncQueue? _syncQueue;
  final Set<String> _syncingUids = {};

  static String _localKeyFor(String uid) => 'custom_exercises_$uid';

  static String _seededKeyFor(String uid) =>
      'custom_exercises_cloud_seeded_$uid';

  List<Exercise> get exercises => List.unmodifiable(_exercises);

  Future<void> load() async {
    if (_loaded) return;
    _loaded = true;
    final uid = FirebaseAuth.instance.currentUser?.uid;
    await _loadLocal(uid);
  }

  Future<void> _loadLocal(String? uid) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(uid == null ? _legacyKey : _localKeyFor(uid));
      final loaded = <Exercise>[];
      if (raw != null) {
        final list = jsonDecode(raw) as List;
        loaded.addAll(
          list.map((item) => _fromJson(Map<String, dynamic>.from(item as Map))),
        );
      }
      if (_uid != uid && uid != null) return;
      _exercises
        ..clear()
        ..addAll(loaded);
      notifyListeners();
    } catch (e) {
      debugPrint('CustomExerciseStore._loadLocal error: $e');
    }
  }

  Future<void> _syncWithCloud(String uid) async {
    await _loadLocal(uid);
    await _migrateLegacy(uid);
    if (_uid != uid) return;

    final localById = {for (final exercise in _exercises) exercise.id: exercise};
    final queue = _syncQueue;
    var pending = queue == null
        ? const <PendingMutation>[]
        : await queue.load();

    try {
      final ref = FirebaseFirestore.instance.collection(
        'users/$uid/customExercises',
      );
      final snap = await ref.get();
      if (_uid != uid) return;

      final merged = <String, Exercise>{
        for (final doc in snap.docs) doc.id: _fromJson(doc.data()),
      };
      if (queue != null) {
        pending = await seedLocalOnlyOnFirstCloudSync(
          queue: queue,
          seededKey: _seededKeyFor(uid),
          local: localById,
          cloud: merged,
          pending: pending,
          encode: _toJson,
        );
      }
      final resolved = mergeAuthoritativeCloudWithPending(
        cloud: merged,
        pending: pending,
        decode: _fromJson,
      );

      _exercises
        ..clear()
        ..addAll(resolved.values);
      await _persistLocal(uid);
      notifyListeners();
    } catch (e) {
      debugPrint('CustomExerciseStore._syncWithCloud error: $e');
    }
    unawaited(_flushPending(uid));
  }

  Future<void> _migrateLegacy(String uid) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final legacy = prefs.getString(_legacyKey);
      if (legacy == null) return;
      final list = jsonDecode(legacy) as List;
      for (final item in list) {
        final exercise = _fromJson(Map<String, dynamic>.from(item as Map));
        if (!_exercises.any((current) => current.id == exercise.id)) {
          _exercises.add(exercise);
        }
      }
      await prefs.remove(_legacyKey);
      await _persistLocal(uid);
    } catch (e) {
      debugPrint('CustomExerciseStore._migrateLegacy error: $e');
    }
  }

  Future<void> add(Exercise exercise) async {
    final uid = _uid;
    final queue = _syncQueue;
    if (uid == null || queue == null) return;
    _exercises.removeWhere((item) => item.id == exercise.id);
    _exercises.add(exercise);
    notifyListeners();
    await _persistLocal(uid);
    await queue.enqueueUpsert(exercise.id, _toJson(exercise));
    unawaited(_flushPending(uid));
  }

  Future<void> remove(String id) async {
    final uid = _uid;
    final queue = _syncQueue;
    if (uid == null || queue == null) return;
    _exercises.removeWhere((exercise) => exercise.id == id);
    notifyListeners();
    await _persistLocal(uid);
    await queue.enqueueDelete(id);
    unawaited(_flushPending(uid));
  }

  Future<void> _persistLocal(String uid) async {
    if (_uid != uid) return;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        _localKeyFor(uid),
        jsonEncode(_exercises.map(_toJson).toList()),
      );
    } catch (e) {
      debugPrint('CustomExerciseStore._persistLocal error: $e');
    }
  }

  Future<void> _flushPending(String uid) async {
    if (_syncingUids.contains(uid)) return;
    final queue = _uid == uid ? _syncQueue : null;
    if (queue == null) return;
    _syncingUids.add(uid);
    var madeProgress = false;
    try {
      final ref = FirebaseFirestore.instance.collection(
        'users/$uid/customExercises',
      );
      for (final operation in await queue.load()) {
        try {
          if (operation.type == PendingMutationType.delete) {
            await ref
                .doc(operation.documentId)
                .delete()
                .timeout(const Duration(seconds: 8));
          } else if (operation.payload != null) {
            await ref
                .doc(operation.documentId)
                .set(operation.payload!)
                .timeout(const Duration(seconds: 8));
          }
          await queue.removeIfCurrent(operation);
          madeProgress = true;
        } catch (e) {
          debugPrint('CustomExerciseStore sync pending error: $e');
          break;
        }
      }
    } finally {
      _syncingUids.remove(uid);
    }
    if (madeProgress && _uid == uid && (await queue.load()).isNotEmpty) {
      unawaited(_flushPending(uid));
    }
  }

  static Map<String, dynamic> _toJson(Exercise exercise) => {
    'id': exercise.id,
    'name': exercise.name,
    'muscleGroup': exercise.muscleGroup,
    'equipment': exercise.equipment,
    'difficulty': exercise.difficulty,
    'description': exercise.description,
  };

  static Exercise _fromJson(Map<String, dynamic> json) => Exercise(
    id: json['id'] as String,
    name: json['name'] as String,
    muscleGroup: json['muscleGroup'] as String,
    equipment: json['equipment'] as String,
    difficulty: json['difficulty'] as String? ?? 'Intermedio',
    description: json['description'] as String? ?? '',
  );
}
