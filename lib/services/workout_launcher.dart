import 'package:flutter/foundation.dart';

import '../data/workout_templates.dart';
import '../models/models.dart';

/// Lets one screen queue work to be picked up by [TrainScreen] the next time
/// it's shown. Used by Home: quick-start tiles queue a [WorkoutTemplate],
/// "Repetir último" queues a past [Workout].
class WorkoutLauncher extends ChangeNotifier {
  WorkoutLauncher._();
  static final WorkoutLauncher instance = WorkoutLauncher._();

  WorkoutTemplate? _pendingTemplate;
  Workout? _pendingWorkout;

  WorkoutTemplate? get pendingTemplate => _pendingTemplate;
  Workout? get pendingWorkout => _pendingWorkout;
  bool get hasPending => _pendingTemplate != null || _pendingWorkout != null;

  void queue(WorkoutTemplate template) {
    _pendingTemplate = template;
    _pendingWorkout = null;
    notifyListeners();
  }

  void queueWorkout(Workout workout) {
    _pendingWorkout = workout;
    _pendingTemplate = null;
    notifyListeners();
  }

  WorkoutTemplate? consumeTemplate() {
    final t = _pendingTemplate;
    _pendingTemplate = null;
    return t;
  }

  Workout? consumeWorkout() {
    final w = _pendingWorkout;
    _pendingWorkout = null;
    return w;
  }
}
