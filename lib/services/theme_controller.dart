import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/app_theme.dart';

/// The user's appearance choice. Stored per device, not per account, so it
/// applies before sign-in too.
class ThemeController extends ChangeNotifier {
  ThemeController._();
  static final ThemeController instance = ThemeController._();

  static const _key = 'theme_mode';

  /// Dark stays the default so existing users keep the look they know.
  ThemeMode _mode = ThemeMode.dark;
  ThemeMode get mode => _mode;

  Future<void> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final stored = prefs.getString(_key);
      _mode = ThemeMode.values.firstWhere(
        (mode) => mode.name == stored,
        orElse: () => ThemeMode.dark,
      );
    } catch (_) {
      _mode = ThemeMode.dark;
    }
  }

  Future<void> setMode(ThemeMode mode) async {
    if (mode == _mode) return;
    _mode = mode;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_key, mode.name);
    } catch (_) {
      // Not persisting the choice is harmless; it applies for this session.
    }
  }

  /// The palette to use for [mode] given the system [platformBrightness].
  static AppPalette paletteFor(ThemeMode mode, Brightness platformBrightness) {
    final brightness = switch (mode) {
      ThemeMode.light => Brightness.light,
      ThemeMode.dark => Brightness.dark,
      ThemeMode.system => platformBrightness,
    };
    return brightness == Brightness.light ? AppPalette.light : AppPalette.dark;
  }
}
