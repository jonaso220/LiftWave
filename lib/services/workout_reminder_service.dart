import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest_10y.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

import 'rest_alert_service.dart';

/// The wording of a reminder, in the app's language, and the routines the
/// user has assigned to each weekday (`DateTime.monday`..`DateTime.sunday`).
///
/// Built by the UI, which is where the localizations and the routines are.
@immutable
class ReminderContent {
  final String title;

  /// The text on a day with no routine assigned.
  final String body;

  /// The text on a day with routines, given their names joined.
  final String Function(String routines) routineBody;

  /// The name of the notification channel shown in the system settings.
  final String channelName;

  final Map<int, List<String>> routinesByWeekday;

  const ReminderContent({
    required this.title,
    required this.body,
    required this.routineBody,
    required this.channelName,
    this.routinesByWeekday = const {},
  });

  String bodyFor(int weekday) {
    final routines = routinesByWeekday[weekday] ?? const [];
    return routines.isEmpty ? body : routineBody(routines.join(' · '));
  }
}

/// What the reminders need from the system; replaceable in tests.
abstract class ReminderScheduler {
  /// Asks for notification permission when needed. False when refused.
  Future<bool> requestPermission();

  /// A notification every [weekday] at [minutesOfDay], local time.
  Future<void> scheduleWeekly({
    required int id,
    required int weekday,
    required int minutesOfDay,
    required String title,
    required String body,
    required String channelName,
  });

  Future<void> cancel(int id);
}

/// Reminds the user to train on the days and at the time they choose in
/// Profile, with a local notification that repeats every week.
///
/// The notifications are handed to the system, so they arrive without the
/// app running. Their text is fixed when they are scheduled; [sync] is run
/// at launch and whenever the routines change, which keeps it current.
class WorkoutReminderService extends ChangeNotifier {
  WorkoutReminderService._(this._scheduler);

  static final WorkoutReminderService instance = WorkoutReminderService._(
    LocalNotificationReminderScheduler(),
  );

  @visibleForTesting
  WorkoutReminderService.withScheduler(ReminderScheduler scheduler)
    : _scheduler = scheduler;

  static const _enabledKey = 'workout_reminder_enabled';
  static const _daysKey = 'workout_reminder_days';
  static const _minutesKey = 'workout_reminder_minutes';

  /// One notification id per weekday: 4201 (Monday) .. 4207 (Sunday).
  static int notificationId(int weekday) => 4200 + weekday;

  static const defaultWeekdays = {
    DateTime.monday,
    DateTime.wednesday,
    DateTime.friday,
  };
  static const defaultMinutesOfDay = 18 * 60;

  final ReminderScheduler _scheduler;
  bool _enabled = false;
  Set<int> _weekdays = {...defaultWeekdays};
  bool _daysChosen = false;
  int _minutesOfDay = defaultMinutesOfDay;

  /// What the system currently holds, to skip a sync that changes nothing.
  String? _scheduledSignature;

  bool get enabled => _enabled;

  /// `DateTime.monday`..`DateTime.sunday`. Never empty.
  Set<int> get weekdays => Set.unmodifiable(_weekdays);

  /// Minutes after midnight, local time.
  int get minutesOfDay => _minutesOfDay;

  Future<void> init() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _enabled = prefs.getBool(_enabledKey) ?? false;
      final days = prefs
          .getStringList(_daysKey)
          ?.map(int.tryParse)
          .whereType<int>()
          .where((day) => day >= DateTime.monday && day <= DateTime.sunday)
          .toSet();
      if (days != null && days.isNotEmpty) {
        _weekdays = days;
        _daysChosen = true;
      }
      final minutes = prefs.getInt(_minutesKey);
      if (minutes != null && minutes >= 0 && minutes < 24 * 60) {
        _minutesOfDay = minutes;
      }
    } catch (_) {
      _enabled = false;
    }
    notifyListeners();
  }

  Future<void> _persist() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_enabledKey, _enabled);
      await prefs.setInt(_minutesKey, _minutesOfDay);
      if (_daysChosen) {
        await prefs.setStringList(_daysKey, [
          for (final day in _weekdays.toList()..sort()) '$day',
        ]);
      }
    } catch (_) {
      // The choice still applies for this launch.
    }
  }

  /// Turns the reminders on, asking for notification permission. Returns
  /// false, and stays off, when the user refuses it.
  ///
  /// [suggestedWeekdays] (the days that have a routine) become the reminder
  /// days if the user has never picked their own.
  Future<bool> enable({Set<int> suggestedWeekdays = const {}}) async {
    bool granted;
    try {
      granted = await _scheduler.requestPermission();
    } catch (e) {
      debugPrint('WorkoutReminderService.enable error: $e');
      granted = false;
    }
    if (!granted) return false;
    if (!_daysChosen && suggestedWeekdays.isNotEmpty) {
      _weekdays = {...suggestedWeekdays};
    }
    _enabled = true;
    notifyListeners();
    await _persist();
    return true;
  }

  Future<void> disable() async {
    if (!_enabled) return;
    _enabled = false;
    notifyListeners();
    await _persist();
    await _cancelAll();
  }

  /// Forgets the reminders, e.g. when the account is deleted from this
  /// device.
  Future<void> reset() async {
    final wasEnabled = _enabled;
    _enabled = false;
    _weekdays = {...defaultWeekdays};
    _daysChosen = false;
    _minutesOfDay = defaultMinutesOfDay;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_enabledKey);
      await prefs.remove(_daysKey);
      await prefs.remove(_minutesKey);
    } catch (_) {
      // Nothing else to clean.
    }
    if (wasEnabled) await _cancelAll();
  }

  /// Adds or removes a day. The last day cannot be removed: turning the
  /// reminders off is what the switch is for.
  Future<void> toggleWeekday(int weekday) async {
    final next = {..._weekdays};
    if (!next.remove(weekday)) next.add(weekday);
    if (next.isEmpty) return;
    _weekdays = next;
    _daysChosen = true;
    notifyListeners();
    await _persist();
  }

  Future<void> setMinutesOfDay(int minutes) async {
    if (minutes < 0 || minutes >= 24 * 60 || minutes == _minutesOfDay) return;
    _minutesOfDay = minutes;
    notifyListeners();
    await _persist();
  }

  /// Brings the system's scheduled notifications in line with the settings
  /// and with [content]. Safe to call often: it does nothing when nothing
  /// changed.
  Future<void> sync(ReminderContent content) {
    // One at a time: a sync started while another is still scheduling
    // waits for it, and then usually finds nothing left to do.
    return _syncing = _syncing.then((_) => _sync(content));
  }

  Future<void> _syncing = Future.value();

  Future<void> _sync(ReminderContent content) async {
    if (!_enabled) return;
    final days = _weekdays.toList()..sort();
    final signature = [
      _minutesOfDay,
      content.title,
      content.channelName,
      for (final day in days) '$day:${content.bodyFor(day)}',
    ].join('|');
    if (signature == _scheduledSignature) return;
    try {
      for (var day = DateTime.monday; day <= DateTime.sunday; day++) {
        if (_weekdays.contains(day)) {
          await _scheduler.scheduleWeekly(
            id: notificationId(day),
            weekday: day,
            minutesOfDay: _minutesOfDay,
            title: content.title,
            body: content.bodyFor(day),
            channelName: content.channelName,
          );
        } else {
          await _scheduler.cancel(notificationId(day));
        }
      }
      _scheduledSignature = signature;
    } catch (e) {
      debugPrint('WorkoutReminderService.sync error: $e');
    }
  }

  Future<void> _cancelAll() async {
    _scheduledSignature = null;
    try {
      for (var day = DateTime.monday; day <= DateTime.sunday; day++) {
        await _scheduler.cancel(notificationId(day));
      }
    } catch (e) {
      debugPrint('WorkoutReminderService.cancel error: $e');
    }
  }
}

