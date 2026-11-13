import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:health/health.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/models.dart';
import '../models/progress_models.dart';

/// Whether the phone's health store can be used right now.
enum HealthAvailability {
  available,

  /// Android 13 and below without Health Connect, or with an old one: the
  /// user has to install or update it from the store first.
  needsInstall,

  /// No health store on this device or platform.
  unsupported,
}

/// What came of the user turning the sync on.
enum HealthEnableResult { enabled, denied, needsInstall, unsupported }

/// What the app needs from the phone's health store (Apple Health on iOS,
/// Health Connect on Android). LiftWave only writes; it reads nothing.
///
/// Kept behind an interface so the sync rules can be tested without the
/// platform.
abstract class HealthGateway {
  /// "Apple Health" or "Health Connect"; null where there is neither.
  String? get storeName;

  Future<HealthAvailability> availability();

  Future<bool> hasWriteAccess();

  /// Shows the system permission screen when needed.
  Future<bool> requestWriteAccess();

  Future<bool> writeWorkout({
    required DateTime start,
    required DateTime end,
    required String title,
  });

  /// Removes the workouts this app wrote that start in the given window.
  Future<bool> deleteWorkouts({required DateTime start, required DateTime end});

  Future<bool> writeBodyWeight({required double kg, required DateTime at});

  /// Removes the weights this app wrote in the given window.
  Future<bool> deleteBodyWeight({
    required DateTime start,
    required DateTime end,
  });

  /// Opens the store page of Health Connect.
  Future<void> openInstallPage();
}

/// Saves the workouts and body weight logged in LiftWave to the phone's
/// health store, when the user turns that on in Profile.
///
/// Everything here is best effort: a failure to reach the health store never
/// gets in the way of saving in LiftWave itself.
class HealthSyncService extends ChangeNotifier {
  HealthSyncService._(this._gateway);

  static final HealthSyncService instance = HealthSyncService._(
    PluginHealthGateway(),
  );

  @visibleForTesting
  HealthSyncService.withGateway(HealthGateway gateway) : _gateway = gateway;

  static const _enabledKey = 'health_sync_enabled';

  /// The shortest workout written. Health Connect rejects a session that
  /// ends when it starts, and a few seconds say nothing either.
  static const minimumWorkout = Duration(minutes: 1);

  /// Slack around a record's time when deleting it, to absorb rounding.
  static const _deleteSlack = Duration(seconds: 1);

  final HealthGateway _gateway;
  bool _enabled = false;

  /// The user's choice in Profile. Off until they turn it on.
  bool get enabled => _enabled;

  /// Whether this platform has a health store at all (the tile is hidden
  /// otherwise).
  bool get supported => _gateway.storeName != null;

  /// "Apple Health" or "Health Connect".
  String get storeName => _gateway.storeName ?? '';

  Future<void> init() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _enabled = supported && (prefs.getBool(_enabledKey) ?? false);
    } catch (_) {
      _enabled = false;
    }
  }

  Future<void> _setEnabled(bool value) async {
    if (_enabled == value) return;
    _enabled = value;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_enabledKey, value);
    } catch (_) {
      // Still applies for this launch.
    }
  }

  /// Turns the sync on, asking for permission. Nothing is written for
  /// workouts logged before this.
  Future<HealthEnableResult> enable() async {
    if (!supported) return HealthEnableResult.unsupported;
    try {
      switch (await _gateway.availability()) {
        case HealthAvailability.unsupported:
          return HealthEnableResult.unsupported;
        case HealthAvailability.needsInstall:
          return HealthEnableResult.needsInstall;
        case HealthAvailability.available:
          break;
      }
      final granted =
          await _gateway.hasWriteAccess() ||
          await _gateway.requestWriteAccess();
      if (!granted) return HealthEnableResult.denied;
    } catch (e) {
      debugPrint('HealthSyncService.enable error: $e');
      return HealthEnableResult.denied;
    }
    await _setEnabled(true);
    return HealthEnableResult.enabled;
  }

  Future<void> disable() => _setEnabled(false);

  /// Turns the switch back off when the permission was taken away in the
  /// system settings, so Profile does not promise a sync that cannot happen.
  Future<void> refreshAccess() async {
    if (!_enabled) return;
    try {
      if (await _gateway.availability() != HealthAvailability.available ||
          !await _gateway.hasWriteAccess()) {
        await _setEnabled(false);
      }
    } catch (e) {
      debugPrint('HealthSyncService.refreshAccess error: $e');
    }
  }

  Future<void> openInstallPage() async {
    try {
      await _gateway.openInstallPage();
    } catch (e) {
      debugPrint('HealthSyncService.openInstallPage error: $e');
    }
  }

  // ── Workouts ───────────────────────────────────────────────────────────

  /// When a workout happened, as the health store wants it. [Workout.date]
  /// is when it ended.
  static ({DateTime start, DateTime end}) workoutInterval(Workout workout) {
    final duration = workout.duration < minimumWorkout
        ? minimumWorkout
        : workout.duration;
    return (start: workout.date.subtract(duration), end: workout.date);
  }

  Future<void> workoutSaved(Workout workout) async {
    if (!_enabled || !workout.hasCompletedWork) return;
    final interval = workoutInterval(workout);
    await _run(
      'workoutSaved',
      () => _gateway.writeWorkout(
        start: interval.start,
        end: interval.end,
        title: workout.name,
      ),
    );
  }

  /// The workout was edited: what was written for it is replaced, since its
  /// date, duration or name may have changed.
  Future<void> workoutUpdated(Workout before, Workout after) async {
    if (!_enabled) return;
    await workoutRemoved(before);
    await workoutSaved(after);
  }

  Future<void> workoutRemoved(Workout workout) async {
    if (!_enabled || !workout.hasCompletedWork) return;
    final start = workoutInterval(workout).start;
    await _run(
      'workoutRemoved',
      () => _gateway.deleteWorkouts(
        start: start.subtract(_deleteSlack),
        end: start.add(_deleteSlack),
      ),
    );
  }

  // ── Body weight ────────────────────────────────────────────────────────

  /// [replaced] is the measurement this one takes the place of, if any.
  Future<void> measurementSaved(
    BodyMeasurement measurement, {
    BodyMeasurement? replaced,
  }) async {
    if (!_enabled) return;
    if (replaced != null) await measurementRemoved(replaced);
    final kg = measurement.weight;
    if (kg == null || kg <= 0) return;
    await _run(
      'measurementSaved',
      // Weights entered in pounds are stored converted: two decimals of a
      // kilogram are plenty and keep the conversion noise out.
      () => _gateway.writeBodyWeight(
        kg: (kg * 100).round() / 100,
        at: measurement.date,
      ),
    );
  }

  Future<void> measurementRemoved(BodyMeasurement measurement) async {
    if (!_enabled) return;
    final kg = measurement.weight;
    if (kg == null || kg <= 0) return;
    await _run(
      'measurementRemoved',
      () => _gateway.deleteBodyWeight(
        start: measurement.date.subtract(_deleteSlack),
        end: measurement.date.add(_deleteSlack),
      ),
    );
  }

  Future<void> _run(String what, Future<bool> Function() action) async {
    try {
      final ok = await action();
      if (!ok) debugPrint('HealthSyncService.$what: not written');
    } catch (e) {
      debugPrint('HealthSyncService.$what error: $e');
    }
  }
}

