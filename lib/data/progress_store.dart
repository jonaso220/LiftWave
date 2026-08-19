import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/progress_models.dart';
import 'persistent_sync_queue.dart';

/// Body measurements with user-scoped local caching and durable cloud sync.
class ProgressStore extends ChangeNotifier {
  ProgressStore._() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        _uid = user.uid;
        _syncQueue = PersistentSyncQueue('measurements_sync_queue_${user.uid}');
        _load(user.uid);
      } else {
        _uid = null;
        _syncQueue = null;
        _measurements.clear();
        notifyListeners();
      }
    });
  }

  static final ProgressStore instance = ProgressStore._();

  static const _legacyLocalKey = 'body_measurements';

  List<BodyMeasurement> _measurements = [];
  String? _uid;
  PersistentSyncQueue? _syncQueue;
  final Set<String> _syncingUids = {};

  static String _localKeyFor(String uid) => 'body_measurements_$uid';

  static String _seededKeyFor(String uid) => 'measurements_cloud_seeded_$uid';

  List<BodyMeasurement> get measurements => List.unmodifiable(_measurements);

  List<BodyMeasurement> get measurementsDesc =>
      List.unmodifiable(_measurements.reversed.toList());

  BodyMeasurement? get latest =>
      _measurements.isEmpty ? null : _measurements.last;

  List<BodyMeasurement> get withPhoto =>
      _measurements.where((measurement) => measurement.hasPhoto).toList();

  Future<void> _load(String uid) async {
    await _migrateLegacyCache(uid);
    await _loadLocal(uid);
    if (_uid != uid) return;

    final localById = <String, BodyMeasurement>{
      for (final measurement in _measurements) measurement.id: measurement,
    };
    final queue = _syncQueue;
    var pending = queue == null
        ? const <PendingMutation>[]
        : await queue.load();

    try {
      final ref = FirebaseFirestore.instance.collection(
        'users/$uid/measurements',
      );
      final snap = await ref.orderBy('date', descending: false).get();
      if (_uid != uid) return;

      final merged = <String, BodyMeasurement>{};
      for (final doc in snap.docs) {
        final data = Map<String, dynamic>.from(doc.data());
        if (data['date'] is Timestamp) {
          data['date'] = (data['date'] as Timestamp).toDate().toIso8601String();
        }
        // Device-local paths from old builds are not valid on this device.
        data.remove('photoPath');
        var remote = BodyMeasurement.fromJson(data);
        final localPath = localById[remote.id]?.photoPath;
        if (localPath != null) remote = remote.copyWith(photoPath: localPath);
        merged[remote.id] = remote;
      }

      if (queue != null) {
        pending = await seedLocalOnlyOnFirstCloudSync(
          queue: queue,
          seededKey: _seededKeyFor(uid),
          local: localById,
          cloud: merged,
          pending: pending,
          encode: (measurement) => measurement.toCloudJson(),
        );
      }

      final resolved = mergeAuthoritativeCloudWithPending(
        cloud: merged,
        pending: pending,
        decode: (payload) {
          var localPending = BodyMeasurement.fromJson(payload);
          final localPath = localById[localPending.id]?.photoPath;
          if (localPath != null) {
            localPending = localPending.copyWith(photoPath: localPath);
          }
          return localPending;
        },
      );

      _measurements = resolved.values.toList()
        ..sort((a, b) => a.date.compareTo(b.date));
      await _persistLocal(uid);
    } catch (e) {
      debugPrint('ProgressStore._load Firestore error: $e');
    }

    if (_uid != uid) return;
    notifyListeners();
    unawaited(_flushPending(uid));
  }

  Future<void> _migrateLegacyCache(String uid) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final legacy = prefs.getStringList(_legacyLocalKey);
      if (legacy == null) return;

      final scopedKey = _localKeyFor(uid);
      final scoped = prefs.getStringList(scopedKey) ?? const <String>[];
      final byId = <String, String>{};
      for (final raw in [...scoped, ...legacy]) {
        final json = Map<String, dynamic>.from(jsonDecode(raw) as Map);
        byId[json['id'] as String] = raw;
      }
      await prefs.setStringList(scopedKey, byId.values.toList());
      await prefs.remove(_legacyLocalKey);
    } catch (e) {
      debugPrint('ProgressStore legacy migration error: $e');
    }
  }

  Future<void> _loadLocal(String uid) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getStringList(_localKeyFor(uid)) ?? const [];
      final loaded =
          raw.map((item) => BodyMeasurement.fromJson(jsonDecode(item))).toList()
            ..sort((a, b) => a.date.compareTo(b.date));
      if (_uid != uid) return;
      _measurements = loaded;
      notifyListeners();
    } catch (e) {
      debugPrint('ProgressStore._loadLocal error: $e');
    }
  }

  Future<void> add(BodyMeasurement measurement) async {
    final uid = _uid;
    final queue = _syncQueue;
    if (uid == null || queue == null) return;

    _measurements.removeWhere((item) => item.id == measurement.id);
    _measurements.add(measurement);
    _measurements.sort((a, b) => a.date.compareTo(b.date));
    notifyListeners();

    await _persistLocal(uid);
    await queue.enqueueUpsert(measurement.id, measurement.toCloudJson());
    unawaited(_flushPending(uid));
  }

  Future<void> remove(String id) async {
    final uid = _uid;
    final queue = _syncQueue;
    if (uid == null || queue == null) return;

    final index = _measurements.indexWhere(
      (measurement) => measurement.id == id,
    );
    final removed = index == -1 ? null : _measurements.removeAt(index);
    notifyListeners();

    await _persistLocal(uid);
    await queue.enqueueDelete(id);
    if (removed?.photoPath != null) {
      unawaited(_deleteLocalPhoto(removed!.photoPath!));
    }
    unawaited(_flushPending(uid));
  }

  Future<void> _persistLocal(String uid) async {
    if (_uid != uid) return;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(
        _localKeyFor(uid),
        _measurements.map((m) => jsonEncode(m.toJson())).toList(),
      );
    } catch (e) {
      debugPrint('ProgressStore._persistLocal error: $e');
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
        'users/$uid/measurements',
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
          debugPrint('ProgressStore sync pending error: $e');
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

  Future<void> _deleteLocalPhoto(String path) async {
    try {
      final file = File(path);
      if (await file.exists()) await file.delete();
    } on FileSystemException {
      // The measurement is already gone from the app; stale file cleanup can
      // safely be ignored if the OS removed it first.
    }
  }
}
