import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// What the Live Activity needs from the platform; replaceable in tests.
abstract class LiveActivityGateway {
  Future<void> show({
    required DateTime start,
    required DateTime end,
    required String title,
    required String finishedTitle,
    required String workoutName,
  });

  Future<void> end();
}

/// Shows the rest (or timed set) countdown as a Live Activity on the iPhone
/// Lock Screen and in the Dynamic Island, so the time left is visible
/// without opening the app.
///
/// The countdown runs on the system's side from the two dates it is given;
/// the app only says when it starts, moves or ends. iOS 16.2+; a no-op
/// everywhere else.
class LiveActivityService {
  LiveActivityService._(this._gateway);

  static final LiveActivityService instance = LiveActivityService._(
    ChannelLiveActivityGateway(),
  );

  @visibleForTesting
  LiveActivityService.withGateway(LiveActivityGateway gateway)
    : _gateway = gateway;

  final LiveActivityGateway _gateway;

  /// What is on screen now, to send only what changes: the timer notifies
  /// every second, the activity moves only when its end does.
  String? _shown;
  bool _everEnded = false;

  /// Shows the countdown to [end], or moves the one on screen. [total] is
  /// the whole length of the rest, from which the progress is drawn.
  Future<void> show({
    required DateTime end,
    required Duration total,
    required String title,
    required String finishedTitle,
    required String workoutName,
  }) async {
    final start = end.subtract(total);
    final key =
        '${start.millisecondsSinceEpoch}|${end.millisecondsSinceEpoch}|'
        '$title|$finishedTitle|$workoutName';
    if (key == _shown) return;
    _shown = key;
    try {
      await _gateway.show(
        start: start,
        end: end,
        title: title,
        finishedTitle: finishedTitle,
        workoutName: workoutName,
      );
    } catch (e) {
      debugPrint('LiveActivityService.show error: $e');
    }
  }

  /// Takes the countdown off the screen. Also clears one left over from a
  /// launch that was killed, the first time it is called.
  Future<void> end() async {
    if (_shown == null && _everEnded) return;
    _shown = null;
    _everEnded = true;
    try {
      await _gateway.end();
    } catch (e) {
      debugPrint('LiveActivityService.end error: $e');
    }
  }
}

/// [LiveActivityGateway] on the method channel answered by
/// ios/Runner/RestLiveActivityController.swift.
class ChannelLiveActivityGateway implements LiveActivityGateway {
  static const _channel = MethodChannel('com.liftwave.liftwave/live_activity');

  bool get _supported => !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;

  @override
  Future<void> show({
    required DateTime start,
    required DateTime end,
    required String title,
    required String finishedTitle,
    required String workoutName,
  }) async {
    if (!_supported) return;
    await _channel.invokeMethod<bool>('show', {
      'startMs': start.millisecondsSinceEpoch,
      'endMs': end.millisecondsSinceEpoch,
      'title': title,
      'finishedTitle': finishedTitle,
      'workoutName': workoutName,
    });
  }

  @override
  Future<void> end() async {
    if (!_supported) return;
    await _channel.invokeMethod<bool>('end');
  }
}
