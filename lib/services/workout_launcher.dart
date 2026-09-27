import 'package:flutter/foundation.dart';

import '../data/workout_templates.dart';
import '../models/models.dart';
import '../utils/routine_days.dart';

/// Lets one screen queue work to be picked up by [TrainScreen] the next time
/// it's shown. Used by Home: "Hoy toca" queues today's routine day or the
/// adaptive session, "Repetir" queues a past [Workout].
class WorkoutLauncher extends ChangeNotifier {
  WorkoutLauncher._();
  static final WorkoutLauncher instance = WorkoutLauncher._();

  /// Whether [TrainScreen] currently has a workout in progress, so other tabs
  /// can offer to resume it instead of queueing a new one.
  final ValueNotifier<bool> sessionActive = ValueNotifier(false);

  WorkoutTemplate? _pendingTemplate;
  Workout? _pendingWorkout;
  RoutineDay? _pendingRoutineDay;
  final List<Exercise> _pendingExercises = [];

  WorkoutTemplate? get pendingTemplate => _pendingTemplate;
  Workout? get pendingWorkout => _pendingWorkout;
  bool get hasPending =>
      _pendingTemplate != null ||
      _pendingWorkout != null ||
      _pendingRoutineDay != null ||
      _pendingExercises.isNotEmpty;

  void queue(WorkoutTemplate template) {
    _pendingExercises.clear();
    _pendingTemplate = template;
    _pendingWorkout = null;
    _pendingRoutineDay = null;
    notifyListeners();
  }

  void queueWorkout(Workout workout) {
    _pendingExercises.clear();
    _pendingWorkout = workout;
    _pendingTemplate = null;
    _pendingRoutineDay = null;
    notifyListeners();
  }

  /// Queues every routine block assigned to [day], as "Empezar todo" does.
  void queueRoutineDay(RoutineDay day) {
    _pendingExercises.clear();
    _pendingRoutineDay = day;
    _pendingTemplate = null;
    _pendingWorkout = null;
    notifyListeners();
  }

  void queueExercise(Exercise exercise) {
    _pendingTemplate = null;
    _pendingWorkout = null;
    _pendingRoutineDay = null;
    _pendingExercises.add(exercise);
    notifyListeners();
  }

  List<Exercise> consumeExercises() {
    final exercises = List<Exercise>.of(_pendingExercises);
    _pendingExercises.clear();
    return exercises;
  }

  WorkoutTemplate? consumeTemplate() {
    final t = _pendingTemplate;
    _pendingTemplate = null;
    return t;
  }

  RoutineDay? consumeRoutineDay() {
    final day = _pendingRoutineDay;
    _pendingRoutineDay = null;
    return day;
  }

  Workout? consumeWorkout() {
    final w = _pendingWorkout;
    _pendingWorkout = null;
    return w;
  }
}
