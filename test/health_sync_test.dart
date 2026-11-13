import 'package:flutter_test/flutter_test.dart';
import 'package:liftwave/models/models.dart';
import 'package:liftwave/models/progress_models.dart';
import 'package:liftwave/services/health_sync_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakeGateway implements HealthGateway {
  @override
  String? storeName = 'Health Connect';

  HealthAvailability available = HealthAvailability.available;
  bool granted = false;
  bool grantOnRequest = true;
  bool failing = false;
  int requests = 0;

  /// What was asked of the health store, in order.
  final log = <String>[];

  void _mayFail() {
    if (failing) throw StateError('health store unreachable');
  }

  @override
  Future<HealthAvailability> availability() async => available;

  @override
  Future<bool> hasWriteAccess() async => granted;

  @override
  Future<bool> requestWriteAccess() async {
    requests++;
    granted = grantOnRequest;
    return granted;
  }

  @override
  Future<bool> writeWorkout({
    required DateTime start,
    required DateTime end,
    required String title,
  }) async {
    _mayFail();
    log.add('workout $title ${end.difference(start).inMinutes}min @$end');
    return true;
  }

  @override
  Future<bool> deleteWorkouts({
    required DateTime start,
    required DateTime end,
  }) async {
    _mayFail();
    log.add('delete workout $start..$end');
    return true;
  }

  @override
  Future<bool> writeBodyWeight({
    required double kg,
    required DateTime at,
  }) async {
    _mayFail();
    log.add('weight $kg @$at');
    return true;
  }

  @override
  Future<bool> deleteBodyWeight({
    required DateTime start,
    required DateTime end,
  }) async {
    _mayFail();
    log.add('delete weight $start..$end');
    return true;
  }

  @override
  Future<void> openInstallPage() async => log.add('install');
}

