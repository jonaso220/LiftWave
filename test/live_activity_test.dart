import 'package:flutter_test/flutter_test.dart';
import 'package:liftwave/services/live_activity_service.dart';

class _FakeGateway implements LiveActivityGateway {
  final log = <String>[];
  bool failing = false;

  @override
  Future<void> show({
    required DateTime start,
    required DateTime end,
    required String title,
    required String finishedTitle,
    required String workoutName,
  }) async {
    if (failing) throw StateError('no Live Activities here');
    log.add(
      'show $title ${end.difference(start).inSeconds}s until $end '
      '($workoutName, then "$finishedTitle")',
    );
  }

  @override
  Future<void> end() async {
    if (failing) throw StateError('no Live Activities here');
    log.add('end');
  }
}

void main() {
  late _FakeGateway gateway;
  late LiveActivityService service;
  final end = DateTime(2026, 11, 12, 19, 30, 30);

  Future<void> show({DateTime? until, int seconds = 90}) => service.show(
    end: until ?? end,
    total: Duration(seconds: seconds),
    title: 'DESCANSANDO',
    finishedTitle: 'Descanso terminado',
    workoutName: 'Full Body',
  );

  setUp(() {
    gateway = _FakeGateway();
    service = LiveActivityService.withGateway(gateway);
  });

  test('the countdown spans the whole rest, ending at the deadline', () async {
    await show();

    expect(gateway.log, [
      'show DESCANSANDO 90s until $end (Full Body, then "Descanso terminado")',
    ]);
  });

  test('the timer ticking every second sends nothing new', () async {
    await show();
    await show();
    await show();

    expect(gateway.log, hasLength(1));
  });

  test('adding time moves the countdown', () async {
    await show();
    await show(until: end.add(const Duration(seconds: 15)), seconds: 105);

    expect(gateway.log, hasLength(2));
    expect(gateway.log.last, startsWith('show DESCANSANDO 105s until '));
  });

  test('it is taken down once when the rest ends', () async {
    await show();
    await service.end();
    await service.end();

    expect(gateway.log.last, 'end');
    expect(gateway.log.where((entry) => entry == 'end'), hasLength(1));
  });

  test('the first end clears one left over from an earlier launch', () async {
    await service.end();
    await service.end();

    expect(gateway.log, ['end']);
  });

  test('the same rest can be shown again after it ended', () async {
    await show();
    await service.end();
    await show();

    expect(
      gateway.log.where((entry) => entry.startsWith('show')),
      hasLength(2),
    );
  });

  test('a phone without Live Activities does not break the session', () async {
    gateway.failing = true;
    await show();
    await service.end();

    expect(gateway.log, isEmpty);
  });
}
