import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Communicates with the Apple Watch via WatchConnectivity.
class WatchService {
  WatchService._();
  static final WatchService instance = WatchService._();

  static const _channel = MethodChannel('com.liftwave.liftwave/watch');

  /// Callback for commands received from the Watch.
  void Function(String type, Map<String, dynamic> data)? onWatchCommand;

  void init() {
    _channel.setMethodCallHandler((call) async {
      if (call.method == 'watchCommand') {
        final args = Map<String, dynamic>.from(call.arguments as Map);
        final type = args['type'] as String? ?? '';
        onWatchCommand?.call(type, args);
      }
    });
  }

  /// Send current workout state to the Watch.
  Future<void> updateWorkoutState({
    required bool active,
    String name = '',
    int elapsedSeconds = 0,
    List<Map<String, dynamic>> exercises = const [],
  }) async {
    try {
      await _channel.invokeMethod('updateWorkoutState', {
        'workoutActive': active,
        'workoutName': name,
        'elapsedSeconds': elapsedSeconds,
        'exercises': exercises,
      });
    } catch (e) {
      debugPrint('WatchService.updateWorkoutState error: $e');
    }
  }

  /// Send current timer state to the Watch.
  Future<void> updateTimerState({
    required bool running,
    required int remaining,
    required int total,
  }) async {
    try {
      await _channel.invokeMethod('updateTimerState', {
        'timerRunning': running,
        'timerRemaining': remaining,
        'timerTotal': total,
      });
    } catch (e) {
      debugPrint('WatchService.updateTimerState error: $e');
    }
  }
}
