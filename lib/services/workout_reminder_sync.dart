import 'package:liftwave/l10n/generated/app_localizations.dart';

import '../data/custom_template_store.dart';
import '../utils/routine_days.dart';
import 'workout_reminder_service.dart';

/// The names of the user's routines for each weekday
/// (`DateTime.monday`..`DateTime.sunday`), in the order they are trained.
Map<int, List<String>> routinesByWeekday(Iterable<CustomTemplate> routines) {
  final byDay = <int, List<CustomTemplate>>{};
  for (final routine in routines) {
    final day = routineDayForHistoryGrouping(
      storedDay: routine.routineDay,
      name: routine.name,
    );
    if (day == null) continue;
    byDay.putIfAbsent(day.weekday, () => []).add(routine);
  }
  return {
    for (final entry in byDay.entries)
      entry.key: [
        for (final routine
            in entry.value..sort(
              (a, b) =>
                  (a.routineOrder ?? 999).compareTo(b.routineOrder ?? 999),
            ))
          routine.name,
      ],
  };
}

/// The reminder wording in the app's language, with today's routines.
ReminderContent reminderContent(S l10n, Iterable<CustomTemplate> routines) =>
    ReminderContent(
      title: l10n.reminders_notificationTitle,
      body: l10n.reminders_notificationBody,
      routineBody: l10n.reminders_notificationRoutine,
      channelName: l10n.reminders_title,
      routinesByWeekday: routinesByWeekday(routines),
    );

/// Re-schedules the workout reminders with the current routines. Called at
/// launch, when the routines change and when the settings change.
Future<void> syncWorkoutReminders(S l10n) => WorkoutReminderService.instance
    .sync(reminderContent(l10n, CustomTemplateStore.instance.templates));
