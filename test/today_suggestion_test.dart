import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:liftwave/data/custom_template_store.dart';
import 'package:liftwave/data/workout_templates.dart';
import 'package:liftwave/models/models.dart';
import 'package:liftwave/services/today_suggestion.dart';
import 'package:liftwave/services/weekly_plan_service.dart';
import 'package:liftwave/services/workout_launcher.dart';
import 'package:liftwave/utils/routine_days.dart';

void main() {
  // 2026-09-28 is a Monday.
  final monday = DateTime(2026, 9, 28, 18);

  const squat = TemplateExercise(
    name: 'Sentadilla',
    muscleGroup: 'Piernas',
    equipment: 'Barra',
    sets: 3,
    reps: 10,
    weight: 60,
  );

  CustomTemplate routine(String name, {String? day, int? order}) =>
      CustomTemplate(
        id: name,
        name: name,
        exercises: const [squat, squat],
        routineDay: day,
        routineOrder: order,
      );

  const nextSession = WorkoutTemplate(
    id: 'adaptive',
    name: 'Sesión adaptativa',
    subtitle: '',
    icon: Icons.auto_awesome,
    color: Colors.blue,
    exercises: [squat],
  );

  WeeklyTrainingPlan plan({int completed = 1, int target = 3}) =>
      WeeklyTrainingPlan(
        weekStart: DateTime(2026, 9, 28),
        targetWorkouts: target,
        completedWorkouts: completed,
        trainingTime: Duration.zero,
        completedSetsByMuscle: const {},
        volumeByMuscle: const {},
        nextWorkout: completed >= target ? null : nextSession,
        focusMuscles: const [],
      );

  Workout doneToday(String blockName) => Workout(
    id: 'w-$blockName',
    name: 'Rutina del Lunes',
    date: monday.subtract(const Duration(hours: 2)),
    duration: const Duration(minutes: 50),
    totalVolume: 1800,
    routineDay: 'monday',
    exercises: [
      WorkoutExercise(
        id: 'e1',
        name: 'Sentadilla',
        muscleGroup: 'Piernas',
        routineBlockName: blockName,
        sets: const [
          WorkoutSet(setNumber: 1, reps: 10, weight: 60, completed: true),
        ],
      ),
    ],
  );

  test('a running workout always wins', () {
    final result = TodaySuggestion.resolve(
      sessionActive: true,
      now: monday,
      routines: [routine('Pierna', day: 'monday')],
      workouts: const [],
      plan: plan(),
    );
    expect(result.kind, TodaySuggestionKind.resume);
  });

  test("today's routine blocks come before the adaptive plan", () {
    final result = TodaySuggestion.resolve(
      sessionActive: false,
      now: monday,
      routines: [
        routine('Pierna', day: 'monday', order: 1),
        routine('Core', day: 'monday', order: 2),
        routine('Pecho', day: 'tuesday'),
      ],
      workouts: const [],
      plan: plan(),
    );
    expect(result.kind, TodaySuggestionKind.routineDay);
    expect(result.day, RoutineDay.monday);
    expect(result.exerciseCount, 4);
  });

  test('routines named after the weekday count as that day', () {
    final result = TodaySuggestion.resolve(
      sessionActive: false,
      now: monday,
      routines: [routine('Lunes - pierna')],
      workouts: const [],
    );
    expect(result.kind, TodaySuggestionKind.routineDay);
  });

  test('falls back to the plan once every block of today is done', () {
    final result = TodaySuggestion.resolve(
      sessionActive: false,
      now: monday,
      routines: [routine('Pierna', day: 'monday', order: 1)],
      workouts: [doneToday('Pierna')],
      plan: plan(),
    );
    expect(result.kind, TodaySuggestionKind.planSession);
    expect(result.template, same(nextSession));
    expect(result.exerciseCount, 1);
  });

  test('keeps suggesting today while a block is still pending', () {
    final result = TodaySuggestion.resolve(
      sessionActive: false,
      now: monday,
      routines: [
        routine('Pierna', day: 'monday', order: 1),
        routine('Core', day: 'monday', order: 2),
      ],
      workouts: [doneToday('Pierna')],
      plan: plan(),
    );
    expect(result.kind, TodaySuggestionKind.routineDay);
  });

  test('reports a completed week and otherwise lets the user choose', () {
    expect(
      TodaySuggestion.resolve(
        sessionActive: false,
        now: monday,
        routines: const [],
        workouts: const [],
        plan: plan(completed: 3, target: 3),
      ).kind,
      TodaySuggestionKind.planCompleted,
    );
    expect(
      TodaySuggestion.resolve(
        sessionActive: false,
        now: monday,
        routines: const [],
        workouts: const [],
      ).kind,
      TodaySuggestionKind.choose,
    );
  });

  test('queueing a routine day replaces any other pending launch', () {
    final launcher = WorkoutLauncher.instance;
    launcher.queue(nextSession);
    launcher.queueRoutineDay(RoutineDay.monday);

    expect(launcher.consumeTemplate(), isNull);
    expect(launcher.consumeRoutineDay(), RoutineDay.monday);
    expect(launcher.hasPending, isFalse);

    launcher.queueRoutineDay(RoutineDay.friday);
    launcher.queue(nextSession);
    expect(launcher.consumeRoutineDay(), isNull);
    expect(launcher.consumeTemplate(), same(nextSession));
  });
}
