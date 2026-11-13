import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  DateTime? _deadline;
  DateTime Function() _now = DateTime.now;

  // The same bar also counts down a set of a timed exercise (a "hold").
  bool _isHold = false;
  VoidCallback? _onHoldFinished;

  /// The countdown is a set being held, not a rest.
  bool get isHold => _isHold;

  void _endHold() {
    _isHold = false;
    _onHoldFinished = null;
  }

  /// Counts down [seconds] for a set of a timed exercise and calls
  /// [onFinished] when the time is up. The user's preferred rest is left
  /// untouched.
  void startHold(int seconds, {required VoidCallback onFinished}) {
    if (seconds <= 0) return;
    _ticker?.cancel();
    _isHold = true;
    _onHoldFinished = onFinished;
    _total = seconds;
    _remaining = seconds;
    _deadline = _now().add(Duration(seconds: seconds));
    _isRunning = true;
    _isVisible = true;
    HapticFeedback.lightImpact();
    _syncWatch();
    _runTicker();
    notifyListeners();
  }

  static const _preferredKey = 'rest_preferred_seconds';
  static const _customKey = 'rest_preferred_is_custom';

  /// Restores the rest duration the user last chose, so it does not go back
  /// to 90 s on every launch.
  Future<void> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final stored = prefs.getInt(_preferredKey);
      if (stored == null || stored <= 0 || stored > 3600) return;
      if (_isVisible) return; // A rest already started: leave it alone.
      _preferredSeconds = stored;
      _total = stored;
      _remaining = stored;
      _isCustom = prefs.getBool(_customKey) ?? !presets.contains(stored);
      notifyListeners();
    } catch (_) {
      // The default duration is used.
    }
  }

  Future<void> _savePreference() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_preferredKey, _preferredSeconds);
      await prefs.setBool(_customKey, _isCustom);
    } catch (_) {
      // The choice still applies for this session.
    }
  }

  /// When the running rest ends; null while paused, finished or hidden.
  DateTime? get deadline => _isRunning ? _deadline : null;

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
    _endHold();
    _ticker?.cancel();
    _total = s;
    _remaining = s;
    _deadline = _now().add(Duration(seconds: s));
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
      _updateRemainingFromClock();
      _ticker?.cancel();
      _isRunning = false;
      _deadline = null;
    } else {
      if (_remaining == 0) _remaining = _total;
      _isRunning = true;
      _deadline = _now().add(Duration(seconds: _remaining));
      _runTicker();
    }
    _syncWatch();
    notifyListeners();
  }

  void pause() {
    if (!_isRunning) return;
    toggle();
  }

  void resume({int? seconds}) {
    if (seconds != null && seconds > 0) {
      startWithDefault(seconds: seconds);
    } else if (!_isRunning) {
      toggle();
    }
  }

  void reset() {
    HapticFeedback.mediumImpact();
    _ticker?.cancel();
    _remaining = _total;
    _isRunning = false;
    _deadline = null;
    _syncWatch();
    notifyListeners();
  }

  void selectPreset(int seconds) {
    _endHold();
    _ticker?.cancel();
    _total = seconds;
    _remaining = seconds;
    _preferredSeconds = seconds;
    _isRunning = false;
    _deadline = null;
    _isCustom = false;
    _syncWatch();
    notifyListeners();
    _savePreference();
  }

  void setCustom(int seconds) {
    if (seconds <= 0) return;
    _endHold();
    _ticker?.cancel();
    _total = seconds;
    _remaining = seconds;
    _preferredSeconds = seconds;
    _isRunning = false;
    _deadline = null;
    _isCustom = true;
    _syncWatch();
    notifyListeners();
    _savePreference();
  }

  void addTime(int seconds) {
    HapticFeedback.selectionClick();
    if (_isRunning) _updateRemainingFromClock();
    _remaining = (_remaining + seconds).clamp(0, 3600);
    if (_remaining > _total) _total = _remaining;
    if (_isRunning) {
      if (_remaining == 0) {
        _finish();
        return;
      }
      _deadline = _now().add(Duration(seconds: _remaining));
    }
    _syncWatch();
    notifyListeners();
  }

  /// Recalculates remaining time from [_deadline]. Call when the app returns
  /// from background so a frozen Dart ticker does not leave the overlay stale.
  void syncFromClock() {
    if (!_isRunning) return;
    final previous = _remaining;
    _updateRemainingFromClock();
    if (_remaining <= 0) {
      _finish();
      return;
    }
    if (_remaining == previous) return;
    _syncWatch();
    notifyListeners();
  }

  /// Hide the overlay and stop the timer entirely.
  void dismiss() {
    _endHold();
    _ticker?.cancel();
    _remaining = _total;
    _isRunning = false;
    _isVisible = false;
    _deadline = null;
    _syncWatch();
    notifyListeners();
  }

  void _runTicker() {
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      final previous = _remaining;
      _updateRemainingFromClock();
      if (_remaining <= 0) {
        _finish();
        return;
      }
      if (previous > 3 && _remaining <= 3) {
        HapticFeedback.selectionClick();
      }
      _syncWatch();
      notifyListeners();
    });
  }

  void _updateRemainingFromClock() {
    final deadline = _deadline;
    if (deadline == null) return;
    final milliseconds = deadline.difference(_now()).inMilliseconds;
    _remaining = milliseconds <= 0 ? 0 : (milliseconds / 1000).ceil();
  }

  void _finish() {
    _ticker?.cancel();
    _remaining = 0;
    _isRunning = false;
    _deadline = null;
    HapticFeedback.heavyImpact();
    if (_isHold) {
      // The set is over: hand it back (it is marked done, which starts the
      // rest and shows this bar again) instead of showing "done".
      final onFinished = _onHoldFinished;
      _endHold();
      _isVisible = false;
      _remaining = _total = _preferredSeconds;
      _syncWatch();
      notifyListeners();
      onFinished?.call();
      return;
    }
    _syncWatch();
    notifyListeners();
  }

  @visibleForTesting
  void setClockForTesting(DateTime Function()? clock) {
    _now = clock ?? DateTime.now;
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
