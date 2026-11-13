import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:liftwave/data/custom_template_store.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';
import 'package:liftwave/l10n/generated/app_localizations_es.dart';
import 'package:liftwave/screens/profile/workout_reminder_sheet.dart';
import 'package:liftwave/services/workout_reminder_service.dart';
import 'package:liftwave/services/workout_reminder_sync.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _FakeScheduler implements ReminderScheduler {
  bool grant = true;
  int permissionRequests = 0;

  /// What the system holds: notification id -> "weekday HH:MM title / body".
  final scheduled = <int, String>{};
  int calls = 0;

  @override
  Future<bool> requestPermission() async {
    permissionRequests++;
    return grant;
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
    calls++;
    final hour = (minutesOfDay ~/ 60).toString().padLeft(2, '0');
    final minute = (minutesOfDay % 60).toString().padLeft(2, '0');
    scheduled[id] = '$weekday $hour:$minute $title / $body';
  }

  @override
  Future<void> cancel(int id) async {
    calls++;
    scheduled.remove(id);
  }
}

ReminderContent _content({Map<int, List<String>> routines = const {}}) =>
    ReminderContent(
      title: 'Hora de entrenar',
      body: 'Tu entrenamiento de hoy te espera.',
      routineBody: (routine) => 'Hoy toca: $routine',
      channelName: 'Recordatorios',
      routinesByWeekday: routines,
    );

