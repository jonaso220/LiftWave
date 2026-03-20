// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class SFr extends S {
  SFr([String locale = 'fr']) : super(locale);

  @override
  String get common_cancel => 'Annuler';

  @override
  String get common_delete => 'Supprimer';

  @override
  String get common_save => 'Enregistrer';

  @override
  String get common_ok => 'OK';

  @override
  String get common_or => 'ou';

  @override
  String get common_today => 'Aujourd\'hui';

  @override
  String get common_yesterday => 'Hier';

  @override
  String common_daysAgo(int count) {
    return 'Il y a $count jours';
  }

  @override
  String get common_exercises => 'Exercices';

  @override
  String get common_sets => 'Séries';

  @override
  String get common_volume => 'Volume';

  @override
  String get common_reps => 'Reps';

  @override
  String get common_weight => 'Poids';

  @override
  String get common_duration => 'Durée';

  @override
  String get common_bodyweight => 'Poids du corps';

  @override
  String get common_custom => 'CUSTOM';

  @override
  String get common_pro => 'PRO';

  @override
  String get muscle_all => 'Tous';

  @override
  String get muscle_chest => 'Pectoraux';

  @override
  String get muscle_back => 'Dos';

  @override
  String get muscle_legs => 'Jambes';

  @override
  String get muscle_shoulders => 'Épaules';

  @override
  String get muscle_arms => 'Bras';

  @override
  String get muscle_core => 'Core';

  @override
  String get equipment_all => 'Tous';

  @override
  String get equipment_barbell => 'Barre';

  @override
  String get equipment_dumbbells => 'Haltères';

  @override
  String get equipment_machine => 'Machine';

  @override
  String get equipment_cable => 'Poulie';

  @override
  String get equipment_bodyweight => 'Poids du corps';

  @override
  String get equipment_pullupBar => 'Barre de traction';

  @override
  String get equipment_noEquipment => 'Sans matériel';

  @override
  String get equipment_parallelBars => 'Barres parallèles';

  @override
  String get difficulty_beginner => 'Débutant';

  @override
  String get difficulty_intermediate => 'Intermédiaire';

  @override
  String get difficulty_advanced => 'Avancé';

  @override
  String get nav_home => 'Accueil';

  @override
  String get nav_train => 'Entraînement';

  @override
  String get nav_history => 'Historique';

  @override
  String get nav_rest => 'Repos';

  @override
  String get nav_exercises => 'Exercices';

  @override
  String get login_tagline => 'Votre appli fitness personnelle';

  @override
  String get login_continueGoogle => 'Continuer avec Google';

  @override
  String get login_continueApple => 'Continuer avec Apple';

  @override
  String get login_continueEmail => 'Continuer par e-mail';

  @override
  String get login_legal =>
      'En continuant, vous acceptez nos conditions d\'utilisation\net notre politique de confidentialité.';

  @override
  String get login_legalPrefix => 'En continuant, vous acceptez nos ';

  @override
  String get login_termsLink => 'conditions d\'utilisation';

  @override
  String get login_legalAnd => 'et notre';

  @override
  String get login_privacyLink => 'politique de confidentialité';

  @override
  String get login_googleError => 'Impossible de se connecter avec Google.';

  @override
  String get login_appleError => 'Impossible de se connecter avec Apple.';

  @override
  String get emailAuth_titleLogin => 'Connexion';

  @override
  String get emailAuth_titleRegister => 'Créer un compte';

  @override
  String get emailAuth_greetingLogin => 'Content de vous revoir';

  @override
  String get emailAuth_greetingRegister => 'Bienvenue !';

  @override
  String get emailAuth_subtitleLogin =>
      'Connectez-vous avec votre e-mail et mot de passe';

  @override
  String get emailAuth_subtitleRegister => 'Créez votre compte pour commencer';

  @override
  String get emailAuth_nameLabel => 'Nom';

  @override
  String get emailAuth_nameHint => 'Votre nom';

  @override
  String get emailAuth_nameError => 'Veuillez entrer votre nom';

  @override
  String get emailAuth_emailLabel => 'E-mail';

  @override
  String get emailAuth_emailHint => 'email@exemple.com';

  @override
  String get emailAuth_emailErrorEmpty => 'Veuillez entrer votre e-mail';

  @override
  String get emailAuth_emailErrorInvalid => 'E-mail invalide';

  @override
  String get emailAuth_passwordLabel => 'Mot de passe';

  @override
  String get emailAuth_passwordHintLogin => 'Votre mot de passe';

  @override
  String get emailAuth_passwordHintRegister => '6 caractères minimum';

  @override
  String get emailAuth_passwordErrorEmpty =>
      'Veuillez entrer votre mot de passe';

  @override
  String get emailAuth_passwordErrorShort => '6 caractères minimum';

  @override
  String get emailAuth_forgotPassword => 'Mot de passe oublié ?';

  @override
  String get emailAuth_hasAccount => 'Vous avez déjà un compte ? ';

  @override
  String get emailAuth_noAccount => 'Pas encore de compte ? ';

  @override
  String get emailAuth_loginLink => 'Se connecter';

  @override
  String get emailAuth_registerLink => 'S\'inscrire';

  @override
  String get emailAuth_unexpectedError =>
      'Erreur inattendue. Veuillez réessayer.';

  @override
  String get emailAuth_emailFirst => 'Veuillez d\'abord entrer votre e-mail.';

  @override
  String emailAuth_resetSent(String email) {
    return 'E-mail de récupération envoyé à $email';
  }

  @override
  String get emailAuth_resetError =>
      'Impossible d\'envoyer l\'e-mail de récupération.';

  @override
  String get authError_userNotFound =>
      'Aucun compte n\'existe avec cet e-mail.';

  @override
  String get authError_wrongPassword => 'Mot de passe incorrect.';

  @override
  String get authError_emailAlreadyInUse => 'Cet e-mail est déjà utilisé.';

  @override
  String get authError_weakPassword =>
      'Le mot de passe est trop faible (6 caractères minimum).';

  @override
  String get authError_invalidEmail => 'L\'e-mail n\'est pas valide.';

  @override
  String get authError_tooManyRequests =>
      'Trop de tentatives. Veuillez patienter quelques minutes.';

  @override
  String get authError_networkFailed => 'Pas de connexion internet.';

  @override
  String get authError_default => 'Erreur de connexion. Veuillez réessayer.';

  @override
  String home_greetingMorning(String name) {
    return 'Bonjour, $name !';
  }

  @override
  String get home_greetingMorningNoName => 'Bonjour !';

  @override
  String home_greetingAfternoon(String name) {
    return 'Bon après-midi, $name !';
  }

  @override
  String get home_greetingAfternoonNoName => 'Bon après-midi !';

  @override
  String home_greetingEvening(String name) {
    return 'Bonsoir, $name !';
  }

  @override
  String get home_greetingEveningNoName => 'Bonsoir !';

  @override
  String get home_weekMotivationZero =>
      'Pas encore d\'entraînement cette semaine. C\'est le moment de commencer !';

  @override
  String get home_weekMotivationOne =>
      '1 entraînement cette semaine. Continuez comme ça !';

  @override
  String home_weekMotivationMany(int count) {
    return '$count entraînements cette semaine. Continuez comme ça !';
  }

  @override
  String get home_startWorkout => 'Démarrer l\'entraînement';

  @override
  String get home_thisWeek => 'Cette semaine';

  @override
  String get home_weekTime => 'Temps hebdo';

  @override
  String get home_weekVolume => 'Volume hebdo';

  @override
  String get home_quickAccess => 'Accès rapide';

  @override
  String get home_lastWorkout => 'Dernier entraînement';

  @override
  String get home_viewAll => 'Tout voir';

  @override
  String get home_noWorkoutsYet => 'Pas encore d\'entraînements';

  @override
  String get home_noWorkoutsSubtitle =>
      'Terminez votre premier entraînement et il apparaîtra ici.';

  @override
  String get home_goToTrain => 'Aller à Entraînement →';

  @override
  String get home_progress => 'Progrès';

  @override
  String get home_noRecordsYet => 'Pas encore de données';

  @override
  String get home_recordWeightMeasures =>
      'Enregistrez votre poids et vos mensurations';

  @override
  String get home_achievements => 'Succès';

  @override
  String get home_noAchievements =>
      'Terminez des entraînements pour débloquer des succès';

  @override
  String get home_recentExercises => 'Exercices récents';

  @override
  String get home_noRecentExercises =>
      'Vos exercices fréquents apparaîtront ici';

  @override
  String home_frequentExercise(int count) {
    return '$count séances';
  }

  @override
  String get home_latestRecord => 'Dernier enregistrement';

  @override
  String get home_waist => 'Taille';

  @override
  String get home_hips => 'Hanches';

  @override
  String get home_exerciseLibrary => 'Bibliothèque d\'exercices';

  @override
  String get home_viewAllExercises => 'Voir tout';

  @override
  String home_exercisesAvailable(int count) {
    return '$count exercices disponibles';
  }

  @override
  String get profile_proActive => 'Abonnement actif';

  @override
  String get profile_freePlan => 'Plan gratuit';

  @override
  String get profile_upgradePro => 'Passer à PRO';

  @override
  String get profile_redeemCode => 'Utiliser un code';

  @override
  String get profile_restorePurchases => 'Restaurer les achats';

  @override
  String get profile_signOut => 'Se déconnecter';

  @override
  String get profile_deleteAccount => 'Supprimer le compte';

  @override
  String get profile_redeemTitle => 'Utiliser un code';

  @override
  String get profile_redeemSubtitle =>
      'Entrez votre code promotionnel pour débloquer LiftWave PRO.';

  @override
  String get profile_codeHint => 'CODE';

  @override
  String get profile_redeem => 'Utiliser';

  @override
  String get profile_proActivated => 'LiftWave PRO activé';

  @override
  String get profile_invalidCode => 'Code invalide';

  @override
  String get profile_purchasesRestored => 'Achats restaurés avec succès';

  @override
  String get profile_noPurchasesFound => 'Aucun achat précédent trouvé';

  @override
  String get profile_deleteTitle => 'Supprimer le compte';

  @override
  String get profile_deleteConfirm =>
      'Êtes-vous sûr ? Cette action est irréversible et toutes vos données seront supprimées.';

  @override
  String get profile_deleteReauthError =>
      'Pour supprimer votre compte, déconnectez-vous, reconnectez-vous et réessayez.';

  @override
  String get train_title => 'Entraînement';

  @override
  String get train_readyTitle => 'Prêt à vous entraîner ?';

  @override
  String get train_readySubtitle =>
      'Commencez une séance libre ou choisissez une routine prédéfinie.';

  @override
  String get train_freeSession => 'Séance libre';

  @override
  String get train_freeWorkout => 'Entraînement libre';

  @override
  String get train_myRoutines => 'Mes routines';

  @override
  String get train_predefinedRoutines => 'Routines prédéfinies';

  @override
  String get train_inProgress => 'En cours';

  @override
  String get train_cancelWorkout => 'Annuler l\'entraînement';

  @override
  String get train_cancelConfirm =>
      'Êtes-vous sûr de vouloir annuler ? La progression sera perdue.';

  @override
  String get train_continue => 'Continuer';

  @override
  String get train_addExerciseFirst =>
      'Ajoutez au moins un exercice avant de terminer.';

  @override
  String get train_workoutCompleted => 'Entraînement terminé !';

  @override
  String get train_completedSets => 'Séries terminées';

  @override
  String get train_totalVolume => 'Volume total';

  @override
  String get train_saveAsRoutine => 'Enregistrer comme routine';

  @override
  String get train_finish => 'Terminer';

  @override
  String get train_newAchievement => 'Nouveau succès !';

  @override
  String get train_great => 'Super !';

  @override
  String get train_routineNameHint => 'Nom de la routine';

  @override
  String train_routineSaved(String name) {
    return 'Routine \"$name\" enregistrée';
  }

  @override
  String get train_deleteRoutine => 'Supprimer la routine';

  @override
  String train_deleteRoutineConfirm(String name) {
    return 'Supprimer \"$name\" ?';
  }

  @override
  String get train_noExercisesYet => 'Pas encore d\'exercices';

  @override
  String get train_addExerciseHint =>
      'Appuyez sur le bouton ci-dessous pour ajouter le premier exercice.';

  @override
  String get train_addExercise => 'Ajouter un exercice';

  @override
  String get train_exercise => 'Exercice';

  @override
  String train_exerciseCount(int count) {
    return '$count exercices';
  }

  @override
  String train_startTemplate(String name) {
    return 'Commencer $name';
  }

  @override
  String train_setsProgress(int done, int total) {
    return '$done/$total séries ✓';
  }

  @override
  String get train_viewProgress => 'Voir les progrès';

  @override
  String get train_deleteExercise => 'Supprimer l\'exercice';

  @override
  String get train_notesHint => 'Notes (facultatif)';

  @override
  String get train_setHeader => 'SÉRIE';

  @override
  String get train_repsHeader => 'REPS';

  @override
  String get train_weightHeader => 'POIDS (kg)';

  @override
  String get train_addSet => 'Ajouter une série';

  @override
  String train_lastWeight(String weight) {
    return 'Dernier : $weight kg';
  }

  @override
  String get train_abbreviationExercises => 'ex.';

  @override
  String get train_orChooseRoutine => 'Ou choisissez une routine';

  @override
  String get train_defaultRoutineName => 'Ma routine';

  @override
  String get train_bodyweightLabel => 'Poids du corps';

  @override
  String get picker_title => 'Choisir un exercice';

  @override
  String get picker_searchHint => 'Rechercher un exercice...';

  @override
  String get picker_createManual => 'Créer un exercice personnalisé';

  @override
  String get picker_createManualSubtitle =>
      'Nom, groupe musculaire et équipement';

  @override
  String get picker_createTitle => 'Créer un exercice';

  @override
  String get picker_nameLabel => 'Nom';

  @override
  String get picker_nameHint => 'Ex : Curl marteau';

  @override
  String get picker_muscleGroupLabel => 'Groupe musculaire';

  @override
  String get picker_equipmentLabel => 'Équipement';

  @override
  String get picker_addExercise => 'Ajouter l\'exercice';

  @override
  String get exercises_title => 'Exercices';

  @override
  String get exercises_searchHint => 'Rechercher des exercices...';

  @override
  String get exercises_muscleFilter => 'Muscle';

  @override
  String get exercises_equipmentFilter => 'Matériel';

  @override
  String exercises_exerciseCount(int count, String suffix) {
    return '$count exercice$suffix';
  }

  @override
  String get exercises_clearFilters => 'Effacer les filtres';

  @override
  String get exercises_noResults => 'Aucun résultat';

  @override
  String get exercises_noResultsHint =>
      'Essayez d\'autres filtres ou termes de recherche';

  @override
  String get exercises_deleteTitle => 'Supprimer l\'exercice';

  @override
  String exercises_deleteConfirm(String name) {
    return 'Supprimer \"$name\" de votre liste d\'exercices ?';
  }

  @override
  String get exercises_muscleGroupLabel => 'Groupe musculaire';

  @override
  String get exercises_materialLabel => 'Matériel';

  @override
  String get exercises_executionTitle => 'Exécution';

  @override
  String get exercises_secondaryMuscles => 'Muscles secondaires';

  @override
  String get exercises_benefits => 'Bénéfices';

  @override
  String get exercises_viewProgress => 'Voir les progrès';

  @override
  String get exercises_addToWorkout => 'Ajouter à l\'entraînement';

  @override
  String get progress_maxWeight => 'Poids max.';

  @override
  String get progress_volumeLabel => 'Volume';

  @override
  String get progress_noData => 'Pas de données pour cet exercice';

  @override
  String get progress_needMoreSessions =>
      'Au moins 2 séances sont nécessaires pour voir les progrès';

  @override
  String get progress_lastVolume => 'Dernier volume';

  @override
  String get progress_lastWeight => 'Dernier poids';

  @override
  String get progress_best => 'Meilleur';

  @override
  String get progress_progressLabel => 'Progrès';

  @override
  String get progress_historyTitle => 'Historique';

  @override
  String get history_title => 'Historique';

  @override
  String get history_exportCsv => 'Exporter CSV';

  @override
  String get history_allWorkouts => 'Tous les entraînements';

  @override
  String get history_noWorkoutsYet => 'Pas encore d\'entraînements';

  @override
  String get history_noWorkoutsSubtitle =>
      'Terminez votre premier entraînement dans l\'onglet Entraînement et il apparaîtra ici.';

  @override
  String get history_limitedHistory => 'Historique limité';

  @override
  String history_unlockWorkouts(int count) {
    return 'Débloquez vos $count entraînements avec PRO';
  }

  @override
  String get history_weeklySummary => 'Résumé hebdomadaire';

  @override
  String get history_workouts => 'Entraînements';

  @override
  String get history_total => 'Total';

  @override
  String get history_volumeKg => 'Volume kg';

  @override
  String get history_dayMon => 'L';

  @override
  String get history_dayTue => 'M';

  @override
  String get history_dayWed => 'M';

  @override
  String get history_dayThu => 'J';

  @override
  String get history_dayFri => 'V';

  @override
  String get history_daySat => 'S';

  @override
  String get history_daySun => 'D';

  @override
  String get history_exercisesPerformed => 'Exercices réalisés';

  @override
  String history_setsCount(int count) {
    return '$count séries';
  }

  @override
  String get history_setHeader => 'Série';

  @override
  String get detail_monthJan => 'janvier';

  @override
  String get detail_monthFeb => 'février';

  @override
  String get detail_monthMar => 'mars';

  @override
  String get detail_monthApr => 'avril';

  @override
  String get detail_monthMay => 'mai';

  @override
  String get detail_monthJun => 'juin';

  @override
  String get detail_monthJul => 'juillet';

  @override
  String get detail_monthAug => 'août';

  @override
  String get detail_monthSep => 'septembre';

  @override
  String get detail_monthOct => 'octobre';

  @override
  String get detail_monthNov => 'novembre';

  @override
  String get detail_monthDec => 'décembre';

  @override
  String detail_dateFormat(int day, String month, int year) {
    return '$day $month $year';
  }

  @override
  String get paywall_subtitle => 'Libérez tout votre potentiel';

  @override
  String get paywall_featureTemplates => 'Modèles d\'entraînement';

  @override
  String get paywall_featureHistory => 'Historique illimité';

  @override
  String get paywall_featureTimer => 'Minuteur personnalisé';

  @override
  String get paywall_featureDetails => 'Détails des exercices';

  @override
  String get paywall_featureMeasures => 'Mensurations + photos';

  @override
  String get paywall_featureStats => 'Statistiques hebdomadaires';

  @override
  String get paywall_allIncluded => 'Tout inclus';

  @override
  String get paywall_weekly => 'Hebdomadaire';

  @override
  String get paywall_monthly => 'Mensuel';

  @override
  String get paywall_yearly => 'Annuel';

  @override
  String get paywall_bestValue => 'Meilleure offre';

  @override
  String get paywall_perWeek => '/semaine';

  @override
  String get paywall_perMonth => '/mois';

  @override
  String get paywall_perYear => '/an';

  @override
  String get paywall_freeTrial => '7 jours d\'essai gratuit';

  @override
  String get paywall_startTrial => 'Commencer l\'essai gratuit';

  @override
  String get paywall_restorePurchases => 'Restaurer les achats';

  @override
  String get paywall_legalText =>
      'L\'abonnement se renouvelle automatiquement. Vous pouvez annuler\nà tout moment depuis l\'App Store.';

  @override
  String get paywall_termsLink => 'Conditions d\'utilisation';

  @override
  String get paywall_privacyLink => 'Politique de confidentialité';

  @override
  String get paywall_purchaseError => 'Impossible de finaliser l\'achat.';

  @override
  String get paywall_noPurchasesFound => 'Aucun achat précédent trouvé.';

  @override
  String get rest_title => 'Repos';

  @override
  String get rest_ready => 'C\'est parti ! Place à la série suivante';

  @override
  String get rest_almostReady => 'Presque prêt !';

  @override
  String get rest_resting => 'Repos en cours...';

  @override
  String rest_customTime(String time) {
    return 'Temps personnalisé · $time';
  }

  @override
  String get rest_choosePreset => 'Choisissez un préréglage ou personnalisez';

  @override
  String rest_of(String time) {
    return 'sur $time';
  }

  @override
  String get rest_presets => 'Préréglages';

  @override
  String get rest_customize => 'Personnaliser';

  @override
  String get rest_customTimeTitle => 'Temps personnalisé';

  @override
  String get rest_customTimeSubtitle =>
      'Entrez les minutes et secondes de repos.';

  @override
  String get rest_minutes => 'Minutes';

  @override
  String get rest_seconds => 'Secondes';

  @override
  String get rest_setTime => 'Définir le temps';

  @override
  String get progressScreen_title => 'Évolution corporelle';

  @override
  String get progressScreen_measurements => 'Mensurations';

  @override
  String get progressScreen_photos => 'Photos';

  @override
  String get progressScreen_addMeasurement => 'Ajouter une mesure';

  @override
  String get progressScreen_weight => 'Poids';

  @override
  String get progressScreen_bodyFat => 'Masse grasse';

  @override
  String get progressScreen_muscle => 'Muscle';

  @override
  String get progressScreen_noEntries => 'Pas encore de données';

  @override
  String get progressScreen_noEntriesHint =>
      'Appuyez sur le bouton + pour ajouter votre première mesure';

  @override
  String get progressScreen_noPhotos => 'Pas encore de photos';

  @override
  String get progressScreen_noPhotosHint =>
      'Appuyez sur le bouton + pour ajouter votre première photo de progrès';

  @override
  String get progressScreen_current => 'Actuel';

  @override
  String get progressScreen_change => 'Variation';

  @override
  String get progressScreen_trend => 'Tendance';

  @override
  String get progressScreen_addMeasurementTitle => 'Nouvelle mesure';

  @override
  String get progressScreen_weightKg => 'Poids (kg)';

  @override
  String get progressScreen_bodyFatPercent => 'Masse grasse (%)';

  @override
  String get progressScreen_muscleMassKg => 'Masse musculaire (kg)';

  @override
  String get progressScreen_optional => 'Facultatif';

  @override
  String get progressScreen_saveEntry => 'Enregistrer';

  @override
  String get progressScreen_deleteMeasurement => 'Supprimer cette mesure ?';

  @override
  String get progressScreen_deletePhoto => 'Supprimer cette photo ?';

  @override
  String get progressScreen_camera => 'Appareil photo';

  @override
  String get progressScreen_gallery => 'Galerie';

  @override
  String get progressScreen_selectSource => 'Choisir la source';

  @override
  String get progressScreen_waist => 'Taille';

  @override
  String get progressScreen_chest => 'Poitrine';

  @override
  String get progressScreen_hips => 'Hanches';

  @override
  String get progressScreen_record => 'enregistrement';

  @override
  String get progressScreen_noDataMetric => 'Aucune donnée pour cette métrique';

  @override
  String get progressScreen_addMoreRecords =>
      'Ajoutez plus d\'enregistrements pour voir le graphique';

  @override
  String get progressScreen_historyTitle => 'Historique';

  @override
  String get progressScreen_noEntriesSubtitle =>
      'Enregistrez votre premier poids et mensurations\npour voir votre évolution.';

  @override
  String get progressScreen_addFirstRecord =>
      'Ajouter un premier enregistrement';

  @override
  String get progressScreen_progressPhotos => 'Photos de progrès';

  @override
  String get progressScreen_progressPhotosHint =>
      'Suivez votre progression visuelle avec des photos.\nDisponible avec LiftWave PRO.';

  @override
  String get progressScreen_unlockWithPro => 'Débloquer avec PRO';

  @override
  String get progressScreen_noPhotosSubtitle =>
      'Ajoutez une photo en enregistrant vos mensurations\npour voir votre progression visuelle.';

  @override
  String get progressScreen_addPhoto => 'Ajouter une photo';

  @override
  String get progressScreen_newRecord => 'Nouvel enregistrement';

  @override
  String get progressScreen_photoAdded => 'Photo ajoutée';

  @override
  String get progressScreen_addPhotoOptional =>
      'Ajouter une photo (facultatif)';

  @override
  String get progressScreen_saveRecord => 'Sauvegarder';

  @override
  String get progressScreen_enterAtLeastOneValue =>
      'Entrez au moins une valeur';

  @override
  String get progressScreen_monthShortJan => 'jan';

  @override
  String get progressScreen_monthShortFeb => 'fév';

  @override
  String get progressScreen_monthShortMar => 'mar';

  @override
  String get progressScreen_monthShortApr => 'avr';

  @override
  String get progressScreen_monthShortMay => 'mai';

  @override
  String get progressScreen_monthShortJun => 'juin';

  @override
  String get progressScreen_monthShortJul => 'juil';

  @override
  String get progressScreen_monthShortAug => 'août';

  @override
  String get progressScreen_monthShortSep => 'sep';

  @override
  String get progressScreen_monthShortOct => 'oct';

  @override
  String get progressScreen_monthShortNov => 'nov';

  @override
  String get progressScreen_monthShortDec => 'déc';

  @override
  String get achievement_firstWorkout_title => 'Première séance';

  @override
  String get achievement_firstWorkout_description =>
      'Terminez votre premier entraînement';

  @override
  String get achievement_streak7_title => '7 jours de suite';

  @override
  String get achievement_streak7_description =>
      'Entraînez-vous au moins 1 fois pendant 7 jours consécutifs';

  @override
  String get achievement_streak30_title => '30 jours de suite';

  @override
  String get achievement_streak30_description =>
      'Entraînez-vous au moins 1 fois par semaine pendant 30 jours';

  @override
  String get achievement_volume1000_title => '1 000 kg soulevés';

  @override
  String get achievement_volume1000_description =>
      'Accumulez 1 000 kg de volume total';

  @override
  String get achievement_volume5000_title => '5 000 kg soulevés';

  @override
  String get achievement_volume5000_description =>
      'Accumulez 5 000 kg de volume total';

  @override
  String get achievement_volume10000_title => '10 000 kg soulevés';

  @override
  String get achievement_volume10000_description =>
      'Accumulez 10 000 kg de volume total';

  @override
  String get achievement_personalRecord_title => 'Nouveau record personnel';

  @override
  String get achievement_personalRecord_description =>
      'Dépassez votre poids maximal sur un exercice';

  @override
  String get csv_header =>
      'Date,Entraînement,Exercice,Groupe musculaire,Série,Reps,Poids (kg),Volume (kg)';

  @override
  String get csv_subject => 'LiftWave - Historique des entraînements';

  @override
  String get template_fullBody_subtitle =>
      'Tous les groupes musculaires en une séance';

  @override
  String get template_push_subtitle => 'Pectoraux · Épaules · Triceps';

  @override
  String get template_pull_subtitle => 'Dos · Biceps';

  @override
  String get template_torso_subtitle => 'Pectoraux · Dos · Épaules';

  @override
  String get template_legs_subtitle =>
      'Quadriceps · Ischio-jambiers · Fessiers · Core';

  @override
  String get template_legs_name => 'Jambes';

  @override
  String get ex_pecho_1_name => 'Développé couché';

  @override
  String get ex_pecho_2_name => 'Développé incliné aux haltères';

  @override
  String get ex_pecho_3_name => 'Écarté aux haltères';

  @override
  String get ex_pecho_4_name => 'Dips aux barres parallèles';

  @override
  String get ex_pecho_5_name => 'Croisé à la poulie';

  @override
  String get ex_esp_1_name => 'Soulevé de terre';

  @override
  String get ex_esp_2_name => 'Tractions';

  @override
  String get ex_esp_3_name => 'Rowing barre';

  @override
  String get ex_esp_4_name => 'Rowing haltère';

  @override
  String get ex_esp_5_name => 'Tirage vertical';

  @override
  String get ex_pier_1_name => 'Squat barre';

  @override
  String get ex_pier_2_name => 'Presse à cuisses';

  @override
  String get ex_pier_3_name => 'Hip thrust';

  @override
  String get ex_pier_4_name => 'Fentes';

  @override
  String get ex_pier_5_name => 'Leg curl';

  @override
  String get ex_hom_1_name => 'Développé militaire';

  @override
  String get ex_hom_2_name => 'Élévations latérales';

  @override
  String get ex_hom_3_name => 'Face pull';

  @override
  String get ex_hom_4_name => 'Développé Arnold';

  @override
  String get ex_bra_1_name => 'Curl biceps aux haltères';

  @override
  String get ex_bra_2_name => 'Curl barre EZ';

  @override
  String get ex_bra_3_name => 'Curl marteau';

  @override
  String get ex_bra_4_name => 'Extension triceps à la poulie';

  @override
  String get ex_bra_5_name => 'Barre au front';

  @override
  String get ex_core_1_name => 'Gainage';

  @override
  String get ex_core_2_name => 'Crunch';

  @override
  String get ex_core_3_name => 'Relevé de jambes suspendu';

  @override
  String get ex_core_4_name => 'Roue abdominale';

  @override
  String get ex_pecho_1_desc =>
      'Allongez-vous sur un banc plat, pieds au sol. Saisissez la barre avec une prise plus large que les épaules. Descendez la barre de manière contrôlée jusqu\'à effleurer la poitrine puis poussez jusqu\'à l\'extension complète. Gardez les omoplates serrées tout au long du mouvement.';

  @override
  String get ex_pecho_2_desc =>
      'Réglez le banc à 30-45°. Asseyez-vous avec un haltère dans chaque main posé sur les cuisses. En vous allongeant, amenez les haltères à hauteur de poitrine avec les coudes à 45° du corps. Poussez vers le haut et vers l\'intérieur jusqu\'à presque joindre les haltères en haut.';

  @override
  String get ex_pecho_3_desc =>
      'Allongez-vous sur un banc plat avec un haltère dans chaque main, bras tendus au-dessus de la poitrine et coudes légèrement fléchis. Descendez les bras en arc large jusqu\'à sentir l\'étirement des pectoraux, puis revenez en position initiale en contractant les pectoraux en haut.';

  @override
  String get ex_pecho_4_desc =>
      'Placez-vous sur les barres parallèles, bras tendus. Inclinez légèrement le buste vers l\'avant pour mieux solliciter les pectoraux. Descendez en fléchissant les coudes jusqu\'à ce que les bras soient parallèles au sol. Remontez sans verrouiller les coudes.';

  @override
  String get ex_pecho_5_desc =>
      'Placez les poulies en position haute. Saisissez les poignées et faites un pas en avant. Avec les coudes légèrement fléchis, croisez les bras vers l\'avant et vers le bas jusqu\'à ce que les mains se rejoignent devant vous. Contractez les pectoraux en position finale et revenez lentement.';

  @override
  String get ex_esp_1_desc =>
      'Placez-vous devant la barre, pieds à largeur de hanches. Saisissez-la en pronation ou prise mixte juste à l\'extérieur des genoux. Gardez le dos droit et la poitrine haute. Poussez le sol avec les pieds en étendant les hanches et les genoux jusqu\'à être complètement debout. Redescendez de manière contrôlée.';

  @override
  String get ex_esp_2_desc =>
      'Suspendez-vous à la barre en pronation (paumes vers l\'extérieur) plus large que les épaules. Activez les omoplates et tirez le corps vers le haut jusqu\'à ce que le menton dépasse la barre. Redescendez lentement avec contrôle. Évitez le balancement et gardez le core engagé.';

  @override
  String get ex_esp_3_desc =>
      'Pieds à largeur d\'épaules, penchez-vous en avant à environ 45° en gardant le dos neutre. Saisissez la barre en pronation, un peu plus large que les épaules. Tirez la barre vers l\'abdomen en rétractant les omoplates. Redescendez de manière contrôlée sans laisser tomber le buste.';

  @override
  String get ex_esp_4_desc =>
      'Posez le genou et la main du même côté sur un banc. Le dos parallèle au sol et neutre, saisissez l\'haltère de la main libre. Tirez l\'haltère vers la hanche en rétractant l\'omoplate. Le coude doit frôler le flanc. Redescendez avec un contrôle total.';

  @override
  String get ex_esp_5_desc =>
      'Asseyez-vous à la machine de tirage et saisissez la barre large en pronation. Le buste légèrement incliné vers l\'arrière, tirez la barre vers la poitrine en rétractant les omoplates et en abaissant les coudes. Ne vous balancez pas. Revenez lentement en position initiale.';

  @override
  String get ex_pier_1_desc =>
      'Placez la barre sur les trapèzes. Pieds à largeur d\'épaules ou légèrement plus écartés. Descendez en fléchissant genoux et hanches, poitrine haute et dos neutre, jusqu\'à ce que les cuisses soient parallèles au sol. Poussez à travers les talons pour remonter.';

  @override
  String get ex_pier_2_desc =>
      'Asseyez-vous dans la machine, dos entièrement appuyé. Placez les pieds à largeur d\'épaules sur la plateforme. Libérez les sécurités et descendez la plateforme jusqu\'à ce que les genoux forment environ 90°, puis poussez jusqu\'à presque l\'extension complète sans verrouiller les genoux.';

  @override
  String get ex_pier_3_desc =>
      'Appuyez les omoplates sur un banc solide avec la barre sur les hanches (utilisez un coussin). Pieds au sol à largeur d\'épaules. Descendez les hanches vers le sol puis poussez vers le haut en serrant les fessiers jusqu\'à ce que les hanches soient alignées avec le buste.';

  @override
  String get ex_pier_4_desc =>
      'Debout avec un haltère dans chaque main. Faites un grand pas en avant et descendez le genou arrière jusqu\'à presque toucher le sol. Le genou avant ne doit pas dépasser la pointe du pied. Poussez avec le talon avant pour revenir en position initiale. Alternez les jambes.';

  @override
  String get ex_pier_5_desc =>
      'Allongez-vous face contre terre sur la machine, talons sous le rouleau. Fléchissez les genoux en amenant les talons vers les fessiers de manière contrôlée. En position finale, contractez les ischio-jambiers. Redescendez lentement sans laisser reposer les poids.';

  @override
  String get ex_hom_1_desc =>
      'Debout ou assis, la barre à hauteur d\'épaules en prise pronation légèrement plus large que les épaules. Poussez la barre verticalement au-dessus de la tête jusqu\'à l\'extension complète. Redescendez de manière contrôlée. Gardez le core engagé pour protéger le bas du dos.';

  @override
  String get ex_hom_2_desc =>
      'Debout avec un haltère dans chaque main le long du corps, paumes vers l\'intérieur. Coudes légèrement fléchis, élevez les bras latéralement jusqu\'à hauteur des épaules. Redescendez lentement. Évitez de vous balancer ou d\'utiliser l\'élan ; le mouvement doit être pur et contrôlé.';

  @override
  String get ex_hom_3_desc =>
      'Placez la corde sur la poulie haute. Saisissez les extrémités paumes vers le bas et reculez d\'un pas. Tirez la corde vers votre visage en écartant les coudes à hauteur d\'épaules et en amenant les mains vers les oreilles. Contractez les deltoïdes postérieurs en position finale.';

  @override
  String get ex_hom_4_desc =>
      'Assis avec les haltères devant vous à hauteur d\'épaules, paumes vers vous. En poussant vers le haut, tournez les paumes vers l\'extérieur de sorte qu\'elles soient orientées vers l\'avant en haut. Redescendez en inversant la rotation. Mouvement fluide et continu.';

  @override
  String get ex_bra_1_desc =>
      'Debout avec un haltère dans chaque main, bras tendus et paumes vers l\'avant. Fléchissez les coudes en amenant les haltères vers les épaules sans bouger le haut du bras. Contractez le biceps en haut. Redescendez de manière contrôlée jusqu\'à l\'extension complète.';

  @override
  String get ex_bra_2_desc =>
      'Debout avec la barre EZ en prise supination à largeur d\'épaules. Gardez les coudes collés aux flancs et fléchissez jusqu\'à amener la barre à hauteur de poitrine. Redescendez de manière contrôlée en sentant l\'étirement complet du biceps. La barre EZ réduit la tension sur les poignets.';

  @override
  String get ex_bra_3_desc =>
      'Debout avec un haltère dans chaque main en prise neutre (paumes face à face, comme si vous teniez un marteau). Fléchissez les coudes en alternance ou simultanément, amenant les haltères vers les épaules. Gardez les coudes collés au corps en permanence. Redescendez avec contrôle.';

  @override
  String get ex_bra_4_desc =>
      'Placez la corde ou la barre sur la poulie haute. Saisissez l\'accessoire, coudes fléchis et collés au buste. Poussez vers le bas en étendant complètement les coudes sans les bouger. Écartez légèrement les mains en bas si vous utilisez la corde. Remontez lentement en résistant au poids.';

  @override
  String get ex_bra_5_desc =>
      'Allongez-vous sur un banc avec la barre EZ à bras tendus au-dessus de la poitrine. Les coudes pointant vers le plafond, descendez la barre vers le front en fléchissant uniquement les coudes. Étendez à nouveau vers la position initiale. Les coudes doivent rester fixes ; seul l\'avant-bras bouge.';

  @override
  String get ex_core_1_desc =>
      'Appuyez-vous sur les avant-bras et les pointes de pieds. Maintenez le corps droit comme une planche : hanches ni relevées ni affaissées, fessiers serrés et abdominaux contractés. Respirez régulièrement. Maintenez la position le temps visé sans compromettre la forme.';

  @override
  String get ex_core_2_desc =>
      'Allongez-vous sur le dos, genoux fléchis et pieds au sol. Placez les mains derrière la tête sans tirer sur le cou. Contractez les abdominaux en soulevant les épaules du sol d\'environ 30° et serrez le grand droit en haut. Redescendez de manière contrôlée sans relâcher complètement les abdominaux.';

  @override
  String get ex_core_3_desc =>
      'Suspendez-vous à la barre en pronation à largeur d\'épaules. Jambes légèrement fléchies, élevez les genoux ou les jambes jusqu\'à l\'horizontale (ou plus haut) en contractant les abdominaux. Redescendez lentement sans vous balancer. Le mouvement doit venir de la flexion de hanche, pas de l\'élan.';

  @override
  String get ex_core_4_desc =>
      'À genoux avec la roue devant vous. Saisissez les poignées et roulez vers l\'avant en étendant lentement le corps jusqu\'à presque toucher le sol. Contractez le core pour revenir en position initiale sans laisser les hanches s\'affaisser. Gardez le dos neutre et les abdominaux serrés tout au long du mouvement.';

  @override
  String get secondary_triceps => 'Triceps';

  @override
  String get secondary_anteriorDeltoid => 'Deltoïde antérieur';

  @override
  String get secondary_biceps => 'Biceps';

  @override
  String get secondary_glutes => 'Fessiers';

  @override
  String get secondary_hamstrings => 'Ischio-jambiers';

  @override
  String get secondary_trapezius => 'Trapèzes';

  @override
  String get secondary_rhomboids => 'Rhomboïdes';

  @override
  String get secondary_lowerBack => 'Bas du dos';

  @override
  String get secondary_quads => 'Quadriceps';

  @override
  String get secondary_calves => 'Mollets';

  @override
  String get secondary_rotatorCuff => 'Coiffe des rotateurs';

  @override
  String get secondary_brachialis => 'Brachial';

  @override
  String get secondary_brachioradialis => 'Brachio-radial';

  @override
  String get secondary_anconeus => 'Anconé';

  @override
  String get secondary_obliques => 'Obliques';

  @override
  String get secondary_hipFlexors => 'Fléchisseurs de hanche';

  @override
  String get secondary_deltoids => 'Deltoïdes';

  @override
  String get secondary_lats => 'Grand dorsal';

  @override
  String get ex_pecho_1_b1 => 'Développe la masse et la force des pectoraux';

  @override
  String get ex_pecho_1_b2 =>
      'Renforce les triceps et les deltoïdes antérieurs';

  @override
  String get ex_pecho_1_b3 =>
      'Exercice composé à fort transfert vers la force fonctionnelle';

  @override
  String get ex_pecho_2_b1 =>
      'Cible la portion claviculaire (supérieure) des pectoraux';

  @override
  String get ex_pecho_2_b2 =>
      'Plus grande amplitude de mouvement qu\'avec la barre';

  @override
  String get ex_pecho_2_b3 => 'Permet de travailler chaque côté indépendamment';

  @override
  String get ex_pecho_3_b1 => 'Isolation profonde du grand pectoral';

  @override
  String get ex_pecho_3_b2 =>
      'Améliore la souplesse et l\'étirement des pectoraux';

  @override
  String get ex_pecho_3_b3 =>
      'Idéal pour ajouter du volume et de la définition';

  @override
  String get ex_pecho_4_b1 =>
      'Exercice composé sollicitant pectoraux, triceps et épaules';

  @override
  String get ex_pecho_4_b2 => 'Ne nécessite aucun équipement supplémentaire';

  @override
  String get ex_pecho_4_b3 =>
      'Progression possible en ajoutant du poids avec une ceinture';

  @override
  String get ex_pecho_5_b1 =>
      'Tension constante sur toute l\'amplitude du mouvement';

  @override
  String get ex_pecho_5_b2 =>
      'Excellent pour la définition et l\'isolation des pectoraux';

  @override
  String get ex_pecho_5_b3 =>
      'Multiples variantes selon la hauteur de la poulie';

  @override
  String get ex_esp_1_b1 => 'Exercice complet qui maximise la force globale';

  @override
  String get ex_esp_1_b2 =>
      'Développe la chaîne postérieure (dos, fessiers, ischio-jambiers)';

  @override
  String get ex_esp_1_b3 => 'Forte libération hormonale et effet anabolisant';

  @override
  String get ex_esp_2_b1 => 'Développe la largeur du dos (grand dorsal)';

  @override
  String get ex_esp_2_b2 => 'Améliore la force relative au poids du corps';

  @override
  String get ex_esp_2_b3 => 'Excellent indicateur de performance fonctionnelle';

  @override
  String get ex_esp_3_b1 => 'Développe l\'épaisseur et la densité du dos';

  @override
  String get ex_esp_3_b2 => 'Renforce les muscles posturaux';

  @override
  String get ex_esp_3_b3 => 'Complément idéal du développé couché';

  @override
  String get ex_esp_4_b1 => 'Correction des déséquilibres entre les deux côtés';

  @override
  String get ex_esp_4_b2 =>
      'Plus grande amplitude de mouvement que le rowing barre';

  @override
  String get ex_esp_4_b3 =>
      'Excellent pour les débutants car facile à apprendre';

  @override
  String get ex_esp_5_b1 => 'Alternative aux tractions pour les débutants';

  @override
  String get ex_esp_5_b2 => 'Développe la largeur du dos';

  @override
  String get ex_esp_5_b3 => 'Contrôle du poids facile et progression graduelle';

  @override
  String get ex_pier_1_b1 => 'L\'exercice le plus complet pour le bas du corps';

  @override
  String get ex_pier_1_b2 =>
      'Libère plus d\'hormones anabolisantes que tout autre exercice';

  @override
  String get ex_pier_1_b3 =>
      'Améliore la puissance athlétique et la fonctionnalité';

  @override
  String get ex_pier_2_b1 =>
      'Permet de travailler avec des charges lourdes en toute sécurité';

  @override
  String get ex_pier_2_b2 => 'Idéal pour les débutants ou la rééducation';

  @override
  String get ex_pier_2_b3 =>
      'La position des pieds permet de cibler différentes zones';

  @override
  String get ex_pier_3_b1 =>
      'L\'exercice le plus efficace pour activer et développer les fessiers';

  @override
  String get ex_pier_3_b2 => 'Améliore l\'extension de hanche et la posture';

  @override
  String get ex_pier_3_b3 =>
      'Réduit le risque de blessures au genou et à la hanche';

  @override
  String get ex_pier_4_b1 =>
      'Travaille chaque jambe unilatéralement, corrigeant les déséquilibres';

  @override
  String get ex_pier_4_b2 => 'Améliore l\'équilibre et la stabilité';

  @override
  String get ex_pier_4_b3 =>
      'Excellent pour le développement des fessiers et des quadriceps';

  @override
  String get ex_pier_5_b1 => 'Isolation directe des ischio-jambiers';

  @override
  String get ex_pier_5_b2 => 'Prévient les blessures du tendon';

  @override
  String get ex_pier_5_b3 =>
      'Équilibre le développement musculaire de la cuisse';

  @override
  String get ex_hom_1_b1 => 'Développe les trois faisceaux du deltoïde';

  @override
  String get ex_hom_1_b2 =>
      'Améliore la force fonctionnelle au-dessus de la tête';

  @override
  String get ex_hom_1_b3 =>
      'Renforce la coiffe des rotateurs et la stabilité de l\'épaule';

  @override
  String get ex_hom_2_b1 =>
      'Isole le deltoïde latéral pour des épaules plus larges';

  @override
  String get ex_hom_2_b2 => 'Améliore l\'apparence de largeur du buste';

  @override
  String get ex_hom_2_b3 => 'Faible risque de blessure avec un poids approprié';

  @override
  String get ex_hom_3_b1 =>
      'Renforce les deltoïdes postérieurs et améliore la posture';

  @override
  String get ex_hom_3_b2 => 'Prévient les blessures de la coiffe des rotateurs';

  @override
  String get ex_hom_3_b3 => 'Contrebalance les effets du travail de poussée';

  @override
  String get ex_hom_4_b1 =>
      'Active les trois faisceaux du deltoïde en un seul mouvement';

  @override
  String get ex_hom_4_b2 => 'La rotation améliore la mobilité de l\'épaule';

  @override
  String get ex_hom_4_b3 =>
      'Variante plus complète que le développé épaules classique';

  @override
  String get ex_bra_1_b1 => 'Isolation directe du biceps brachial';

  @override
  String get ex_bra_1_b2 => 'Travaille chaque bras de manière indépendante';

  @override
  String get ex_bra_1_b3 =>
      'Progression de charge facile et technique accessible';

  @override
  String get ex_bra_2_b1 =>
      'Permet d\'utiliser plus de charge qu\'avec des haltères';

  @override
  String get ex_bra_2_b2 =>
      'La barre EZ réduit la tension sur les poignets et les coudes';

  @override
  String get ex_bra_2_b3 => 'Idéal pour développer la masse globale du biceps';

  @override
  String get ex_bra_3_b1 => 'Cible le brachial et le brachio-radial';

  @override
  String get ex_bra_3_b2 => 'Donne épaisseur et volume au bras vu de face';

  @override
  String get ex_bra_3_b3 =>
      'Moins de stress sur les poignets que le curl en supination';

  @override
  String get ex_bra_4_b1 => 'Isolation efficace des trois faisceaux du triceps';

  @override
  String get ex_bra_4_b2 => 'Tension constante grâce à la poulie';

  @override
  String get ex_bra_4_b3 =>
      'Excellent pour la définition et la finition du triceps';

  @override
  String get ex_bra_5_b1 => 'Étirement maximal du long chef du triceps';

  @override
  String get ex_bra_5_b2 => 'Développe l\'épaisseur du triceps';

  @override
  String get ex_bra_5_b3 =>
      'Peut se faire avec des haltères ou une barre droite';

  @override
  String get ex_core_1_b1 =>
      'Renforce le core profond sans charge sur la colonne';

  @override
  String get ex_core_1_b2 => 'Améliore la posture et la stabilité lombaire';

  @override
  String get ex_core_1_b3 => 'Réduit le risque de blessures au dos';

  @override
  String get ex_core_2_b1 =>
      'Exercice de base pour l\'isolation du grand droit';

  @override
  String get ex_core_2_b2 => 'Facile à apprendre et à exécuter';

  @override
  String get ex_core_2_b3 =>
      'Base pour des exercices abdominaux plus exigeants';

  @override
  String get ex_core_3_b1 => 'Travaille le core inférieur avec haute intensité';

  @override
  String get ex_core_3_b2 =>
      'Améliore la force de préhension et la zone lombaire';

  @override
  String get ex_core_3_b3 =>
      'Progression : genoux fléchis → jambes tendues → L-sit';

  @override
  String get ex_core_4_b1 =>
      'L\'un des exercices de core les plus complets et exigeants';

  @override
  String get ex_core_4_b2 =>
      'Travaille le core en extension, différent des abdominaux classiques';

  @override
  String get ex_core_4_b3 =>
      'Développe la force fonctionnelle sur toute la chaîne antérieure';
}
