import 'package:firebase_auth/firebase_auth.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';

import '../data/custom_template_store.dart';
import '../data/training_preferences_store.dart';
import '../data/workout_store.dart';
import 'home_widget_service.dart';
import 'workout_reminder_sync.dart';

HomeWidgetLabels homeWidgetLabels(S l10n) => HomeWidgetLabels(
  today: l10n.widget_today,
  freeSession: l10n.train_freeSession,
  weekOfTarget: l10n.widget_weekOfTarget('{done}', '{target}'),
  weekOne: l10n.widget_weekOne,
  weekOther: l10n.widget_weekOther('{count}'),
);

/// Hands the home-screen widget the current routines, recent workouts and
/// weekly goal. Called at launch and whenever any of them changes.
Future<void> syncHomeWidget(S l10n) {
  // Signed out (or the account was just deleted): the stores may still
  // hold the last account's data for a moment, and none of it belongs on
  // the home screen any more.
  if (!_signedIn()) return HomeWidgetService.instance.clear();
  // Until the history is loaded there is nothing true to show; publishing
  // now would blank a widget that is already right.
  if (!WorkoutStore.instance.isLoaded) return Future.value();
  return HomeWidgetService.instance.publish(
    buildHomeWidgetSnapshot(
      labels: homeWidgetLabels(l10n),
      workouts: WorkoutStore.instance.workouts,
      routinesByWeekday: routinesByWeekday(
        CustomTemplateStore.instance.templates,
      ),
      weekTarget: TrainingPreferencesStore.instance.preferences?.daysPerWeek,
      now: DateTime.now(),
    ),
  );
}

bool _signedIn() {
  try {
    return FirebaseAuth.instance.currentUser != null;
  } catch (_) {
    // Firebase not initialized (tests).
    return false;
  }
}
