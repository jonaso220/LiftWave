import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'watch_service.dart';

/// Singleton that drives the rest timer overlay shown during a workout.
/// Replaces the standalone Rest tab — the timer now auto-starts when a set
/// is marked done and lives on top of the train screen.
class RestTimerController extends ChangeNotifier {
  RestTimerController._();
  static final RestTimerController instance = RestTimerController._();

  static const int defaultRestSeconds = 90;
  static const List<int> presets = [30, 60, 90, 120, 180];

  int _total = defaultRestSeconds;
  int _remaining = defaultRestSeconds;

  /// Duration to use the next time [startWithDefault] is called without an
  /// explicit seconds argument. Updated by the user via presets / custom
  /// time so their choice persists across set completions in a workout.
  int _preferredSeconds = defaultRestSeconds;
  bool _isRunning = false;
  bool _isVisible = false;
  bool _isCustom = false;
  Timer? _ticker;

  int get total => _total;
  int get remaining => _remaining;
  bool get isRunning => _isRunning;
  bool get isVisible => _isVisible;
  bool get isCustom => _isCustom;
  bool get hasFinished => _remaining == 0 && !_isRunning && _isVisible;
  double get progress => _total > 0 ? (_total - _remaining) / _total : 1.0;

  /// Start the timer using the user's preferred duration (defaults to 90s
  /// the first time, then whichever preset/custom they last picked). Pass
  /// [seconds] to override for this single set. Called when a set is
  /// marked done.
  void startWithDefault({int? seconds}) {
    final s = seconds ?? _preferredSeconds;
    if (s <= 0) return;
    _ticker?.cancel();
    _total = s;
    _remaining = s;
    _isRunning = true;
    _isVisible = true;
    HapticFeedback.lightImpact();
    _syncWatch();
    _runTicker();
    notifyListeners();
  }

  /// Toggle running/paused. If finished, restarts from total.
  void toggle() {
    HapticFeedback.lightImpact();
    if (_isRunning) {
      _ticker?.cancel();
      _isRunning = false;
    } else {
      if (_remaining == 0) _remaining = _total;
      _isRunning = true;
      _runTicker();
    }
    _syncWatch();
    notifyListeners();
  }

  void reset() {
    HapticFeedback.mediumImpact();
    _ticker?.cancel();
    _remaining = _total;
    _isRunning = false;
    _syncWatch();
    notifyListeners();
  }

  void selectPreset(int seconds) {
    _ticker?.cancel();
    _total = seconds;
    _remaining = seconds;
    _preferredSeconds = seconds;
    _isRunning = false;
    _isCustom = false;
    _syncWatch();
    notifyListeners();
  }

  void setCustom(int seconds) {
    if (seconds <= 0) return;
    _ticker?.cancel();
    _total = seconds;
    _remaining = seconds;
    _preferredSeconds = seconds;
    _isRunning = false;
    _isCustom = true;
    _syncWatch();
    notifyListeners();
  }

  void addTime(int seconds) {
    HapticFeedback.selectionClick();
    _remaining = (_remaining + seconds).clamp(0, 3600);
    if (_remaining > _total) _total = _remaining;
    _syncWatch();
    notifyListeners();
  }

  /// Hide the overlay and stop the timer entirely.
  void dismiss() {
    _ticker?.cancel();
    _remaining = _total;
    _isRunning = false;
    _isVisible = false;
    _syncWatch();
    notifyListeners();
  }

  void _runTicker() {
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_remaining <= 0) {
        _ticker?.cancel();
        _isRunning = false;
        HapticFeedback.heavyImpact();
        _syncWatch();
        notifyListeners();
      } else {
        _remaining--;
        if (_remaining == 3) HapticFeedback.selectionClick();
        _syncWatch();
        notifyListeners();
      }
    });
  }

  void _syncWatch() {
    WatchService.instance.updateTimerState(
      running: _isRunning,
      remaining: _remaining,
      total: _total,
    );
  }

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }
}
