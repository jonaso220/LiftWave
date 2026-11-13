import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:liftwave/l10n/generated/app_localizations_es.dart';
import 'package:liftwave/models/models.dart';
import 'package:liftwave/services/home_widget_service.dart';
import 'package:liftwave/services/home_widget_sync.dart';

class _FakeGateway implements HomeWidgetGateway {
  final published = <String?>[];
  bool failing = false;

  @override
  Future<void> publish(String? snapshot) async {
    if (failing) throw StateError('no widget support');
    published.add(snapshot);
  }
}

const _labels = HomeWidgetLabels(
  today: 'Hoy toca',
  freeSession: 'Sesión libre',
  weekOfTarget: '{done}/{target} esta semana',
  weekOne: '1 sesión esta semana',
  weekOther: '{count} sesiones esta semana',
);

Workout _workout(DateTime date, {bool completed = true}) => Workout(
  id: 'w_${date.millisecondsSinceEpoch}',
  name: 'Torso',
  date: date,
  duration: const Duration(minutes: 40),
  totalVolume: 0,
  exercises: [
    WorkoutExercise(
      id: 'e',
      name: 'Press de banca',
      muscleGroup: 'Pecho',
      sets: [
        WorkoutSet(setNumber: 1, reps: 8, weight: 60, completed: completed),
      ],
    ),
  ],
);

Map<String, dynamic> _snapshot({
  Iterable<Workout> workouts = const [],
  Map<int, List<String>> routines = const {},
  int? target,
  DateTime? now,
}) =>
    jsonDecode(
          buildHomeWidgetSnapshot(
            labels: _labels,
            workouts: workouts,
            routinesByWeekday: routines,
            weekTarget: target,
            now: now ?? DateTime(2026, 11, 12, 19),
          ),
        )
        as Map<String, dynamic>;

void main() {
  group('what the widget is given', () {
    test('the routines of each weekday, joined', () {
      final snapshot = _snapshot(
        routines: {
          DateTime.monday: ['Torso', 'Core'],
          DateTime.thursday: ['Pierna'],
          DateTime.friday: [],
        },
      );

      expect(snapshot['routines'], {'1': 'Torso · Core', '4': 'Pierna'});
    });

    test('the days trained lately, one entry per workout', () {
      final snapshot = _snapshot(
        workouts: [
          _workout(DateTime(2026, 11, 12, 8)),
          _workout(DateTime(2026, 11, 12, 18)),
          _workout(DateTime(2026, 11, 9, 7)),
          // Too old to matter for "this week".
          _workout(DateTime(2026, 10, 1)),
          // Started but nothing completed.
          _workout(DateTime(2026, 11, 11), completed: false),
        ],
      );

      expect(snapshot['workouts'], ['2026-11-09', '2026-11-12', '2026-11-12']);
    });

    test('the weekly goal when there is one', () {
      expect(_snapshot(target: 4)['target'], 4);
      expect(_snapshot()['target'], isNull);
    });

    test('the wording in the app language, with the widget\'s blanks', () {
      final labels = homeWidgetLabels(SEs());

      expect(labels.today, 'Hoy toca');
      expect(labels.freeSession, 'Sesión libre');
      expect(labels.weekOfTarget, '{done}/{target} esta semana');
      expect(labels.weekOne, '1 sesión esta semana');
      expect(labels.weekOther, '{count} sesiones esta semana');
    });
  });

  group('publishing', () {
    late _FakeGateway gateway;
    late HomeWidgetService service;

    setUp(() {
      gateway = _FakeGateway();
      service = HomeWidgetService.withGateway(gateway);
    });

    test('the same content is not sent twice', () async {
      await service.publish('a');
      await service.publish('a');
      await service.publish('b');

      expect(gateway.published, ['a', 'b']);
    });

    test('signing out empties the widget', () async {
      await service.publish('a');
      await service.clear();
      await service.clear();

      expect(gateway.published, ['a', null]);
    });

    test('a platform without widgets does not break the app', () async {
      gateway.failing = true;
      await service.publish('a');

      // And it is tried again once the platform answers.
      gateway.failing = false;
      await service.publish('a');
      expect(gateway.published, ['a']);
    });
  });
}
