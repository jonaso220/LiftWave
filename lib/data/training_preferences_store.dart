import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/training_preferences.dart';
import 'persistent_sync_queue.dart';

/// Per-user training preferences with an immediate local cache and a
/// retryable single-document cloud sync.
class TrainingPreferencesStore extends ChangeNotifier {
  TrainingPreferencesStore._() {
    FirebaseAuth.instance.authStateChanges().listen(_onAuthChanged);
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) _onAuthChanged(currentUser);
  }

  static final instance = TrainingPreferencesStore._();

  static const _documentId = 'trainingPreferences';

  String? _uid;
  bool _loaded = false;
  bool _loading = false;
  bool _dismissed = false;
  TrainingPreferences? _preferences;
  PersistentSyncQueue? _syncQueue;
  final Set<String> _syncingUids = {};

  static String _localKeyFor(String uid) => 'training_preferences_$uid';

  bool get isLoaded => _loaded;
  bool get shouldShowOnboarding =>
      _loaded && _preferences == null && !_dismissed;
  TrainingPreferences? get preferences => _preferences;

  void _onAuthChanged(User? user) {
    if (user == null) {
      _uid = null;
      _syncQueue = null;
      _loaded = false;
      _loading = false;
      _dismissed = false;
      _preferences = null;
      notifyListeners();
      return;
    }

    if (_uid == user.uid && (_loading || _loaded)) return;
    _uid = user.uid;
    _loaded = false;
    _loading = true;
    _dismissed = false;
    _preferences = null;
    _syncQueue = PersistentSyncQueue(
      'training_preferences_sync_queue_${user.uid}',
    );
    unawaited(_load(user.uid));
  }

  Future<void> _load(String uid) async {
    final local = await _readLocal(uid);
    if (_uid != uid) return;
    if (local != null) {
      _applyPayload(local);
      _loading = false;
      _loaded = true;
      notifyListeners();
    }

    final queue = _syncQueue;
    final pending = queue == null
        ? const <PendingMutation>[]
        : await queue.load();
    Map<String, dynamic>? resolved = local;

    try {
      final snapshot = await _documentFor(
        uid,
      ).get().timeout(const Duration(seconds: 5));
      if (_uid != uid) return;

      PendingMutation? pendingWrite;
      for (final operation in pending) {
        if (operation.documentId == _documentId &&
            operation.type == PendingMutationType.upsert) {
          pendingWrite = operation;
        }
      }
      if (pendingWrite?.payload != null) {
        resolved = pendingWrite!.payload;
      } else if (snapshot.exists && snapshot.data() != null) {
        resolved = Map<String, dynamic>.from(snapshot.data()!);
      } else if (local != null) {
        await queue?.enqueueUpsert(_documentId, local);
      }
    } catch (error) {
      debugPrint('TrainingPreferencesStore._load error: $error');
    }

    if (_uid != uid) return;
    _applyPayload(resolved);
    if (resolved != null) await _persistLocal(uid, resolved);
    _loading = false;
    _loaded = true;
    notifyListeners();
    unawaited(_flushPending(uid));
  }

  Future<void> save(TrainingPreferences preferences) async {
    final uid = _uid;
    final queue = _syncQueue;
    if (uid == null || queue == null) return;

    _preferences = preferences;
    _dismissed = false;
    _loaded = true;
    final payload = _currentPayload();
    notifyListeners();

    await _persistLocal(uid, payload);
    await queue.enqueueUpsert(_documentId, payload);
    unawaited(_flushPending(uid));
  }

  Future<void> dismissOnboarding() async {
    final uid = _uid;
    final queue = _syncQueue;
    if (uid == null || queue == null) return;

    _dismissed = true;
    _loaded = true;
    final payload = _currentPayload();
    notifyListeners();

    await _persistLocal(uid, payload);
    await queue.enqueueUpsert(_documentId, payload);
    unawaited(_flushPending(uid));
  }

  Future<Map<String, dynamic>?> _readLocal(String uid) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_localKeyFor(uid));
      if (raw == null) return null;
      return Map<String, dynamic>.from(jsonDecode(raw) as Map);
    } catch (error) {
      debugPrint('TrainingPreferencesStore._readLocal error: $error');
      return null;
    }
  }

  Future<void> _persistLocal(String uid, Map<String, dynamic> payload) async {
    if (_uid != uid) return;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_localKeyFor(uid), jsonEncode(payload));
    } catch (error) {
      debugPrint('TrainingPreferencesStore._persistLocal error: $error');
    }
  }

  void _applyPayload(Map<String, dynamic>? payload) {
    if (payload == null) {
      _dismissed = false;
      _preferences = null;
      return;
    }
    _dismissed = payload['dismissed'] as bool? ?? false;
    final rawPreferences = payload['preferences'];
    _preferences = rawPreferences is Map
        ? TrainingPreferences.fromJson(
            Map<String, dynamic>.from(rawPreferences),
          )
        : null;
  }

  Map<String, dynamic> _currentPayload() => {
    'dismissed': _dismissed,
    'preferences': _preferences?.toJson(),
    'updatedAt': DateTime.now().toUtc().toIso8601String(),
  };

  DocumentReference<Map<String, dynamic>> _documentFor(String uid) =>
      FirebaseFirestore.instance.doc('users/$uid/meta/$_documentId');

  Future<void> _flushPending(String uid) async {
    if (_syncingUids.contains(uid)) return;
    final queue = _uid == uid ? _syncQueue : null;
    if (queue == null) return;

    _syncingUids.add(uid);
    var madeProgress = false;
    try {
      for (final operation in await queue.load()) {
        if (operation.documentId != _documentId || operation.payload == null) {
          continue;
        }
        try {
          await _documentFor(
            uid,
          ).set(operation.payload!).timeout(const Duration(seconds: 8));
          await queue.removeIfCurrent(operation);
          madeProgress = true;
        } catch (error) {
          debugPrint('TrainingPreferencesStore sync error: $error');
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
