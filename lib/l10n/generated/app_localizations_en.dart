// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class SEn extends S {
  SEn([String locale = 'en']) : super(locale);

  @override
  String get common_cancel => 'Cancel';

  @override
  String get common_delete => 'Delete';

  @override
  String get common_save => 'Save';

  @override
  String get common_or => 'or';

  @override
  String get common_today => 'Today';

  @override
  String get common_yesterday => 'Yesterday';

  @override
  String common_daysAgo(int count) {
    return '$count days ago';
  }

  @override
  String get common_exercises => 'Exercises';

  @override
  String get common_sets => 'Sets';

  @override
  String get common_volume => 'Volume';

  @override
  String get common_reps => 'Reps';

  @override
  String get common_weight => 'Weight';

  @override
  String get common_duration => 'Duration';

  @override
  String get common_bodyweight => 'Bodyweight';

  @override
  String get common_custom => 'CUSTOM';

  @override
  String get common_discardChangesTitle => 'Discard changes?';

  @override
  String get common_discardChangesBody =>
      'The changes you made will not be saved.';

  @override
  String get common_keepEditing => 'Keep editing';

  @override
  String get common_discard => 'Discard';

  @override
  String get muscle_all => 'All';

  @override
  String get muscle_chest => 'Chest';

  @override
  String get muscle_back => 'Back';

  @override
  String get muscle_legs => 'Legs';

  @override
  String get muscle_shoulders => 'Shoulders';

  @override
  String get muscle_arms => 'Arms';

  @override
  String get muscle_core => 'Core';

  @override
  String get muscle_crossfit => 'CrossFit';

  @override
  String get equipment_all => 'All';

  @override
  String get equipment_barbell => 'Barbell';

  @override
  String get equipment_dumbbells => 'Dumbbells';

  @override
  String get equipment_machine => 'Machine';

  @override
  String get equipment_cable => 'Cable';

  @override
  String get equipment_bodyweight => 'Bodyweight';

  @override
  String get equipment_pullupBar => 'Pull-up Bar';

  @override
  String get equipment_noEquipment => 'No Equipment';

  @override
  String get equipment_parallelBars => 'Parallel Bars';

  @override
  String get equipment_rings => 'Rings';

  @override
  String get equipment_box => 'Plyo Box';

  @override
  String get equipment_rope => 'Rope';

  @override
  String get equipment_ball => 'Ball';

  @override
  String get equipment_kettlebell => 'Kettlebell';

  @override
  String get difficulty_beginner => 'Beginner';

  @override
  String get difficulty_intermediate => 'Intermediate';

  @override
  String get difficulty_advanced => 'Advanced';

  @override
  String get nav_home => 'Home';

  @override
  String get nav_train => 'Train';

  @override
  String get nav_progress => 'Progress';

  @override
  String get nav_profile => 'Profile';

  @override
  String get home_todayTitle => 'TODAY\'S WORKOUT';

  @override
  String get home_inProgressTitle => 'WORKOUT IN PROGRESS';

  @override
  String get home_continueWorkout => 'Resume workout';

  @override
  String get home_chooseAnother => 'Choose another workout';

  @override
  String get login_tagline => 'Your personal fitness app';

  @override
  String get login_continueGoogle => 'Continue with Google';

  @override
  String get login_continueApple => 'Continue with Apple';

  @override
  String get login_continueEmail => 'Continue with email';

  @override
  String get login_continueGuest => 'Continue without an account';

  @override
  String get guest_name => 'Guest';

  @override
  String get guest_saveProgressTitle => 'Save your progress';

  @override
  String get guest_saveProgressBody =>
      'You\'re using LiftWave as a guest. Create a free account so you don\'t lose your workouts if you change phones or reinstall the app.';

  @override
  String get guest_createAccount => 'Create account';

  @override
  String get guest_notNow => 'Not now';

  @override
  String get guest_createAccountSubtitle =>
      'Create an account so you don\'t lose your progress';

  @override
  String get guest_accountCreated => 'Account created. Your workouts are safe.';

  @override
  String get guest_existingAccountTitle => 'This account already exists';

  @override
  String get guest_existingAccountBody =>
      'If you sign in with it, the workouts you logged as a guest won\'t be moved to that account.';

  @override
  String get guest_signInAnyway => 'Sign in anyway';

  @override
  String get guest_leave => 'Leave guest mode';

  @override
  String get guest_leaveBody =>
      'Since you don\'t have an account, your workouts and data will be deleted. This can\'t be undone.';

  @override
  String train_reasonIncreaseLoad(int reps, String weight, int min, int max) {
    return 'You did $reps reps at $weight, the top of your range ($min–$max). Time to add weight.';
  }

  @override
  String train_reasonAddRep(int reps, String weight) {
    return 'You did $reps reps at $weight. Add one rep before adding weight.';
  }

  @override
  String train_reasonConsolidate(int reps, String weight, int min, int max) {
    return 'You did $reps reps, below your range ($min–$max). Stay at $weight until you reach $min.';
  }

  @override
  String train_reasonBodyweight(int reps) {
    return 'You did $reps reps. Try one more.';
  }

  @override
  String get login_legalPrefix => 'By continuing, you agree to our ';

  @override
  String get login_termsLink => 'terms of service';

  @override
  String get login_legalAnd => 'and';

  @override
  String get login_privacyLink => 'privacy policy';

  @override
  String get login_googleError => 'Could not sign in with Google.';

  @override
  String get login_appleError => 'Could not sign in with Apple.';

  @override
  String get emailAuth_titleLogin => 'Sign In';

  @override
  String get emailAuth_titleRegister => 'Create Account';

  @override
  String get emailAuth_greetingLogin => 'Good to see you';

  @override
  String get emailAuth_greetingRegister => 'Welcome!';

  @override
  String get emailAuth_subtitleLogin => 'Sign in with your email and password';

  @override
  String get emailAuth_subtitleRegister => 'Create your account to get started';

  @override
  String get emailAuth_nameLabel => 'Name';

  @override
  String get emailAuth_nameHint => 'Your name';

  @override
  String get emailAuth_nameError => 'Enter your name';

  @override
  String get emailAuth_emailLabel => 'Email';

  @override
  String get emailAuth_emailHint => 'email@example.com';

  @override
  String get emailAuth_emailErrorEmpty => 'Enter your email';

  @override
  String get emailAuth_emailErrorInvalid => 'Invalid email';

  @override
  String get emailAuth_passwordLabel => 'Password';

  @override
  String get emailAuth_passwordHintLogin => 'Your password';

  @override
  String get emailAuth_passwordHintRegister => 'At least 6 characters';

  @override
  String get emailAuth_passwordErrorEmpty => 'Enter your password';

  @override
  String get emailAuth_passwordErrorShort => 'At least 6 characters';

  @override
  String get emailAuth_forgotPassword => 'Forgot your password?';

  @override
  String get emailAuth_hasAccount => 'Already have an account? ';

  @override
  String get emailAuth_noAccount => 'Don\'t have an account? ';

  @override
  String get emailAuth_loginLink => 'Sign in';

  @override
  String get emailAuth_registerLink => 'Sign up';

  @override
  String get emailAuth_unexpectedError => 'Unexpected error. Please try again.';

  @override
  String get emailAuth_emailFirst => 'Enter your email first.';

  @override
  String emailAuth_resetSent(String email) {
    return 'Recovery email sent to $email';
  }

  @override
  String get emailAuth_resetError => 'Could not send recovery email.';

  @override
  String get authError_userNotFound => 'No account exists with that email.';

  @override
  String get authError_wrongPassword => 'Incorrect password.';

  @override
  String get authError_emailAlreadyInUse => 'This email is already registered.';

  @override
  String get authError_weakPassword =>
      'Password is too weak (at least 6 characters).';

  @override
  String get authError_invalidEmail => 'The email is not valid.';

  @override
  String get authError_tooManyRequests =>
      'Too many attempts. Wait a few minutes.';

  @override
  String get authError_networkFailed => 'No internet connection.';

  @override
  String get authError_default => 'Sign in error. Please try again.';

  @override
  String home_greetingMorning(String name) {
    return 'Good morning, $name!';
  }

  @override
  String get home_greetingMorningNoName => 'Good morning!';

  @override
  String home_greetingAfternoon(String name) {
    return 'Good afternoon, $name!';
  }

  @override
  String get home_greetingAfternoonNoName => 'Good afternoon!';

  @override
  String home_greetingEvening(String name) {
    return 'Good evening, $name!';
  }

  @override
  String get home_greetingEveningNoName => 'Good evening!';

  @override
  String get home_weekMotivationZero =>
      'You haven\'t trained this week yet. Start today!';

  @override
  String get home_weekMotivationOne =>
      'You have 1 workout this week. Keep it up!';

  @override
  String home_weekMotivationMany(int count) {
    return 'You have $count workouts this week. Keep it up!';
  }

  @override
  String get home_thisWeek => 'This week';

  @override
  String get home_weekTime => 'Week time';

  @override
  String get home_weekVolume => 'Week volume';

  @override
  String get restTimer_title => 'Rest';

  @override
  String get restTimer_openControls => 'Open rest timer controls';

  @override
  String restTimer_addSeconds(int seconds) {
    return 'Add $seconds seconds';
  }

  @override
  String restTimer_subtractSeconds(int seconds) {
    return 'Subtract $seconds seconds';
  }

  @override
  String get restTimer_pause => 'Pause timer';

  @override
  String get restTimer_resume => 'Resume timer';

  @override
  String get restTimer_dismiss => 'Close timer';

  @override
  String get restTimer_reset => 'Reset timer';

  @override
  String restTimer_preset(String time) {
    return 'Use a $time rest';
  }

  @override
  String get restTimer_resting => 'RESTING';

  @override
  String get restTimer_done => 'DONE!';

  @override
  String get home_lastWorkout => 'Last workout';

  @override
  String get home_repeatWorkout => 'Repeat workout';

  @override
  String get editWorkout_title => 'Edit workout';

  @override
  String get editWorkout_saved => 'Workout updated';

  @override
  String get detail_deleteWorkout => 'Delete workout';

  @override
  String get detail_deleteWorkoutConfirm =>
      'It will be removed from your history. This can\'t be undone.';

  @override
  String get detail_workoutDeleted => 'Workout deleted';

  @override
  String get home_viewAll => 'View all';

  @override
  String get home_goToTrain => 'Go to Train →';

  @override
  String get home_achievements => 'Achievements';

  @override
  String get home_noAchievements => 'Complete workouts to unlock achievements';

  @override
  String get home_exerciseLibrary => 'Exercise library';

  @override
  String get profile_proActive => 'Active subscription';

  @override
  String get profile_freePlan => 'Free plan';

  @override
  String get profile_upgradePro => 'Upgrade to PRO';

  @override
  String get profile_restorePurchases => 'Restore purchases';

  @override
  String get profile_signOut => 'Sign out';

  @override
  String get profile_deleteAccount => 'Delete account';

  @override
  String get progressScreen_deleteMeasurementTitle => 'Delete record?';

  @override
  String get progressScreen_deleteMeasurementBody =>
      'The record and its photo will be deleted. This can\'t be undone.';

  @override
  String get profile_signOutConfirm =>
      'Sign out? Your data stays saved in your account.';

  @override
  String get profile_deleteSubscriptionNote =>
      'Deleting your account doesn\'t cancel your subscription. Cancel it first in the store.';

  @override
  String get profile_manageSubscription => 'Manage subscription';

  @override
  String get profile_help => 'Help & support';

  @override
  String get rest_alertTitle => 'Rest finished';

  @override
  String get rest_alertBody => 'Time for your next set.';

  @override
  String get rest_alertChannel => 'Rest timer';

  @override
  String get profile_restAlert => 'Alert when rest ends';

  @override
  String get profile_restAlertSubtitle =>
      'Notification with sound when the app is not on screen';

  @override
  String get profile_restAlertExact => 'Allow exact alarms';

  @override
  String get profile_restAlertExactSubtitle =>
      'Without this permission, Android may delay the alert';

  @override
  String get editWorkout_date => 'Date and time';

  @override
  String get editWorkout_duration => 'Duration (min)';

  @override
  String get history_searchHint => 'Search workout or exercise';

  @override
  String get history_noResults => 'No results';

  @override
  String get history_calendar => 'Calendar';

  @override
  String get progress_oneRm => 'Est. 1RM';

  @override
  String get progress_recordsTitle => 'Records';

  @override
  String get progress_bestLift => 'Heaviest lift';

  @override
  String get progress_bestOneRm => 'Best estimated 1RM';

  @override
  String get setType_title => 'Set type';

  @override
  String get setType_normal => 'Normal';

  @override
  String get setType_warmup => 'Warm-up';

  @override
  String get setType_drop => 'Drop set';

  @override
  String get setType_failure => 'To failure';

  @override
  String get setType_warmupHint => 'Doesn\'t count toward volume or records';

  @override
  String get setType_warmupShort => 'W';

  @override
  String get setType_dropShort => 'D';

  @override
  String get setType_failureShort => 'F';

  @override
  String get plates_title => 'Plate calculator';

  @override
  String get plates_target => 'Total weight';

  @override
  String get plates_bar => 'Bar';

  @override
  String get plates_perSide => 'Per side';

  @override
  String get plates_onlyBar => 'Just the bar';

  @override
  String get plates_belowBar => 'The weight is less than the bar';

  @override
  String plates_missing(String amount) {
    return '$amount can\'t be loaded with these plates';
  }

  @override
  String get train_secondsHeader => 'SEC';

  @override
  String get train_secondsShort => 's';

  @override
  String get train_startHold => 'Start';

  @override
  String get train_measureByTime => 'Track by time';

  @override
  String get train_measureByReps => 'Track by reps';

  @override
  String get hold_running => 'IN PROGRESS';

  @override
  String get hold_alertTitle => 'Time\'s up';

  @override
  String get hold_alertBody => 'Set complete.';

  @override
  String train_reasonHold(int seconds) {
    return 'You held $seconds s. Try adding 5 s.';
  }

  @override
  String get superset_label => 'Superset';

  @override
  String get superset_linkNext => 'Superset with next';

  @override
  String get superset_unlink => 'Remove from superset';

  @override
  String get superset_hint =>
      'Alternate the sets; rest starts when the round is done.';

  @override
  String get reminders_title => 'Workout reminders';

  @override
  String get reminders_off => 'Off';

  @override
  String get reminders_enable => 'Remind me to train';

  @override
  String get reminders_enableSubtitle =>
      'A notification on the days you choose';

  @override
  String get reminders_days => 'Days';

  @override
  String get reminders_time => 'Time';

  @override
  String get reminders_notificationTitle => 'Time to train';

  @override
  String get reminders_notificationBody =>
      'Today\'s workout is waiting for you.';

  @override
  String reminders_notificationRoutine(String routine) {
    return 'On today: $routine';
  }

  @override
  String get reminders_permissionDenied =>
      'Turn on notifications for LiftWave in the system settings to get reminders.';

  @override
  String health_sync(String store) {
    return 'Sync with $store';
  }

  @override
  String health_syncSubtitle(String store) {
    return 'Saves the workouts and body weight you log to $store';
  }

  @override
  String health_enabled(String store) {
    return 'Done. Your next workouts will be saved to $store.';
  }

  @override
  String health_denied(String store) {
    return 'Could not turn it on. Check LiftWave\'s permissions in $store.';
  }

  @override
  String get health_needsInstall =>
      'Install or update Health Connect to turn on the sync.';

  @override
  String get health_install => 'Install';

  @override
  String health_unsupported(String store) {
    return '$store is not available on this device.';
  }

  @override
  String get profile_purchasesRestored => 'Purchases restored successfully';

  @override
  String get profile_noPurchasesFound => 'No previous purchases found';

  @override
  String get restore_connectionError =>
      'No connection. Check your internet and try again.';

  @override
  String get restore_unknownError => 'Could not restore. Try again.';

  @override
  String get profile_deleteTitle => 'Delete account';

  @override
  String get profile_deleteConfirm =>
      'Are you sure? This action is irreversible and all your data will be deleted.';

  @override
  String get profile_deleteReauthError =>
      'To delete your account, sign out, sign back in, and try again.';

  @override
  String get profile_trainingPreferences => 'Training preferences';

  @override
  String get profile_trainingPreferencesSubtitle =>
      'Goal, experience, days, and equipment';

  @override
  String get profile_appearance => 'Appearance';

  @override
  String get appearance_system => 'Automatic (match phone)';

  @override
  String get appearance_light => 'Light';

  @override
  String get appearance_dark => 'Dark';

  @override
  String get onboarding_title => 'Personalize your training';

  @override
  String get onboarding_goalTitle => 'What is your main goal?';

  @override
  String get onboarding_goalSubtitle =>
      'We will use this to tailor your next recommendations.';

  @override
  String get onboarding_goalMuscle => 'Build muscle';

  @override
  String get onboarding_goalStrength => 'Get stronger';

  @override
  String get onboarding_goalFatLoss => 'Lose fat';

  @override
  String get onboarding_goalFitness => 'Improve my fitness';

  @override
  String get onboarding_experienceTitle => 'What is your experience level?';

  @override
  String get onboarding_experienceSubtitle =>
      'We will adjust volume and progression to your level.';

  @override
  String get onboarding_experienceBeginner => 'Beginner';

  @override
  String get onboarding_experienceBeginnerHint => 'Less than 1 year';

  @override
  String get onboarding_experienceIntermediate => 'Intermediate';

  @override
  String get onboarding_experienceIntermediateHint => 'Between 1 and 3 years';

  @override
  String get onboarding_experienceAdvanced => 'Advanced';

  @override
  String get onboarding_experienceAdvancedHint => 'More than 3 years';

  @override
  String get onboarding_daysTitle => 'How many days can you train?';

  @override
  String get onboarding_daysSubtitle => 'Choose a schedule you can maintain.';

  @override
  String onboarding_daysSelected(int count) {
    return '$count days per week';
  }

  @override
  String get onboarding_equipmentTitle => 'What equipment do you have?';

  @override
  String get onboarding_equipmentSubtitle =>
      'Select everything you can regularly use.';

  @override
  String get onboarding_continue => 'Continue';

  @override
  String get onboarding_back => 'Back';

  @override
  String get onboarding_finish => 'Save and start';

  @override
  String get onboarding_skip => 'Not now';

  @override
  String get onboarding_saved => 'Preferences saved';

  @override
  String get weeklyPlan_title => 'Weekly plan';

  @override
  String weeklyPlan_sessions(int done, int total) {
    return '$done/$total sessions';
  }

  @override
  String get weeklyPlan_adherence => 'Adherence';

  @override
  String get weeklyPlan_remaining => 'Remaining';

  @override
  String get weeklyPlan_completedSets => 'Sets';

  @override
  String get weeklyPlan_muscleBalance => 'SETS BY MUSCLE';

  @override
  String get weeklyPlan_completed => 'Weekly goal completed. Great work.';

  @override
  String get weeklyPlan_nextSession => 'NEXT SESSION';

  @override
  String weeklyPlan_exerciseCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count exercises',
      one: '1 exercise',
    );
    return '$_temp0';
  }

  @override
  String get weeklyPlan_start => 'Start';

  @override
  String get weeklyPlan_noCompatible =>
      'There are not enough exercises compatible with your equipment.';

  @override
  String get weeklyPlan_adjustEquipment => 'Adjust';

  @override
  String get weeklyPlan_setupTitle => 'Set up your plan';

  @override
  String get weeklyPlan_setupSubtitle =>
      'Complete your preferences to receive an adapted session every week.';

  @override
  String get weeklyPlan_configure => 'Configure';

  @override
  String get weeklyPlan_adaptiveName => 'Adaptive session';

  @override
  String get train_title => 'Train';

  @override
  String get train_readyTitle => 'Ready to train?';

  @override
  String get train_readySubtitle =>
      'Start a free session or choose a preset routine.';

  @override
  String get train_freeSession => 'Free session';

  @override
  String get train_freeWorkout => 'Free workout';

  @override
  String get train_myRoutines => 'My routines';

  @override
  String get train_predefinedRoutines => 'Preset routines';

  @override
  String get train_inProgress => 'In progress';

  @override
  String get train_readyToStart => 'Ready to start';

  @override
  String get train_startSession => 'Start';

  @override
  String get train_resumeTitle => 'Resume workout?';

  @override
  String train_resumeBody(String name) {
    return 'You have an unfinished \"$name\" workout. Continue where you left off?';
  }

  @override
  String get train_resumeContinue => 'Continue';

  @override
  String get train_resumeDiscard => 'Discard';

  @override
  String get train_cancelWorkout => 'Discard workout?';

  @override
  String get train_cancelConfirm =>
      'The sets logged in this session will be lost.';

  @override
  String get train_continue => 'Keep training';

  @override
  String get train_addExerciseFirst =>
      'Add at least one exercise before finishing.';

  @override
  String get train_completeSetFirst =>
      'Complete at least one set before finishing.';

  @override
  String get train_workoutCompleted => 'Workout completed!';

  @override
  String get train_completedSets => 'Completed sets';

  @override
  String get train_totalVolume => 'Total volume';

  @override
  String get train_saveAsRoutine => 'Save as routine';

  @override
  String get train_finish => 'Finish';

  @override
  String get train_newAchievement => 'New achievement!';

  @override
  String get train_great => 'Great!';

  @override
  String get train_routineNameHint => 'Routine name';

  @override
  String train_routineSaved(String name) {
    return 'Routine \"$name\" saved';
  }

  @override
  String get train_deleteRoutine => 'Delete routine';

  @override
  String train_deleteRoutineConfirm(String name) {
    return 'Delete \"$name\"?';
  }

  @override
  String get train_noExercisesYet => 'No exercises yet';

  @override
  String get train_addExerciseHint =>
      'Tap the button below to add the first exercise.';

  @override
  String get train_addExercise => 'Add exercise';

  @override
  String get train_exercise => 'Exercise';

  @override
  String train_exerciseCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count exercises',
      one: '1 exercise',
    );
    return '$_temp0';
  }

  @override
  String train_startTemplate(String name) {
    return 'Start $name';
  }

  @override
  String train_setsProgress(int done, int total) {
    return '$done/$total sets ✓';
  }

  @override
  String get train_viewProgress => 'View progress';

  @override
  String get train_deleteExercise => 'Delete exercise';

  @override
  String train_deleteExerciseConfirm(String name) {
    return 'Delete \"$name\"? Completed sets will be lost.';
  }

  @override
  String get train_notesHint => 'Notes (optional)';

  @override
  String get train_setHeader => 'SET';

  @override
  String get train_repsHeader => 'REPS';

  @override
  String get train_weightHeader => 'WEIGHT';

  @override
  String get train_addSet => 'Add set';

  @override
  String get train_nextSuggestion => 'Next suggested load';

  @override
  String get train_applySuggestion => 'Apply';

  @override
  String get train_abbreviationExercises => 'ex.';

  @override
  String get train_defaultRoutineName => 'My routine';

  @override
  String get train_createRoutine => 'Create routine';

  @override
  String get train_editRoutine => 'Edit routine';

  @override
  String train_routineUpdated(String name) {
    return 'Routine \"$name\" updated';
  }

  @override
  String get train_addFirstExercise => 'Add first exercise';

  @override
  String get train_addFirstExerciseHint =>
      'Tap here or “Add exercise” to add the first one.';

  @override
  String get train_removeSet => 'Remove set';

  @override
  String get train_routinesHint =>
      'A day can hold one or more routines. Starting the day runs them all, in order.';

  @override
  String get train_firstRoutineTitle => 'Create your first routine';

  @override
  String get train_firstRoutineBody =>
      'Pick the exercises and give it a weekday: on that day it shows up on Home, ready to start.';

  @override
  String get train_freeSessionHint =>
      'No plan? Start a free session and add exercises as you go.';

  @override
  String get profile_keepScreenOn => 'Keep screen on while training';

  @override
  String get profile_keepScreenOnSubtitle =>
      'Stops the phone from locking between sets';

  @override
  String get profile_weightUnit => 'Weight unit';

  @override
  String get weightUnit_kg => 'Kilograms (kg)';

  @override
  String get weightUnit_lb => 'Pounds (lb)';

  @override
  String get train_repShort => 'rep';

  @override
  String get rest_label => 'Rest';

  @override
  String get rest_forExercise => 'Rest for this exercise';

  @override
  String get rest_default => 'Default';

  @override
  String get rest_defaultHint => 'Uses the time chosen on the rest timer';

  @override
  String get train_newRecords => 'New records';

  @override
  String train_recordLine(String weight, String previous) {
    return '$weight (was $previous)';
  }

  @override
  String train_volumeUp(String kg) {
    return '+$kg volume vs. last time';
  }

  @override
  String train_volumeDown(String kg) {
    return '$kg less volume than last time';
  }

  @override
  String get train_volumeSame => 'Same volume as last time';

  @override
  String get train_discardWorkout => 'Discard';

  @override
  String get train_previousHeader => 'PREVIOUS';

  @override
  String get train_usePrevious => 'Copy previous values';

  @override
  String get train_removeCompletedSetTitle => 'Remove completed set?';

  @override
  String train_removeCompletedSetBody(int setNumber) {
    return 'Set $setNumber is completed and will no longer count toward your workout.';
  }

  @override
  String get train_createRoutineHint =>
      'Choose the exercises and prepare it now to train whenever you want.';

  @override
  String get train_routineNameRequired => 'Enter a name for the routine.';

  @override
  String train_addRoutineForDay(String day) {
    return 'Add another routine for $day';
  }

  @override
  String get train_trainingDay => 'Training day';

  @override
  String get train_noAssignedDay => 'No assigned day';

  @override
  String get train_trainingDayHint =>
      'Group it by day to keep the complete routine together.';

  @override
  String get train_organizeRoutine => 'Organize routine';

  @override
  String train_blockCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count blocks',
      one: '1 block',
    );
    return '$_temp0';
  }

  @override
  String get train_noRoutinesForDay => 'There are no blocks for this day yet.';

  @override
  String get train_reorderBlocksHint => 'Press and drag to change the order.';

  @override
  String get train_startCompleteRoutine => 'Start complete routine';

  @override
  String train_routineForDay(String day) {
    return '$day routine';
  }

  @override
  String get train_bodyweightLabel => 'Bodyweight';

  @override
  String get train_chooseWeight => 'Choose weight';

  @override
  String get picker_title => 'Select exercise';

  @override
  String get picker_searchHint => 'Search exercise...';

  @override
  String get picker_createManual => 'Create custom exercise';

  @override
  String get picker_createManualSubtitle => 'Name, muscle group, and equipment';

  @override
  String get picker_createTitle => 'Create exercise';

  @override
  String get picker_nameLabel => 'Name';

  @override
  String get picker_nameHint => 'E.g.: Hammer Curl';

  @override
  String get picker_muscleGroupLabel => 'Muscle group';

  @override
  String get picker_equipmentLabel => 'Equipment';

  @override
  String get picker_addExercise => 'Add exercise';

  @override
  String get exercises_title => 'Exercises';

  @override
  String get exercises_searchHint => 'Search exercises...';

  @override
  String get exercises_muscleFilter => 'Muscle';

  @override
  String get exercises_equipmentFilter => 'Equipment';

  @override
  String exercises_countLabel(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count exercises',
      one: '$count exercise',
    );
    return '$_temp0';
  }

  @override
  String get exercises_descriptionUnavailable =>
      'Detailed instructions are not available in this language yet.';

  @override
  String get exercises_clearFilters => 'Clear filters';

  @override
  String get exercises_noResults => 'No results';

  @override
  String get exercises_noResultsHint => 'Try different filters or search terms';

  @override
  String get exercises_deleteTitle => 'Delete exercise';

  @override
  String exercises_deleteConfirm(String name) {
    return 'Delete \"$name\" from your exercise list?';
  }

  @override
  String get exercises_muscleGroupLabel => 'Muscle group';

  @override
  String get exercises_materialLabel => 'Equipment';

  @override
  String get exercises_executionTitle => 'Execution';

  @override
  String get exercises_secondaryMuscles => 'Secondary muscles';

  @override
  String get exercises_benefits => 'Benefits';

  @override
  String get exercises_viewProgress => 'View progress';

  @override
  String get exercises_addToWorkout => 'Add to workout';

  @override
  String get progress_maxWeight => 'Max weight';

  @override
  String get progress_volumeLabel => 'Volume';

  @override
  String get progress_noData => 'No data for this exercise';

  @override
  String get progress_needMoreSessions =>
      'At least 2 sessions are needed to view progress';

  @override
  String get progress_lastVolume => 'Last volume';

  @override
  String get progress_lastWeight => 'Last weight';

  @override
  String get progress_best => 'Best';

  @override
  String get progress_progressLabel => 'Progress';

  @override
  String get progress_historyTitle => 'History';

  @override
  String get history_title => 'History';

  @override
  String get history_exportCsv => 'Export CSV';

  @override
  String get history_allWorkouts => 'All workouts';

  @override
  String get history_noWorkoutsYet => 'No workouts yet';

  @override
  String get history_noWorkoutsSubtitle =>
      'Complete your first workout in the Train tab and it will appear here.';

  @override
  String get history_weeklySummary => 'Weekly summary';

  @override
  String get history_workouts => 'Workouts';

  @override
  String get history_total => 'Total';

  @override
  String get history_volumeKg => 'Volume';

  @override
  String get history_routinesByDay => 'Routines by day';

  @override
  String history_sessionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sessions',
      one: '1 session',
    );
    return '$_temp0';
  }

  @override
  String history_dayRoutineTitle(String day) {
    return '$day workouts';
  }

  @override
  String get history_dayRoutineHint =>
      'Blocks from the same day appear together and in order.';

  @override
  String get history_dayMon => 'M';

  @override
  String get history_dayTue => 'T';

  @override
  String get history_dayWed => 'W';

  @override
  String get history_dayThu => 'T';

  @override
  String get history_dayFri => 'F';

  @override
  String get history_daySat => 'S';

  @override
  String get history_daySun => 'S';

  @override
  String get history_exercisesPerformed => 'Exercises performed';

  @override
  String history_setsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sets',
      one: '1 set',
    );
    return '$_temp0';
  }

  @override
  String get history_setHeader => 'Set';

  @override
  String get detail_monthJan => 'January';

  @override
  String get detail_monthFeb => 'February';

  @override
  String get detail_monthMar => 'March';

  @override
  String get detail_monthApr => 'April';

  @override
  String get detail_monthMay => 'May';

  @override
  String get detail_monthJun => 'June';

  @override
  String get detail_monthJul => 'July';

  @override
  String get detail_monthAug => 'August';

  @override
  String get detail_monthSep => 'September';

  @override
  String get detail_monthOct => 'October';

  @override
  String get detail_monthNov => 'November';

  @override
  String get detail_monthDec => 'December';

  @override
  String detail_dateFormat(int day, String month, int year) {
    return '$month $day, $year';
  }

  @override
  String get paywall_subtitle => 'Unlock your full potential';

  @override
  String get paywall_featureTemplates => 'All predefined workouts';

  @override
  String get paywall_featureMeasures =>
      'Waist, chest, hips and progress photos';

  @override
  String get paywall_featureExerciseProgress =>
      'Progress charts for every exercise';

  @override
  String get paywall_allIncluded => 'All included';

  @override
  String get paywall_weekly => 'Weekly';

  @override
  String get paywall_monthly => 'Monthly';

  @override
  String get paywall_yearly => 'Yearly';

  @override
  String get paywall_bestValue => 'Best value';

  @override
  String get paywall_perWeek => '/week';

  @override
  String get paywall_perMonth => '/month';

  @override
  String get paywall_perYear => '/year';

  @override
  String get paywall_startTrial => 'Start free trial';

  @override
  String get paywall_subscribe => 'Subscribe';

  @override
  String get paywall_restorePurchases => 'Restore purchases';

  @override
  String get paywall_legalText =>
      'Subscription renews automatically. You can cancel\nat any time from the App Store.';

  @override
  String get paywall_legalTextPlay =>
      'Subscription renews automatically. You can cancel\nat any time from Google Play.';

  @override
  String get paywall_legalTextTrial =>
      'Free trial converts to a paid subscription. Cancel anytime before the trial ends. Subscription renews automatically.';

  @override
  String get paywall_termsLink => 'Terms of Use';

  @override
  String get paywall_privacyLink => 'Privacy Policy';

  @override
  String get paywall_purchaseError => 'Could not complete the purchase.';

  @override
  String get paywall_noPurchasesFound => 'No previous purchases found.';

  @override
  String paywall_trialDays(int count) {
    return '$count-day free trial';
  }

  @override
  String paywall_trialMonths(int count) {
    return '$count-month free trial';
  }

  @override
  String paywall_trialThenPrice(String price) {
    return 'then $price';
  }

  @override
  String get paywall_offersUnavailable => 'Could not load offers';

  @override
  String get paywall_retry => 'Retry';

  @override
  String rest_of(String time) {
    return 'of $time';
  }

  @override
  String get progressScreen_measurements => 'Measurements';

  @override
  String get progressScreen_photos => 'Photos';

  @override
  String get progressScreen_addMeasurement => 'Add measurement';

  @override
  String get progressScreen_weight => 'Weight';

  @override
  String get progressScreen_noEntries => 'No entries yet';

  @override
  String get progressScreen_noPhotos => 'No photos yet';

  @override
  String get progressScreen_camera => 'Camera';

  @override
  String get progressScreen_gallery => 'Gallery';

  @override
  String get progressScreen_waist => 'Waist';

  @override
  String get progressScreen_chest => 'Chest';

  @override
  String get progressScreen_hips => 'Hips';

  @override
  String get progressScreen_record => 'record';

  @override
  String get progressScreen_noDataMetric => 'No data for this metric';

  @override
  String get progressScreen_addMoreRecords =>
      'Add more records to see the chart';

  @override
  String get progressScreen_historyTitle => 'History';

  @override
  String get progressScreen_noEntriesSubtitle =>
      'Record your first weight and measurements\nto see your progress.';

  @override
  String get progressScreen_addFirstRecord => 'Add first record';

  @override
  String get progressScreen_progressPhotos => 'Progress photos';

  @override
  String get progressScreen_progressPhotosHint =>
      'Track your visual progress with photos.\nAvailable with LiftWave PRO.';

  @override
  String get progressScreen_unlockWithPro => 'Unlock with PRO';

  @override
  String get progressScreen_noPhotosSubtitle =>
      'Add a photo when recording your measurements\nto see your visual progress.';

  @override
  String get progressScreen_addPhoto => 'Add photo';

  @override
  String get progressScreen_newRecord => 'New record';

  @override
  String get progressScreen_photoAdded => 'Photo added';

  @override
  String get progressScreen_addPhotoOptional => 'Add photo (optional)';

  @override
  String get progressScreen_saveRecord => 'Save record';

  @override
  String get progressScreen_enterAtLeastOneValue => 'Enter at least one value';

  @override
  String get progressScreen_monthShortJan => 'Jan';

  @override
  String get progressScreen_monthShortFeb => 'Feb';

  @override
  String get progressScreen_monthShortMar => 'Mar';

  @override
  String get progressScreen_monthShortApr => 'Apr';

  @override
  String get progressScreen_monthShortMay => 'May';

  @override
  String get progressScreen_monthShortJun => 'Jun';

  @override
  String get progressScreen_monthShortJul => 'Jul';

  @override
  String get progressScreen_monthShortAug => 'Aug';

  @override
  String get progressScreen_monthShortSep => 'Sep';

  @override
  String get progressScreen_monthShortOct => 'Oct';

  @override
  String get progressScreen_monthShortNov => 'Nov';

  @override
  String get progressScreen_monthShortDec => 'Dec';

  @override
  String get achievement_firstWorkout_title => 'First session';

  @override
  String get achievement_firstWorkout_description =>
      'Complete your first workout';

  @override
  String get achievement_streak7_title => '7-day streak';

  @override
  String get achievement_streak7_description =>
      'Train at least once in 7 consecutive days';

  @override
  String get achievement_streak30_title => '30-day streak';

  @override
  String get achievement_streak30_description =>
      'Train at least once per week for 30 days';

  @override
  String get achievement_volume1000_title => '1,000 kg lifted';

  @override
  String get achievement_volume1000_description =>
      'Accumulate 1,000 kg of total volume';

  @override
  String get achievement_volume5000_title => '5,000 kg lifted';

  @override
  String get achievement_volume5000_description =>
      'Accumulate 5,000 kg of total volume';

  @override
  String get achievement_volume10000_title => '10,000 kg lifted';

  @override
  String get achievement_volume10000_description =>
      'Accumulate 10,000 kg of total volume';

  @override
  String get achievement_personalRecord_title => 'New personal record';

  @override
  String get achievement_personalRecord_description =>
      'Beat your max weight on an exercise';

  @override
  String get achievement_streak14_title => '14-day streak';

  @override
  String get achievement_streak14_description =>
      'Train at least once for 14 consecutive days';

  @override
  String get achievement_streak100_title => '100-day streak';

  @override
  String get achievement_streak100_description =>
      'Keep the streak going for 100 days with at least 1 workout per week';

  @override
  String get achievement_streak365_title => 'One year strong';

  @override
  String get achievement_streak365_description =>
      'Keep the streak going for a full year';

  @override
  String get achievement_bench50_title => 'Bench 50 kg';

  @override
  String get achievement_bench50_description =>
      'Complete a bench press with 50 kg or more';

  @override
  String get achievement_bench100_title => 'Bench 100 kg';

  @override
  String get achievement_bench100_description =>
      'Complete a bench press with 100 kg or more';

  @override
  String get achievement_squat100_title => 'Squat 100 kg';

  @override
  String get achievement_squat100_description =>
      'Complete a squat with 100 kg or more';

  @override
  String get achievement_squat150_title => 'Squat 150 kg';

  @override
  String get achievement_squat150_description =>
      'Complete a squat with 150 kg or more';

  @override
  String get achievement_deadlift100_title => 'Deadlift 100 kg';

  @override
  String get achievement_deadlift100_description =>
      'Complete a deadlift with 100 kg or more';

  @override
  String get achievement_deadlift150_title => 'Deadlift 150 kg';

  @override
  String get achievement_deadlift150_description =>
      'Complete a deadlift with 150 kg or more';

  @override
  String get achievement_deadlift200_title => 'Deadlift 200 kg';

  @override
  String get achievement_deadlift200_description =>
      'Complete a deadlift with 200 kg or more';

  @override
  String get achievement_explorer10_title => 'Explorer';

  @override
  String get achievement_explorer10_description =>
      'Use 10 different exercises in your workouts';

  @override
  String get achievement_master25_title => 'Master';

  @override
  String get achievement_master25_description =>
      'Use 25 different exercises in your workouts';

  @override
  String get achievement_fullBodyGroups_title => 'Full body';

  @override
  String get achievement_fullBodyGroups_description =>
      'Train every muscle group at least once';

  @override
  String get achievement_crossfitFan_title => 'CrossFit Fan';

  @override
  String get achievement_crossfitFan_description =>
      'Complete 10 different CrossFit category exercises';

  @override
  String get achievement_time1h_title => '1 hour total';

  @override
  String get achievement_time1h_description =>
      'Accumulate 1 hour of total training time';

  @override
  String get achievement_time10h_title => '10 hours';

  @override
  String get achievement_time10h_description =>
      'Accumulate 10 hours of total training time';

  @override
  String get achievement_time50h_title => '50 hours';

  @override
  String get achievement_time50h_description =>
      'Accumulate 50 hours of total training time';

  @override
  String get achievement_time100h_title => '100 hours';

  @override
  String get achievement_time100h_description =>
      'Accumulate 100 hours of total training time';

  @override
  String get achievement_earlyBird_title => 'Early bird';

  @override
  String get achievement_earlyBird_description =>
      'Start a workout before 7:00 AM';

  @override
  String get achievement_nightOwl_title => 'Night owl';

  @override
  String get achievement_nightOwl_description => 'Finish a workout after 22:00';

  @override
  String get achievement_comeback_title => 'Comeback';

  @override
  String get achievement_comeback_description =>
      'Return to training after 30+ days off';

  @override
  String get achievement_marathoner_title => 'Marathoner';

  @override
  String get achievement_marathoner_description =>
      'Complete a workout longer than 90 minutes';

  @override
  String get achievement_efficient_title => 'Efficient';

  @override
  String get achievement_efficient_description =>
      'Complete a 3+ exercise workout in under 30 minutes';

  @override
  String get achievement_weekendWarrior_title => 'Weekend warrior';

  @override
  String get achievement_weekendWarrior_description =>
      'Train Saturday and Sunday for 3 weekends in a row';

  @override
  String get achievement_weeklyVariety_title => 'Weekly variety';

  @override
  String get achievement_weeklyVariety_description =>
      'Train 5 different muscle groups in one week';

  @override
  String get csv_header =>
      'Date,Workout,Exercise,Muscle Group,Set,Reps,Weight (kg),Volume (kg)';

  @override
  String get csv_subject => 'LiftWave - Workout History';

  @override
  String get template_fullBody_subtitle => 'All muscle groups in one session';

  @override
  String get template_fullBody_name => 'Full Body';

  @override
  String get template_push_name => 'Push';

  @override
  String get template_pull_name => 'Pull';

  @override
  String get template_torso_name => 'Upper Body';

  @override
  String get template_push_subtitle => 'Chest · Shoulders · Triceps';

  @override
  String get template_pull_subtitle => 'Back · Biceps';

  @override
  String get template_torso_subtitle => 'Chest · Back · Shoulders';

  @override
  String get template_legs_subtitle => 'Quads · Hamstrings · Glutes · Core';

  @override
  String get template_legs_name => 'Legs';

  @override
  String get ex_pecho_6_name => 'Incline Barbell Press';

  @override
  String get ex_pecho_6_desc =>
      'Set the bench to 30-45°. Grip the bar slightly wider than shoulder width. Lower the bar in a controlled manner to your upper chest, then press up to full extension. Keep your lower back against the bench and your shoulder blades retracted.';

  @override
  String get ex_pecho_6_b1 => 'Emphasizes the upper chest (clavicular portion)';

  @override
  String get ex_pecho_6_b2 => 'Allows heavier loads than dumbbells';

  @override
  String get ex_pecho_6_b3 => 'Improves pressing strength from elevated angles';

  @override
  String get ex_pecho_7_name => 'Decline Dumbbell Press';

  @override
  String get ex_pecho_7_desc =>
      'Set the bench to a 15-30° decline. With a dumbbell in each hand at chest height, press up, bringing the dumbbells together at the top. Lower with control, feeling the stretch in the lower portion of your chest.';

  @override
  String get ex_pecho_7_b1 => 'Works the lower portion of the chest';

  @override
  String get ex_pecho_7_b2 => 'Reduces shoulder involvement';

  @override
  String get ex_pecho_7_b3 =>
      'Greater range of motion than the decline barbell press';

  @override
  String get ex_pecho_8_name => 'Push-ups';

  @override
  String get ex_pecho_8_desc =>
      'Place your hands on the floor shoulder-width apart with your feet together. Keep your body straight from head to heels. Lower by bending your elbows until your chest nearly touches the floor, then push back up. Keep your core tight throughout the movement.';

  @override
  String get ex_pecho_8_b1 => 'No equipment required';

  @override
  String get ex_pecho_8_b2 =>
      'Multiple variations to progress (diamond, decline, clap)';

  @override
  String get ex_pecho_8_b3 =>
      'Compound exercise that also strengthens the core';

  @override
  String get ex_pecho_9_name => 'Dumbbell Pullover';

  @override
  String get ex_pecho_9_desc =>
      'Lie on a flat bench holding one dumbbell with both hands over your chest, arms extended. Lower the dumbbell in an arc over your head until you feel a stretch in your chest and lats. Return to the starting position by contracting your chest.';

  @override
  String get ex_pecho_9_b1 => 'Works the chest and lats at the same time';

  @override
  String get ex_pecho_9_b2 => 'Improves shoulder and rib cage mobility';

  @override
  String get ex_pecho_9_b3 =>
      'Excellent complement between sets of presses and rows';

  @override
  String get ex_esp_6_name => 'T-Bar Row';

  @override
  String get ex_esp_6_desc =>
      'Stand over the T-bar with your feet shoulder-width apart. Lean forward keeping a neutral back and pull the handles toward your chest, driving your elbows back. Squeeze your shoulder blades at the end position and lower with control.';

  @override
  String get ex_esp_6_b1 => 'Develops mid-back thickness';

  @override
  String get ex_esp_6_b2 =>
      'Allows very heavy loads with less lower back stress than the free-weight row';

  @override
  String get ex_esp_6_b3 => 'Works posture and scapular stability';

  @override
  String get ex_esp_7_name => 'Seated Cable Row';

  @override
  String get ex_esp_7_desc =>
      'Sit facing the low pulley with your feet braced. Grip the attachment with your arms extended and your back neutral. Pull your hands toward your abdomen by retracting your shoulder blades and keeping your torso upright. Return in a controlled manner without rounding your back.';

  @override
  String get ex_esp_7_b1 => 'Constant tension throughout the movement';

  @override
  String get ex_esp_7_b2 => 'Easy weight progression and accessible technique';

  @override
  String get ex_esp_7_b3 => 'Excellent for developing mid-back thickness';

  @override
  String get ex_esp_8_name => 'Dumbbell Shrugs';

  @override
  String get ex_esp_8_desc =>
      'Stand with a dumbbell in each hand at your sides, arms relaxed. Raise your shoulders toward your ears without bending your elbows. Hold the contraction for 1 second at the top and lower slowly. Don\'t roll your shoulders; the movement is purely vertical.';

  @override
  String get ex_esp_8_b1 => 'Direct isolation of the upper traps';

  @override
  String get ex_esp_8_b2 => 'Improves posture and the appearance of the neck';

  @override
  String get ex_esp_8_b3 => 'Strengthens scapular stability for other lifts';

  @override
  String get ex_esp_9_name => 'Good Morning';

  @override
  String get ex_esp_9_desc =>
      'Place the bar across your traps as in a squat. With your feet hip-width apart and knees slightly bent, lean forward from the hips keeping a neutral back. Lower until your torso is nearly parallel to the floor, then return squeezing your glutes.';

  @override
  String get ex_esp_9_b1 => 'Strengthens the posterior chain and lower back';

  @override
  String get ex_esp_9_b2 => 'Improves the hip hinge for the deadlift and squat';

  @override
  String get ex_esp_9_b3 => 'Key accessory work for powerlifting';

  @override
  String get ex_pier_6_name => 'Front Squat';

  @override
  String get ex_pier_6_desc =>
      'Rest the bar on your front delts, elbows high, with a cross-arm or clean grip. Feet shoulder-width apart. Lower keeping your torso upright and your elbows pointing forward until your thighs go below parallel. Drive through your heels to return to the starting position.';

  @override
  String get ex_pier_6_b1 => 'Emphasizes the quads more than the back squat';

  @override
  String get ex_pier_6_b2 => 'Demands a very strong core and upright posture';

  @override
  String get ex_pier_6_b3 =>
      'Technical foundation for the clean and thruster in CrossFit';

  @override
  String get ex_pier_7_name => 'Bulgarian Split Squat';

  @override
  String get ex_pier_7_desc =>
      'Place the top of your back foot on a bench, holding a dumbbell in each hand. With your front foot stepped forward, lower by bending your front knee until your thigh is parallel to the floor. Push through your front heel to come back up.';

  @override
  String get ex_pier_7_b1 =>
      'Unilateral work that corrects imbalances between legs';

  @override
  String get ex_pier_7_b2 => 'Intense glute and quad activation';

  @override
  String get ex_pier_7_b3 => 'Improves balance and hip stability';

  @override
  String get ex_pier_8_name => 'Romanian Deadlift';

  @override
  String get ex_pier_8_desc =>
      'Stand with the bar at hip height, using an overhand grip at shoulder width. With your knees slightly bent and fixed, slide the bar down your legs by hinging your torso from the hips until you feel tension in your hamstrings. Return squeezing your glutes.';

  @override
  String get ex_pier_8_b1 => 'Intense isolation of the hamstrings and glutes';

  @override
  String get ex_pier_8_b2 =>
      'Strengthens the posterior chain and improves the hip hinge';

  @override
  String get ex_pier_8_b3 =>
      'Reduces the risk of hamstring injuries when running or jumping';

  @override
  String get ex_pier_9_name => 'Leg Extension';

  @override
  String get ex_pier_9_desc =>
      'Sit in the machine with your back supported and the roller on top of your instep. Extend your knees, lifting the weight until your legs are nearly straight, without locking your knees. Squeeze your quads at the top and lower with control.';

  @override
  String get ex_pier_9_b1 => 'Direct isolation of the quads';

  @override
  String get ex_pier_9_b2 =>
      'Useful for rehabilitation and targeted hypertrophy work';

  @override
  String get ex_pier_9_b3 => 'Precise, low-risk load adjustment';

  @override
  String get ex_pier_10_name => 'Calf Raise';

  @override
  String get ex_pier_10_desc =>
      'Place your shoulders under the pads of the calf raise machine (or hold a dumbbell while standing). Rest the balls of your feet on a platform with your heels hanging off. Rise by pushing through the balls of your feet and squeeze your calves at the top. Lower slowly, feeling the stretch.';

  @override
  String get ex_pier_10_b1 => 'Isolation of the soleus and gastrocnemius';

  @override
  String get ex_pier_10_b2 => 'Improves power in jumps and sprints';

  @override
  String get ex_pier_10_b3 =>
      'Reduces the risk of ankle and Achilles tendon injuries';

  @override
  String get ex_hom_5_name => 'Dumbbell Shoulder Press';

  @override
  String get ex_hom_5_desc =>
      'Seated with an upright backrest, hold a dumbbell at each side of your shoulders, palms facing forward. Press the dumbbells up until they nearly touch overhead, without locking your elbows. Lower with control to the starting position.';

  @override
  String get ex_hom_5_b1 => 'Greater range of motion than the barbell press';

  @override
  String get ex_hom_5_b2 => 'Allows each side to work independently';

  @override
  String get ex_hom_5_b3 => 'Less shoulder stress than the barbell';

  @override
  String get ex_hom_6_name => 'Front Raises';

  @override
  String get ex_hom_6_desc =>
      'Stand with a dumbbell in each hand in front of your thighs, palms facing your body. Raise your arms in front of you, alternating or simultaneously, to shoulder height, keeping your elbows almost straight. Lower slowly without swinging.';

  @override
  String get ex_hom_6_b1 => 'Isolation of the front delts';

  @override
  String get ex_hom_6_b2 => 'Enhances the front appearance of the shoulder';

  @override
  String get ex_hom_6_b3 =>
      'Accessory work for the bench press and overhead press';

  @override
  String get ex_hom_7_name => 'Dumbbell Reverse Fly';

  @override
  String get ex_hom_7_desc =>
      'Lean forward from the hips with your torso nearly parallel to the floor, a dumbbell in each hand and your arms hanging. Raise your arms laterally to shoulder height, elbows slightly bent. Squeeze the rear delts at the top and lower with control.';

  @override
  String get ex_hom_7_b1 =>
      'Isolation of the rear delts, a key area for posture';

  @override
  String get ex_hom_7_b2 => 'Counteracts the effects of pressing work';

  @override
  String get ex_hom_7_b3 => 'Reduces the risk of rotator cuff injuries';

  @override
  String get ex_bra_6_name => 'Preacher Curl';

  @override
  String get ex_bra_6_desc =>
      'Sit at the preacher bench with your arms resting on the pad. Grip the bar (straight or EZ) with an underhand grip. Bend your elbows, bringing the bar toward your shoulders while controlling the movement. Lower slowly without locking your elbows at the bottom.';

  @override
  String get ex_bra_6_b1 => 'Isolates the bicep by immobilizing the shoulder';

  @override
  String get ex_bra_6_b2 =>
      'Makes it impossible to use momentum, strict technique';

  @override
  String get ex_bra_6_b3 => 'Excellent for peak bicep contraction';

  @override
  String get ex_bra_7_name => 'Concentration Curl';

  @override
  String get ex_bra_7_desc =>
      'Sit on a bench with your legs apart. Rest the elbow of your working arm against the inside of your thigh, with the dumbbell hanging. Bend your elbow, bringing the dumbbell toward your shoulder and isolating the bicep. Squeeze at the top and lower with control.';

  @override
  String get ex_bra_7_b1 => 'Pure bicep isolation with maximum contraction';

  @override
  String get ex_bra_7_b2 => 'Lets you focus on the mind-muscle connection';

  @override
  String get ex_bra_7_b3 => 'Ideal as the final exercise of an arm workout';

  @override
  String get ex_bra_8_name => 'Close-Grip Bench Press';

  @override
  String get ex_bra_8_desc =>
      'Lie on a flat bench and grip the bar with a close grip at shoulder width. Lower the bar in a controlled manner until it lightly touches your sternum, keeping your elbows tucked to your body. Press up, emphasizing the tricep extension.';

  @override
  String get ex_bra_8_b1 => 'Compound exercise that emphasizes the triceps';

  @override
  String get ex_bra_8_b2 =>
      'Allows heavier loads than a tricep isolation exercise';

  @override
  String get ex_bra_8_b3 =>
      'Carries over to bench press and overhead press strength';

  @override
  String get ex_bra_9_name => 'Bench Dips';

  @override
  String get ex_bra_9_desc =>
      'Place your hands on a bench behind you with your fingers pointing forward. Extend your legs in front of you, resting on your heels (or bend your knees to make it easier). Lower by bending your elbows backward to 90°, then push back up.';

  @override
  String get ex_bra_9_b1 => 'Tricep isolation with no equipment needed';

  @override
  String get ex_bra_9_b2 => 'Easy to progress by adding weight on your lap';

  @override
  String get ex_bra_9_b3 =>
      'Improves pressing strength from positions behind the body';

  @override
  String get ex_core_5_name => 'Russian Twists';

  @override
  String get ex_core_5_desc =>
      'Sit on the floor with your knees bent and your feet raised or resting on the floor, and lean back 45°. Clasp your hands together (or hold a weight) and rotate your torso from side to side, touching the floor or bringing the weight to each side. Keep your core tight.';

  @override
  String get ex_core_5_b1 => 'Direct isolation of the obliques';

  @override
  String get ex_core_5_b2 => 'Improves torso rotation, key in sports';

  @override
  String get ex_core_5_b3 =>
      'Can be progressed by adding weight (dumbbell, plate, ball)';

  @override
  String get ex_core_6_name => 'Mountain Climbers';

  @override
  String get ex_core_6_desc =>
      'Get into a high plank position with your hands under your shoulders. Drive one knee toward your chest, alternating quickly, as if running in place. Keep your hips low and your core tight throughout the movement.';

  @override
  String get ex_core_6_b1 => 'Combines core work with cardio';

  @override
  String get ex_core_6_b2 => 'No equipment required, ideal for HIIT';

  @override
  String get ex_core_6_b3 => 'Improves coordination and endurance';

  @override
  String get ex_core_7_name => 'Hollow Hold';

  @override
  String get ex_core_7_desc =>
      'Lie on your back with your arms extended overhead and your legs straight. Lift your arms and legs slightly off the floor, pressing your lower back into the floor. Hold the boat position with your core fully contracted.';

  @override
  String get ex_core_7_b1 =>
      'Gymnastics foundation for many CrossFit movements';

  @override
  String get ex_core_7_b2 => 'Strengthens the entire core isometrically';

  @override
  String get ex_core_7_b3 =>
      'Improves posture and strength for strict pull-ups';

  @override
  String get ex_core_8_name => 'Side Plank';

  @override
  String get ex_core_8_desc =>
      'Lie on your side resting on your forearm with your elbow under your shoulder. Lift your hips off the floor, forming a straight line from your feet to your head. Hold the position without letting your hips sag. Repeat on the other side.';

  @override
  String get ex_core_8_b1 =>
      'Intense isolation of the obliques and lateral core';

  @override
  String get ex_core_8_b2 => 'Improves hip and spine stability';

  @override
  String get ex_core_8_b3 => 'No equipment and low impact';

  @override
  String get ex_core_9_name => 'Dead Bug';

  @override
  String get ex_core_9_desc =>
      'Lie on your back with your arms extended toward the ceiling and your knees bent at 90° over your hips. Simultaneously lower your right arm behind your head and your left leg, extended, toward the floor. Return and alternate sides, keeping your lower back pressed into the floor.';

  @override
  String get ex_core_9_b1 => 'Improves anti-extension core stability';

  @override
  String get ex_core_9_b2 =>
      'Excellent for beginners and lower back rehabilitation';

  @override
  String get ex_core_9_b3 => 'Works contralateral coordination';

  @override
  String get ex_cf_1_name => 'Clean';

  @override
  String get ex_cf_1_desc =>
      'From the floor, grip the bar with an overhand grip just outside your knees. Pull explosively by extending your hips and knees, shrug your shoulders and pull yourself under the bar, receiving it in a front squat with your elbows high. Stand up to complete the lift.';

  @override
  String get ex_cf_1_b1 => 'Full Olympic lift for explosive power';

  @override
  String get ex_cf_1_b2 =>
      'Develops coordination, speed, and strength at the same time';

  @override
  String get ex_cf_1_b3 => 'Foundation of many CrossFit WODs';

  @override
  String get ex_cf_2_name => 'Power Clean';

  @override
  String get ex_cf_2_desc =>
      'Same as the Clean but without receiving the bar in a full squat: you catch the bar in a quarter squat with your elbows high and the bar in the front rack on your shoulders. Faster and less demanding on mobility than the Clean.';

  @override
  String get ex_cf_2_b1 => 'Develops explosive power in the posterior chain';

  @override
  String get ex_cf_2_b2 => 'Technically more accessible than the full Clean';

  @override
  String get ex_cf_2_b3 => 'Excellent for beginners in the Olympic lifts';

  @override
  String get ex_cf_3_name => 'Snatch';

  @override
  String get ex_cf_3_desc =>
      'From the floor, grip the bar with a very wide grip. Pull explosively and receive the bar overhead with your arms extended in a deep squat (overhead squat). Stand up keeping the bar overhead.';

  @override
  String get ex_cf_3_b1 =>
      'The most complete and technically demanding Olympic lift';

  @override
  String get ex_cf_3_b2 =>
      'Develops power, mobility, and stability at the same time';

  @override
  String get ex_cf_3_b3 => 'Burns more calories than almost any other exercise';

  @override
  String get ex_cf_4_name => 'Power Snatch';

  @override
  String get ex_cf_4_desc =>
      'Same as the Snatch but receiving the bar in a quarter squat with your arms extended overhead. Faster and less demanding on ankle and hip mobility.';

  @override
  String get ex_cf_4_b1 => 'More accessible than the full Snatch';

  @override
  String get ex_cf_4_b2 => 'Develops explosive power in the posterior chain';

  @override
  String get ex_cf_4_b3 => 'Excellent for mobility and coordination';

  @override
  String get ex_cf_5_name => 'Thruster';

  @override
  String get ex_cf_5_desc =>
      'Hold the bar in the front rack position (on your front delts). Perform a full front squat and, as you come up, use the drive from your legs to press the bar overhead with your arms extended. Lower the bar to the front rack position and repeat.';

  @override
  String get ex_cf_5_b1 => 'Works the entire body in a single movement';

  @override
  String get ex_cf_5_b2 => 'Signature exercise of WODs like Fran';

  @override
  String get ex_cf_5_b3 => 'Combines strength and metabolic conditioning';

  @override
  String get ex_cf_6_name => 'Push Press';

  @override
  String get ex_cf_6_desc =>
      'With the bar in the front rack position on your shoulders, perform a quick dip by slightly bending your knees. Extend your legs explosively to drive the bar overhead until your arms are extended. Lower with control to the starting position.';

  @override
  String get ex_cf_6_b1 =>
      'Lets you move more weight than the strict overhead press';

  @override
  String get ex_cf_6_b2 => 'Develops vertical pressing power';

  @override
  String get ex_cf_6_b3 => 'Carries over to the Jerk and other Olympic lifts';

  @override
  String get ex_cf_7_name => 'Push Jerk';

  @override
  String get ex_cf_7_desc =>
      'Same as the Push Press, but as you drive the bar up, you rebend your legs to receive the bar in a quarter squat with your arms already extended. Then stand up to complete the lift. Allows heavier loads than the Push Press.';

  @override
  String get ex_cf_7_b1 => 'Moves more weight overhead than any press';

  @override
  String get ex_cf_7_b2 => 'Technical, high-power Olympic lift';

  @override
  String get ex_cf_7_b3 => 'Component of the Clean & Jerk';

  @override
  String get ex_cf_8_name => 'Wall Balls';

  @override
  String get ex_cf_8_desc =>
      'Stand facing a wall with a medicine ball in front of your chest. Perform a deep squat and, as you come up, throw the ball at a high target on the wall (~3 m). Catch the ball at chest height and descend immediately into the next squat.';

  @override
  String get ex_cf_8_b1 => 'Cardio and power exercise at the same time';

  @override
  String get ex_cf_8_b2 => 'Standard movement in many CrossFit benchmarks';

  @override
  String get ex_cf_8_b3 => 'Works coordination and rhythm';

  @override
  String get ex_cf_9_name => 'American Kettlebell Swing';

  @override
  String get ex_cf_9_desc =>
      'Stand with the kettlebell hanging between your legs, held with both hands. Hinge at the hips to swing it back, then extend your hips explosively to drive it overhead with your arms extended. The power comes from the hips, not the arms.';

  @override
  String get ex_cf_9_b1 => 'Develops explosive hip power';

  @override
  String get ex_cf_9_b2 => 'Cardio and strength in a single movement';

  @override
  String get ex_cf_9_b3 =>
      'Standard in CrossFit (Russian swings only go to chest height)';

  @override
  String get ex_cf_10_name => 'Russian Kettlebell Swing';

  @override
  String get ex_cf_10_desc =>
      'Identical to the American swing, but the kettlebell only rises to chest/eye height, not overhead. Technically easier and less stressful on the shoulders.';

  @override
  String get ex_cf_10_b1 => 'Entry point to kettlebell training';

  @override
  String get ex_cf_10_b2 => 'Less shoulder stress than the American swing';

  @override
  String get ex_cf_10_b3 => 'Ideal for beginners and high reps';

  @override
  String get ex_cf_11_name => 'Box Jumps';

  @override
  String get ex_cf_11_desc =>
      'Facing a sturdy box or platform, bend your knees and jump onto the box, landing with your feet fully on the surface. Extend your hips and knees at the top. Jump or step down one foot at a time to reduce impact.';

  @override
  String get ex_cf_11_b1 => 'Pure plyometrics for developing power';

  @override
  String get ex_cf_11_b2 => 'Improves vertical jump and explosiveness';

  @override
  String get ex_cf_11_b3 => 'Classic component of many WODs';

  @override
  String get ex_cf_12_name => 'Burpees';

  @override
  String get ex_cf_12_desc =>
      'From standing, squat down and place your hands on the floor. Jump your feet back into a plank position. Perform a push-up, touching your chest to the floor. Jump your feet back toward your hands and jump straight up, extending your arms overhead.';

  @override
  String get ex_cf_12_b1 => 'Full-body exercise with no equipment';

  @override
  String get ex_cf_12_b2 => 'Intense cardio and strength work at the same time';

  @override
  String get ex_cf_12_b3 => 'Standard in benchmarks like Murph and many WODs';

  @override
  String get ex_cf_13_name => 'Toes-to-Bar';

  @override
  String get ex_cf_13_desc =>
      'Hang from the bar with an overhand grip. Engage your lats and raise your legs, straight (or slightly bent), until your feet touch the bar. Lower with control without excessive swinging. Use the kip to keep your cadence.';

  @override
  String get ex_cf_13_b1 => 'Highly demanding dynamic core work';

  @override
  String get ex_cf_13_b2 => 'Improves grip strength and the lats';

  @override
  String get ex_cf_13_b3 => 'Component of many CrossFit WODs';

  @override
  String get ex_cf_14_name => 'Knees-to-Elbows';

  @override
  String get ex_cf_14_desc =>
      'Hang from the bar with an overhand grip. Flex your hips and knees, bringing your knees toward your elbows in a controlled, dynamic movement. Lower with control. Useful as a progression toward Toes-to-Bar.';

  @override
  String get ex_cf_14_b1 => 'Progression toward Toes-to-Bar';

  @override
  String get ex_cf_14_b2 =>
      'Dynamic core work that is less technically demanding';

  @override
  String get ex_cf_14_b3 => 'Improves grip strength';

  @override
  String get ex_cf_15_name => 'Muscle-Up';

  @override
  String get ex_cf_15_desc =>
      'Hang from the rings (or bar) with a false grip. Pull your body up explosively, transitioning over the rings, and at the top press by extending your arms until you are in the support position. Lower by controlling the reverse transition.';

  @override
  String get ex_cf_15_b1 =>
      'Advanced gymnastics movement combining pulling and pushing';

  @override
  String get ex_cf_15_b2 => 'Key milestone in CrossFit (Rx in many WODs)';

  @override
  String get ex_cf_15_b3 => 'Develops extreme relative strength to bodyweight';

  @override
  String get ex_cf_16_name => 'Pistol Squat';

  @override
  String get ex_cf_16_desc =>
      'Standing on one leg, extend the other in front of you parallel to the floor. Lower into a deep squat, keeping your balance and your supporting foot flat. Rise by driving through your heel without letting the free leg touch the floor. Repeat on the other side.';

  @override
  String get ex_cf_16_b1 => 'The most difficult single-leg squat';

  @override
  String get ex_cf_16_b2 => 'Develops ankle and hip mobility';

  @override
  String get ex_cf_16_b3 => 'Unilateral work that corrects asymmetries';

  @override
  String get ex_cf_17_name => 'Handstand Push-Up (HSPU)';

  @override
  String get ex_cf_17_desc =>
      'Place your hands on the floor about 30 cm from a wall and kick up into a handstand against the wall. Lower by bending your elbows until your head touches the floor (or an AbMat). Press to return to the top. Use the kip if you need assistance.';

  @override
  String get ex_cf_17_b1 => 'Vertical press with your full bodyweight';

  @override
  String get ex_cf_17_b2 => 'Improves shoulder and core stability';

  @override
  String get ex_cf_17_b3 => 'Key gymnastics milestone in CrossFit';

  @override
  String get ex_cf_18_name => 'Turkish Get-Up';

  @override
  String get ex_cf_18_desc =>
      'Lie on your back holding a kettlebell with one arm extended toward the ceiling. Stand up step by step (elbow → hand → hip hinge → leg sweep → kneeling → standing), keeping the kettlebell overhead at all times. Reverse the movement.';

  @override
  String get ex_cf_18_b1 => 'Unique total-body functional movement';

  @override
  String get ex_cf_18_b2 => 'Improves mobility, stability, and coordination';

  @override
  String get ex_cf_18_b3 => 'Excellent shoulder and core work';

  @override
  String get ex_cf_19_name => 'Double Unders';

  @override
  String get ex_cf_19_desc =>
      'Jump rope, passing the rope under your feet twice on each jump. Keep your jumps low and your wrists turning fast. Arms tucked to your body, elbows close to your waist. Requires coordination and a speed rope.';

  @override
  String get ex_cf_19_b1 => 'Explosive, high-intensity cardio';

  @override
  String get ex_cf_19_b2 => 'Improves coordination and timing';

  @override
  String get ex_cf_19_b3 => 'Standard in hundreds of CrossFit WODs';

  @override
  String get ex_cf_20_name => 'Farmer\'s Carry';

  @override
  String get ex_cf_20_desc =>
      'Hold a heavy dumbbell or kettlebell in each hand at your sides. Walk with short steps, keeping an upright posture, shoulders back and core tight. Cover a set distance or work for time.';

  @override
  String get ex_cf_20_b1 => 'Strengthens the grip and forearms';

  @override
  String get ex_cf_20_b2 => 'Functional full-body work';

  @override
  String get ex_cf_20_b3 => 'Improves posture and core stability';

  @override
  String get ex_cf_21_name => 'Goblet Squat';

  @override
  String get ex_cf_21_desc =>
      'Hold a kettlebell (or dumbbell) in front of your chest at sternum height, gripping it by the horns. Perform a deep squat, keeping your torso upright and your elbows pointing forward. Drive through your heels to stand back up.';

  @override
  String get ex_cf_21_b1 => 'Perfect entry point to the loaded squat';

  @override
  String get ex_cf_21_b2 => 'Teaches upright posture and proper depth';

  @override
  String get ex_cf_21_b3 => 'Excellent for activating the core';

  @override
  String get ex_pecho_1_name => 'Bench Press';

  @override
  String get ex_pecho_2_name => 'Incline Dumbbell Press';

  @override
  String get ex_pecho_3_name => 'Dumbbell Flyes';

  @override
  String get ex_pecho_4_name => 'Parallel Bar Dips';

  @override
  String get ex_pecho_5_name => 'Cable Crossover';

  @override
  String get ex_esp_1_name => 'Deadlift';

  @override
  String get ex_esp_2_name => 'Pull-ups';

  @override
  String get ex_esp_3_name => 'Barbell Row';

  @override
  String get ex_esp_4_name => 'Dumbbell Row';

  @override
  String get ex_esp_5_name => 'Lat Pulldown';

  @override
  String get ex_pier_1_name => 'Barbell Squat';

  @override
  String get ex_pier_2_name => 'Leg Press';

  @override
  String get ex_pier_3_name => 'Hip Thrust';

  @override
  String get ex_pier_4_name => 'Lunges';

  @override
  String get ex_pier_5_name => 'Hamstring Curl';

  @override
  String get ex_hom_1_name => 'Overhead Press';

  @override
  String get ex_hom_2_name => 'Lateral Raises';

  @override
  String get ex_hom_3_name => 'Face Pull';

  @override
  String get ex_hom_4_name => 'Arnold Press';

  @override
  String get ex_bra_1_name => 'Dumbbell Bicep Curl';

  @override
  String get ex_bra_2_name => 'EZ Bar Curl';

  @override
  String get ex_bra_3_name => 'Hammer Curl';

  @override
  String get ex_bra_4_name => 'Cable Tricep Pushdown';

  @override
  String get ex_bra_5_name => 'Skull Crusher';

  @override
  String get ex_core_1_name => 'Plank';

  @override
  String get ex_core_2_name => 'Crunch';

  @override
  String get ex_core_3_name => 'Hanging Leg Raise';

  @override
  String get ex_core_4_name => 'Ab Wheel Rollout';

  @override
  String get ex_pecho_1_desc =>
      'Lie on a flat bench with your feet flat on the floor. Grip the bar slightly wider than shoulder width. Lower the bar in a controlled manner until it lightly touches your chest, then press up to full extension. Keep your shoulder blades retracted throughout the movement.';

  @override
  String get ex_pecho_2_desc =>
      'Set the bench to 30-45°. Sit with a dumbbell in each hand resting on your thighs. As you recline, bring the dumbbells to chest height with your elbows at 45° from your body. Press up and inward until the dumbbells nearly touch at the top.';

  @override
  String get ex_pecho_3_desc =>
      'Lie on a flat bench with a dumbbell in each hand, arms extended over your chest and elbows slightly bent. Lower your arms in a wide arc until you feel a stretch in your chest, then return to the starting position squeezing your chest at the top.';

  @override
  String get ex_pecho_4_desc =>
      'Grip the parallel bars with your arms extended. Lean your torso slightly forward to engage more chest. Lower your body by bending your elbows until your upper arms are parallel to the floor. Push back up without locking your elbows.';

  @override
  String get ex_pecho_5_desc =>
      'Set the cables to the high position. Grab the handles and step forward. With your elbows slightly bent, cross your arms forward and down until your hands meet in front of you. Squeeze your chest at the end position and return slowly.';

  @override
  String get ex_esp_1_desc =>
      'Stand in front of the bar with your feet hip-width apart. Grip the bar with an overhand or mixed grip just outside your knees. Keep your back straight and chest up. Push the floor with your feet while extending your hips and knees until fully upright. Lower in a controlled manner.';

  @override
  String get ex_esp_2_desc =>
      'Hang from the bar with an overhand grip (palms facing away) wider than shoulder width. Engage your shoulder blades and pull your body up until your chin clears the bar. Lower slowly with control. Avoid swinging and keep your core tight throughout the movement.';

  @override
  String get ex_esp_3_desc =>
      'Stand with feet shoulder-width apart, lean forward about 45° keeping a neutral back. Grip the bar overhand, slightly wider than shoulder width. Pull the bar toward your abdomen by retracting your shoulder blades. Lower in a controlled manner without dropping your torso.';

  @override
  String get ex_esp_4_desc =>
      'Place the knee and hand of the same side on a bench. With your back parallel to the floor and neutral, grab the dumbbell with your free hand. Pull the dumbbell toward your hip by retracting the shoulder blade. Your elbow should brush past your side. Lower with full control.';

  @override
  String get ex_esp_5_desc =>
      'Sit at the lat pulldown machine and grip the wide bar overhand. With your torso leaning slightly back, pull the bar to your chest by retracting your shoulder blades and driving your elbows down. Don\'t swing. Return slowly to the starting position with control.';

  @override
  String get ex_pier_1_desc =>
      'Place the bar across your traps. Feet shoulder-width apart or slightly wider. Lower by bending your knees and hips while keeping your chest up and back neutral until your thighs are parallel to the floor. Drive through your heels to stand back up.';

  @override
  String get ex_pier_2_desc =>
      'Sit in the machine with your back fully supported. Place your feet shoulder-width apart on the platform. Release the safety locks and lower the platform until your knees form roughly 90°, then push to near full extension without locking your knees.';

  @override
  String get ex_pier_3_desc =>
      'Rest your shoulder blades on a sturdy bench with the barbell across your hips (use a pad). Feet flat on the floor shoulder-width apart. Lower your hips to the floor, then drive upward squeezing your glutes until your hips are level with the bench.';

  @override
  String get ex_pier_4_desc =>
      'Stand holding a dumbbell in each hand. Take a long step forward and lower your back knee until it nearly touches the floor. Your front knee should not go past your toes. Push through the front heel to return to the starting position. Alternate legs.';

  @override
  String get ex_pier_5_desc =>
      'Lie face down on the machine with your heels under the roller. Curl your heels toward your glutes in a controlled motion. Squeeze your hamstrings at the top. Lower slowly without letting the weight stack rest.';

  @override
  String get ex_hom_1_desc =>
      'Standing or seated, hold the bar at shoulder height with an overhand grip slightly wider than your shoulders. Press the bar straight overhead to full extension. Lower in a controlled manner to the starting position. Keep your core engaged to protect your lower back.';

  @override
  String get ex_hom_2_desc =>
      'Stand with a dumbbell in each hand at your sides, palms facing inward. With elbows slightly bent, raise your arms laterally to shoulder height. Lower slowly. Avoid swinging or using momentum; the movement should be strict and controlled.';

  @override
  String get ex_hom_3_desc =>
      'Attach the rope to the high pulley. Grab the ends with palms facing down and step back. Pull the rope toward your face, flaring your elbows out to shoulder height and bringing your hands toward your ears. Squeeze the rear delts at the end.';

  @override
  String get ex_hom_4_desc =>
      'Seated with dumbbells in front of you at shoulder height, palms facing you. As you press up, rotate your palms outward so they face forward at the top. Lower by reversing the rotation back to the starting position. Keep the movement fluid and continuous.';

  @override
  String get ex_bra_1_desc =>
      'Stand with a dumbbell in each hand, arms extended and palms facing forward. Curl the dumbbells toward your shoulders without moving your upper arms. Squeeze the bicep at the top. Lower in a controlled manner to full extension.';

  @override
  String get ex_bra_2_desc =>
      'Stand holding the EZ bar with an underhand grip at shoulder width. Keep your elbows tucked to your sides and curl until the bar reaches chest height. Lower in a controlled manner feeling the full stretch of the bicep. The EZ bar reduces wrist tension.';

  @override
  String get ex_bra_3_desc =>
      'Stand with a dumbbell in each hand using a neutral grip (palms facing each other, as if holding a hammer). Curl your elbows alternating or simultaneously, bringing the dumbbells toward your shoulders. Keep your elbows close to your body at all times. Lower with control.';

  @override
  String get ex_bra_4_desc =>
      'Attach the rope or bar to the high pulley. Grip the attachment with your elbows bent and pinned to your torso. Push down extending your elbows fully without moving them. Slightly separate your hands at the bottom if using the rope. Return slowly, resisting the weight.';

  @override
  String get ex_bra_5_desc =>
      'Lie on a bench with the EZ bar held at arm\'s length over your chest. With your elbows pointing at the ceiling, lower the bar toward your forehead by bending only at the elbows. Extend back to the starting position. Your elbows must stay fixed; only the forearms move.';

  @override
  String get ex_core_1_desc =>
      'Rest on your forearms and toes on the floor. Keep your body straight like a board: hips neither raised nor sagging, glutes tight and abs engaged. Breathe steadily. Hold the position for the target time without compromising form.';

  @override
  String get ex_core_2_desc =>
      'Lie on your back with knees bent and feet flat. Place your hands behind your head without pulling on your neck. Contract your abs by lifting your shoulders off the floor about 30° and squeezing the rectus abdominis at the top. Lower in a controlled manner without fully relaxing your abs.';

  @override
  String get ex_core_3_desc =>
      'Hang from the bar with an overhand grip at shoulder width. With legs slightly bent, raise your knees or legs to horizontal (or higher) by contracting your abs. Lower slowly without swinging. The movement should come from hip flexion, not momentum.';

  @override
  String get ex_core_4_desc =>
      'Kneel with the wheel in front of you. Grip the handles and roll forward, extending your body slowly until you nearly touch the floor. Contract your core to return to the starting position without letting your hips sag. Keep a neutral back and abs tight throughout the movement.';

  @override
  String get secondary_triceps => 'Triceps';

  @override
  String get secondary_anteriorDeltoid => 'Anterior deltoid';

  @override
  String get secondary_biceps => 'Biceps';

  @override
  String get secondary_glutes => 'Glutes';

  @override
  String get secondary_hamstrings => 'Hamstrings';

  @override
  String get secondary_trapezius => 'Trapezius';

  @override
  String get secondary_rhomboids => 'Rhomboids';

  @override
  String get secondary_lowerBack => 'Lower back';

  @override
  String get secondary_quads => 'Quads';

  @override
  String get secondary_calves => 'Calves';

  @override
  String get secondary_rotatorCuff => 'Rotator cuff';

  @override
  String get secondary_brachialis => 'Brachialis';

  @override
  String get secondary_brachioradialis => 'Brachioradialis';

  @override
  String get secondary_anconeus => 'Anconeus';

  @override
  String get secondary_obliques => 'Obliques';

  @override
  String get secondary_hipFlexors => 'Hip flexors';

  @override
  String get secondary_deltoids => 'Deltoids';

  @override
  String get secondary_lats => 'Lats';

  @override
  String get ex_pecho_1_b1 => 'Builds chest mass and strength';

  @override
  String get ex_pecho_1_b2 => 'Strengthens the triceps and front shoulders';

  @override
  String get ex_pecho_1_b3 =>
      'Compound exercise with high carryover to functional strength';

  @override
  String get ex_pecho_2_b1 =>
      'Emphasizes the clavicular (upper) portion of the chest';

  @override
  String get ex_pecho_2_b2 => 'Greater range of motion than the barbell';

  @override
  String get ex_pecho_2_b3 => 'Allows each side to work independently';

  @override
  String get ex_pecho_3_b1 => 'Deep isolation of the pectoralis major';

  @override
  String get ex_pecho_3_b2 => 'Improves chest flexibility and stretch';

  @override
  String get ex_pecho_3_b3 => 'Ideal for adding volume and definition';

  @override
  String get ex_pecho_4_b1 =>
      'Compound exercise working chest, triceps, and shoulders';

  @override
  String get ex_pecho_4_b2 => 'No additional equipment required';

  @override
  String get ex_pecho_4_b3 =>
      'Can be progressed by adding weight with a dip belt';

  @override
  String get ex_pecho_5_b1 =>
      'Constant tension throughout the full range of motion';

  @override
  String get ex_pecho_5_b2 => 'Excellent for chest definition and isolation';

  @override
  String get ex_pecho_5_b3 => 'Multiple variations depending on cable height';

  @override
  String get ex_esp_1_b1 =>
      'Full-body exercise that maximizes overall strength';

  @override
  String get ex_esp_1_b2 =>
      'Develops the posterior chain (back, glutes, hamstrings)';

  @override
  String get ex_esp_1_b3 => 'High hormonal release and anabolic effect';

  @override
  String get ex_esp_2_b1 => 'Develops back width (latissimus dorsi)';

  @override
  String get ex_esp_2_b2 => 'Improves relative strength to bodyweight';

  @override
  String get ex_esp_2_b3 => 'Excellent indicator of functional performance';

  @override
  String get ex_esp_3_b1 => 'Develops back thickness and density';

  @override
  String get ex_esp_3_b2 => 'Strengthens postural muscles';

  @override
  String get ex_esp_3_b3 => 'Ideal complement to the bench press';

  @override
  String get ex_esp_4_b1 => 'Corrects imbalances between both sides';

  @override
  String get ex_esp_4_b2 => 'Greater range of motion than the barbell row';

  @override
  String get ex_esp_4_b3 => 'Excellent for beginners as it is easy to learn';

  @override
  String get ex_esp_5_b1 => 'Alternative to pull-ups for beginners';

  @override
  String get ex_esp_5_b2 => 'Develops back width';

  @override
  String get ex_esp_5_b3 => 'Easy weight control and gradual progression';

  @override
  String get ex_pier_1_b1 => 'The most complete lower-body exercise';

  @override
  String get ex_pier_1_b2 =>
      'Releases more anabolic hormones than any other exercise';

  @override
  String get ex_pier_1_b3 => 'Improves athletic power and functionality';

  @override
  String get ex_pier_2_b1 => 'Allows heavy loads to be used safely';

  @override
  String get ex_pier_2_b2 => 'Ideal for beginners or rehabilitation';

  @override
  String get ex_pier_2_b3 =>
      'Foot placement can be varied to target different areas';

  @override
  String get ex_pier_3_b1 =>
      'The most effective exercise for activating and developing the glutes';

  @override
  String get ex_pier_3_b2 => 'Improves hip extension and posture';

  @override
  String get ex_pier_3_b3 => 'Reduces the risk of knee and hip injuries';

  @override
  String get ex_pier_4_b1 =>
      'Works each leg unilaterally, correcting imbalances';

  @override
  String get ex_pier_4_b2 => 'Improves balance and stability';

  @override
  String get ex_pier_4_b3 => 'Excellent for glute and quad development';

  @override
  String get ex_pier_5_b1 => 'Direct isolation of the hamstrings';

  @override
  String get ex_pier_5_b2 => 'Prevents hamstring injuries';

  @override
  String get ex_pier_5_b3 => 'Balances thigh muscle development';

  @override
  String get ex_hom_1_b1 => 'Develops all three heads of the deltoid';

  @override
  String get ex_hom_1_b2 => 'Improves functional overhead strength';

  @override
  String get ex_hom_1_b3 =>
      'Strengthens the rotator cuff and shoulder stability';

  @override
  String get ex_hom_2_b1 => 'Isolates the lateral deltoid for wider shoulders';

  @override
  String get ex_hom_2_b2 => 'Enhances the appearance of upper-body width';

  @override
  String get ex_hom_2_b3 => 'Low injury risk when appropriate weight is used';

  @override
  String get ex_hom_3_b1 => 'Strengthens the rear delts and improves posture';

  @override
  String get ex_hom_3_b2 => 'Prevents rotator cuff injuries';

  @override
  String get ex_hom_3_b3 => 'Counteracts the effects of pressing work';

  @override
  String get ex_hom_4_b1 => 'Activates all three deltoid heads in one movement';

  @override
  String get ex_hom_4_b2 => 'The rotation improves shoulder mobility';

  @override
  String get ex_hom_4_b3 =>
      'More complete variation than the standard shoulder press';

  @override
  String get ex_bra_1_b1 => 'Direct isolation of the biceps brachii';

  @override
  String get ex_bra_1_b2 => 'Works each arm independently';

  @override
  String get ex_bra_1_b3 => 'Easy weight progression and accessible technique';

  @override
  String get ex_bra_2_b1 => 'Allows heavier loads than dumbbells';

  @override
  String get ex_bra_2_b2 => 'The EZ bar reduces tension on wrists and elbows';

  @override
  String get ex_bra_2_b3 => 'Ideal for building overall bicep mass';

  @override
  String get ex_bra_3_b1 => 'Emphasis on the brachialis and brachioradialis';

  @override
  String get ex_bra_3_b2 => 'Adds thickness and size to the arm from the front';

  @override
  String get ex_bra_3_b3 => 'Less wrist stress than the supinated curl';

  @override
  String get ex_bra_4_b1 => 'Effective isolation of all three tricep heads';

  @override
  String get ex_bra_4_b2 => 'Constant tension thanks to the cable';

  @override
  String get ex_bra_4_b3 => 'Excellent for tricep definition and finishing';

  @override
  String get ex_bra_5_b1 => 'Maximum stretch of the long head of the triceps';

  @override
  String get ex_bra_5_b2 => 'Develops tricep thickness';

  @override
  String get ex_bra_5_b3 => 'Can be performed with dumbbells or a straight bar';

  @override
  String get ex_core_1_b1 => 'Strengthens the deep core without spinal loading';

  @override
  String get ex_core_1_b2 => 'Improves posture and lumbar stability';

  @override
  String get ex_core_1_b3 => 'Reduces the risk of back injuries';

  @override
  String get ex_core_2_b1 =>
      'Basic isolation exercise for the rectus abdominis';

  @override
  String get ex_core_2_b2 => 'Easy to learn and perform';

  @override
  String get ex_core_2_b3 => 'Foundation for more demanding ab progressions';

  @override
  String get ex_core_3_b1 => 'Works the lower core with high intensity';

  @override
  String get ex_core_3_b2 => 'Improves grip strength and lower back strength';

  @override
  String get ex_core_3_b3 =>
      'Progressive version: bent knees → straight legs → L-sit';

  @override
  String get ex_core_4_b1 =>
      'One of the most complete and demanding core exercises';

  @override
  String get ex_core_4_b2 =>
      'Works the core in extension, unlike traditional ab exercises';

  @override
  String get ex_core_4_b3 =>
      'Develops functional strength across the entire anterior chain';
}
