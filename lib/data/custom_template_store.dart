import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

class CustomTemplateStore extends ChangeNotifier {
  CustomTemplateStore._();
  static final instance = CustomTemplateStore._();

  static const _key = 'custom_templates';
  final List<CustomTemplate> _templates = [];

  List<CustomTemplate> get templates => List.unmodifiable(_templates);

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw != null) {
      final list = jsonDecode(raw) as List;
      _templates
        ..clear()
        ..addAll(list.map(
            (e) => CustomTemplate.fromJson(e as Map<String, dynamic>)));
      notifyListeners();
    }
  }

  Future<void> add(CustomTemplate template) async {
    _templates.insert(0, template);
    notifyListeners();
    await _save();
  }

  Future<void> remove(String id) async {
    _templates.removeWhere((t) => t.id == id);
    notifyListeners();
    await _save();
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        _key, jsonEncode(_templates.map((t) => t.toJson()).toList()));
  }
}
