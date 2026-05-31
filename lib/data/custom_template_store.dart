import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../services/firebase_service.dart';
import 'workout_templates.dart';

class CustomTemplate {
  final String id;
  final String name;
  final List<TemplateExercise> exercises;

  CustomTemplate({
    required this.id,
    required this.name,
    required this.exercises,
  });

  List<String> get muscleGroups =>
      exercises.map((e) => e.muscleGroup).toSet().toList();

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'exercises': exercises.map((e) => e.toJson()).toList(),
  };

  factory CustomTemplate.fromJson(Map<String, dynamic> json) => CustomTemplate(
    id: json['id'] as String,
    name: json['name'] as String,
    exercises: (json['exercises'] as List)
        .map((e) => TemplateExercise.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

/// User-created workout templates.
/// Primary storage: Firestore (cloud sync, survives device changes).
/// Secondary storage: SharedPreferences (local cache / offline fallback).
class CustomTemplateStore extends ChangeNotifier {
  CustomTemplateStore._() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        _uid = user.uid;
        _syncWithCloud();
      } else {
        _uid = null;
        _templates.clear();
        notifyListeners();
      }
    });
  }
  static final instance = CustomTemplateStore._();

  /// Pre-cloud builds stored templates under a single device-global key.
  static const _legacyKey = 'custom_templates';

  final List<CustomTemplate> _templates = [];
  String? _uid;
  bool _loaded = false;

  String get _localKey => _uid == null ? _legacyKey : 'custom_templates_$_uid';

  List<CustomTemplate> get templates => List.unmodifiable(_templates);

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
      _templates.clear();
      if (raw != null) {
        final list = jsonDecode(raw) as List;
        _templates.addAll(
          list.map((e) => CustomTemplate.fromJson(e as Map<String, dynamic>)),
        );
      }
      notifyListeners();
    } catch (e) {
      debugPrint('CustomTemplateStore._loadLocal error: $e');
    }
  }

  Future<void> _syncWithCloud() async {
    await _loadLocal();
    await _migrateLegacy();

    try {
      final snap = await FirebaseService.instance.customTemplatesRef.get();
      final cloud = snap.docs
          .map((d) => CustomTemplate.fromJson(d.data()))
          .toList();
      final cloudIds = cloud.map((t) => t.id).toSet();

      final localOnly = _templates
          .where((t) => !cloudIds.contains(t.id))
          .toList();

      final byId = <String, CustomTemplate>{
        for (final t in _templates) t.id: t,
      };
      for (final t in cloud) {
        byId[t.id] = t;
      }
      _templates
        ..clear()
        ..addAll(byId.values);

      await Future.wait([_persistLocal(), ...localOnly.map(_saveToFirestore)]);
      notifyListeners();
    } catch (e) {
      debugPrint('CustomTemplateStore._syncWithCloud error: $e');
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
        final t = CustomTemplate.fromJson(j as Map<String, dynamic>);
        if (!_templates.any((x) => x.id == t.id)) _templates.add(t);
      }
      await prefs.remove(_legacyKey);
      await _persistLocal();
    } catch (e) {
      debugPrint('CustomTemplateStore._migrateLegacy error: $e');
    }
  }

  Future<void> add(CustomTemplate template) async {
    _templates.insert(0, template);
    notifyListeners();
    await Future.wait([_persistLocal(), _saveToFirestore(template)]);
  }

  Future<void> remove(String id) async {
    _templates.removeWhere((t) => t.id == id);
    notifyListeners();
    await Future.wait([_persistLocal(), _deleteFromFirestore(id)]);
  }

  // ── Persistence helpers ─────────────────────────────────────────────────

  Future<void> _persistLocal() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(
        _localKey,
        jsonEncode(_templates.map((t) => t.toJson()).toList()),
      );
    } catch (e) {
      debugPrint('CustomTemplateStore._persistLocal error: $e');
    }
  }

  Future<void> _saveToFirestore(CustomTemplate t) async {
    if (_uid == null) return;
    try {
      await FirebaseService.instance.customTemplatesRef
          .doc(t.id)
          .set(t.toJson());
    } catch (e) {
      debugPrint('CustomTemplateStore._saveToFirestore error: $e');
    }
  }

  Future<void> _deleteFromFirestore(String id) async {
    if (_uid == null) return;
    try {
      await FirebaseService.instance.customTemplatesRef.doc(id).delete();
    } catch (e) {
      debugPrint('CustomTemplateStore._deleteFromFirestore error: $e');
    }
  }
}
