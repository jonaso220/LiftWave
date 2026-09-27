import '../data/custom_template_store.dart';
import '../data/workout_templates.dart';
import '../models/models.dart';
import '../utils/routine_days.dart';
import 'weekly_plan_service.dart';

enum TodaySuggestionKind {
  /// A workout is already running: offer to resume it.
  resume,

  /// The user assigned routine blocks to today's weekday.
  routineDay,

  /// The adaptive weekly plan has a session ready.
  planSession,

  /// The weekly target is already met.
  planCompleted,

  /// Nothing to suggest: let the user choose in the Train tab.
  choose,
}

/// The single workout Home offers to start, so the user never has to pick
/// between several start buttons.
class TodaySuggestion {
  final TodaySuggestionKind kind;
  final RoutineDay? day;
  final WorkoutTemplate? template;
  final int exerciseCount;

  const TodaySuggestion._(
    this.kind, {
    this.day,
    this.template,
    this.exerciseCount = 0,
  });

  /// Priority: a running workout, then today's own routine (unless all its
  /// blocks were already done this week), then the adaptive plan.
  static TodaySuggestion resolve({
    required bool sessionActive,
    required DateTime now,
    required List<CustomTemplate> routines,
    required List<Workout> workouts,
    WeeklyTrainingPlan? plan,
  }) {
    if (sessionActive) {
      return const TodaySuggestion._(TodaySuggestionKind.resume);
    }

    final today = RoutineDay.fromWeekday(now.weekday);
    final blocks = routines
        .where(
          (routine) =>
              routineDayForHistoryGrouping(
                storedDay: routine.routineDay,
                name: routine.name,
              ) ==
              today,
        )
        .toList();
    final pendingToday = blocks.any(
      (block) => !routineBlockWasCompleted(
        day: today,
        blockName: block.name,
        blockOrder:
            block.routineOrder ?? routineOrderFromName(block.name, fallback: 0),
        workouts: workouts,
        now: now,
      ),
    );
    if (pendingToday) {
      return TodaySuggestion._(
        TodaySuggestionKind.routineDay,
        day: today,
        exerciseCount: blocks.fold(
          0,
          (sum, block) => sum + block.exercises.length,
        ),
      );
    }

    if (plan != null) {
      if (plan.targetReached) {
        return const TodaySuggestion._(TodaySuggestionKind.planCompleted);
      }
      final next = plan.nextWorkout;
      if (next != null) {
        return TodaySuggestion._(
          TodaySuggestionKind.planSession,
          template: next,
          exerciseCount: next.exercises.length,
        );
      }
    }
    return const TodaySuggestion._(TodaySuggestionKind.choose);
  }
}
