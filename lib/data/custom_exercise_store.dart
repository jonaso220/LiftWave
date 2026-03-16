import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/models.dart';

class CustomExerciseStore extends ChangeNotifier {
  CustomExerciseStore._();
  static final instance = CustomExerciseStore._();

  static const _key = 'custom_exercises';
  final List<Exercise> _exercises = [];

  List<Exercise> get exercises => List.unmodifiable(_exercises);

  bool _loaded = false;

  Future<void> load() async {
    if (_loaded) return;
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getString(_key);
      if (raw != null) {
        final list = jsonDecode(raw) as List;
        _exercises.clear();
        for (final j in list) {
          _exercises.add(_fromJson(j as Map<String, dynamic>));
        }
      }
    } catch (e) {
      debugPrint('CustomExerciseStore.load error: $e');
    }
    _loaded = true;
  }

  Future<void> add(Exercise exercise) async {
    _exercises.add(exercise);
    notifyListeners();
    await _save();
  }

  Future<void> remove(String id) async {
    _exercises.removeWhere((e) => e.id == id);
    notifyListeners();
    await _save();
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    final data = _exercises.map(_toJson).toList();
    await prefs.setString(_key, jsonEncode(data));
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