/// [HealthGateway] on the `health` plugin.
class PluginHealthGateway implements HealthGateway {
  final Health _health = Health();
  bool _configured = false;

  static const _types = [HealthDataType.WORKOUT, HealthDataType.WEIGHT];
  static const _access = [HealthDataAccess.WRITE, HealthDataAccess.WRITE];

  bool get _isIOS => !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;
  bool get _isAndroid =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.android;

  @override
  String? get storeName => _isIOS
      ? 'Apple Health'
      : _isAndroid
      ? 'Health Connect'
      : null;

  Future<void> _configure() async {
    if (_configured) return;
    await _health.configure();
    _configured = true;
  }

  @override
  Future<HealthAvailability> availability() async {
    if (_isIOS) return HealthAvailability.available;
    if (!_isAndroid) return HealthAvailability.unsupported;
    return switch (await _health.getHealthConnectSdkStatus()) {
      HealthConnectSdkStatus.sdkAvailable => HealthAvailability.available,
      HealthConnectSdkStatus.sdkUnavailableProviderUpdateRequired =>
        HealthAvailability.needsInstall,
      _ => HealthAvailability.unsupported,
    };
  }

  @override
  Future<bool> hasWriteAccess() async {
    await _configure();
    return await _health.hasPermissions(_types, permissions: _access) ?? false;
  }

  @override
  Future<bool> requestWriteAccess() async {
    await _configure();
    final shown = await _health.requestAuthorization(
      _types,
      permissions: _access,
    );
    // The screen being shown says nothing about what the user chose.
    return shown && await hasWriteAccess();
  }

  @override
  Future<bool> writeWorkout({
    required DateTime start,
    required DateTime end,
    required String title,
  }) async {
    await _configure();
    return _health.writeWorkoutData(
      activityType: _isIOS
          ? HealthWorkoutActivityType.TRADITIONAL_STRENGTH_TRAINING
          : HealthWorkoutActivityType.STRENGTH_TRAINING,
      start: start,
      end: end,
      title: title,
      // Logged by the user in the app, not measured by a sensor.
      recordingMethod: RecordingMethod.manual,
    );
  }

  @override
  Future<bool> deleteWorkouts({
    required DateTime start,
    required DateTime end,
  }) async {
    await _configure();
    return _health.delete(
      type: HealthDataType.WORKOUT,
      startTime: start,
      endTime: end,
    );
  }

  @override
  Future<bool> writeBodyWeight({
    required double kg,
    required DateTime at,
  }) async {
    await _configure();
    return _health.writeHealthData(
      value: kg,
      unit: HealthDataUnit.KILOGRAM,
      type: HealthDataType.WEIGHT,
      startTime: at,
      recordingMethod: RecordingMethod.manual,
    );
  }

  @override
  Future<bool> deleteBodyWeight({
    required DateTime start,
    required DateTime end,
  }) async {
    await _configure();
    return _health.delete(
      type: HealthDataType.WEIGHT,
      startTime: start,
      endTime: end,
    );
  }

  @override
  Future<void> openInstallPage() => _health.installHealthConnect();
}
