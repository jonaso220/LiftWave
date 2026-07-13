import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

enum PendingMutationType { upsert, delete }

/// Resolves an authoritative cloud snapshot with durable local mutations.
/// Cached records are intentionally not an input: a cache-only document that
/// disappeared from the cloud was deleted on another device and must not be
/// uploaded again.
Map<String, T> mergeAuthoritativeCloudWithPending<T>({
  required Map<String, T> cloud,
  required List<PendingMutation> pending,
  required T Function(Map<String, dynamic> payload) decode,
}) {
  final resolved = Map<String, T>.from(cloud);
  for (final operation in pending) {
    if (operation.type == PendingMutationType.delete) {
      resolved.remove(operation.documentId);
    } else if (operation.payload != null) {
      resolved[operation.documentId] = decode(operation.payload!);
    }
  }
  return resolved;
}

class PendingMutation {
  final String documentId;
  final PendingMutationType type;
  final Map<String, dynamic>? payload;
  final String token;

  const PendingMutation({
    required this.documentId,
    required this.type,
    required this.token,
    this.payload,
  });

  Map<String, dynamic> toJson() => {
    'documentId': documentId,
    'type': type.name,
    'payload': payload,
    'token': token,
  };

  factory PendingMutation.fromJson(Map<String, dynamic> json) {
    return PendingMutation(
      documentId: json['documentId'] as String,
      type: PendingMutationType.values.byName(json['type'] as String),
      payload: json['payload'] == null
          ? null
          : Map<String, dynamic>.from(json['payload'] as Map),
      token: json['token'] as String,
    );
  }
}

/// A tiny durable last-write-wins mutation queue.
///
/// Firestore already caches documents offline, but keeping the app's intent in
/// SharedPreferences as well means a failed write can be retried after a full
/// process restart. One entry is retained per document; a later update or
/// delete supersedes the previous operation.
class PersistentSyncQueue {
  final String storageKey;

  PersistentSyncQueue(this.storageKey);

  final Map<String, PendingMutation> _operations = {};
  Future<void>? _loadFuture;
  static int _sequence = 0;

  Future<List<PendingMutation>> load() async {
    await _ensureLoaded();
    return List.unmodifiable(_operations.values);
  }

  Future<void> enqueueUpsert(
    String documentId,
    Map<String, dynamic> payload,
  ) async {
    await _ensureLoaded();
    _operations[documentId] = PendingMutation(
      documentId: documentId,
      type: PendingMutationType.upsert,
      payload: Map<String, dynamic>.from(payload),
      token: _newToken(),
    );
    await _persist();
  }

  Future<void> enqueueDelete(
    String documentId, {
    Map<String, dynamic>? payload,
  }) async {
    await _ensureLoaded();
    _operations[documentId] = PendingMutation(
      documentId: documentId,
      type: PendingMutationType.delete,
      payload: payload == null ? null : Map<String, dynamic>.from(payload),
      token: _newToken(),
    );
    await _persist();
  }

  Future<void> removeIfCurrent(PendingMutation completed) async {
    await _ensureLoaded();
    if (_operations[completed.documentId]?.token != completed.token) return;
    _operations.remove(completed.documentId);
    await _persist();
  }

  Future<void> _ensureLoaded() {
    return _loadFuture ??= _loadFromDisk();
  }

  Future<void> _loadFromDisk() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(storageKey);
    if (raw == null) return;

    try {
      final decoded = jsonDecode(raw) as List;
      for (final item in decoded) {
        final operation = PendingMutation.fromJson(
          Map<String, dynamic>.from(item as Map),
        );
        _operations[operation.documentId] = operation;
      }
    } on Object {
      // A corrupt queue should not prevent the user's cached data from loading.
      // Start clean; the stores will re-enqueue local-only records on merge.
      _operations.clear();
      await prefs.remove(storageKey);
    }
  }

  Future<void> _persist() async {
    final prefs = await SharedPreferences.getInstance();
    if (_operations.isEmpty) {
      await prefs.remove(storageKey);
      return;
    }
    await prefs.setString(
      storageKey,
      jsonEncode(
        _operations.values.map((operation) => operation.toJson()).toList(),
      ),
    );
  }

  String _newToken() =>
      '${DateTime.now().microsecondsSinceEpoch}-${_sequence++}';
}
