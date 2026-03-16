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
  String get common_ok => 'OK';

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
  String get common_pro => 'PRO';

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
  String get nav_history => 'History';

  @override
  String get nav_rest => 'Rest';

  @override
  String get nav_exercises => 'Exercises';

  @override
  String get login_tagline => 'Your personal fitness app';

  @override
  String get login_continueGoogle => 'Continue with Google';

  @override
  String get login_continueApple => 'Continue with Apple';

  @override
  String get login_continueEmail => 'Continue with email';

  @override
  String get login_legal =>
      'By continuing, you agree to our terms of service\nand privacy policy.';

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
  String get home_startWorkout => 'Start workout';

  @override
  String get home_thisWeek => 'This week';

  @override
  String get home_weekTime => 'Week time';

  @override
  String get home_weekVolume => 'Week volume';

  @override
  String get home_quickAccess => 'Quick access';

  @override
  String get home_lastWorkout => 'Last workout';

  @override
  String get home_viewAll => 'View all';

  @override
  String get home_noWorkoutsYet => 'No workouts yet';

  @override
  String get home_noWorkoutsSubtitle =>
      'Complete your first workout and it will appear here.';

  @override
  String get home_goToTrain => 'Go to Train →';

  @override
  String get home_progress => 'Progress';

  @override
  String get home_noRecordsYet => 'No records yet';

  @override
  String get home_recordWeightMeasures => 'Track your weight and measurements';

  @override
  String get home_achievements => 'Achievements';

  @override
  String get home_noAchievements => 'Complete workouts to unlock achievements';

  @override
  String get home_recentExercises => 'Recent exercises';

  @override
  String get home_noRecentExercises =>
      'Your frequent exercises will appear here';

  @override
  String home_frequentExercise(int count) {
    return '$count sessions';
  }

  @override
  String get home_latestRecord => 'Latest record';

  @override
  String get home_waist => 'Waist';

  @override
  String get home_hips => 'Hips';

  @override
  String get home_exerciseLibrary => 'Exercise library';

  @override
  String get home_viewAllExercises => 'View all';

  @override
  String home_exercisesAvailable(int count) {
    return '$count exercises available';
  }

  @override
  String get profile_proActive => 'Active subscription';

  @override
  String get profile_freePlan => 'Free plan';

  @override
  String get profile_upgradePro => 'Upgrade to PRO';

  @override
  String get profile_redeemCode => 'Redeem code';

  @override
  String get profile_restorePurchases => 'Restore purchases';

  @override
  String get profile_signOut => 'Sign out';

  @override
  String get profile_deleteAccount => 'Delete account';

  @override
  String get profile_redeemTitle => 'Redeem code';

  @override
  String get profile_redeemSubtitle =>
      'Enter your promo code to unlock LiftWave PRO.';

  @override
  String get profile_codeHint => 'CODE';

  @override
  String get profile_redeem => 'Redeem';

  @override
  String get profile_proActivated => 'LiftWave PRO activated';

  @override
  String get profile_invalidCode => 'Invalid code';

  @override
  String get profile_purchasesRestored => 'Purchases restored successfully';

  @override
  String get profile_noPurchasesFound => 'No previous purchases found';

  @override
  String get profile_deleteTitle => 'Delete account';

  @override
  String get profile_deleteConfirm =>
      'Are you sure? This action is irreversible and all your data will be deleted.';

  @override
  String get profile_deleteReauthError =>
      'To delete your account, sign out, sign back in, and try again.';

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
  String get train_cancelWorkout => 'Cancel workout';

  @override
  String get train_cancelConfirm =>
      'Are you sure you want to cancel? Progress will be lost.';

  @override
  String get train_continue => 'Continue';

  @override
  String get train_addExerciseFirst =>
      'Add at least one exercise before finishing.';

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
    return '$count exercises';
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
  String get train_notesHint => 'Notes (optional)';

  @override
  String get train_setHeader => 'SET';

  @override
  String get train_repsHeader => 'REPS';

  @override
  String get train_weightHeader => 'WEIGHT (kg)';

  @override
  String get train_addSet => 'Add set';

  @override
  String train_lastWeight(String weight) {
    return 'Last: $weight kg';
  }

  @override
  String get train_abbreviationExercises => 'ex.';

  @override
  String get train_orChooseRoutine => 'Or choose a routine';

  @override
  String get train_defaultRoutineName => 'My routine';

  @override
  String get train_bodyweightLabel => 'Bodyweight';

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
  String exercises_exerciseCount(int count, String suffix) {
    return '$count exercise$suffix';
  }

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
  String get history_limitedHistory => 'Limited history';

  @override
  String history_unlockWorkouts(int count) {
    return 'Unlock your $count workouts with PRO';
  }

  @override
  String get history_weeklySummary => 'Weekly summary';

  @override
  String get history_workouts => 'Workouts';

  @override
  String get history_total => 'Total';

  @override
  String get history_volumeKg => 'Volume kg';

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
    return '$count sets';
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
  String get paywall_featureTemplates => 'Workout templates';

  @override
  String get paywall_featureHistory => 'Unlimited history';

  @override
  String get paywall_featureTimer => 'Custom timer';

  @override
  String get paywall_featureDetails => 'Exercise details';

  @override
  String get paywall_featureMeasures => 'Body measurements + photos';

  @override
  String get paywall_featureStats => 'Weekly stats';

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
  String get paywall_freeTrial => '7-day free trial';

  @override
  String get paywall_startTrial => 'Start free trial';

  @override
  String get paywall_restorePurchases => 'Restore purchases';

  @override
  String get paywall_legalText =>
      'Subscription renews automatically. You can cancel\nat any time from the App Store.';

  @override
  String get paywall_purchaseError => 'Could not complete the purchase.';

  @override
  String get paywall_noPurchasesFound => 'No previous purchases found.';

  @override
  String get rest_title => 'Rest';

  @override
  String get rest_ready => 'Ready! Time for the next set';

  @override
  String get rest_almostReady => 'Almost ready!';

  @override
  String get rest_resting => 'Resting...';

  @override
  String rest_customTime(String time) {
    return 'Custom time · $time';
  }

  @override
  String get rest_choosePreset => 'Choose a preset or customize';

  @override
  String rest_of(String time) {
    return 'of $time';
  }

  @override
  String get rest_presets => 'Presets';

  @override
  String get rest_customize => 'Customize';

  @override
  String get rest_customTimeTitle => 'Custom time';

  @override
  String get rest_customTimeSubtitle =>
      'Enter the minutes and seconds of rest.';

  @override
  String get rest_minutes => 'Minutes';

  @override
  String get rest_seconds => 'Seconds';

  @override
  String get rest_setTime => 'Set time';

  @override
  String get progressScreen_title => 'Body Progress';

  @override
  String get progressScreen_measurements => 'Measurements';

  @override
  String get progressScreen_photos => 'Photos';

  @override
  String get progressScreen_addMeasurement => 'Add measurement';

  @override
  String get progressScreen_weight => 'Weight';

  @override
  String get progressScreen_bodyFat => 'Body fat';

  @override
  String get progressScreen_muscle => 'Muscle';

  @override
  String get progressScreen_noEntries => 'No entries yet';

  @override
  String get progressScreen_noEntriesHint =>
      'Tap the + button to add your first measurement';

  @override
  String get progressScreen_noPhotos => 'No photos yet';

  @override
  String get progressScreen_noPhotosHint =>
      'Tap the + button to add your first progress photo';

  @override
  String get progressScreen_current => 'Current';

  @override
  String get progressScreen_change => 'Change';

  @override
  String get progressScreen_trend => 'Trend';

  @override
  String get progressScreen_addMeasurementTitle => 'New measurement';

  @override
  String get progressScreen_weightKg => 'Weight (kg)';

  @override
  String get progressScreen_bodyFatPercent => 'Body fat (%)';

  @override
  String get progressScreen_muscleMassKg => 'Muscle mass (kg)';

  @override
  String get progressScreen_optional => 'Optional';

  @override
  String get progressScreen_saveEntry => 'Save entry';

  @override
  String get progressScreen_deleteMeasurement => 'Delete this entry?';

  @override
  String get progressScreen_deletePhoto => 'Delete this photo?';

  @override
  String get progressScreen_camera => 'Camera';

  @override
  String get progressScreen_gallery => 'Gallery';

  @override
  String get progressScreen_selectSource => 'Select source';

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
  String get csv_header =>
      'Date,Workout,Exercise,Muscle Group,Set,Reps,Weight (kg),Volume (kg)';

  @override
  String get csv_subject => 'LiftWave - Workout History';

  @override
  String get template_fullBody_subtitle => 'All muscle groups in one session';

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
