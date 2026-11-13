import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:home_widget/home_widget.dart';

import '../models/models.dart';
import '../utils/calendar_days.dart';

/// The wording the home-screen widget draws, in the app's language.
///
/// The widget runs without the app, so it cannot read the localizations; it
/// gets these ready-made instead. `{count}`, `{done}` and `{target}` are
/// filled in by the widget, which is what knows how many sessions this week
/// has at the moment it draws.
@immutable
class HomeWidgetLabels {
  /// "Hoy toca"
  final String today;

  /// Shown when today has no routine: "Sesión libre".
  final String freeSession;

  /// "{done}/{target} esta semana"
  final String weekOfTarget;

  /// "1 sesión esta semana"
  final String weekOne;

  /// "{count} sesiones esta semana"
  final String weekOther;

  const HomeWidgetLabels({
    required this.today,
    required this.freeSession,
    required this.weekOfTarget,
    required this.weekOne,
    required this.weekOther,
  });
}

/// How far back the workout days handed to the widget go. Enough for it to
/// count the current week on its own, whichever day it is drawn.
const _widgetHistory = Duration(days: 14);

/// What the widget needs to draw itself on any day without the app running:
/// the routines of each weekday and the days recently trained, from which
/// it works out "today" and "this week" when it draws.
///
/// Returns JSON, the one format both native widgets read.
String buildHomeWidgetSnapshot({
  required HomeWidgetLabels labels,
  required Iterable<Workout> workouts,
  required Map<int, List<String>> routinesByWeekday,
  required int? weekTarget,
  required DateTime now,
}) {
  final since = startOfDay(now).subtract(_widgetHistory);
  final days = [
    for (final workout in workouts)
      if (workout.hasCompletedWork && !workout.date.isBefore(since))
        _dayKey(workout.date),
  ]..sort();
  return jsonEncode({
    'v': 1,
    'labels': {
      'today': labels.today,
      'free': labels.freeSession,
      'weekOfTarget': labels.weekOfTarget,
      'weekOne': labels.weekOne,
      'weekOther': labels.weekOther,
    },
    'routines': {
      for (final entry in routinesByWeekday.entries)
        if (entry.value.isNotEmpty) '${entry.key}': entry.value.join(' · '),
    },
    // One entry per workout, so two sessions in a day count as two.
    'workouts': days,
    'target': weekTarget,
  });
}

String _dayKey(DateTime date) =>
    '${date.year.toString().padLeft(4, '0')}-'
    '${date.month.toString().padLeft(2, '0')}-'
    '${date.day.toString().padLeft(2, '0')}';

/// Where the snapshot goes; replaceable in tests.
abstract class HomeWidgetGateway {
  /// Stores [snapshot] (null clears it) and asks the widgets to redraw.
  Future<void> publish(String? snapshot);
}

/// Keeps the home-screen widget (Android and iOS) showing today's routine
/// and the week's sessions.
class HomeWidgetService {
  HomeWidgetService._(this._gateway);

  static final HomeWidgetService instance = HomeWidgetService._(
    PluginHomeWidgetGateway(),
  );

  @visibleForTesting
  HomeWidgetService.withGateway(HomeWidgetGateway gateway) : _gateway = gateway;

  final HomeWidgetGateway _gateway;
  String? _published;
  bool _hasPublished = false;

  /// Publishes [snapshot] unless it is what the widget already has.
  Future<void> publish(String snapshot) => _publish(snapshot);

  /// Empties the widget, e.g. when the user signs out: it must not keep
  /// showing someone's routines.
  Future<void> clear() => _publish(null);

  Future<void> _publish(String? snapshot) async {
    if (_hasPublished && snapshot == _published) return;
    try {
      await _gateway.publish(snapshot);
      _published = snapshot;
      _hasPublished = true;
    } catch (e) {
      // No widget support (tests, desktop) or the platform refused: the app
      // works the same without it.
      debugPrint('HomeWidgetService: not published ($e)');
    }
  }
}

/// [HomeWidgetGateway] on the home_widget plugin.
class PluginHomeWidgetGateway implements HomeWidgetGateway {
  /// The key both native widgets read.
  static const dataKey = 'liftwave_widget';

  /// Shared container of the app and its iOS widget extension.
  static const appGroupId = 'group.com.liftwave.liftwave';

  static const _androidProvider =
      'com.liftwave.liftwave.LiftWaveWidgetProvider';
  static const _iosKind = 'LiftWaveHomeWidget';

  bool _configured = false;

  bool get _supported =>
      !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.android ||
          defaultTargetPlatform == TargetPlatform.iOS);

  @override
  Future<void> publish(String? snapshot) async {
    if (!_supported) return;
    if (!_configured && defaultTargetPlatform == TargetPlatform.iOS) {
      await HomeWidget.setAppGroupId(appGroupId);
    }
    _configured = true;
    await HomeWidget.saveWidgetData<String>(dataKey, snapshot);
    await HomeWidget.updateWidget(
      qualifiedAndroidName: _androidProvider,
      iOSName: _iosKind,
    );
  }
}
