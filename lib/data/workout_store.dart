import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/models.dart';
import 'persistent_sync_queue.dart';

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
        _syncQueue = PersistentSyncQueue('workouts_sync_queue_${user.uid}');
        _load(user.uid);
      } else {
        _uid = null;
        _syncQueue = null;
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
  PersistentSyncQueue? _syncQueue;
  final Set<String> _syncingUids = {};

  static String _localKeyFor(String uid) => 'workouts_cache_$uid';

  /// Workouts sorted newest-first.
  List<Workout> get workouts => List.unmodifiable(_workouts.reversed.toList());

  bool get isLoaded => _loaded;

  // ── Load ─────────────────────────────────────────────────────────────────

  Future<void> _load(String uid) async {
    // 1. Show the local cache immediately (instant + offline).
    await _loadLocal(uid);
    if (_uid != uid) return;

    final queue = _syncQueue;
    final pending = queue == null
        ? const <PendingMutation>[]
        : await queue.load();

    // 2. Merge the cloud snapshot with local data. Cloud wins for records that
    // have no pending local mutation; queued changes are applied last.
    try {
      final ref = FirebaseFirestore.instance.collection('users/$uid/workouts');
      final snap = await ref.orderBy('date', descending: false).get();
      if (_uid != uid) return;

      final merged = <String, Workout>{};
      for (final doc in snap.docs) {
        final data = Map<String, dynamic>.from(doc.data());
        if (data['date'] is Timestamp) {
          data['date'] = (data['date'] as Timestamp).toDate().toIso8601String();
        }
        final workout = Workout.fromJson(data);
        merged[workout.id] = workout;
        if ((data['totalVolume'] as num?)?.toInt() != workout.totalVolume) {
          await queue?.enqueueUpsert(workout.id, workout.toJson());
        }
      }

      final resolved = mergeAuthoritativeCloudWithPending(
        cloud: merged,
        pending: pending,
        decode: Workout.fromJson,
      );

      _workouts
        ..clear()
        ..addAll(resolved.values)
        ..sort((a, b) => a.date.compareTo(b.date));
      await _persistLocal(uid);
    } catch (e) {
      // Offline / fetch failed: keep whatever the local cache gave us.
      debugPrint('WorkoutStore._load error: $e');
    }
    _loaded = true;
    notifyListeners();
    unawaited(_flushPending(uid));
  }

  Future<void> _loadLocal(String uid) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_localKeyFor(uid));
      if (raw == null) return;
      final list = jsonDecode(raw) as List;
      final loaded =
          list
              .map((e) => Workout.fromJson(Map<String, dynamic>.from(e as Map)))
              .toList()
            ..sort((a, b) => a.date.compareTo(b.date));
      if (_uid != uid) return;
      _workouts
        ..clear()
        ..addAll(loaded);
      notifyListeners();
    } catch (e) {
      debugPrint('WorkoutStore._loadLocal error: $e');
    }
  }

  Future<void> _persistLocal(String uid) async {
    if (_uid != uid) return;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        _localKeyFor(uid),
        jsonEncode(_workouts.map((w) => w.toJson()).toList()),
      );
    } catch (e) {
      debugPrint('WorkoutStore._persistLocal error: $e');
    }
  }

  // ── Add ──────────────────────────────────────────────────────────────────

  Future<void> add(Workout workout) async {
    final uid = _uid;
    final queue = _syncQueue;
    if (uid == null || queue == null) return;
    _workouts.add(workout);
    notifyListeners();

    await _persistLocal(uid);
    await queue.enqueueUpsert(workout.id, workout.toJson());
    unawaited(_flushPending(uid));
  }

  // ── Update ───────────────────────────────────────────────────────────────

  /// Replace an existing workout with [updated] (keyed by id). Persists to
  /// Firestore. Used by the History edit flow.
  Future<void> update(Workout updated) async {
    final uid = _uid;
    final queue = _syncQueue;
    if (uid == null || queue == null) return;
    final idx = _workouts.indexWhere((w) => w.id == updated.id);
    if (idx == -1) return;
    _workouts[idx] = updated;
    notifyListeners();

    await _persistLocal(uid);
    await queue.enqueueUpsert(updated.id, updated.toJson());
    unawaited(_flushPending(uid));
  }

  // ── Delete ───────────────────────────────────────────────────────────────

  Future<void> remove(String id) async {
    final uid = _uid;
    final queue = _syncQueue;
    if (uid == null || queue == null) return;
    _workouts.removeWhere((w) => w.id == id);
    notifyListeners();

    await _persistLocal(uid);
    await queue.enqueueDelete(id);
    unawaited(_flushPending(uid));
  }

  Future<void> _flushPending(String uid) async {
    if (_syncingUids.contains(uid)) return;
    final queue = _uid == uid ? _syncQueue : null;
    if (queue == null) return;

    _syncingUids.add(uid);
    var madeProgress = false;
    try {
      final ref = FirebaseFirestore.instance.collection('users/$uid/workouts');
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
          debugPrint('WorkoutStore sync pending error: $e');
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
}
