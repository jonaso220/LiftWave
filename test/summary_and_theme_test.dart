import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:liftwave/models/models.dart';
import 'package:liftwave/models/session_models.dart';
import 'package:liftwave/services/theme_controller.dart';
import 'package:liftwave/services/workout_summary_service.dart';
import 'package:liftwave/theme/app_theme.dart';

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
