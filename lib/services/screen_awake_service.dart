import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'workout_launcher.dart';

/// Keeps the screen on while a workout is in progress so the phone does not
/// lock between sets. Implemented with a small native channel
/// (MainActivity.kt / AppDelegate.swift) instead of a plugin, so the iOS
/// Podfile.lock used by Xcode Cloud's `pod install --deployment` stays valid.
class ScreenAwakeService extends ChangeNotifier {
  ScreenAwakeService._();
  static final ScreenAwakeService instance = ScreenAwakeService._();

  static const _channel = MethodChannel('com.liftwave.liftwave/screen');
  static const _prefKey = 'keep_screen_on_during_workout';

  bool _enabled = true;
  bool? _applied;

  /// The user's choice in Profile. On by default.
  bool get enabled => _enabled;

  Future<void> init() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _enabled = prefs.getBool(_prefKey) ?? true;
    } catch (_) {
      _enabled = true;
    }
    WorkoutLauncher.instance.sessionActive.addListener(_sync);
    await _sync();
  }

  Future<void> setEnabled(bool value) async {
    if (value == _enabled) return;
    _enabled = value;
    notifyListeners();
    await _sync();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_prefKey, value);
    } catch (_) {
      // The choice still applies for this session.
    }
  }

  Future<void> _sync() async {
    final keepOn = _enabled && WorkoutLauncher.instance.sessionActive.value;
    if (keepOn == _applied) return;
    _applied = keepOn;
    try {
      await _channel.invokeMethod<void>('setKeepOn', keepOn);
    } on MissingPluginException {
      // Web and desktop have no channel; they do not auto-lock mid-workout.
    } on PlatformException catch (error) {
      debugPrint('ScreenAwakeService: $error');
    }
  }

  @visibleForTesting
  void resetForTesting() {
    WorkoutLauncher.instance.sessionActive.removeListener(_sync);
    _enabled = true;
    _applied = null;
  }
}
