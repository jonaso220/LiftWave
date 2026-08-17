import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../models/models.dart';

/// Stable weekday identifiers used by routines and completed workouts.
///
/// Values are stored as lowercase English keys so changing the app language
/// never breaks an existing routine assignment.
enum RoutineDay {
  monday('monday', DateTime.monday),
  tuesday('tuesday', DateTime.tuesday),
  wednesday('wednesday', DateTime.wednesday),
  thursday('thursday', DateTime.thursday),
  friday('friday', DateTime.friday),
  saturday('saturday', DateTime.saturday),
  sunday('sunday', DateTime.sunday);

  const RoutineDay(this.storageKey, this.weekday);

  final String storageKey;
  final int weekday;

  static RoutineDay? fromStorage(String? value) {
    if (value == null) return null;
    for (final day in values) {
      if (day.storageKey == value.toLowerCase()) return day;
    }
    return null;
  }

  static RoutineDay fromWeekday(int weekday) =>
      values.firstWhere((day) => day.weekday == weekday);
}

/// Returns a localized, capitalized weekday name.
String routineDayLabel(BuildContext context, RoutineDay day) {
  final locale = Localizations.localeOf(context).toString();
  // 2024-01-01 was a Monday.
  final date = DateTime(2024, 1, day.weekday);
  final raw = DateFormat.EEEE(locale).format(date);
  if (raw.isEmpty) return day.storageKey;
  return '${raw[0].toUpperCase()}${raw.substring(1)}';
}

RoutineDay? routineDayFromName(String name) {
  final normalized = _normalize(name);
  for (final entry in _weekdayWords.entries) {
    if (entry.value.any(normalized.contains)) return entry.key;
  }
  return null;
}

/// Returns only routine-backed day metadata. Unlike [routineDayForWorkout],
/// this deliberately does not infer a routine from the completion date, so a
/// free session remains in the full history without appearing as a day routine.
RoutineDay? routineDayForHistoryGrouping({
  required String? storedDay,
  required String name,
}) => RoutineDay.fromStorage(storedDay) ?? routineDayFromName(name);

/// Explicitly assigned days win. Older records remain useful by detecting a
/// weekday in their name and finally falling back to their completion date.
RoutineDay routineDayForWorkout({
  required String? storedDay,
  required String name,
  required DateTime date,
}) =>
    RoutineDay.fromStorage(storedDay) ??
    routineDayFromName(name) ??
    RoutineDay.fromWeekday(date.weekday);

/// Existing names such as "1er biserie" or "4ta bi serie" migrate naturally
/// into the expected order. New routines persist an explicit order.
int routineOrderFromName(String name, {int fallback = 999}) {
  final match = RegExp(r'^\s*(\d+)').firstMatch(name);
  return match == null ? fallback : int.parse(match.group(1)!);
}

/// Whether persisted history proves this block was done this calendar week.
///
/// New day-wide workouts record the block name on every exercise, so only a
/// block with completed sets is marked. Older single-block workouts fall back
/// to their saved name or explicit day/order metadata. The visual week runs
/// from Monday through Sunday and resets without mutating historical records.
bool routineBlockWasCompleted({
  required RoutineDay day,
  required String blockName,
  required int blockOrder,
  required Iterable<Workout> workouts,
  DateTime? now,
}) {
  final normalizedBlockName = _normalize(blockName).trim();
  final reference = (now ?? DateTime.now()).toLocal();
  final referenceDate = DateTime(
    reference.year,
    reference.month,
    reference.day,
  );
  final weekStart = referenceDate.subtract(
    Duration(days: referenceDate.weekday - DateTime.monday),
  );
  final nextWeekStart = weekStart.add(const Duration(days: 7));

  for (final workout in workouts) {
    final workoutDate = workout.date.toLocal();
    final isInCurrentWeek =
        !workoutDate.isBefore(weekStart) && workoutDate.isBefore(nextWeekStart);
    if (!isInCurrentWeek ||
        !workout.hasCompletedWork ||
        routineDayForWorkout(
              storedDay: workout.routineDay,
              name: workout.name,
              date: workout.date,
            ) !=
            day) {
      continue;
    }

    final hasNamedBlocks = workout.exercises.any(
      (exercise) => exercise.routineBlockName?.trim().isNotEmpty ?? false,
    );
    final completedNamedBlock = workout.exercises.any(
      (exercise) =>
          exercise.completedSetCount > 0 &&
          _normalize(exercise.routineBlockName ?? '').trim() ==
              normalizedBlockName,
    );
    if (completedNamedBlock) return true;

    // Named blocks are authoritative for a combined day workout. Do not mark
    // its untouched blocks merely because another block has completed sets.
    if (hasNamedBlocks) continue;

    if (_normalize(workout.name).trim() == normalizedBlockName) return true;
    if (workout.routineDay != null && workout.routineOrder == blockOrder) {
      return true;
    }
  }

  return false;
}

String _normalize(String value) => value
    .toLowerCase()
    .replaceAll(RegExp('[áàäâ]'), 'a')
    .replaceAll(RegExp('[éèëê]'), 'e')
    .replaceAll(RegExp('[íìïî]'), 'i')
    .replaceAll(RegExp('[óòöô]'), 'o')
    .replaceAll(RegExp('[úùüû]'), 'u');

const Map<RoutineDay, List<String>> _weekdayWords = {
  RoutineDay.monday: ['lunes', 'monday', 'segunda', 'montag', 'lundi'],
  RoutineDay.tuesday: ['martes', 'tuesday', 'terca', 'dienstag', 'mardi'],
  RoutineDay.wednesday: [
    'miercoles',
    'wednesday',
    'quarta',
    'mittwoch',
    'mercredi',
  ],
  RoutineDay.thursday: ['jueves', 'thursday', 'quinta', 'donnerstag', 'jeudi'],
  RoutineDay.friday: ['viernes', 'friday', 'sexta', 'freitag', 'vendredi'],
  RoutineDay.saturday: ['sabado', 'saturday', 'samstag', 'samedi'],
  RoutineDay.sunday: ['domingo', 'sunday', 'sonntag', 'dimanche'],
};