/// The next [weekday] at [minutesOfDay] strictly after [now], as local wall
/// clock time.
DateTime nextReminderTime(DateTime now, int weekday, int minutesOfDay) {
  final hour = minutesOfDay ~/ 60;
  final minute = minutesOfDay % 60;
  var daysAhead = (weekday - now.weekday) % 7;
  // Building the date from its parts keeps the wall-clock time across a
  // daylight-saving change, which adding 24-hour days would not.
  var next = DateTime(now.year, now.month, now.day + daysAhead, hour, minute);
  if (!next.isAfter(now)) {
    daysAhead += 7;
    next = DateTime(now.year, now.month, now.day + daysAhead, hour, minute);
  }
  return next;
}

/// [ReminderScheduler] on flutter_local_notifications. The plugin itself is
/// initialized by [RestAlertService], which shares it.
class LocalNotificationReminderScheduler implements ReminderScheduler {
  static const _channelId = 'workout_reminders';

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  bool? _hasLocalZone;

  /// Loads the phone's time zone so a reminder keeps its wall-clock time
  /// when the clocks change. Without it the reminder is scheduled as a fixed
  /// instant, which is right until the next daylight-saving change (and is
  /// corrected the next time the app is opened).
  Future<bool> _ensureLocalZone() async {
    final known = _hasLocalZone;
    if (known != null) return known;
    try {
      tz_data.initializeTimeZones();
      final zone = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(zone.identifier));
      return _hasLocalZone = true;
    } catch (e) {
      debugPrint('Workout reminders: local time zone unavailable ($e)');
      return _hasLocalZone = false;
    }
  }

  @override
  Future<bool> requestPermission() async {
    if (!await RestAlertService.instance.whenReady) return false;
    if (defaultTargetPlatform == TargetPlatform.android) {
      final android = _plugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();
      // Null below Android 13, where no permission is needed.
      return await android?.requestNotificationsPermission() ?? true;
    }
    final ios = _plugin
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >();
    return await ios?.requestPermissions(alert: true, sound: true) ?? false;
  }

  @override
  Future<void> scheduleWeekly({
    required int id,
    required int weekday,
    required int minutesOfDay,
    required String title,
    required String body,
    required String channelName,
  }) async {
    if (!await RestAlertService.instance.whenReady) return;
    final next = nextReminderTime(DateTime.now(), weekday, minutesOfDay);
    final scheduledDate = await _ensureLocalZone()
        ? tz.TZDateTime(
            tz.local,
            next.year,
            next.month,
            next.day,
            next.hour,
            next.minute,
          )
        : tz.TZDateTime.from(next.toUtc(), tz.UTC);
    await _plugin.zonedSchedule(
      id: id,
      title: title,
      body: body,
      scheduledDate: scheduledDate,
      matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      // A reminder a few minutes late is fine, and needs no exact-alarm
      // permission.
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          _channelId,
          channelName,
          importance: Importance.defaultImportance,
          priority: Priority.defaultPriority,
          category: AndroidNotificationCategory.reminder,
        ),
        iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentSound: true,
        ),
      ),
    );
  }

  @override
  Future<void> cancel(int id) async {
    if (!await RestAlertService.instance.whenReady) return;
    await _plugin.cancel(id: id);
  }
}
