import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:liftwave/models/models.dart';
import 'package:liftwave/models/session_models.dart';
import 'package:liftwave/services/theme_controller.dart';
import 'package:liftwave/services/workout_summary_service.dart';
import 'package:liftwave/theme/app_theme.dart';
import 'package:liftwave/utils/calendar_days.dart';
import 'package:liftwave/utils/weight_units.dart';

void main() {
  Workout past(
    String name,
    DateTime date,
    List<WorkoutSet> sets, {
    String exercise = 'Press banca',
    String? routineDay,
    int? routineOrder,
  }) => Workout(
    id: '$name-${date.day}',
    name: name,
    date: date,
    duration: const Duration(minutes: 40),
    totalVolume: 0,
    routineDay: routineDay,
    routineOrder: routineOrder,
    exercises: [
      WorkoutExercise(
        id: exercise,
        name: exercise,
        muscleGroup: 'Pecho',
        sets: sets,
      ),
    ],
  );

  SessionExercise now(String name, List<SessionSet> sets) => SessionExercise(
    id: name,
    name: name,
    muscleGroup: 'Pecho',
    equipment: 'Barra',
    sets: sets,
  );

  group('personal records', () {
    final history = [
      past('Empuje', DateTime(2026, 9, 1), const [
        WorkoutSet(setNumber: 1, reps: 8, weight: 80, completed: true),
        WorkoutSet(setNumber: 2, reps: 1, weight: 100, completed: false),
      ]),
      past('Empuje', DateTime(2026, 9, 8), const [
        WorkoutSet(setNumber: 1, reps: 6, weight: 82.5, completed: true),
      ]),
    ];

    test('a heavier completed set than ever is a record', () {
      final records = WorkoutSummaryService.personalRecords(
        exercises: [
          now('Press banca', [
            SessionSet(reps: 5, weight: 85, completed: true),
            SessionSet(reps: 3, weight: 90),
          ]),
        ],
        history: history,
      );
      expect(records, hasLength(1));
      expect(records.single.weight, 85);
      // The uncompleted 100 kg attempt never counted.
      expect(records.single.previousBest, 82.5);
    });

    test('matching the best, or a first-ever exercise, is not a record', () {
      final records = WorkoutSummaryService.personalRecords(
        exercises: [
          now('press BANCA ', [
            SessionSet(reps: 5, weight: 82.5, completed: true),
          ]),
          now('Sentadilla', [
            SessionSet(reps: 5, weight: 120, completed: true),
          ]),
        ],
        history: history,
      );
      expect(records, isEmpty);
    });
  });

  group('records and unit conversion', () {
    tearDown(() => WeightUnits.instance.setForTesting(WeightUnit.kg));

    test('a load read back from pounds is a tie, not a record', () {
      WeightUnits.instance.setForTesting(WeightUnit.lb);
      // 60 kg is shown as 132.28 lb; typing that back stores 60.0012 kg.
      final typedBack = displayToKg(kgToDisplay(60));
      expect(typedBack, greaterThan(60));
      expect(beatsPersonalRecord(typedBack, 60), isFalse);

      final history = [
        past('Empuje', DateTime(2026, 9, 1), const [
          WorkoutSet(setNumber: 1, reps: 8, weight: 60, completed: true),
        ]),
      ];
      expect(
        WorkoutSummaryService.personalRecords(
          exercises: [
            now('Press banca', [
              SessionSet(reps: 8, weight: typedBack, completed: true),
            ]),
          ],
          history: history,
        ),
        isEmpty,
      );
      // The smallest real jump, half a pound, still counts.
      expect(beatsPersonalRecord(displayToKg(132.78), 60), isTrue);
    });
  });

  group('calendar days', () {
    test('differences ignore the time of day', () {
      expect(
        calendarDaysBetween(
          DateTime(2026, 3, 28, 23, 30),
          DateTime(2026, 3, 29, 0, 15),
        ),
        1,
      );
      expect(
        calendarDaysBetween(
          DateTime(2026, 3, 29, 6),
          DateTime(2026, 3, 29, 22),
        ),
        0,
      );
      // Across a month in which the clocks change in many countries.
      expect(
        calendarDaysBetween(DateTime(2026, 3, 1), DateTime(2026, 4, 1)),
        31,
      );
    });

    test('offsets land on midnight of the right date', () {
      expect(
        addCalendarDays(DateTime(2026, 3, 30, 18, 45), -1),
        DateTime(2026, 3, 29),
      );
      expect(addCalendarDays(DateTime(2026, 3, 1), -1), DateTime(2026, 2, 28));
      expect(addCalendarDays(DateTime(2026, 12, 31), 1), DateTime(2027, 1, 1));
    });

    test('a month grid starts on Monday and fills whole weeks', () {
      // November 2026 starts on a Sunday: six blanks, then 30 days.
      final november = monthGrid(DateTime(2026, 11, 12));
      expect(november.take(6), everyElement(isNull));
      expect(november[6], DateTime(2026, 11, 1));
      expect(november.whereType<DateTime>(), hasLength(30));
      expect(november.length % 7, 0);
      expect(november.length, 42);

      // February 2027 starts on a Monday and has 28 days: four exact weeks.
      final february = monthGrid(DateTime(2027, 2, 20));
      expect(february, hasLength(28));
      expect(february.first, DateTime(2027, 2, 1));
      expect(february.last, DateTime(2027, 2, 28));

      // A leap February.
      expect(
        monthGrid(DateTime(2028, 2, 1)).whereType<DateTime>(),
        hasLength(29),
      );
    });

    test('moving between months crosses the year', () {
      expect(startOfMonth(DateTime(2026, 11, 12, 20)), DateTime(2026, 11));
      expect(addMonths(DateTime(2026, 11, 12), 2), DateTime(2027, 1));
      expect(addMonths(DateTime(2026, 1, 31), -1), DateTime(2025, 12));
    });

    test('weeks start on Monday', () {
      // 2026-11-12 is a Thursday, 2026-11-15 a Sunday.
      expect(startOfWeek(DateTime(2026, 11, 12, 20)), DateTime(2026, 11, 9));
      expect(
        startOfWeek(DateTime(2026, 11, 15, 23, 59)),
        DateTime(2026, 11, 9),
      );
      expect(startOfWeek(DateTime(2026, 11, 9)), DateTime(2026, 11, 9));
    });
  });

  group('volume vs. last time', () {
    final history = [
      past('Rutina del lunes', DateTime(2026, 9, 14), const [
        WorkoutSet(setNumber: 1, reps: 10, weight: 50, completed: true),
      ], routineDay: 'monday'),
      past('Rutina del lunes', DateTime(2026, 9, 21), const [
        WorkoutSet(setNumber: 1, reps: 10, weight: 60, completed: true),
      ], routineDay: 'monday'),
      past('Tracción', DateTime(2026, 9, 22), const [
        WorkoutSet(setNumber: 1, reps: 10, weight: 90, completed: true),
      ]),
    ];

    test('compares with the latest session of the same routine', () {
      final result = WorkoutSummaryService.compareWithPrevious(
        workoutName: 'Rutina del lunes',
        routineDay: 'monday',
        routineOrder: null,
        volume: 750,
        history: history,
      );
      expect(result!.delta, 150);
      expect(result.previousDate, DateTime(2026, 9, 21));
    });

    test('routines without a day are only compared by name', () {
      final unassigned = [
        past('Empuje', DateTime(2026, 9, 14), const [
          WorkoutSet(setNumber: 1, reps: 10, weight: 50, completed: true),
        ], routineDay: 'none'),
      ];
      expect(
        WorkoutSummaryService.compareWithPrevious(
          workoutName: 'Tracción',
          routineDay: 'none',
          routineOrder: null,
          volume: 900,
          history: unassigned,
        ),
        isNull,
      );
      expect(
        WorkoutSummaryService.compareWithPrevious(
          workoutName: 'Empuje',
          routineDay: 'none',
          routineOrder: null,
          volume: 700,
          history: unassigned,
        )!.delta,
        200,
      );
    });

    test('free sessions and new workouts have no comparison', () {
      expect(
        WorkoutSummaryService.compareWithPrevious(
          workoutName: null,
          routineDay: null,
          routineOrder: null,
          volume: 500,
          history: history,
        ),
        isNull,
      );
      expect(
        WorkoutSummaryService.compareWithPrevious(
          workoutName: 'Piernas',
          routineDay: null,
          routineOrder: null,
          volume: 500,
          history: history,
        ),
        isNull,
      );
    });
  });

  group('theme', () {
    tearDown(() => AppColors.usePalette(AppPalette.dark));

    test('mode and system brightness pick the palette', () {
      expect(
        ThemeController.paletteFor(ThemeMode.dark, Brightness.light),
        same(AppPalette.dark),
      );
      expect(
        ThemeController.paletteFor(ThemeMode.light, Brightness.dark),
        same(AppPalette.light),
      );
      expect(
        ThemeController.paletteFor(ThemeMode.system, Brightness.light),
        same(AppPalette.light),
      );
      expect(
        ThemeController.paletteFor(ThemeMode.system, Brightness.dark),
        same(AppPalette.dark),
      );
    });

    test('switching the palette changes surfaces and text, not the brand', () {
      final darkCard = AppColors.bgCard;
      AppColors.usePalette(AppPalette.light);
      expect(AppColors.bgCard, isNot(darkCard));
      expect(AppColors.brightness, Brightness.light);
      expect(AppColors.primary, const Color(0xFF6C63FF));
    });

    test('muscle colours darken to readable text on the light theme', () {
      double contrast(Color a, Color b) {
        final la = a.computeLuminance(), lb = b.computeLuminance();
        final hi = la > lb ? la : lb, lo = la > lb ? lb : la;
        return (hi + 0.05) / (lo + 0.05);
      }

      const muscles = [
        AppColors.chest,
        AppColors.back,
        AppColors.legs,
        AppColors.shoulders,
        AppColors.arms,
        AppColors.core,
        AppColors.crossfit,
      ];

      // Dark theme: the brand tones are used as they are.
      for (final color in muscles) {
        expect(AppColors.asText(color), color);
      }

      AppColors.usePalette(AppPalette.light);
      for (final color in muscles) {
        final text = AppColors.asText(color);
        // On the card, and on the chip's own 15 % tint of the same colour.
        final tint = Color.alphaBlend(
          color.withValues(alpha: 0.15),
          AppPalette.light.bgCard,
        );
        expect(contrast(text, AppPalette.light.bgCard), greaterThan(4.5));
        expect(contrast(text, tint), greaterThan(4.5));
      }
    });

    test('light text keeps readable contrast on light surfaces', () {
      double contrast(Color a, Color b) {
        final la = a.computeLuminance(), lb = b.computeLuminance();
        final hi = la > lb ? la : lb, lo = la > lb ? lb : la;
        return (hi + 0.05) / (lo + 0.05);
      }

      const p = AppPalette.light;
      expect(contrast(p.textPrimary, p.bgCard), greaterThan(7));
      expect(contrast(p.textSecondary, p.bgCard), greaterThan(4.5));
      expect(contrast(p.textMuted, p.bgCard), greaterThan(4.5));
      expect(contrast(p.accent, p.bgCard), greaterThan(3));
      expect(contrast(p.primaryLight, p.bgCard), greaterThan(4.5));
    });
  });
}
