import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'persistent_sync_queue.dart';
import 'workout_templates.dart';

class CustomTemplate {
  final String id;
  final String name;
  final List<TemplateExercise> exercises;
  final String? routineDay;
  final int? routineOrder;

  CustomTemplate({
    required this.id,
    required this.name,
    required this.exercises,
    this.routineDay,
    this.routineOrder,
  });

  List<String> get muscleGroups =>
      exercises.map((exercise) => exercise.muscleGroup).toSet().toList();

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'exercises': exercises.map((exercise) => exercise.toJson()).toList(),
    'routineDay': routineDay,
    'routineOrder': routineOrder,
  };

  factory CustomTemplate.fromJson(Map<String, dynamic> json) => CustomTemplate(
    id: json['id'] as String,
    name: json['name'] as String,
    exercises: (json['exercises'] as List)
        .map(
          (exercise) => TemplateExercise.fromJson(
            Map<String, dynamic>.from(exercise as Map),
          ),
        )
        .toList(),
    routineDay: json['routineDay'] as String?,
    routineOrder: (json['routineOrder'] as num?)?.toInt(),
  );

  CustomTemplate copyWith({
    String? name,
    List<TemplateExercise>? exercises,
    String? routineDay,
    int? routineOrder,
    bool clearRoutineDay = false,
  }) => CustomTemplate(
    id: id,
    name: name ?? this.name,
    exercises: exercises ?? this.exercises,
    routineDay: clearRoutineDay ? null : routineDay ?? this.routineDay,
    routineOrder: clearRoutineDay ? null : routineOrder ?? this.routineOrder,
  );
}

/// User-created templates with per-user caching and retryable cloud mutations.
class CustomTemplateStore extends ChangeNotifier {
  CustomTemplateStore._() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        _uid = user.uid;
        _syncQueue = PersistentSyncQueue(
          'custom_templates_sync_queue_${user.uid}',
        );
        _syncWithCloud(user.uid);
      } else {
        _uid = null;
        _syncQueue = null;
        _templates.clear();
        notifyListeners();
      }
    });
  }

  static final instance = CustomTemplateStore._();

  static const _legacyKey = 'custom_templates';

  final List<CustomTemplate> _templates = [];
  String? _uid;
  bool _loaded = false;
  PersistentSyncQueue? _syncQueue;
  final Set<String> _syncingUids = {};

  static String _localKeyFor(String uid) => 'custom_templates_$uid';

  List<CustomTemplate> get templates => List.unmodifiable(_templates);

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
      final loaded = <CustomTemplate>[];
      if (raw != null) {
        final list = jsonDecode(raw) as List;
        loaded.addAll(
          list.map(
            (item) =>
                CustomTemplate.fromJson(Map<String, dynamic>.from(item as Map)),
          ),
        );
      }
      if (_uid != uid && uid != null) return;
      _templates
        ..clear()
        ..addAll(loaded);
      notifyListeners();
    } catch (e) {
      debugPrint('CustomTemplateStore._loadLocal error: $e');
    }
  }

  Future<void> _syncWithCloud(String uid) async {
    await _loadLocal(uid);
    await _migrateLegacy(uid);
    if (_uid != uid) return;

    final queue = _syncQueue;
    final pending = queue == null
        ? const <PendingMutation>[]
        : await queue.load();

    try {
      final ref = FirebaseFirestore.instance.collection(
        'users/$uid/customTemplates',
      );
      final snap = await ref.get();
      if (_uid != uid) return;

      final merged = <String, CustomTemplate>{
        for (final doc in snap.docs)
          doc.id: CustomTemplate.fromJson(doc.data()),
      };
      final resolved = mergeAuthoritativeCloudWithPending(
        cloud: merged,
        pending: pending,
        decode: CustomTemplate.fromJson,
      );

      _templates
        ..clear()
        ..addAll(resolved.values);
      await _persistLocal(uid);
      notifyListeners();
    } catch (e) {
      debugPrint('CustomTemplateStore._syncWithCloud error: $e');
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
        final template = CustomTemplate.fromJson(
          Map<String, dynamic>.from(item as Map),
        );
        if (!_templates.any((current) => current.id == template.id)) {
          _templates.add(template);
        }
      }
      await prefs.remove(_legacyKey);
      await _persistLocal(uid);
    } catch (e) {
      debugPrint('CustomTemplateStore._migrateLegacy error: $e');
    }
  }

  Future<void> add(CustomTemplate template) async {
    final uid = _uid;
    final queue = _syncQueue;
    if (uid == null || queue == null) return;
    _templates.removeWhere((item) => item.id == template.id);
    _templates.insert(0, template);
    notifyListeners();
    await _persistLocal(uid);
    await queue.enqueueUpsert(template.id, template.toJson());
    unawaited(_flushPending(uid));
  }

  Future<void> update(CustomTemplate template) async {
    final uid = _uid;
    final queue = _syncQueue;
    if (uid == null || queue == null) return;
    final index = _templates.indexWhere((item) => item.id == template.id);
    if (index == -1) return;
    _templates[index] = template;
    notifyListeners();
    await _persistLocal(uid);
    await queue.enqueueUpsert(template.id, template.toJson());
    unawaited(_flushPending(uid));
  }

  Future<void> reorderDay(
    String routineDay,
    List<CustomTemplate> ordered,
  ) async {
    for (var index = 0; index < ordered.length; index++) {
      final template = ordered[index].copyWith(
        routineDay: routineDay,
        routineOrder: index + 1,
      );
      final currentIndex = _templates.indexWhere(
        (item) => item.id == template.id,
      );
      if (currentIndex != -1) _templates[currentIndex] = template;
    }
    notifyListeners();

    final uid = _uid;
    final queue = _syncQueue;
    if (uid == null || queue == null) return;
    await _persistLocal(uid);
    for (var index = 0; index < ordered.length; index++) {
      final template = _templates.firstWhere(
        (item) => item.id == ordered[index].id,
      );
      await queue.enqueueUpsert(template.id, template.toJson());
    }
    unawaited(_flushPending(uid));
  }

  Future<void> remove(String id) async {
    final uid = _uid;
    final queue = _syncQueue;
    if (uid == null || queue == null) return;
    _templates.removeWhere((template) => template.id == id);
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
        jsonEncode(_templates.map((template) => template.toJson()).toList()),
      );
    } catch (e) {
      debugPrint('CustomTemplateStore._persistLocal error: $e');
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
        'users/$uid/customTemplates',
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
          debugPrint('CustomTemplateStore sync pending error: $e');
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
