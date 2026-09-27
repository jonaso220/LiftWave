import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/progression_service.dart';
import 'weight_format.dart';

enum WeightUnit { kg, lb }

/// The unit loads and body weight are shown and typed in. Everything is
/// still stored in kilograms (workouts, routines, the cloud and the Watch),
/// so switching never rewrites any data; values are only converted at the
/// edges, when displayed or read from a text field.
class WeightUnits extends ChangeNotifier {
  WeightUnits._();
  static final WeightUnits instance = WeightUnits._();

  static const double kgPerLb = 0.45359237;
  static const _key = 'weight_unit';

  WeightUnit _unit = WeightUnit.kg;
  WeightUnit get unit => _unit;

  Future<void> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final stored = prefs.getString(_key);
      _unit = WeightUnit.values.firstWhere(
        (unit) => unit.name == stored,
        orElse: () => WeightUnit.kg,
      );
    } catch (_) {
      _unit = WeightUnit.kg;
    }
  }

  Future<void> setUnit(WeightUnit unit) async {
    if (unit == _unit) return;
    _unit = unit;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_key, unit.name);
    } catch (_) {
      // The choice still applies for this session.
    }
  }

  @visibleForTesting
  void setForTesting(WeightUnit unit) => _unit = unit;
}

bool get _usesPounds => WeightUnits.instance.unit == WeightUnit.lb;

/// "kg" or "lb".
String get weightSymbol => _usesPounds ? 'lb' : 'kg';

/// Kilograms to the unit shown to the user, rounded to two decimals: a load
/// typed in pounds reads back exactly (135 → 135) and a pound load viewed in
/// kilograms stays readable (61.23 rather than 61.234970).
double kgToDisplay(double kg) {
  final value = _usesPounds ? kg / WeightUnits.kgPerLb : kg;
  return (value * 100).round() / 100;
}

/// A value typed in the user's unit, in kilograms for storage.
double displayToKg(double value) =>
    _usesPounds ? value * WeightUnits.kgPerLb : value;

/// The load as a number in the user's unit, e.g. "62,5" or "135".
String formatLoad(double kg, String locale) =>
    formatWeight(kgToDisplay(kg), locale);

/// The load with its unit, e.g. "62,5 kg" or "135 lb".
String formatLoadWithUnit(double kg, String locale) =>
    '${formatLoad(kg, locale)} $weightSymbol';

/// Training volume with its unit; [compact] shortens thousands ("8.4k").
String formatVolume(num kg, {bool compact = false}) {
  final value = _usesPounds ? (kg / WeightUnits.kgPerLb).round() : kg.round();
  final text = compact && value >= 1000
      ? '${(value / 1000).toStringAsFixed(1)}k'
      : '$value';
  return '$text $weightSymbol';
}

/// One load step in the user's unit: 2.5 kg (2 kg for dumbbells) or 5 lb,
/// the smallest jump plates and dumbbells usually allow.
double loadStepDisplay(String equipment) =>
    _usesPounds ? 5 : ProgressionService.loadIncrementFor(equipment);

/// The same step in kilograms, for progression suggestions.
double loadStepKg(String equipment) => displayToKg(loadStepDisplay(equipment));