Workout _workout({
  String name = 'Torso',
  required DateTime endedAt,
  Duration duration = const Duration(minutes: 45),
  bool completed = true,
}) => Workout(
  id: 'w_${endedAt.millisecondsSinceEpoch}',
  name: name,
  date: endedAt,
  duration: duration,
  totalVolume: 0,
  exercises: [
    WorkoutExercise(
      id: 'e1',
      name: 'Press de banca',
      muscleGroup: 'Pecho',
      sets: [
        WorkoutSet(setNumber: 1, reps: 8, weight: 60, completed: completed),
      ],
    ),
  ],
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _FakeGateway gateway;
  late HealthSyncService service;
  final ended = DateTime(2026, 11, 12, 19, 30);

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    gateway = _FakeGateway();
    service = HealthSyncService.withGateway(gateway);
  });

  group('turning the sync on', () {
    test('it is off until the user turns it on', () async {
      await service.init();
      expect(service.enabled, isFalse);

      await service.workoutSaved(_workout(endedAt: ended));
      await service.measurementSaved(
        BodyMeasurement(id: 'm1', date: ended, weight: 80),
      );
      expect(gateway.log, isEmpty);
    });

    test('asks for permission and remembers the choice', () async {
      expect(await service.enable(), HealthEnableResult.enabled);
      expect(service.enabled, isTrue);
      expect(gateway.requests, 1);

      // A new launch.
      final restored = HealthSyncService.withGateway(gateway);
      await restored.init();
      expect(restored.enabled, isTrue);
    });

    test('does not ask again when access was already given', () async {
      gateway.granted = true;
      expect(await service.enable(), HealthEnableResult.enabled);
      expect(gateway.requests, 0);
    });

    test('stays off when the user refuses', () async {
      gateway.grantOnRequest = false;
      expect(await service.enable(), HealthEnableResult.denied);
      expect(service.enabled, isFalse);
    });

    test('says so when Health Connect has to be installed', () async {
      gateway.available = HealthAvailability.needsInstall;
      expect(await service.enable(), HealthEnableResult.needsInstall);
      expect(service.enabled, isFalse);
      expect(gateway.requests, 0);
    });

    test('is unsupported where there is no health store', () async {
      gateway.storeName = null;
      expect(service.supported, isFalse);
      expect(await service.enable(), HealthEnableResult.unsupported);
    });

    test('turns itself off when the permission is taken away', () async {
      await service.enable();
      gateway.granted = false;

      await service.refreshAccess();
      expect(service.enabled, isFalse);
    });

    test('turning it off stops the writing', () async {
      await service.enable();
      await service.disable();

      await service.workoutSaved(_workout(endedAt: ended));
      expect(gateway.log, isEmpty);
    });
  });

  group('workouts', () {
    setUp(() => service.enable());

    test('a saved workout is written from its start to its end', () async {
      await service.workoutSaved(_workout(endedAt: ended));

      expect(gateway.log, ['workout Torso 45min @$ended']);
      final interval = HealthSyncService.workoutInterval(
        _workout(endedAt: ended),
      );
      expect(interval.start, DateTime(2026, 11, 12, 18, 45));
      expect(interval.end, ended);
    });

    test('a workout of a few seconds counts as one minute', () async {
      await service.workoutSaved(
        _workout(endedAt: ended, duration: const Duration(seconds: 20)),
      );
      expect(gateway.log, ['workout Torso 1min @$ended']);
    });

    test('a workout with no completed set is not written', () async {
      await service.workoutSaved(_workout(endedAt: ended, completed: false));
      expect(gateway.log, isEmpty);
    });

    test('an edited workout replaces what was written', () async {
      final before = _workout(endedAt: ended);
      final after = _workout(
        name: 'Torso B',
        endedAt: ended.add(const Duration(hours: 1)),
        duration: const Duration(minutes: 30),
      );
      await service.workoutUpdated(before, after);

      expect(gateway.log, hasLength(2));
      expect(gateway.log.first, startsWith('delete workout '));
      expect(
        gateway.log.last,
        'workout Torso B 30min @${ended.add(const Duration(hours: 1))}',
      );
    });

    test('a deleted workout is removed around its start', () async {
      await service.workoutRemoved(_workout(endedAt: ended));

      final start = DateTime(2026, 11, 12, 18, 45);
      expect(gateway.log, [
        'delete workout '
            '${start.subtract(const Duration(seconds: 1))}..'
            '${start.add(const Duration(seconds: 1))}',
      ]);
    });

    test('a failure of the health store does not reach the caller', () async {
      gateway.failing = true;
      await service.workoutSaved(_workout(endedAt: ended));
      await service.workoutRemoved(_workout(endedAt: ended));
      expect(gateway.log, isEmpty);
    });
  });

  group('body weight', () {
    setUp(() => service.enable());

    test('a measurement with weight is written in kilograms', () async {
      await service.measurementSaved(
        BodyMeasurement(id: 'm1', date: ended, weight: 80.5),
      );
      expect(gateway.log, ['weight 80.5 @$ended']);
    });

    test('a weight converted from pounds is rounded', () async {
      await service.measurementSaved(
        BodyMeasurement(id: 'm1', date: ended, weight: 79.83225712000001),
      );
      expect(gateway.log, ['weight 79.83 @$ended']);
    });

    test('a measurement without weight writes nothing', () async {
      await service.measurementSaved(
        BodyMeasurement(id: 'm1', date: ended, waist: 90),
      );
      expect(gateway.log, isEmpty);
    });

    test('a replaced measurement takes the old weight out first', () async {
      final old = BodyMeasurement(id: 'm1', date: ended, weight: 81);
      await service.measurementSaved(
        BodyMeasurement(id: 'm1', date: ended, weight: 80),
        replaced: old,
      );

      expect(gateway.log, hasLength(2));
      expect(gateway.log.first, startsWith('delete weight '));
      expect(gateway.log.last, 'weight 80.0 @$ended');
    });

    test('a deleted measurement removes its weight', () async {
      await service.measurementRemoved(
        BodyMeasurement(id: 'm1', date: ended, weight: 80),
      );
      expect(gateway.log.single, startsWith('delete weight '));
    });
  });
}
