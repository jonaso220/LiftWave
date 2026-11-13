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
  String get common_discardChangesTitle => 'Ignorer les modifications ?';

  @override
  String get common_discardChangesBody =>
      'Les modifications effectuées ne seront pas enregistrées.';

  @override
  String get common_keepEditing => 'Continuer la modification';

  @override
  String get common_discard => 'Ignorer';

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
  String get muscle_crossfit => 'CrossFit';

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
  String get equipment_rings => 'Anneaux';

  @override
  String get equipment_box => 'Caisse pliométrique';

  @override
  String get equipment_rope => 'Corde';

  @override
  String get equipment_ball => 'Ballon';

  @override
  String get equipment_kettlebell => 'Kettlebell';

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
  String get nav_progress => 'Progrès';

  @override
  String get nav_profile => 'Profil';

  @override
  String get home_todayTitle => 'AU PROGRAMME AUJOURD\'HUI';

  @override
  String get home_inProgressTitle => 'ENTRAÎNEMENT EN COURS';

  @override
  String get home_continueWorkout => 'Reprendre l\'entraînement';

  @override
  String get home_chooseAnother => 'Choisir une autre séance';

  @override
  String get login_tagline => 'Votre appli fitness personnelle';

  @override
  String get login_continueGoogle => 'Continuer avec Google';

  @override
  String get login_continueApple => 'Continuer avec Apple';

  @override
  String get login_continueEmail => 'Continuer par e-mail';

  @override
  String get login_continueGuest => 'Continuer sans compte';

  @override
  String get guest_name => 'Invité';

  @override
  String get guest_saveProgressTitle => 'Sauvegardez votre progression';

  @override
  String get guest_saveProgressBody =>
      'Vous utilisez LiftWave en tant qu\'invité. Créez un compte gratuit pour ne pas perdre vos entraînements si vous changez de téléphone ou réinstallez l\'app.';

  @override
  String get guest_createAccount => 'Créer un compte';

  @override
  String get guest_notNow => 'Pas maintenant';

  @override
  String get guest_createAccountSubtitle =>
      'Créez un compte pour ne pas perdre votre progression';

  @override
  String get guest_accountCreated =>
      'Compte créé. Vos entraînements sont en sécurité.';

  @override
  String get guest_existingAccountTitle => 'Ce compte existe déjà';

  @override
  String get guest_existingAccountBody =>
      'Si vous vous connectez avec ce compte, les entraînements faits en tant qu\'invité n\'y seront pas transférés.';

  @override
  String get guest_signInAnyway => 'Se connecter quand même';

  @override
  String get guest_leave => 'Quitter le mode invité';

  @override
  String get guest_leaveBody =>
      'Comme vous n\'avez pas de compte, vos entraînements et données seront supprimés. Cette action est irréversible.';

  @override
  String train_reasonIncreaseLoad(int reps, String weight, int min, int max) {
    return 'Vous avez fait $reps répétitions à $weight, le haut de votre plage ($min–$max). Augmentez la charge.';
  }

  @override
  String train_reasonAddRep(int reps, String weight) {
    return 'Vous avez fait $reps répétitions à $weight. Ajoutez une répétition avant d\'augmenter la charge.';
  }

  @override
  String train_reasonConsolidate(int reps, String weight, int min, int max) {
    return 'Vous avez fait $reps répétitions, sous votre plage ($min–$max). Restez à $weight jusqu\'à atteindre $min.';
  }

  @override
  String train_reasonBodyweight(int reps) {
    return 'Vous avez fait $reps répétitions. Essayez d\'en faire une de plus.';
  }

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
  String get home_thisWeek => 'Cette semaine';

  @override
  String get home_weekTime => 'Temps hebdo';

  @override
  String get home_weekVolume => 'Volume hebdo';

  @override
  String get restTimer_title => 'Repos';

  @override
  String get restTimer_openControls =>
      'Ouvrir les commandes du minuteur de repos';

  @override
  String restTimer_addSeconds(int seconds) {
    return 'Ajouter $seconds secondes';
  }

  @override
  String restTimer_subtractSeconds(int seconds) {
    return 'Retirer $seconds secondes';
  }

  @override
  String get restTimer_pause => 'Mettre le minuteur en pause';

  @override
  String get restTimer_resume => 'Reprendre le minuteur';

  @override
  String get restTimer_dismiss => 'Fermer le minuteur';

  @override
  String get restTimer_reset => 'Réinitialiser le minuteur';

  @override
  String restTimer_preset(String time) {
    return 'Utiliser un repos de $time';
  }

  @override
  String get restTimer_resting => 'REPOS';

  @override
  String get restTimer_done => 'PRÊT !';

  @override
  String get home_lastWorkout => 'Dernier entraînement';

  @override
  String get home_repeatWorkout => 'Répéter l\'entraînement';

  @override
  String get editWorkout_title => 'Modifier l\'entraînement';

  @override
  String get editWorkout_saved => 'Entraînement mis à jour';

  @override
  String get detail_deleteWorkout => 'Supprimer l\'entraînement';

  @override
  String get detail_deleteWorkoutConfirm =>
      'Il sera retiré de votre historique. Cette action est irréversible.';

  @override
  String get detail_workoutDeleted => 'Entraînement supprimé';

  @override
  String get home_viewAll => 'Tout voir';

  @override
  String get home_goToTrain => 'Aller à Entraînement →';

  @override
  String get home_achievements => 'Succès';

  @override
  String get home_noAchievements =>
      'Terminez des entraînements pour débloquer des succès';

  @override
  String get home_exerciseLibrary => 'Bibliothèque d\'exercices';

  @override
  String get profile_proActive => 'Abonnement actif';

  @override
  String get profile_freePlan => 'Plan gratuit';

  @override
  String get profile_upgradePro => 'Passer à PRO';

  @override
  String get profile_restorePurchases => 'Restaurer les achats';

  @override
  String get profile_signOut => 'Se déconnecter';

  @override
  String get profile_deleteAccount => 'Supprimer le compte';

  @override
  String get progressScreen_deleteMeasurementTitle => 'Supprimer l\'entrée ?';

  @override
  String get progressScreen_deleteMeasurementBody =>
      'L\'entrée et sa photo seront supprimées. Cette action est irréversible.';

  @override
  String get profile_signOutConfirm =>
      'Se déconnecter ? Vos données restent enregistrées dans votre compte.';

  @override
  String get profile_deleteSubscriptionNote =>
      'Supprimer le compte n\'annule pas votre abonnement. Annulez-le d\'abord depuis la boutique.';

  @override
  String get profile_manageSubscription => 'Gérer l\'abonnement';

  @override
  String get profile_help => 'Aide et assistance';

  @override
  String get rest_alertTitle => 'Repos terminé';

  @override
  String get rest_alertBody => 'C\'est l\'heure de votre prochaine série.';

  @override
  String get rest_alertChannel => 'Minuteur de repos';

  @override
  String get profile_restAlert => 'Alerte à la fin du repos';

  @override
  String get profile_restAlertSubtitle =>
      'Notification sonore quand l\'app n\'est pas à l\'écran';

  @override
  String get profile_restAlertExact => 'Autoriser les alarmes exactes';

  @override
  String get profile_restAlertExactSubtitle =>
      'Sans cette autorisation, Android peut retarder l\'alerte';

  @override
  String get editWorkout_date => 'Date et heure';

  @override
  String get editWorkout_duration => 'Durée (min)';

  @override
  String get history_searchHint => 'Rechercher une séance ou un exercice';

  @override
  String get history_noResults => 'Aucun résultat';

  @override
  String get history_calendar => 'Calendrier';

  @override
  String get progress_oneRm => '1RM est.';

  @override
  String get progress_recordsTitle => 'Records';

  @override
  String get progress_bestLift => 'Charge maximale';

  @override
  String get progress_bestOneRm => 'Meilleur 1RM estimé';

  @override
  String get setType_title => 'Type de série';

  @override
  String get setType_normal => 'Normale';

  @override
  String get setType_warmup => 'Échauffement';

  @override
  String get setType_drop => 'Drop set';

  @override
  String get setType_failure => 'Jusqu\'à l\'échec';

  @override
  String get setType_warmupHint =>
      'Ne compte ni pour le volume ni pour les records';

  @override
  String get setType_warmupShort => 'É';

  @override
  String get setType_dropShort => 'D';

  @override
  String get setType_failureShort => 'F';

  @override
  String get plates_title => 'Calculateur de disques';

  @override
  String get plates_target => 'Poids total';

  @override
  String get plates_bar => 'Barre';

  @override
  String get plates_perSide => 'Par côté';

  @override
  String get plates_onlyBar => 'Barre seule';

  @override
  String get plates_belowBar => 'Le poids est inférieur à celui de la barre';

  @override
  String plates_missing(String amount) {
    return '$amount ne peuvent pas être chargés avec ces disques';
  }

  @override
  String get train_secondsHeader => 'SEC';

  @override
  String get train_secondsShort => 's';

  @override
  String get train_startHold => 'Démarrer';

  @override
  String get train_measureByTime => 'Mesurer en temps';

  @override
  String get train_measureByReps => 'Mesurer en répétitions';

  @override
  String get hold_running => 'EN COURS';

  @override
  String get hold_alertTitle => 'Temps écoulé';

  @override
  String get hold_alertBody => 'Série terminée.';

  @override
  String train_reasonHold(int seconds) {
    return 'Vous avez tenu $seconds s. Essayez d\'ajouter 5 s.';
  }

  @override
  String get superset_label => 'Superset';

  @override
  String get superset_linkNext => 'Superset avec le suivant';

  @override
  String get superset_unlink => 'Retirer du superset';

  @override
  String get superset_hint =>
      'Alternez les séries ; le repos commence à la fin du tour.';

  @override
  String get reminders_title => 'Rappels d\'entraînement';

  @override
  String get reminders_off => 'Désactivés';

  @override
  String get reminders_enable => 'Me rappeler de m\'entraîner';

  @override
  String get reminders_enableSubtitle => 'Une notification les jours choisis';

  @override
  String get reminders_days => 'Jours';

  @override
  String get reminders_time => 'Heure';

  @override
  String get reminders_notificationTitle => 'C\'est l\'heure de s\'entraîner';

  @override
  String get reminders_notificationBody => 'Votre séance du jour vous attend.';

  @override
  String reminders_notificationRoutine(String routine) {
    return 'Au programme aujourd\'hui : $routine';
  }

  @override
  String get reminders_permissionDenied =>
      'Activez les notifications de LiftWave dans les réglages du système pour recevoir des rappels.';

  @override
  String health_sync(String store) {
    return 'Synchroniser avec $store';
  }

  @override
  String health_syncSubtitle(String store) {
    return 'Enregistre dans $store les entraînements et le poids que vous saisissez';
  }

  @override
  String health_enabled(String store) {
    return 'C\'est fait. Vos prochains entraînements seront enregistrés dans $store.';
  }

  @override
  String health_denied(String store) {
    return 'Activation impossible. Vérifiez les autorisations de LiftWave dans $store.';
  }

  @override
  String get health_needsInstall =>
      'Installez ou mettez à jour Health Connect pour activer la synchronisation.';

  @override
  String get health_install => 'Installer';

  @override
  String health_unsupported(String store) {
    return '$store n\'est pas disponible sur cet appareil.';
  }

  @override
  String get profile_purchasesRestored => 'Achats restaurés avec succès';

  @override
  String get profile_noPurchasesFound => 'Aucun achat précédent trouvé';

  @override
  String get restore_connectionError =>
      'Pas de connexion. Vérifiez votre Internet et réessayez.';

  @override
  String get restore_unknownError => 'Restauration impossible. Réessayez.';

  @override
  String get profile_deleteTitle => 'Supprimer le compte';

  @override
  String get profile_deleteConfirm =>
      'Êtes-vous sûr ? Cette action est irréversible et toutes vos données seront supprimées.';

  @override
  String get profile_deleteReauthError =>
      'Pour supprimer votre compte, déconnectez-vous, reconnectez-vous et réessayez.';

  @override
  String get profile_trainingPreferences => 'Préférences d\'entraînement';

  @override
  String get profile_trainingPreferencesSubtitle =>
      'Objectif, expérience, jours et équipement';

  @override
  String get profile_appearance => 'Apparence';

  @override
  String get appearance_system => 'Automatique (selon le téléphone)';

  @override
  String get appearance_light => 'Clair';

  @override
  String get appearance_dark => 'Sombre';

  @override
  String get onboarding_title => 'Personnalisez votre entraînement';

  @override
  String get onboarding_goalTitle => 'Quel est votre objectif principal ?';

  @override
  String get onboarding_goalSubtitle =>
      'Nous l\'utiliserons pour adapter vos prochaines recommandations.';

  @override
  String get onboarding_goalMuscle => 'Prendre du muscle';

  @override
  String get onboarding_goalStrength => 'Gagner en force';

  @override
  String get onboarding_goalFatLoss => 'Perdre de la graisse';

  @override
  String get onboarding_goalFitness => 'Améliorer ma condition';

  @override
  String get onboarding_experienceTitle =>
      'Quel est votre niveau d\'expérience ?';

  @override
  String get onboarding_experienceSubtitle =>
      'Nous adapterons le volume et la progression à votre niveau.';

  @override
  String get onboarding_experienceBeginner => 'Débutant';

  @override
  String get onboarding_experienceBeginnerHint => 'Moins d\'un an';

  @override
  String get onboarding_experienceIntermediate => 'Intermédiaire';

  @override
  String get onboarding_experienceIntermediateHint => 'Entre 1 et 3 ans';

  @override
  String get onboarding_experienceAdvanced => 'Avancé';

  @override
  String get onboarding_experienceAdvancedHint => 'Plus de 3 ans';

  @override
  String get onboarding_daysTitle =>
      'Combien de jours pouvez-vous vous entraîner ?';

  @override
  String get onboarding_daysSubtitle =>
      'Choisissez une fréquence que vous pouvez maintenir.';

  @override
  String onboarding_daysSelected(int count) {
    return '$count jours par semaine';
  }

  @override
  String get onboarding_equipmentTitle => 'Quel équipement avez-vous ?';

  @override
  String get onboarding_equipmentSubtitle =>
      'Sélectionnez tout ce que vous pouvez utiliser régulièrement.';

  @override
  String get onboarding_continue => 'Continuer';

  @override
  String get onboarding_back => 'Retour';

  @override
  String get onboarding_finish => 'Enregistrer et commencer';

  @override
  String get onboarding_skip => 'Plus tard';

  @override
  String get onboarding_saved => 'Préférences enregistrées';

  @override
  String get weeklyPlan_title => 'Plan hebdomadaire';

  @override
  String weeklyPlan_sessions(int done, int total) {
    return '$done/$total séances';
  }

  @override
  String get weeklyPlan_adherence => 'Assiduité';

  @override
  String get weeklyPlan_remaining => 'Restantes';

  @override
  String get weeklyPlan_completedSets => 'Séries';

  @override
  String get weeklyPlan_muscleBalance => 'SÉRIES PAR MUSCLE';

  @override
  String get weeklyPlan_completed => 'Objectif hebdomadaire atteint. Bravo.';

  @override
  String get weeklyPlan_nextSession => 'PROCHAINE SÉANCE';

  @override
  String weeklyPlan_exerciseCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count exercices',
      one: '1 exercice',
    );
    return '$_temp0';
  }

  @override
  String get weeklyPlan_start => 'Commencer';

  @override
  String get weeklyPlan_noCompatible =>
      'Il n\'y a pas assez d\'exercices compatibles avec votre équipement.';

  @override
  String get weeklyPlan_adjustEquipment => 'Ajuster';

  @override
  String get weeklyPlan_setupTitle => 'Configurez votre plan';

  @override
  String get weeklyPlan_setupSubtitle =>
      'Complétez vos préférences pour recevoir une séance adaptée chaque semaine.';

  @override
  String get weeklyPlan_configure => 'Configurer';

  @override
  String get weeklyPlan_adaptiveName => 'Séance adaptative';

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
  String get train_readyToStart => 'Prêt à commencer';

  @override
  String get train_startSession => 'Démarrer';

  @override
  String get train_resumeTitle => 'Reprendre l\'entraînement ?';

  @override
  String train_resumeBody(String name) {
    return 'Vous avez un entraînement \"$name\" inachevé. Reprendre où vous vous êtes arrêté ?';
  }

  @override
  String get train_resumeContinue => 'Continuer';

  @override
  String get train_resumeDiscard => 'Abandonner';

  @override
  String get train_cancelWorkout => 'Abandonner l\'entraînement ?';

  @override
  String get train_cancelConfirm =>
      'Les séries enregistrées pendant cette séance seront perdues.';

  @override
  String get train_continue => 'Continuer la séance';

  @override
  String get train_addExerciseFirst =>
      'Ajoutez au moins un exercice avant de terminer.';

  @override
  String get train_completeSetFirst =>
      'Terminez au moins une série avant de finir.';

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
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count exercices',
      one: '1 exercice',
    );
    return '$_temp0';
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
  String train_deleteExerciseConfirm(String name) {
    return 'Supprimer \"$name\" ? Les séries terminées seront perdues.';
  }

  @override
  String get train_notesHint => 'Notes (facultatif)';

  @override
  String get train_setHeader => 'SÉRIE';

  @override
  String get train_repsHeader => 'REPS';

  @override
  String get train_weightHeader => 'POIDS';

  @override
  String get train_addSet => 'Ajouter une série';

  @override
  String get train_nextSuggestion => 'Prochaine charge suggérée';

  @override
  String get train_applySuggestion => 'Appliquer';

  @override
  String get train_abbreviationExercises => 'ex.';

  @override
  String get train_defaultRoutineName => 'Ma routine';

  @override
  String get train_createRoutine => 'Créer une routine';

  @override
  String get train_editRoutine => 'Modifier la routine';

  @override
  String train_routineUpdated(String name) {
    return 'Routine \"$name\" mise à jour';
  }

  @override
  String get train_addFirstExercise => 'Ajouter le premier exercice';

  @override
  String get train_addFirstExerciseHint =>
      'Touchez ici ou « Ajouter un exercice » pour ajouter le premier.';

  @override
  String get train_removeSet => 'Supprimer la série';

  @override
  String get train_routinesHint =>
      'Un jour peut contenir une ou plusieurs routines. En lançant le jour, elles s\'enchaînent dans l\'ordre.';

  @override
  String get train_firstRoutineTitle => 'Créez votre première routine';

  @override
  String get train_firstRoutineBody =>
      'Choisissez les exercices et un jour de la semaine : ce jour-là, elle apparaîtra sur l\'accueil, prête à démarrer.';

  @override
  String get train_freeSessionHint =>
      'Pas de programme ? Lancez une séance libre et ajoutez des exercices au fur et à mesure.';

  @override
  String get profile_keepScreenOn => 'Écran allumé pendant l\'entraînement';

  @override
  String get profile_keepScreenOnSubtitle =>
      'Empêche le téléphone de se verrouiller entre les séries';

  @override
  String get profile_weightUnit => 'Unité de poids';

  @override
  String get weightUnit_kg => 'Kilogrammes (kg)';

  @override
  String get weightUnit_lb => 'Livres (lb)';

  @override
  String get train_repShort => 'rép.';

  @override
  String get rest_label => 'Repos';

  @override
  String get rest_forExercise => 'Repos pour cet exercice';

  @override
  String get rest_default => 'Par défaut';

  @override
  String get rest_defaultHint =>
      'Utilise la durée choisie dans le minuteur de repos';

  @override
  String get train_newRecords => 'Nouveaux records';

  @override
  String train_recordLine(String weight, String previous) {
    return '$weight (avant $previous)';
  }

  @override
  String train_volumeUp(String kg) {
    return '+$kg de volume par rapport à la dernière fois';
  }

  @override
  String train_volumeDown(String kg) {
    return '$kg de volume en moins que la dernière fois';
  }

  @override
  String get train_volumeSame => 'Même volume que la dernière fois';

  @override
  String get train_discardWorkout => 'Abandonner';

  @override
  String get train_previousHeader => 'PRÉCÉDENT';

  @override
  String get train_usePrevious => 'Copier les valeurs précédentes';

  @override
  String get train_removeCompletedSetTitle => 'Supprimer la série terminée ?';

  @override
  String train_removeCompletedSetBody(int setNumber) {
    return 'La série $setNumber est terminée et ne comptera plus dans votre entraînement.';
  }

  @override
  String get train_createRoutineHint =>
      'Choisissez les exercices et préparez-la pour votre prochain entraînement.';

  @override
  String get train_routineNameRequired => 'Saisissez un nom pour la routine.';

  @override
  String train_addRoutineForDay(String day) {
    return 'Ajouter une autre routine pour $day';
  }

  @override
  String get train_trainingDay => 'Jour d\'entraînement';

  @override
  String get train_noAssignedDay => 'Aucun jour attribué';

  @override
  String get train_trainingDayHint =>
      'Regroupez-la par jour pour garder la routine complète ensemble.';

  @override
  String get train_organizeRoutine => 'Organiser la routine';

  @override
  String train_blockCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count blocs',
      one: '1 bloc',
    );
    return '$_temp0';
  }

  @override
  String get train_noRoutinesForDay =>
      'Il n\'y a pas encore de blocs pour ce jour.';

  @override
  String get train_reorderBlocksHint =>
      'Maintenez et faites glisser pour modifier l\'ordre.';

  @override
  String get train_startCompleteRoutine => 'Démarrer la routine complète';

  @override
  String train_routineForDay(String day) {
    return 'Routine du $day';
  }

  @override
  String get train_bodyweightLabel => 'Poids du corps';

  @override
  String get train_chooseWeight => 'Choisir le poids';

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
  String exercises_countLabel(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count exercices',
      one: '$count exercice',
    );
    return '$_temp0';
  }

  @override
  String get exercises_descriptionUnavailable =>
      'Les instructions détaillées ne sont pas encore disponibles dans cette langue.';

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
  String get history_weeklySummary => 'Résumé hebdomadaire';

  @override
  String get history_workouts => 'Entraînements';

  @override
  String get history_total => 'Total';

  @override
  String get history_volumeKg => 'Volume';

  @override
  String get history_routinesByDay => 'Routines par jour';

  @override
  String history_sessionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count séances',
      one: '1 séance',
    );
    return '$_temp0';
  }

  @override
  String history_dayRoutineTitle(String day) {
    return 'Entraînements du $day';
  }

  @override
  String get history_dayRoutineHint =>
      'Les blocs du même jour apparaissent ensemble et dans l\'ordre.';

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
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count séries',
      one: '1 série',
    );
    return '$_temp0';
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
  String get paywall_featureTemplates => 'Toutes les séances prédéfinies';

  @override
  String get paywall_featureMeasures =>
      'Tour de taille, poitrine, hanches et photos';

  @override
  String get paywall_featureExerciseProgress =>
      'Graphiques de progression par exercice';

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
  String get paywall_startTrial => 'Commencer l\'essai gratuit';

  @override
  String get paywall_subscribe => 'S\'abonner';

  @override
  String get paywall_restorePurchases => 'Restaurer les achats';

  @override
  String get paywall_legalText =>
      'L\'abonnement se renouvelle automatiquement. Vous pouvez annuler\nà tout moment depuis l\'App Store.';

  @override
  String get paywall_legalTextPlay =>
      'L\'abonnement se renouvelle automatiquement. Vous pouvez annuler\nà tout moment depuis Google Play.';

  @override
  String get paywall_legalTextTrial =>
      'L\'essai gratuit se transforme en abonnement payant. Annulez à tout moment avant la fin de l\'essai. L\'abonnement se renouvelle automatiquement.';

  @override
  String get paywall_termsLink => 'Conditions d\'utilisation';

  @override
  String get paywall_privacyLink => 'Politique de confidentialité';

  @override
  String get paywall_purchaseError => 'Impossible de finaliser l\'achat.';

  @override
  String get paywall_noPurchasesFound => 'Aucun achat précédent trouvé.';

  @override
  String paywall_trialDays(int count) {
    return '$count jours gratuits';
  }

  @override
  String paywall_trialMonths(int count) {
    return '$count mois gratuits';
  }

  @override
  String paywall_trialThenPrice(String price) {
    return 'puis $price';
  }

  @override
  String get paywall_offersUnavailable => 'Impossible de charger les offres';

  @override
  String get paywall_retry => 'Réessayer';

  @override
  String rest_of(String time) {
    return 'sur $time';
  }

  @override
  String get progressScreen_measurements => 'Mensurations';

  @override
  String get progressScreen_photos => 'Photos';

  @override
  String get progressScreen_addMeasurement => 'Ajouter une mesure';

  @override
  String get progressScreen_weight => 'Poids';

  @override
  String get progressScreen_noEntries => 'Pas encore de données';

  @override
  String get progressScreen_noPhotos => 'Pas encore de photos';

  @override
  String get progressScreen_camera => 'Appareil photo';

  @override
  String get progressScreen_gallery => 'Galerie';

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
  String get achievement_streak14_title => 'Série de 14 jours';

  @override
  String get achievement_streak14_description =>
      'Entraînez-vous au moins 1 fois pendant 14 jours consécutifs';

  @override
  String get achievement_streak100_title => 'Série de 100 jours';

  @override
  String get achievement_streak100_description =>
      'Maintenez la série 100 jours avec au moins 1 séance par semaine';

  @override
  String get achievement_streak365_title => 'Une année complète';

  @override
  String get achievement_streak365_description =>
      'Maintenez la série pendant 1 année entière';

  @override
  String get achievement_bench50_title => 'Développé 50 kg';

  @override
  String get achievement_bench50_description =>
      'Réussissez un développé couché à 50 kg ou plus';

  @override
  String get achievement_bench100_title => 'Développé 100 kg';

  @override
  String get achievement_bench100_description =>
      'Réussissez un développé couché à 100 kg ou plus';

  @override
  String get achievement_squat100_title => 'Squat 100 kg';

  @override
  String get achievement_squat100_description =>
      'Réussissez un squat à 100 kg ou plus';

  @override
  String get achievement_squat150_title => 'Squat 150 kg';

  @override
  String get achievement_squat150_description =>
      'Réussissez un squat à 150 kg ou plus';

  @override
  String get achievement_deadlift100_title => 'Soulevé de terre 100 kg';

  @override
  String get achievement_deadlift100_description =>
      'Réussissez un soulevé de terre à 100 kg ou plus';

  @override
  String get achievement_deadlift150_title => 'Soulevé de terre 150 kg';

  @override
  String get achievement_deadlift150_description =>
      'Réussissez un soulevé de terre à 150 kg ou plus';

  @override
  String get achievement_deadlift200_title => 'Soulevé de terre 200 kg';

  @override
  String get achievement_deadlift200_description =>
      'Réussissez un soulevé de terre à 200 kg ou plus';

  @override
  String get achievement_explorer10_title => 'Explorateur';

  @override
  String get achievement_explorer10_description =>
      'Utilisez 10 exercices différents dans vos entraînements';

  @override
  String get achievement_master25_title => 'Maître';

  @override
  String get achievement_master25_description =>
      'Utilisez 25 exercices différents dans vos entraînements';

  @override
  String get achievement_fullBodyGroups_title => 'Corps entier';

  @override
  String get achievement_fullBodyGroups_description =>
      'Entraînez chaque groupe musculaire au moins une fois';

  @override
  String get achievement_crossfitFan_title => 'Fan de CrossFit';

  @override
  String get achievement_crossfitFan_description =>
      'Complétez 10 exercices différents de la catégorie CrossFit';

  @override
  String get achievement_time1h_title => '1 heure au total';

  @override
  String get achievement_time1h_description =>
      'Accumulez 1 heure de temps d\'entraînement total';

  @override
  String get achievement_time10h_title => '10 heures';

  @override
  String get achievement_time10h_description =>
      'Accumulez 10 heures de temps d\'entraînement total';

  @override
  String get achievement_time50h_title => '50 heures';

  @override
  String get achievement_time50h_description =>
      'Accumulez 50 heures de temps d\'entraînement total';

  @override
  String get achievement_time100h_title => '100 heures';

  @override
  String get achievement_time100h_description =>
      'Accumulez 100 heures de temps d\'entraînement total';

  @override
  String get achievement_earlyBird_title => 'Lève-tôt';

  @override
  String get achievement_earlyBird_description =>
      'Commencez un entraînement avant 7h00';

  @override
  String get achievement_nightOwl_title => 'Couche-tard';

  @override
  String get achievement_nightOwl_description =>
      'Terminez un entraînement après 22h00';

  @override
  String get achievement_comeback_title => 'Retour';

  @override
  String get achievement_comeback_description =>
      'Reprenez l\'entraînement après 30+ jours d\'arrêt';

  @override
  String get achievement_marathoner_title => 'Marathonien';

  @override
  String get achievement_marathoner_description =>
      'Complétez un entraînement de plus de 90 minutes';

  @override
  String get achievement_efficient_title => 'Efficace';

  @override
  String get achievement_efficient_description =>
      'Complétez un entraînement de 3+ exercices en moins de 30 minutes';

  @override
  String get achievement_weekendWarrior_title => 'Guerrier du week-end';

  @override
  String get achievement_weekendWarrior_description =>
      'Entraînez-vous samedi et dimanche 3 week-ends de suite';

  @override
  String get achievement_weeklyVariety_title => 'Variété hebdomadaire';

  @override
  String get achievement_weeklyVariety_description =>
      'Entraînez 5 groupes musculaires différents en une semaine';

  @override
  String get csv_header =>
      'Date,Entraînement,Exercice,Groupe musculaire,Série,Reps,Poids (kg),Volume (kg)';

  @override
  String get csv_subject => 'LiftWave - Historique des entraînements';

  @override
  String get template_fullBody_subtitle =>
      'Tous les groupes musculaires en une séance';

  @override
  String get template_fullBody_name => 'Corps entier';

  @override
  String get template_push_name => 'Poussée';

  @override
  String get template_pull_name => 'Tirage';

  @override
  String get template_torso_name => 'Haut du corps';

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
  String get ex_pecho_6_name => 'Développé incliné à la barre';

  @override
  String get ex_pecho_6_desc =>
      'Réglez le banc à 30-45°. Saisissez la barre avec une prise un peu plus large que les épaules. Descendez la barre de manière contrôlée jusqu\'au haut de la poitrine puis poussez vers le haut jusqu\'à l\'extension complète. Gardez le bas du dos collé au banc et les omoplates serrées.';

  @override
  String get ex_pecho_6_b1 =>
      'Cible le haut des pectoraux (portion claviculaire)';

  @override
  String get ex_pecho_6_b2 =>
      'Permet de charger plus lourd qu\'avec des haltères';

  @override
  String get ex_pecho_6_b3 =>
      'Améliore la force de poussée sous des angles inclinés';

  @override
  String get ex_pecho_7_name => 'Développé décliné aux haltères';

  @override
  String get ex_pecho_7_desc =>
      'Réglez le banc à une déclinaison de 15-30°. Avec un haltère dans chaque main à hauteur de poitrine, poussez vers le haut en rapprochant les haltères en haut. Redescendez avec contrôle en sentant l\'étirement de la portion inférieure des pectoraux.';

  @override
  String get ex_pecho_7_b1 => 'Travaille la portion inférieure des pectoraux';

  @override
  String get ex_pecho_7_b2 => 'Réduit la sollicitation des épaules';

  @override
  String get ex_pecho_7_b3 =>
      'Plus grande amplitude que le développé décliné à la barre';

  @override
  String get ex_pecho_8_name => 'Pompes';

  @override
  String get ex_pecho_8_desc =>
      'Posez les mains au sol à largeur d\'épaules, pieds joints. Gardez le corps droit de la tête aux talons. Descendez en fléchissant les coudes jusqu\'à ce que la poitrine frôle presque le sol puis repoussez. Gardez le core engagé tout au long du mouvement.';

  @override
  String get ex_pecho_8_b1 => 'Ne nécessite aucun équipement';

  @override
  String get ex_pecho_8_b2 =>
      'Multiples variantes pour progresser (diamant, déclinées, claquées)';

  @override
  String get ex_pecho_8_b3 => 'Exercice composé qui renforce aussi le core';

  @override
  String get ex_pecho_9_name => 'Pull-over avec haltère';

  @override
  String get ex_pecho_9_desc =>
      'Allongez-vous sur un banc plat en tenant un haltère à deux mains au-dessus de la poitrine, bras tendus. Descendez l\'haltère en arc par-dessus la tête jusqu\'à sentir l\'étirement des pectoraux et des dorsaux. Revenez en position initiale en contractant les pectoraux.';

  @override
  String get ex_pecho_9_b1 =>
      'Travaille simultanément les pectoraux et les dorsaux';

  @override
  String get ex_pecho_9_b2 =>
      'Améliore la mobilité des épaules et de la cage thoracique';

  @override
  String get ex_pecho_9_b3 =>
      'Excellent complément entre les séries de développés et de rowings';

  @override
  String get ex_esp_6_name => 'Rowing T-bar';

  @override
  String get ex_esp_6_desc =>
      'Placez-vous au-dessus de la barre en T, pieds à largeur d\'épaules. Penchez-vous en avant en gardant le dos neutre et tirez les poignées vers la poitrine en amenant les coudes vers l\'arrière. Serrez les omoplates en position finale et redescendez avec contrôle.';

  @override
  String get ex_esp_6_b1 => 'Développe l\'épaisseur du milieu du dos';

  @override
  String get ex_esp_6_b2 =>
      'Permet des charges très lourdes avec moins de stress lombaire que le rowing libre';

  @override
  String get ex_esp_6_b3 => 'Travaille la posture et la stabilité scapulaire';

  @override
  String get ex_esp_7_name => 'Tirage horizontal à la poulie';

  @override
  String get ex_esp_7_desc =>
      'Asseyez-vous face à la poulie basse, pieds en appui. Saisissez l\'accessoire bras tendus et dos neutre. Tirez les mains vers l\'abdomen en rétractant les omoplates et en gardant le buste droit. Revenez de manière contrôlée sans arrondir le dos.';

  @override
  String get ex_esp_7_b1 => 'Tension constante tout au long du mouvement';

  @override
  String get ex_esp_7_b2 =>
      'Progression de charge facile et technique accessible';

  @override
  String get ex_esp_7_b3 =>
      'Excellent pour développer l\'épaisseur du milieu du dos';

  @override
  String get ex_esp_8_name => 'Shrugs aux haltères';

  @override
  String get ex_esp_8_desc =>
      'Debout avec un haltère dans chaque main le long du corps, bras relâchés. Élevez les épaules vers les oreilles sans plier les coudes. Maintenez la contraction 1 seconde en haut puis redescendez lentement. Ne faites pas rouler les épaules, le mouvement est purement vertical.';

  @override
  String get ex_esp_8_b1 => 'Isolation directe du trapèze supérieur';

  @override
  String get ex_esp_8_b2 => 'Améliore la posture et l\'apparence du cou';

  @override
  String get ex_esp_8_b3 =>
      'Renforce la stabilité scapulaire pour les autres mouvements de force';

  @override
  String get ex_esp_9_name => 'Good morning';

  @override
  String get ex_esp_9_desc =>
      'Placez la barre sur les trapèzes comme pour un squat. Pieds à largeur de hanches et genoux légèrement fléchis, penchez-vous en avant à partir des hanches en gardant le dos neutre. Descendez jusqu\'à ce que le buste soit presque parallèle au sol puis remontez en serrant les fessiers.';

  @override
  String get ex_esp_9_b1 =>
      'Renforce la chaîne postérieure et la zone lombaire';

  @override
  String get ex_esp_9_b2 =>
      'Améliore la charnière de hanche pour le soulevé de terre et le squat';

  @override
  String get ex_esp_9_b3 => 'Travail accessoire clé en powerlifting';

  @override
  String get ex_pier_6_name => 'Squat avant';

  @override
  String get ex_pier_6_desc =>
      'Placez la barre sur les deltoïdes antérieurs, coudes hauts, en prise croisée ou en prise clean. Pieds à largeur d\'épaules. Descendez en gardant le buste vertical et les coudes vers l\'avant jusqu\'à ce que les cuisses passent sous la parallèle. Poussez à travers les talons pour revenir en position initiale.';

  @override
  String get ex_pier_6_b1 =>
      'Sollicite davantage les quadriceps que le squat arrière';

  @override
  String get ex_pier_6_b2 => 'Exige un core très solide et une posture droite';

  @override
  String get ex_pier_6_b3 =>
      'Base technique du clean et du thruster en CrossFit';

  @override
  String get ex_pier_7_name => 'Fente bulgare';

  @override
  String get ex_pier_7_desc =>
      'Posez le cou-de-pied de la jambe arrière sur un banc, un haltère dans chaque main. Le pied avant avancé, descendez en fléchissant le genou avant jusqu\'à ce que la cuisse soit parallèle au sol. Poussez à travers le talon avant pour remonter.';

  @override
  String get ex_pier_7_b1 =>
      'Travail unilatéral qui corrige les déséquilibres entre les jambes';

  @override
  String get ex_pier_7_b2 =>
      'Activation intense des fessiers et des quadriceps';

  @override
  String get ex_pier_7_b3 =>
      'Améliore l\'équilibre et la stabilité de la hanche';

  @override
  String get ex_pier_8_name => 'Soulevé de terre roumain';

  @override
  String get ex_pier_8_desc =>
      'Debout avec la barre à hauteur de hanches, prise pronation à largeur d\'épaules. Genoux légèrement fléchis et fixes, faites glisser la barre le long des jambes en inclinant le buste à partir des hanches jusqu\'à sentir la tension dans les ischio-jambiers. Remontez en serrant les fessiers.';

  @override
  String get ex_pier_8_b1 =>
      'Isolation intense des ischio-jambiers et des fessiers';

  @override
  String get ex_pier_8_b2 =>
      'Renforce la chaîne postérieure et améliore la charnière de hanche';

  @override
  String get ex_pier_8_b3 =>
      'Réduit le risque de blessures aux ischio-jambiers en course ou en saut';

  @override
  String get ex_pier_9_name => 'Leg extension';

  @override
  String get ex_pier_9_desc =>
      'Asseyez-vous sur la machine, dos appuyé et rouleau sur le cou-de-pied. Étendez les genoux en soulevant la charge jusqu\'à ce que les jambes soient presque tendues, sans verrouiller les genoux. Contractez les quadriceps en haut et redescendez avec contrôle.';

  @override
  String get ex_pier_9_b1 => 'Isolation directe du quadriceps';

  @override
  String get ex_pier_9_b2 =>
      'Utile pour la rééducation et le travail d\'hypertrophie ciblé';

  @override
  String get ex_pier_9_b3 => 'Réglage de charge précis et à faible risque';

  @override
  String get ex_pier_10_name => 'Extension des mollets';

  @override
  String get ex_pier_10_desc =>
      'Placez les épaules sous les coussins de la machine à mollets (ou utilisez un haltère en position debout). Posez les pointes de pieds sur une plateforme, talons dans le vide. Montez en poussant sur les pointes et contractez les mollets en haut. Redescendez lentement en sentant l\'étirement.';

  @override
  String get ex_pier_10_b1 => 'Isolation du soléaire et des jumeaux';

  @override
  String get ex_pier_10_b2 => 'Améliore la puissance en saut et en sprint';

  @override
  String get ex_pier_10_b3 =>
      'Réduit le risque de blessures à la cheville et au tendon d\'Achille';

  @override
  String get ex_hom_5_name => 'Développé épaules aux haltères';

  @override
  String get ex_hom_5_desc =>
      'Assis, le dossier droit, tenez un haltère de chaque côté des épaules, paumes vers l\'avant. Poussez les haltères vers le haut jusqu\'à presque les joindre au-dessus de la tête, sans verrouiller les coudes. Redescendez avec contrôle jusqu\'à la position initiale.';

  @override
  String get ex_hom_5_b1 =>
      'Plus grande amplitude de mouvement que le développé à la barre';

  @override
  String get ex_hom_5_b2 => 'Permet de travailler chaque côté indépendamment';

  @override
  String get ex_hom_5_b3 =>
      'Réduit le stress sur les épaules par rapport à la barre';

  @override
  String get ex_hom_6_name => 'Élévations frontales';

  @override
  String get ex_hom_6_desc =>
      'Debout avec un haltère dans chaque main devant les cuisses, paumes vers le corps. Élevez les bras vers l\'avant, en alternance ou simultanément, jusqu\'à hauteur des épaules en gardant les coudes presque tendus. Redescendez lentement sans vous balancer.';

  @override
  String get ex_hom_6_b1 => 'Isolation du deltoïde antérieur';

  @override
  String get ex_hom_6_b2 => 'Améliore l\'apparence de l\'épaule vue de face';

  @override
  String get ex_hom_6_b3 =>
      'Travail accessoire du développé couché et du développé militaire';

  @override
  String get ex_hom_7_name => 'Oiseau aux haltères';

  @override
  String get ex_hom_7_desc =>
      'Penchez-vous en avant à partir des hanches, le buste presque parallèle au sol, un haltère dans chaque main et les bras pendants. Élevez les bras latéralement jusqu\'à hauteur des épaules, coudes légèrement fléchis. Contractez le deltoïde postérieur en haut et redescendez avec contrôle.';

  @override
  String get ex_hom_7_b1 =>
      'Isolation du deltoïde postérieur, zone clé pour la posture';

  @override
  String get ex_hom_7_b2 => 'Contrebalance les effets du travail de poussée';

  @override
  String get ex_hom_7_b3 =>
      'Réduit le risque de blessures de la coiffe des rotateurs';

  @override
  String get ex_bra_6_name => 'Curl au pupitre';

  @override
  String get ex_bra_6_desc =>
      'Asseyez-vous au pupitre, les bras en appui sur le coussin. Saisissez la barre (droite ou EZ) en prise supination. Fléchissez les coudes en amenant la barre vers les épaules, en contrôlant le mouvement. Redescendez lentement sans verrouiller les coudes en fin de mouvement.';

  @override
  String get ex_bra_6_b1 => 'Isole le biceps en immobilisant l\'épaule';

  @override
  String get ex_bra_6_b2 => 'Empêche d\'utiliser l\'élan, technique stricte';

  @override
  String get ex_bra_6_b3 => 'Excellent pour la contraction maximale du biceps';

  @override
  String get ex_bra_7_name => 'Curl concentré';

  @override
  String get ex_bra_7_desc =>
      'Asseyez-vous sur un banc, jambes écartées. Appuyez le coude du bras qui travaille contre la face interne de la cuisse, l\'haltère pendant. Fléchissez le coude en amenant l\'haltère vers l\'épaule, en isolant le biceps. Contractez en haut et redescendez avec contrôle.';

  @override
  String get ex_bra_7_b1 =>
      'Isolation pure du biceps avec contraction maximale';

  @override
  String get ex_bra_7_b2 =>
      'Permet de se concentrer sur la connexion esprit-muscle';

  @override
  String get ex_bra_7_b3 => 'Idéal comme exercice final de la séance bras';

  @override
  String get ex_bra_8_name => 'Développé couché prise serrée';

  @override
  String get ex_bra_8_desc =>
      'Allongez-vous sur un banc plat et saisissez la barre en prise serrée, à largeur d\'épaules. Descendez la barre de manière contrôlée jusqu\'à effleurer le sternum en gardant les coudes collés au corps. Poussez vers le haut en accentuant l\'extension des triceps.';

  @override
  String get ex_bra_8_b1 => 'Exercice composé qui cible les triceps';

  @override
  String get ex_bra_8_b2 =>
      'Permet de charger plus lourd qu\'un exercice d\'isolation des triceps';

  @override
  String get ex_bra_8_b3 =>
      'Transfert vers la force au développé couché et au développé militaire';

  @override
  String get ex_bra_9_name => 'Dips sur banc';

  @override
  String get ex_bra_9_desc =>
      'Posez les mains sur un banc derrière vous, doigts vers l\'avant. Étendez les jambes devant vous en appui sur les talons (ou genoux fléchis pour faciliter). Descendez en fléchissant les coudes vers l\'arrière jusqu\'à 90° puis poussez pour remonter.';

  @override
  String get ex_bra_9_b1 => 'Isolation des triceps sans équipement';

  @override
  String get ex_bra_9_b2 =>
      'Progression facile en ajoutant du poids sur les cuisses';

  @override
  String get ex_bra_9_b3 =>
      'Améliore la force de poussée dans les positions derrière le corps';

  @override
  String get ex_core_5_name => 'Russian twists';

  @override
  String get ex_core_5_desc =>
      'Assis au sol, genoux fléchis et pieds décollés ou posés, penchez-vous en arrière à 45°. Joignez les mains (ou tenez un poids) et tournez le buste d\'un côté à l\'autre en touchant le sol ou en amenant le poids de chaque côté. Gardez le core engagé.';

  @override
  String get ex_core_5_b1 => 'Isolation directe des obliques';

  @override
  String get ex_core_5_b2 =>
      'Améliore la rotation du buste, essentielle dans le sport';

  @override
  String get ex_core_5_b3 =>
      'Progression possible en ajoutant du poids (haltère, disque, ballon)';

  @override
  String get ex_core_6_name => 'Mountain climbers';

  @override
  String get ex_core_6_desc =>
      'Placez-vous en position de planche haute, mains sous les épaules. Ramenez un genou vers la poitrine en alternance et rapidement, comme si vous couriez sur place. Gardez les hanches basses et le core engagé tout au long du mouvement.';

  @override
  String get ex_core_6_b1 => 'Combine travail du core et cardio';

  @override
  String get ex_core_6_b2 =>
      'Ne nécessite aucun équipement, idéal pour le HIIT';

  @override
  String get ex_core_6_b3 => 'Améliore la coordination et l\'endurance';

  @override
  String get ex_core_7_name => 'Hollow hold';

  @override
  String get ex_core_7_desc =>
      'Allongez-vous sur le dos, bras tendus au-dessus de la tête et jambes tendues. Décollez légèrement les bras et les jambes du sol en plaquant le bas du dos contre le sol. Maintenez la position de « bateau » avec le core entièrement contracté.';

  @override
  String get ex_core_7_b1 => 'Base gymnique de nombreux mouvements de CrossFit';

  @override
  String get ex_core_7_b2 =>
      'Renforce l\'ensemble du core de manière isométrique';

  @override
  String get ex_core_7_b3 =>
      'Améliore la posture et la force pour les tractions strictes';

  @override
  String get ex_core_8_name => 'Gainage latéral';

  @override
  String get ex_core_8_desc =>
      'Allongez-vous sur le côté, en appui sur l\'avant-bras, le coude sous l\'épaule. Décollez les hanches du sol pour former une ligne droite des pieds à la tête. Maintenez la position sans laisser les hanches s\'affaisser. Répétez de l\'autre côté.';

  @override
  String get ex_core_8_b1 =>
      'Isolation intense des obliques et du core latéral';

  @override
  String get ex_core_8_b2 =>
      'Améliore la stabilité des hanches et de la colonne';

  @override
  String get ex_core_8_b3 => 'Sans équipement et à faible impact';

  @override
  String get ex_core_9_name => 'Dead bug';

  @override
  String get ex_core_9_desc =>
      'Allongez-vous sur le dos, bras tendus vers le plafond et genoux fléchis à 90° au-dessus des hanches. Descendez simultanément le bras droit derrière la tête et la jambe gauche tendue vers le sol. Revenez et alternez les côtés en gardant le bas du dos collé au sol.';

  @override
  String get ex_core_9_b1 => 'Améliore la stabilité anti-extension du core';

  @override
  String get ex_core_9_b2 =>
      'Excellent pour les débutants et la rééducation lombaire';

  @override
  String get ex_core_9_b3 => 'Travaille la coordination controlatérale';

  @override
  String get ex_cf_1_name => 'Épaulé (Clean)';

  @override
  String get ex_cf_1_desc =>
      'Depuis le sol, saisissez la barre en pronation juste à l\'extérieur des genoux. Tirez de manière explosive en étendant les hanches et les genoux, haussez les épaules et glissez le corps sous la barre pour la recevoir en squat avant, coudes hauts. Relevez-vous pour terminer le mouvement.';

  @override
  String get ex_cf_1_b1 =>
      'Mouvement d\'haltérophilie complet de puissance explosive';

  @override
  String get ex_cf_1_b2 =>
      'Développe simultanément coordination, vitesse et force';

  @override
  String get ex_cf_1_b3 => 'Base de nombreux WOD de CrossFit';

  @override
  String get ex_cf_2_name => 'Power Clean';

  @override
  String get ex_cf_2_desc =>
      'Identique au Clean mais sans réception en squat complet : vous recevez la barre en quart de squat, coudes hauts, en position frontale sur les épaules. Plus rapide et moins exigeant en mobilité que le Clean.';

  @override
  String get ex_cf_2_b1 =>
      'Développe la puissance explosive de la chaîne postérieure';

  @override
  String get ex_cf_2_b2 => 'Techniquement plus accessible que le Clean complet';

  @override
  String get ex_cf_2_b3 => 'Excellent pour les débutants en haltérophilie';

  @override
  String get ex_cf_3_name => 'Arraché (Snatch)';

  @override
  String get ex_cf_3_desc =>
      'Depuis le sol, saisissez la barre avec une prise très large. Tirez de manière explosive et recevez la barre au-dessus de la tête, bras tendus, en squat profond (overhead squat). Relevez-vous en gardant la barre en haut.';

  @override
  String get ex_cf_3_b1 =>
      'Le mouvement d\'haltérophilie le plus complet et le plus exigeant techniquement';

  @override
  String get ex_cf_3_b2 =>
      'Développe simultanément puissance, mobilité et stabilité';

  @override
  String get ex_cf_3_b3 =>
      'Brûle plus de calories que presque tout autre exercice';

  @override
  String get ex_cf_4_name => 'Power Snatch';

  @override
  String get ex_cf_4_desc =>
      'Identique au Snatch mais en recevant la barre en quart de squat, bras tendus au-dessus de la tête. Plus rapide et moins exigeant en mobilité des chevilles et des hanches.';

  @override
  String get ex_cf_4_b1 => 'Plus accessible que le Snatch complet';

  @override
  String get ex_cf_4_b2 =>
      'Développe la puissance explosive de la chaîne postérieure';

  @override
  String get ex_cf_4_b3 => 'Excellent pour la mobilité et la coordination';

  @override
  String get ex_cf_5_name => 'Thruster';

  @override
  String get ex_cf_5_desc =>
      'Tenez la barre en position frontale (sur les deltoïdes antérieurs). Réalisez un squat avant complet et, en remontant, utilisez l\'élan des jambes pour pousser la barre au-dessus de la tête, bras tendus. Ramenez la barre en position frontale et répétez.';

  @override
  String get ex_cf_5_b1 => 'Travaille tout le corps en un seul mouvement';

  @override
  String get ex_cf_5_b2 => 'Exercice phare de WOD comme « Fran »';

  @override
  String get ex_cf_5_b3 => 'Combine force et endurance métabolique';

  @override
  String get ex_cf_6_name => 'Push Press';

  @override
  String get ex_cf_6_desc =>
      'La barre en position frontale sur les épaules, effectuez un dip rapide en fléchissant légèrement les genoux. Étendez les jambes de manière explosive pour propulser la barre au-dessus de la tête jusqu\'à avoir les bras tendus. Redescendez avec contrôle en position initiale.';

  @override
  String get ex_cf_6_b1 =>
      'Permet de déplacer plus de charge que le développé militaire strict';

  @override
  String get ex_cf_6_b2 => 'Développe la puissance de poussée verticale';

  @override
  String get ex_cf_6_b3 =>
      'Transfert vers le Jerk et d\'autres mouvements d\'haltérophilie';

  @override
  String get ex_cf_7_name => 'Push Jerk';

  @override
  String get ex_cf_7_desc =>
      'Identique au Push Press mais, en propulsant la barre vers le haut, vous relâchez les jambes pour recevoir la barre en quart de squat, bras déjà tendus. Ensuite, relevez-vous pour terminer le mouvement. Permet de charger plus lourd que le Push Press.';

  @override
  String get ex_cf_7_b1 =>
      'Déplace plus de charge au-dessus de la tête que n\'importe quel développé';

  @override
  String get ex_cf_7_b2 =>
      'Mouvement d\'haltérophilie technique et de haute puissance';

  @override
  String get ex_cf_7_b3 => 'Composante du Clean & Jerk';

  @override
  String get ex_cf_8_name => 'Wall Balls';

  @override
  String get ex_cf_8_desc =>
      'Debout avec un médecine-ball devant la poitrine, face à un mur. Réalisez un squat profond et, en remontant, lancez le ballon vers une cible haute sur le mur (~3 m). Rattrapez le ballon à hauteur de poitrine et enchaînez immédiatement avec le squat suivant.';

  @override
  String get ex_cf_8_b1 =>
      'Exercice à la fois cardiovasculaire et de puissance';

  @override
  String get ex_cf_8_b2 =>
      'Mouvement standard dans de nombreux benchmarks de CrossFit';

  @override
  String get ex_cf_8_b3 => 'Travaille la coordination et le rythme';

  @override
  String get ex_cf_9_name => 'Kettlebell Swing américain';

  @override
  String get ex_cf_9_desc =>
      'Debout avec la kettlebell tenue à deux mains entre les jambes. Effectuez une charnière de hanche pour l\'amener vers l\'arrière puis étendez les hanches de manière explosive pour la propulser au-dessus de la tête, bras tendus. La force vient des hanches, pas des bras.';

  @override
  String get ex_cf_9_b1 => 'Développe la puissance explosive des hanches';

  @override
  String get ex_cf_9_b2 => 'Cardio et force en un seul mouvement';

  @override
  String get ex_cf_9_b3 =>
      'Standard en CrossFit (le swing russe ne monte que jusqu\'à la poitrine)';

  @override
  String get ex_cf_10_name => 'Kettlebell Swing russe';

  @override
  String get ex_cf_10_desc =>
      'Identique au swing américain mais la kettlebell ne monte que jusqu\'à hauteur de la poitrine ou des yeux, pas au-dessus de la tête. Techniquement plus facile et moins stressant pour les épaules.';

  @override
  String get ex_cf_10_b1 => 'Porte d\'entrée vers le travail avec kettlebell';

  @override
  String get ex_cf_10_b2 =>
      'Moins de stress sur les épaules que le swing américain';

  @override
  String get ex_cf_10_b3 =>
      'Idéal pour les débutants et les répétitions élevées';

  @override
  String get ex_cf_11_name => 'Box Jumps';

  @override
  String get ex_cf_11_desc =>
      'Face à une box ou une plateforme stable, fléchissez les genoux et sautez sur la box en atterrissant avec les pieds entièrement sur la surface. Étendez les hanches et les genoux en haut. Redescendez en sautant ou pas à pas pour réduire l\'impact.';

  @override
  String get ex_cf_11_b1 => 'Pliométrie pure pour développer la puissance';

  @override
  String get ex_cf_11_b2 => 'Améliore la détente verticale et l\'explosivité';

  @override
  String get ex_cf_11_b3 => 'Composante classique de nombreux WOD';

  @override
  String get ex_cf_12_name => 'Burpees';

  @override
  String get ex_cf_12_desc =>
      'Debout, accroupissez-vous et posez les mains au sol. Lancez les pieds vers l\'arrière d\'un saut pour arriver en position de planche. Réalisez une pompe en touchant le sol avec la poitrine. Ramenez les pieds vers les mains d\'un saut puis sautez à la verticale en tendant les bras vers le haut.';

  @override
  String get ex_cf_12_b1 => 'Exercice full-body sans équipement';

  @override
  String get ex_cf_12_b2 => 'Cardio intense et travail de force simultanés';

  @override
  String get ex_cf_12_b3 =>
      'Standard de benchmarks comme « Murph » et de nombreux WOD';

  @override
  String get ex_cf_13_name => 'Toes-to-Bar';

  @override
  String get ex_cf_13_desc =>
      'Suspendez-vous à la barre en pronation. Activez les dorsaux et élevez les jambes tendues (ou légèrement fléchies) jusqu\'à toucher la barre avec les pieds. Redescendez avec contrôle sans balancement excessif. Utilisez le « kip » pour garder la cadence.';

  @override
  String get ex_cf_13_b1 => 'Travail dynamique du core très exigeant';

  @override
  String get ex_cf_13_b2 => 'Améliore la force de préhension et les dorsaux';

  @override
  String get ex_cf_13_b3 => 'Composante de nombreux WOD de CrossFit';

  @override
  String get ex_cf_14_name => 'Knees-to-Elbow';

  @override
  String get ex_cf_14_desc =>
      'Suspendez-vous à la barre en pronation. Fléchissez les hanches et les genoux en amenant les genoux vers les coudes dans un mouvement dynamique et contrôlé. Redescendez avec contrôle. Utile comme progression vers les Toes-to-Bar.';

  @override
  String get ex_cf_14_b1 => 'Progression vers les Toes-to-Bar';

  @override
  String get ex_cf_14_b2 =>
      'Travail dynamique du core moins exigeant techniquement';

  @override
  String get ex_cf_14_b3 => 'Améliore la force de préhension';

  @override
  String get ex_cf_15_name => 'Muscle-Up';

  @override
  String get ex_cf_15_desc =>
      'Suspendez-vous aux anneaux (ou à la barre) en fausse prise. Tirez le corps vers le haut de manière explosive en effectuant une transition au-dessus des anneaux et, en haut, poussez en tendant les bras jusqu\'à vous retrouver en appui. Redescendez en contrôlant la transition inverse.';

  @override
  String get ex_cf_15_b1 => 'Mouvement gymnique avancé de tirage + poussée';

  @override
  String get ex_cf_15_b2 => 'Étape clé en CrossFit (RX dans de nombreux WOD)';

  @override
  String get ex_cf_15_b3 =>
      'Développe une force relative au poids du corps extrême';

  @override
  String get ex_cf_16_name => 'Pistol Squat';

  @override
  String get ex_cf_16_desc =>
      'Debout sur une jambe, tendez l\'autre devant vous, parallèle au sol. Descendez en squat profond en gardant l\'équilibre et le pied d\'appui à plat. Remontez en poussant sur le talon sans que la jambe libre touche le sol. Répétez de l\'autre côté.';

  @override
  String get ex_cf_16_b1 => 'Squat unilatéral de difficulté maximale';

  @override
  String get ex_cf_16_b2 =>
      'Développe la mobilité de la cheville et de la hanche';

  @override
  String get ex_cf_16_b3 => 'Travail unilatéral qui corrige les asymétries';

  @override
  String get ex_cf_17_name => 'Handstand Push-Up (HSPU)';

  @override
  String get ex_cf_17_desc =>
      'Posez les mains au sol à environ 30 cm d\'un mur et lancez les jambes vers le haut pour vous retrouver en équilibre sur les mains contre le mur. Descendez en fléchissant les coudes jusqu\'à ce que la tête touche le sol (ou un abmat). Poussez pour remonter. Utilisez le « kip » si vous avez besoin d\'aide.';

  @override
  String get ex_cf_17_b1 => 'Développé vertical avec tout le poids du corps';

  @override
  String get ex_cf_17_b2 => 'Améliore la stabilité des épaules et du core';

  @override
  String get ex_cf_17_b3 => 'Étape gymnique clé en CrossFit';

  @override
  String get ex_cf_18_name => 'Turkish Get-Up';

  @override
  String get ex_cf_18_desc =>
      'Allongez-vous sur le dos en tenant une kettlebell, un bras tendu vers le plafond. Relevez-vous étape par étape (coude → main → charnière de hanche → passage de jambe → à genoux → debout) en gardant toujours la kettlebell en haut. Inversez le mouvement.';

  @override
  String get ex_cf_18_b1 => 'Mouvement fonctionnel unique pour tout le corps';

  @override
  String get ex_cf_18_b2 =>
      'Améliore la mobilité, la stabilité et la coordination';

  @override
  String get ex_cf_18_b3 => 'Excellent travail des épaules et du core';

  @override
  String get ex_cf_19_name => 'Double Unders';

  @override
  String get ex_cf_19_desc =>
      'Sautez à la corde en la faisant passer deux fois sous les pieds à chaque saut. Gardez des sauts bas et un rythme de poignet rapide. Bras collés au corps, coudes près de la taille. Demande de la coordination et une corde de vitesse.';

  @override
  String get ex_cf_19_b1 => 'Cardio explosif de haute intensité';

  @override
  String get ex_cf_19_b2 => 'Améliore la coordination et le timing';

  @override
  String get ex_cf_19_b3 => 'Standard dans des centaines de WOD de CrossFit';

  @override
  String get ex_cf_20_name => 'Farmer\'s Carry';

  @override
  String get ex_cf_20_desc =>
      'Tenez un haltère ou une kettlebell lourde dans chaque main le long du corps. Marchez à petits pas en gardant une posture droite, épaules en arrière et core engagé. Parcourez une distance donnée ou travaillez au temps.';

  @override
  String get ex_cf_20_b1 => 'Renforce la préhension et les avant-bras';

  @override
  String get ex_cf_20_b2 => 'Travail fonctionnel de tout le corps';

  @override
  String get ex_cf_20_b3 => 'Améliore la posture et la stabilité du core';

  @override
  String get ex_cf_21_name => 'Goblet Squat';

  @override
  String get ex_cf_21_desc =>
      'Tenez une kettlebell (ou un haltère) devant la poitrine à hauteur du sternum, en la saisissant par les « cornes ». Réalisez un squat profond en gardant le buste vertical et les coudes vers l\'avant. Poussez à travers les talons pour remonter.';

  @override
  String get ex_cf_21_b1 => 'Porte d\'entrée idéale vers le squat avec charge';

  @override
  String get ex_cf_21_b2 =>
      'Enseigne une posture droite et une profondeur correcte';

  @override
  String get ex_cf_21_b3 => 'Excellent pour activer le core';

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
