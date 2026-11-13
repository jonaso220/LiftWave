import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;

/// Tells the user their rest is over when the app is not on screen.
///
/// In the foreground the rest timer overlay and a haptic do that job. Once
/// the app is in the background the Dart timer stops, so the end of the rest
/// is handed to the system as a scheduled local notification (with sound),
/// and withdrawn again when the app comes back.
class RestAlertService extends ChangeNotifier {
  RestAlertService._();
  static final RestAlertService instance = RestAlertService._();

  static const _enabledKey = 'rest_alert_enabled';
  static const _askedKey = 'rest_alert_permission_asked';
  static const _channelId = 'rest_timer';
  static const _notificationId = 4101;

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  bool _enabled = true;
  bool _ready = false;
  final Completer<bool> _initialized = Completer<bool>();

  /// Completes once [init] has run, with whether notifications can be used.
  /// The workout reminders share this plugin and wait for it here.
  Future<bool> get whenReady => _initialized.future;
  bool _permissionAsked = false;

  /// The user's choice in Profile. On by default.
  bool get enabled => _enabled;

  bool get _supported =>
      !kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.android ||
          defaultTargetPlatform == TargetPlatform.iOS);

  AndroidFlutterLocalNotificationsPlugin? get _android => _plugin
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >();

  Future<void> init() async {
    try {
      await _init();
    } finally {
      if (!_initialized.isCompleted) _initialized.complete(_ready);
    }
  }

  Future<void> _init() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _enabled = prefs.getBool(_enabledKey) ?? true;
      _permissionAsked = prefs.getBool(_askedKey) ?? false;
    } catch (_) {
      _enabled = true;
    }
    if (!_supported) return;
    try {
      await _plugin.initialize(
        settings: const InitializationSettings(
          android: AndroidInitializationSettings('ic_stat_rest'),
          // Permission is requested when the first rest starts, not at
          // launch.
          iOS: DarwinInitializationSettings(
            requestAlertPermission: false,
            requestBadgePermission: false,
            requestSoundPermission: false,
          ),
        ),
      );
      _ready = true;
      // A notification left over from a session that was killed.
      await cancel();
    } catch (e) {
      debugPrint('RestAlertService.init error: $e');
    }
  }

  Future<void> setEnabled(bool value) async {
    if (value == _enabled) return;
    _enabled = value;
    notifyListeners();
    if (value) {
      await requestPermission();
    } else {
      await cancel();
    }
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_enabledKey, value);
    } catch (_) {
      // The choice still applies for this session.
    }
  }

  /// Asks for notification permission the first time it is needed (when the
  /// first rest starts), so the system prompt has an obvious reason.
  Future<void> ensurePermissionAsked() async {
    if (!_enabled || _permissionAsked) return;
    _permissionAsked = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_askedKey, true);
    } catch (_) {
      // Asking again next launch is harmless.
    }
    await requestPermission();
  }

  Future<void> requestPermission() async {
    if (!_ready) return;
    try {
      if (defaultTargetPlatform == TargetPlatform.android) {
        await _android?.requestNotificationsPermission();
      } else {
        await _plugin
            .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin
            >()
            ?.requestPermissions(alert: true, sound: true);
      }
    } catch (e) {
      debugPrint('RestAlertService.requestPermission error: $e');
    }
  }

  /// Android 14+ only delivers alarms on time when the user allows "Alarms
  /// & reminders" for the app. Always true elsewhere.
  Future<bool> canAlertOnTime() async {
    if (!_ready || defaultTargetPlatform != TargetPlatform.android) return true;
    try {
      return await _android?.canScheduleExactNotifications() ?? true;
    } catch (_) {
      return true;
    }
  }

  /// Opens the system screen where the user grants exact alarms.
  Future<void> openExactAlarmSettings() async {
    if (!_ready) return;
    try {
      await _android?.requestExactAlarmsPermission();
    } catch (e) {
      debugPrint('RestAlertService.openExactAlarmSettings error: $e');
    }
  }

  /// Schedules the alert for [at], replacing any earlier one.
  Future<void> schedule({
    required DateTime at,
    required String title,
    required String body,
    required String channelName,
  }) async {
    if (!_ready || !_enabled) return;
    if (!at.isAfter(DateTime.now())) return;
    try {
      final exact = await canAlertOnTime();
      await _plugin.zonedSchedule(
        id: _notificationId,
        title: title,
        body: body,
        // An absolute instant: no time-zone database is needed.
        scheduledDate: tz.TZDateTime.from(at.toUtc(), tz.UTC),
        androidScheduleMode: exact
            ? AndroidScheduleMode.exactAllowWhileIdle
            : AndroidScheduleMode.inexactAllowWhileIdle,
        notificationDetails: NotificationDetails(
          android: AndroidNotificationDetails(
            _channelId,
            channelName,
            importance: Importance.high,
            priority: Priority.high,
            category: AndroidNotificationCategory.alarm,
          ),
          iOS: const DarwinNotificationDetails(
            presentAlert: true,
            presentSound: true,
          ),
        ),
      );
    } catch (e) {
      debugPrint('RestAlertService.schedule error: $e');
    }
  }

  Future<void> cancel() async {
    if (!_ready) return;
    try {
      await _plugin.cancel(id: _notificationId);
    } catch (e) {
      debugPrint('RestAlertService.cancel error: $e');
    }
  }
}