CustomTemplate _routine(String name, {String? day, int? order}) =>
    CustomTemplate(
      id: name,
      name: name,
      exercises: const [],
      routineDay: day,
      routineOrder: order,
    );

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('when the next reminder falls', () {
    // Thursday 12 November 2026, 17:00.
    final now = DateTime(2026, 11, 12, 17);

    test('later today', () {
      expect(
        nextReminderTime(now, DateTime.thursday, 18 * 60),
        DateTime(2026, 11, 12, 18),
      );
    });

    test('next week when today\'s time has passed', () {
      expect(
        nextReminderTime(now, DateTime.thursday, 7 * 60 + 30),
        DateTime(2026, 11, 19, 7, 30),
      );
      // Exactly now is not "after now".
      expect(
        nextReminderTime(now, DateTime.thursday, 17 * 60),
        DateTime(2026, 11, 19, 17),
      );
    });

    test('another day of this week or the next', () {
      expect(
        nextReminderTime(now, DateTime.saturday, 9 * 60),
        DateTime(2026, 11, 14, 9),
      );
      expect(
        nextReminderTime(now, DateTime.monday, 9 * 60),
        DateTime(2026, 11, 16, 9),
      );
    });

    test('across the end of the month', () {
      expect(
        nextReminderTime(DateTime(2026, 11, 28, 20), DateTime.tuesday, 6 * 60),
        DateTime(2026, 12, 1, 6),
      );
    });
  });

  group('reminder settings', () {
    late _FakeScheduler scheduler;
    late WorkoutReminderService service;

    setUp(() {
      SharedPreferences.setMockInitialValues({});
      scheduler = _FakeScheduler();
      service = WorkoutReminderService.withScheduler(scheduler);
    });

    test('they are off until the user turns them on', () async {
      await service.init();
      expect(service.enabled, isFalse);

      await service.sync(_content());
      expect(scheduler.calls, 0);
    });

    test('turning them on asks for permission and is remembered', () async {
      expect(await service.enable(), isTrue);
      expect(scheduler.permissionRequests, 1);
      await service.toggleWeekday(DateTime.saturday);
      await service.setMinutesOfDay(7 * 60 + 15);

      // A new launch.
      final restored = WorkoutReminderService.withScheduler(scheduler);
      await restored.init();
      expect(restored.enabled, isTrue);
      expect(restored.weekdays, {
        DateTime.monday,
        DateTime.wednesday,
        DateTime.friday,
        DateTime.saturday,
      });
      expect(restored.minutesOfDay, 7 * 60 + 15);
    });

    test('they stay off when notifications are refused', () async {
      scheduler.grant = false;
      expect(await service.enable(), isFalse);
      expect(service.enabled, isFalse);
    });

    test('the first days are the ones that have a routine', () async {
      await service.enable(
        suggestedWeekdays: {DateTime.tuesday, DateTime.thursday},
      );
      expect(service.weekdays, {DateTime.tuesday, DateTime.thursday});

      // Once the user has picked their own, a suggestion no longer applies.
      await service.toggleWeekday(DateTime.sunday);
      await service.disable();
      await service.enable(suggestedWeekdays: {DateTime.monday});
      expect(service.weekdays, {
        DateTime.tuesday,
        DateTime.thursday,
        DateTime.sunday,
      });
    });

    test('the last day cannot be removed', () async {
      await service.enable(suggestedWeekdays: {DateTime.monday});
      await service.toggleWeekday(DateTime.monday);
      expect(service.weekdays, {DateTime.monday});
    });
  });

  group('what gets scheduled', () {
    late _FakeScheduler scheduler;
    late WorkoutReminderService service;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      scheduler = _FakeScheduler();
      service = WorkoutReminderService.withScheduler(scheduler);
      await service.enable();
    });

    test('one weekly notification per chosen day', () async {
      await service.sync(_content());

      expect(scheduler.scheduled.keys, {
        WorkoutReminderService.notificationId(DateTime.monday),
        WorkoutReminderService.notificationId(DateTime.wednesday),
        WorkoutReminderService.notificationId(DateTime.friday),
      });
      expect(
        scheduler.scheduled[WorkoutReminderService.notificationId(
          DateTime.monday,
        )],
        '1 18:00 Hora de entrenar / Tu entrenamiento de hoy te espera.',
      );
    });

    test('a day with routines names them', () async {
      await service.sync(
        _content(
          routines: {
            DateTime.monday: ['Torso', 'Core'],
          },
        ),
      );

      expect(
        scheduler.scheduled[WorkoutReminderService.notificationId(
          DateTime.monday,
        )],
        endsWith('Hoy toca: Torso · Core'),
      );
      expect(
        scheduler.scheduled[WorkoutReminderService.notificationId(
          DateTime.friday,
        )],
        endsWith('Tu entrenamiento de hoy te espera.'),
      );
    });

    test('nothing is rescheduled when nothing changed', () async {
      await service.sync(_content());
      final calls = scheduler.calls;

      await service.sync(_content());
      expect(scheduler.calls, calls);
    });

    test('a new time, day or routine reschedules', () async {
      await service.sync(_content());

      await service.setMinutesOfDay(6 * 60 + 30);
      await service.sync(_content());
      expect(
        scheduler.scheduled[WorkoutReminderService.notificationId(
          DateTime.monday,
        )],
        startsWith('1 06:30 '),
      );

      await service.toggleWeekday(DateTime.monday);
      await service.sync(_content());
      expect(
        scheduler.scheduled.keys,
        isNot(contains(WorkoutReminderService.notificationId(DateTime.monday))),
      );

      await service.sync(
        _content(
          routines: {
            DateTime.friday: ['Pierna'],
          },
        ),
      );
      expect(
        scheduler.scheduled[WorkoutReminderService.notificationId(
          DateTime.friday,
        )],
        endsWith('Hoy toca: Pierna'),
      );
    });

    test('turning them off cancels every notification', () async {
      await service.sync(_content());
      await service.disable();
      expect(scheduler.scheduled, isEmpty);

      // And they come back when turned on again.
      await service.enable();
      await service.sync(_content());
      expect(scheduler.scheduled, hasLength(3));
    });

    test('deleting the account from the device forgets them', () async {
      await service.toggleWeekday(DateTime.sunday);
      await service.sync(_content());
      await service.reset();

      expect(service.enabled, isFalse);
      expect(scheduler.scheduled, isEmpty);
      final restored = WorkoutReminderService.withScheduler(scheduler);
      await restored.init();
      expect(restored.enabled, isFalse);
      expect(restored.weekdays, WorkoutReminderService.defaultWeekdays);
    });
  });

  group('the routines of each day', () {
    test('are grouped by weekday in the order they are trained', () {
      final byDay = routinesByWeekday([
        _routine('Core', day: 'monday', order: 2),
        _routine('Torso', day: 'monday', order: 1),
        _routine('Pierna', day: 'thursday'),
        _routine('Suelta', day: 'none'),
      ]);

      expect(byDay, {
        DateTime.monday: ['Torso', 'Core'],
        DateTime.thursday: ['Pierna'],
      });
    });

    test('the reminder text comes from the app language', () {
      final content = reminderContent(SEs(), [
        _routine('Torso', day: 'monday'),
      ]);

      expect(content.title, SEs().reminders_notificationTitle);
      expect(content.bodyFor(DateTime.monday), 'Hoy toca: Torso');
      expect(
        content.bodyFor(DateTime.tuesday),
        SEs().reminders_notificationBody,
      );
    });
  });

  testWidgets('the settings sheet starts with the reminders off', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('es'),
        localizationsDelegates: S.localizationsDelegates,
        supportedLocales: S.supportedLocales,
        home: const Scaffold(body: WorkoutReminderSheet()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text(SEs().reminders_enable), findsOneWidget);
    expect(
      tester.widget<SwitchListTile>(find.byType(SwitchListTile)).value,
      isFalse,
    );
    // Days and time only appear once they are on.
    expect(find.byType(FilterChip), findsNothing);
    expect(find.text(SEs().reminders_time), findsNothing);
  });

  testWidgets('weekday names follow the app language', (tester) async {
    late String monday;
    late String sunday;
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('es'),
        localizationsDelegates: S.localizationsDelegates,
        supportedLocales: S.supportedLocales,
        home: Builder(
          builder: (context) {
            monday = shortWeekdayName(context, DateTime.monday);
            sunday = shortWeekdayName(context, DateTime.sunday);
            return const SizedBox();
          },
        ),
      ),
    );

    expect(monday, 'lun');
    expect(sunday, 'dom');
  });
}
