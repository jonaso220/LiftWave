// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class SDe extends S {
  SDe([String locale = 'de']) : super(locale);

  @override
  String get common_cancel => 'Abbrechen';

  @override
  String get common_delete => 'Löschen';

  @override
  String get common_save => 'Speichern';

  @override
  String get common_or => 'oder';

  @override
  String get common_today => 'Heute';

  @override
  String get common_yesterday => 'Gestern';

  @override
  String common_daysAgo(int count) {
    return 'Vor $count Tagen';
  }

  @override
  String get common_exercises => 'Übungen';

  @override
  String get common_sets => 'Sätze';

  @override
  String get common_volume => 'Volumen';

  @override
  String get common_reps => 'Wdh.';

  @override
  String get common_weight => 'Gewicht';

  @override
  String get common_duration => 'Dauer';

  @override
  String get common_bodyweight => 'Körpergewicht';

  @override
  String get common_custom => 'CUSTOM';

  @override
  String get common_discardChangesTitle => 'Änderungen verwerfen?';

  @override
  String get common_discardChangesBody =>
      'Deine Änderungen werden nicht gespeichert.';

  @override
  String get common_keepEditing => 'Weiter bearbeiten';

  @override
  String get common_discard => 'Verwerfen';

  @override
  String get muscle_all => 'Alle';

  @override
  String get muscle_chest => 'Brust';

  @override
  String get muscle_back => 'Rücken';

  @override
  String get muscle_legs => 'Beine';

  @override
  String get muscle_shoulders => 'Schultern';

  @override
  String get muscle_arms => 'Arme';

  @override
  String get muscle_core => 'Core';

  @override
  String get muscle_crossfit => 'CrossFit';

  @override
  String get equipment_all => 'Alle';

  @override
  String get equipment_barbell => 'Langhantel';

  @override
  String get equipment_dumbbells => 'Kurzhanteln';

  @override
  String get equipment_machine => 'Maschine';

  @override
  String get equipment_cable => 'Kabelzug';

  @override
  String get equipment_bodyweight => 'Körpergewicht';

  @override
  String get equipment_pullupBar => 'Klimmzugstange';

  @override
  String get equipment_noEquipment => 'Ohne Geräte';

  @override
  String get equipment_parallelBars => 'Barren';

  @override
  String get equipment_rings => 'Ringe';

  @override
  String get equipment_box => 'Plyobox';

  @override
  String get equipment_rope => 'Seil';

  @override
  String get equipment_ball => 'Ball';

  @override
  String get equipment_kettlebell => 'Kettlebell';

  @override
  String get difficulty_beginner => 'Anfänger';

  @override
  String get difficulty_intermediate => 'Fortgeschritten';

  @override
  String get difficulty_advanced => 'Profi';

  @override
  String get nav_home => 'Start';

  @override
  String get nav_train => 'Training';

  @override
  String get nav_progress => 'Fortschritt';

  @override
  String get nav_profile => 'Profil';

  @override
  String get home_todayTitle => 'HEUTE DRAN';

  @override
  String get home_inProgressTitle => 'TRAINING LÄUFT';

  @override
  String get home_continueWorkout => 'Training fortsetzen';

  @override
  String get home_chooseAnother => 'Anderes Training wählen';

  @override
  String get login_tagline => 'Deine persönliche Fitness-App';

  @override
  String get login_continueGoogle => 'Weiter mit Google';

  @override
  String get login_continueApple => 'Weiter mit Apple';

  @override
  String get login_continueEmail => 'Weiter mit E-Mail';

  @override
  String get login_continueGuest => 'Ohne Konto fortfahren';

  @override
  String get guest_name => 'Gast';

  @override
  String get guest_saveProgressTitle => 'Sichere deinen Fortschritt';

  @override
  String get guest_saveProgressBody =>
      'Du nutzt LiftWave als Gast. Erstelle ein kostenloses Konto, damit deine Trainings beim Handywechsel oder bei einer Neuinstallation nicht verloren gehen.';

  @override
  String get guest_createAccount => 'Konto erstellen';

  @override
  String get guest_notNow => 'Nicht jetzt';

  @override
  String get guest_createAccountSubtitle =>
      'Erstelle ein Konto, damit dein Fortschritt nicht verloren geht';

  @override
  String get guest_accountCreated =>
      'Konto erstellt. Deine Trainings sind gesichert.';

  @override
  String get guest_existingAccountTitle => 'Dieses Konto existiert bereits';

  @override
  String get guest_existingAccountBody =>
      'Wenn du dich damit anmeldest, werden deine Gast-Trainings nicht in dieses Konto übernommen.';

  @override
  String get guest_signInAnyway => 'Trotzdem anmelden';

  @override
  String get guest_leave => 'Gastmodus verlassen';

  @override
  String get guest_leaveBody =>
      'Da du kein Konto hast, werden deine Trainings und Daten gelöscht. Das kann nicht rückgängig gemacht werden.';

  @override
  String train_reasonIncreaseLoad(int reps, String weight, int min, int max) {
    return 'Du hast $reps Wdh. mit $weight geschafft, das Maximum deines Bereichs ($min–$max). Zeit, das Gewicht zu erhöhen.';
  }

  @override
  String train_reasonAddRep(int reps, String weight) {
    return 'Du hast $reps Wdh. mit $weight geschafft. Schaffe eine Wdh. mehr, bevor du das Gewicht erhöhst.';
  }

  @override
  String train_reasonConsolidate(int reps, String weight, int min, int max) {
    return 'Du hast $reps Wdh. geschafft, unter deinem Bereich ($min–$max). Bleib bei $weight, bis du $min erreichst.';
  }

  @override
  String train_reasonBodyweight(int reps) {
    return 'Du hast $reps Wdh. geschafft. Versuche eine mehr.';
  }

  @override
  String get login_legalPrefix => 'Mit der Nutzung akzeptierst du unsere ';

  @override
  String get login_termsLink => 'Nutzungsbedingungen';

  @override
  String get login_legalAnd => 'und';

  @override
  String get login_privacyLink => 'Datenschutzrichtlinie';

  @override
  String get login_googleError => 'Anmeldung mit Google fehlgeschlagen.';

  @override
  String get login_appleError => 'Anmeldung mit Apple fehlgeschlagen.';

  @override
  String get emailAuth_titleLogin => 'Anmelden';

  @override
  String get emailAuth_titleRegister => 'Konto erstellen';

  @override
  String get emailAuth_greetingLogin => 'Schön, dich wiederzusehen';

  @override
  String get emailAuth_greetingRegister => 'Willkommen!';

  @override
  String get emailAuth_subtitleLogin => 'Melde dich mit E-Mail und Passwort an';

  @override
  String get emailAuth_subtitleRegister => 'Erstelle dein Konto, um loszulegen';

  @override
  String get emailAuth_nameLabel => 'Name';

  @override
  String get emailAuth_nameHint => 'Dein Name';

  @override
  String get emailAuth_nameError => 'Bitte gib deinen Namen ein';

  @override
  String get emailAuth_emailLabel => 'E-Mail';

  @override
  String get emailAuth_emailHint => 'mail@beispiel.de';

  @override
  String get emailAuth_emailErrorEmpty => 'Bitte gib deine E-Mail ein';

  @override
  String get emailAuth_emailErrorInvalid => 'Ungültige E-Mail-Adresse';

  @override
  String get emailAuth_passwordLabel => 'Passwort';

  @override
  String get emailAuth_passwordHintLogin => 'Dein Passwort';

  @override
  String get emailAuth_passwordHintRegister => 'Mindestens 6 Zeichen';

  @override
  String get emailAuth_passwordErrorEmpty => 'Bitte gib dein Passwort ein';

  @override
  String get emailAuth_passwordErrorShort => 'Mindestens 6 Zeichen';

  @override
  String get emailAuth_forgotPassword => 'Passwort vergessen?';

  @override
  String get emailAuth_hasAccount => 'Bereits ein Konto? ';

  @override
  String get emailAuth_noAccount => 'Noch kein Konto? ';

  @override
  String get emailAuth_loginLink => 'Anmelden';

  @override
  String get emailAuth_registerLink => 'Registrieren';

  @override
  String get emailAuth_unexpectedError =>
      'Unerwarteter Fehler. Bitte versuche es erneut.';

  @override
  String get emailAuth_emailFirst => 'Gib zuerst deine E-Mail ein.';

  @override
  String emailAuth_resetSent(String email) {
    return 'Wiederherstellungs-E-Mail an $email gesendet';
  }

  @override
  String get emailAuth_resetError =>
      'Die Wiederherstellungs-E-Mail konnte nicht gesendet werden.';

  @override
  String get authError_userNotFound => 'Es gibt kein Konto mit dieser E-Mail.';

  @override
  String get authError_wrongPassword => 'Falsches Passwort.';

  @override
  String get authError_emailAlreadyInUse =>
      'Diese E-Mail ist bereits registriert.';

  @override
  String get authError_weakPassword =>
      'Das Passwort ist zu schwach (mindestens 6 Zeichen).';

  @override
  String get authError_invalidEmail => 'Die E-Mail-Adresse ist ungültig.';

  @override
  String get authError_tooManyRequests =>
      'Zu viele Versuche. Bitte warte einige Minuten.';

  @override
  String get authError_networkFailed => 'Keine Internetverbindung.';

  @override
  String get authError_default =>
      'Anmeldung fehlgeschlagen. Bitte versuche es erneut.';

  @override
  String home_greetingMorning(String name) {
    return 'Guten Morgen, $name!';
  }

  @override
  String get home_greetingMorningNoName => 'Guten Morgen!';

  @override
  String home_greetingAfternoon(String name) {
    return 'Guten Tag, $name!';
  }

  @override
  String get home_greetingAfternoonNoName => 'Guten Tag!';

  @override
  String home_greetingEvening(String name) {
    return 'Guten Abend, $name!';
  }

  @override
  String get home_greetingEveningNoName => 'Guten Abend!';

  @override
  String get home_weekMotivationZero =>
      'Du hast diese Woche noch nicht trainiert. Leg los!';

  @override
  String get home_weekMotivationOne => '1 Training diese Woche. Weiter so!';

  @override
  String home_weekMotivationMany(int count) {
    return '$count Trainings diese Woche. Weiter so!';
  }

  @override
  String get home_thisWeek => 'Diese Woche';

  @override
  String get home_weekTime => 'Wochenzeit';

  @override
  String get home_weekVolume => 'Wochenvolumen';

  @override
  String get restTimer_title => 'Pause';

  @override
  String get restTimer_openControls => 'Steuerung des Pausentimers öffnen';

  @override
  String restTimer_addSeconds(int seconds) {
    return '$seconds Sekunden hinzufügen';
  }

  @override
  String restTimer_subtractSeconds(int seconds) {
    return '$seconds Sekunden abziehen';
  }

  @override
  String get restTimer_pause => 'Timer pausieren';

  @override
  String get restTimer_resume => 'Timer fortsetzen';

  @override
  String get restTimer_dismiss => 'Timer schließen';

  @override
  String get restTimer_reset => 'Timer zurücksetzen';

  @override
  String restTimer_preset(String time) {
    return 'Pause von $time verwenden';
  }

  @override
  String get restTimer_resting => 'PAUSE';

  @override
  String get restTimer_done => 'FERTIG!';

  @override
  String get home_lastWorkout => 'Letztes Training';

  @override
  String get home_repeatWorkout => 'Training wiederholen';

  @override
  String get editWorkout_title => 'Training bearbeiten';

  @override
  String get editWorkout_saved => 'Training aktualisiert';

  @override
  String get detail_deleteWorkout => 'Training löschen';

  @override
  String get detail_deleteWorkoutConfirm =>
      'Es wird aus deinem Verlauf entfernt. Das kann nicht rückgängig gemacht werden.';

  @override
  String get detail_workoutDeleted => 'Training gelöscht';

  @override
  String get home_viewAll => 'Alle anzeigen';

  @override
  String get home_goToTrain => 'Zum Training →';

  @override
  String get home_achievements => 'Erfolge';

  @override
  String get home_noAchievements =>
      'Schließe Trainings ab, um Erfolge freizuschalten';

  @override
  String get home_exerciseLibrary => 'Übungsbibliothek';

  @override
  String get profile_proActive => 'Abo aktiv';

  @override
  String get profile_freePlan => 'Kostenloser Plan';

  @override
  String get profile_upgradePro => 'Auf PRO upgraden';

  @override
  String get profile_restorePurchases => 'Käufe wiederherstellen';

  @override
  String get profile_signOut => 'Abmelden';

  @override
  String get profile_deleteAccount => 'Konto löschen';

  @override
  String get progressScreen_deleteMeasurementTitle => 'Eintrag löschen?';

  @override
  String get progressScreen_deleteMeasurementBody =>
      'Der Eintrag und sein Foto werden gelöscht. Das kann nicht rückgängig gemacht werden.';

  @override
  String get profile_signOutConfirm =>
      'Abmelden? Deine Daten bleiben in deinem Konto gespeichert.';

  @override
  String get profile_deleteSubscriptionNote =>
      'Das Löschen des Kontos kündigt dein Abo nicht. Kündige es vorher im Store.';

  @override
  String get profile_manageSubscription => 'Abo verwalten';

  @override
  String get profile_help => 'Hilfe & Support';

  @override
  String get rest_alertTitle => 'Pause beendet';

  @override
  String get rest_alertBody => 'Zeit für deinen nächsten Satz.';

  @override
  String get rest_alertChannel => 'Pausentimer';

  @override
  String get profile_restAlert => 'Hinweis am Ende der Pause';

  @override
  String get profile_restAlertSubtitle =>
      'Benachrichtigung mit Ton, wenn die App nicht im Vordergrund ist';

  @override
  String get profile_restAlertExact => 'Exakte Alarme erlauben';

  @override
  String get profile_restAlertExactSubtitle =>
      'Ohne diese Berechtigung kann Android den Hinweis verzögern';

  @override
  String get editWorkout_date => 'Datum und Uhrzeit';

  @override
  String get editWorkout_duration => 'Dauer (Min.)';

  @override
  String get history_searchHint => 'Training oder Übung suchen';

  @override
  String get history_noResults => 'Keine Ergebnisse';

  @override
  String get history_calendar => 'Kalender';

  @override
  String get progress_oneRm => '1RM (gesch.)';

  @override
  String get progress_recordsTitle => 'Rekorde';

  @override
  String get progress_bestLift => 'Schwerster Satz';

  @override
  String get progress_bestOneRm => 'Bestes geschätztes 1RM';

  @override
  String get setType_title => 'Satztyp';

  @override
  String get setType_normal => 'Normal';

  @override
  String get setType_warmup => 'Aufwärmen';

  @override
  String get setType_drop => 'Dropsatz';

  @override
  String get setType_failure => 'Bis zum Muskelversagen';

  @override
  String get setType_warmupHint => 'Zählt nicht für Volumen oder Rekorde';

  @override
  String get setType_warmupShort => 'A';

  @override
  String get setType_dropShort => 'D';

  @override
  String get setType_failureShort => 'V';

  @override
  String get plates_title => 'Scheibenrechner';

  @override
  String get plates_target => 'Gesamtgewicht';

  @override
  String get plates_bar => 'Stange';

  @override
  String get plates_perSide => 'Pro Seite';

  @override
  String get plates_onlyBar => 'Nur die Stange';

  @override
  String get plates_belowBar => 'Das Gewicht ist geringer als die Stange';

  @override
  String plates_missing(String amount) {
    return '$amount lassen sich mit diesen Scheiben nicht auflegen';
  }

  @override
  String get train_secondsHeader => 'SEK';

  @override
  String get train_secondsShort => 's';

  @override
  String get train_startHold => 'Start';

  @override
  String get train_measureByTime => 'Nach Zeit erfassen';

  @override
  String get train_measureByReps => 'Nach Wiederholungen erfassen';

  @override
  String get hold_running => 'LÄUFT';

  @override
  String get hold_alertTitle => 'Zeit abgelaufen';

  @override
  String get hold_alertBody => 'Satz geschafft.';

  @override
  String train_reasonHold(int seconds) {
    return 'Du hast $seconds s gehalten. Versuche 5 s mehr.';
  }

  @override
  String get superset_label => 'Supersatz';

  @override
  String get superset_linkNext => 'Supersatz mit nächster Übung';

  @override
  String get superset_unlink => 'Aus Supersatz entfernen';

  @override
  String get superset_hint =>
      'Wechsle die Sätze ab; die Pause beginnt nach der Runde.';

  @override
  String get widget_today => 'Heute';

  @override
  String widget_weekOfTarget(String done, String target) {
    return '$done/$target diese Woche';
  }

  @override
  String get widget_weekOne => '1 Training diese Woche';

  @override
  String widget_weekOther(String count) {
    return '$count Trainings diese Woche';
  }

  @override
  String get reminders_title => 'Trainingserinnerungen';

  @override
  String get reminders_off => 'Aus';

  @override
  String get reminders_enable => 'Ans Training erinnern';

  @override
  String get reminders_enableSubtitle =>
      'Eine Benachrichtigung an den gewählten Tagen';

  @override
  String get reminders_days => 'Tage';

  @override
  String get reminders_time => 'Uhrzeit';

  @override
  String get reminders_notificationTitle => 'Zeit fürs Training';

  @override
  String get reminders_notificationBody =>
      'Dein heutiges Training wartet auf dich.';

  @override
  String reminders_notificationRoutine(String routine) {
    return 'Heute dran: $routine';
  }

  @override
  String get reminders_permissionDenied =>
      'Aktiviere die Benachrichtigungen für LiftWave in den Systemeinstellungen, um Erinnerungen zu erhalten.';

  @override
  String health_sync(String store) {
    return 'Mit $store synchronisieren';
  }

  @override
  String health_syncSubtitle(String store) {
    return 'Speichert deine erfassten Trainings und dein Körpergewicht in $store';
  }

  @override
  String health_enabled(String store) {
    return 'Fertig. Deine nächsten Trainings werden in $store gespeichert.';
  }

  @override
  String health_denied(String store) {
    return 'Aktivierung nicht möglich. Prüfe die Berechtigungen von LiftWave in $store.';
  }

  @override
  String get health_needsInstall =>
      'Installiere oder aktualisiere Health Connect, um die Synchronisierung zu aktivieren.';

  @override
  String get health_install => 'Installieren';

  @override
  String health_unsupported(String store) {
    return '$store ist auf diesem Gerät nicht verfügbar.';
  }

  @override
  String get profile_purchasesRestored => 'Käufe erfolgreich wiederhergestellt';

  @override
  String get profile_noPurchasesFound => 'Keine früheren Käufe gefunden';

  @override
  String get restore_connectionError =>
      'Keine Verbindung. Prüfe dein Internet und versuche es erneut.';

  @override
  String get restore_unknownError =>
      'Wiederherstellung fehlgeschlagen. Versuche es erneut.';

  @override
  String get profile_deleteTitle => 'Konto löschen';

  @override
  String get profile_deleteConfirm =>
      'Bist du sicher? Diese Aktion ist unwiderruflich und alle deine Daten werden gelöscht.';

  @override
  String get profile_deleteReauthError =>
      'Um dein Konto zu löschen, melde dich ab, erneut an und versuche es nochmal.';

  @override
  String get profile_trainingPreferences => 'Trainingseinstellungen';

  @override
  String get profile_trainingPreferencesSubtitle =>
      'Ziel, Erfahrung, Tage und Ausrüstung';

  @override
  String get profile_appearance => 'Darstellung';

  @override
  String get appearance_system => 'Automatisch (wie Telefon)';

  @override
  String get appearance_light => 'Hell';

  @override
  String get appearance_dark => 'Dunkel';

  @override
  String get onboarding_title => 'Personalisiere dein Training';

  @override
  String get onboarding_goalTitle => 'Was ist dein Hauptziel?';

  @override
  String get onboarding_goalSubtitle =>
      'Damit passen wir deine nächsten Empfehlungen an.';

  @override
  String get onboarding_goalMuscle => 'Muskeln aufbauen';

  @override
  String get onboarding_goalStrength => 'Stärker werden';

  @override
  String get onboarding_goalFatLoss => 'Fett verlieren';

  @override
  String get onboarding_goalFitness => 'Fitness verbessern';

  @override
  String get onboarding_experienceTitle => 'Wie viel Erfahrung hast du?';

  @override
  String get onboarding_experienceSubtitle =>
      'Wir passen Volumen und Progression an dein Niveau an.';

  @override
  String get onboarding_experienceBeginner => 'Anfänger';

  @override
  String get onboarding_experienceBeginnerHint => 'Weniger als 1 Jahr';

  @override
  String get onboarding_experienceIntermediate => 'Fortgeschritten';

  @override
  String get onboarding_experienceIntermediateHint => 'Zwischen 1 und 3 Jahren';

  @override
  String get onboarding_experienceAdvanced => 'Erfahren';

  @override
  String get onboarding_experienceAdvancedHint => 'Mehr als 3 Jahre';

  @override
  String get onboarding_daysTitle =>
      'An wie vielen Tagen kannst du trainieren?';

  @override
  String get onboarding_daysSubtitle =>
      'Wähle eine Häufigkeit, die du beibehalten kannst.';

  @override
  String onboarding_daysSelected(int count) {
    return '$count Tage pro Woche';
  }

  @override
  String get onboarding_equipmentTitle => 'Welche Ausrüstung hast du?';

  @override
  String get onboarding_equipmentSubtitle =>
      'Wähle alles aus, was du regelmäßig nutzen kannst.';

  @override
  String get onboarding_continue => 'Weiter';

  @override
  String get onboarding_back => 'Zurück';

  @override
  String get onboarding_finish => 'Speichern und starten';

  @override
  String get onboarding_skip => 'Später';

  @override
  String get onboarding_saved => 'Einstellungen gespeichert';

  @override
  String get weeklyPlan_title => 'Wochenplan';

  @override
  String weeklyPlan_sessions(int done, int total) {
    return '$done/$total Einheiten';
  }

  @override
  String get weeklyPlan_adherence => 'Erfüllung';

  @override
  String get weeklyPlan_remaining => 'Verbleibend';

  @override
  String get weeklyPlan_completedSets => 'Sätze';

  @override
  String get weeklyPlan_muscleBalance => 'SÄTZE PRO MUSKEL';

  @override
  String get weeklyPlan_completed => 'Wochenziel erreicht. Gute Arbeit.';

  @override
  String get weeklyPlan_nextSession => 'NÄCHSTE EINHEIT';

  @override
  String weeklyPlan_exerciseCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Übungen',
      one: '1 Übung',
    );
    return '$_temp0';
  }

  @override
  String get weeklyPlan_start => 'Starten';

  @override
  String get weeklyPlan_noCompatible =>
      'Für deine Ausrüstung sind nicht genügend Übungen verfügbar.';

  @override
  String get weeklyPlan_adjustEquipment => 'Anpassen';

  @override
  String get weeklyPlan_setupTitle => 'Plan einrichten';

  @override
  String get weeklyPlan_setupSubtitle =>
      'Vervollständige deine Einstellungen für eine angepasste Einheit pro Woche.';

  @override
  String get weeklyPlan_configure => 'Einrichten';

  @override
  String get weeklyPlan_adaptiveName => 'Adaptive Einheit';

  @override
  String get train_title => 'Training';

  @override
  String get train_readyTitle => 'Bereit zum Trainieren?';

  @override
  String get train_readySubtitle =>
      'Starte eine freie Einheit oder wähle eine vorgefertigte Routine.';

  @override
  String get train_freeSession => 'Freie Einheit';

  @override
  String get train_freeWorkout => 'Freies Training';

  @override
  String get train_myRoutines => 'Meine Routinen';

  @override
  String get train_predefinedRoutines => 'Vorgefertigte Routinen';

  @override
  String get train_inProgress => 'Läuft';

  @override
  String get train_readyToStart => 'Bereit zum Starten';

  @override
  String get train_startSession => 'Starten';

  @override
  String get train_resumeTitle => 'Training fortsetzen?';

  @override
  String train_resumeBody(String name) {
    return 'Du hast ein unbeendetes \"$name\"-Training. Da fortsetzen, wo du aufgehört hast?';
  }

  @override
  String get train_resumeContinue => 'Fortsetzen';

  @override
  String get train_resumeDiscard => 'Verwerfen';

  @override
  String get train_cancelWorkout => 'Training verwerfen?';

  @override
  String get train_cancelConfirm =>
      'Die in dieser Einheit erfassten Sätze gehen verloren.';

  @override
  String get train_continue => 'Weiter trainieren';

  @override
  String get train_addExerciseFirst =>
      'Füge mindestens eine Übung hinzu, bevor du abschließt.';

  @override
  String get train_completeSetFirst =>
      'Schließe mindestens einen Satz ab, bevor du beendest.';

  @override
  String get train_workoutCompleted => 'Training abgeschlossen!';

  @override
  String get train_completedSets => 'Abgeschlossene Sätze';

  @override
  String get train_totalVolume => 'Gesamtvolumen';

  @override
  String get train_saveAsRoutine => 'Als Routine speichern';

  @override
  String get train_finish => 'Beenden';

  @override
  String get train_newAchievement => 'Neuer Erfolg!';

  @override
  String get train_great => 'Super!';

  @override
  String get train_routineNameHint => 'Name der Routine';

  @override
  String train_routineSaved(String name) {
    return 'Routine \"$name\" gespeichert';
  }

  @override
  String get train_deleteRoutine => 'Routine löschen';

  @override
  String train_deleteRoutineConfirm(String name) {
    return '\"$name\" löschen?';
  }

  @override
  String get train_noExercisesYet => 'Noch keine Übungen';

  @override
  String get train_addExerciseHint =>
      'Tippe auf den Button unten, um die erste Übung hinzuzufügen.';

  @override
  String get train_addExercise => 'Übung hinzufügen';

  @override
  String get train_exercise => 'Übung';

  @override
  String train_exerciseCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Übungen',
      one: '1 Übung',
    );
    return '$_temp0';
  }

  @override
  String train_startTemplate(String name) {
    return '$name starten';
  }

  @override
  String train_setsProgress(int done, int total) {
    return '$done/$total Sätze ✓';
  }

  @override
  String get train_viewProgress => 'Fortschritt anzeigen';

  @override
  String get train_deleteExercise => 'Übung löschen';

  @override
  String train_deleteExerciseConfirm(String name) {
    return '\"$name\" löschen? Abgeschlossene Sätze gehen verloren.';
  }

  @override
  String get train_notesHint => 'Notizen (optional)';

  @override
  String get train_setHeader => 'SATZ';

  @override
  String get train_repsHeader => 'WDH.';

  @override
  String get train_weightHeader => 'GEWICHT';

  @override
  String get train_addSet => 'Satz hinzufügen';

  @override
  String get train_nextSuggestion => 'Nächste Lastempfehlung';

  @override
  String get train_applySuggestion => 'Übernehmen';

  @override
  String get train_abbreviationExercises => 'Üb.';

  @override
  String get train_defaultRoutineName => 'Meine Routine';

  @override
  String get train_createRoutine => 'Routine erstellen';

  @override
  String get train_editRoutine => 'Routine bearbeiten';

  @override
  String train_routineUpdated(String name) {
    return 'Routine \"$name\" aktualisiert';
  }

  @override
  String get train_addFirstExercise => 'Erste Übung hinzufügen';

  @override
  String get train_addFirstExerciseHint =>
      'Tippe hier oder auf „Übung hinzufügen“, um die erste Übung hinzuzufügen.';

  @override
  String get train_removeSet => 'Satz entfernen';

  @override
  String get train_routinesHint =>
      'Ein Tag kann eine oder mehrere Routinen haben. Beim Start des Tages werden alle nacheinander trainiert.';

  @override
  String get train_firstRoutineTitle => 'Erstelle deine erste Routine';

  @override
  String get train_firstRoutineBody =>
      'Wähle die Übungen und einen Wochentag: An diesem Tag erscheint sie auf der Startseite, bereit zum Loslegen.';

  @override
  String get train_freeSessionHint =>
      'Kein Plan? Starte eine freie Einheit und füge Übungen unterwegs hinzu.';

  @override
  String get profile_keepScreenOn => 'Bildschirm beim Training anlassen';

  @override
  String get profile_keepScreenOnSubtitle =>
      'Verhindert, dass sich das Telefon zwischen Sätzen sperrt';

  @override
  String get profile_weightUnit => 'Gewichtseinheit';

  @override
  String get weightUnit_kg => 'Kilogramm (kg)';

  @override
  String get weightUnit_lb => 'Pfund (lb)';

  @override
  String get train_repShort => 'Wdh.';

  @override
  String get rest_label => 'Pause';

  @override
  String get rest_forExercise => 'Pause für diese Übung';

  @override
  String get rest_default => 'Standard';

  @override
  String get rest_defaultHint => 'Nutzt die im Pausentimer gewählte Zeit';

  @override
  String get train_newRecords => 'Neue Rekorde';

  @override
  String train_recordLine(String weight, String previous) {
    return '$weight (vorher $previous)';
  }

  @override
  String train_volumeUp(String kg) {
    return '+$kg Volumen im Vergleich zum letzten Mal';
  }

  @override
  String train_volumeDown(String kg) {
    return '$kg weniger Volumen als beim letzten Mal';
  }

  @override
  String get train_volumeSame => 'Gleiches Volumen wie beim letzten Mal';

  @override
  String get train_discardWorkout => 'Verwerfen';

  @override
  String get train_previousHeader => 'VORHER';

  @override
  String get train_usePrevious => 'Vorherige Werte übernehmen';

  @override
  String get train_removeCompletedSetTitle => 'Abgeschlossenen Satz entfernen?';

  @override
  String train_removeCompletedSetBody(int setNumber) {
    return 'Satz $setNumber ist abgeschlossen und zählt danach nicht mehr zum Training.';
  }

  @override
  String get train_createRoutineHint =>
      'Wähle die Übungen aus und bereite die Routine für dein nächstes Training vor.';

  @override
  String get train_routineNameRequired =>
      'Gib einen Namen für die Routine ein.';

  @override
  String train_addRoutineForDay(String day) {
    return 'Weitere Routine für $day hinzufügen';
  }

  @override
  String get train_trainingDay => 'Trainingstag';

  @override
  String get train_noAssignedDay => 'Kein Tag zugewiesen';

  @override
  String get train_trainingDayHint =>
      'Nach Tag gruppieren, damit die ganze Routine zusammenbleibt.';

  @override
  String get train_organizeRoutine => 'Routine organisieren';

  @override
  String train_blockCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Blöcke',
      one: '1 Block',
    );
    return '$_temp0';
  }

  @override
  String get train_noRoutinesForDay =>
      'Für diesen Tag gibt es noch keine Blöcke.';

  @override
  String get train_reorderBlocksHint =>
      'Gedrückt halten und ziehen, um die Reihenfolge zu ändern.';

  @override
  String get train_startCompleteRoutine => 'Komplette Routine starten';

  @override
  String train_routineForDay(String day) {
    return '$day-Routine';
  }

  @override
  String get train_bodyweightLabel => 'Körpergewicht';

  @override
  String get train_chooseWeight => 'Gewicht wählen';

  @override
  String get picker_title => 'Übung auswählen';

  @override
  String get picker_searchHint => 'Übung suchen...';

  @override
  String get picker_createManual => 'Eigene Übung erstellen';

  @override
  String get picker_createManualSubtitle => 'Name, Muskelgruppe und Gerät';

  @override
  String get picker_createTitle => 'Übung erstellen';

  @override
  String get picker_nameLabel => 'Name';

  @override
  String get picker_nameHint => 'z.B. Hammercurls';

  @override
  String get picker_muscleGroupLabel => 'Muskelgruppe';

  @override
  String get picker_equipmentLabel => 'Gerät';

  @override
  String get picker_addExercise => 'Übung hinzufügen';

  @override
  String get exercises_title => 'Übungen';

  @override
  String get exercises_searchHint => 'Übungen suchen...';

  @override
  String get exercises_muscleFilter => 'Muskel';

  @override
  String get exercises_equipmentFilter => 'Gerät';

  @override
  String exercises_countLabel(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Übungen',
      one: '$count Übung',
    );
    return '$_temp0';
  }

  @override
  String get exercises_descriptionUnavailable =>
      'Detaillierte Anweisungen sind in dieser Sprache noch nicht verfügbar.';

  @override
  String get exercises_clearFilters => 'Filter zurücksetzen';

  @override
  String get exercises_noResults => 'Keine Ergebnisse';

  @override
  String get exercises_noResultsHint =>
      'Versuche es mit anderen Filtern oder Suchbegriffen';

  @override
  String get exercises_deleteTitle => 'Übung löschen';

  @override
  String exercises_deleteConfirm(String name) {
    return '\"$name\" aus deiner Übungsliste löschen?';
  }

  @override
  String get exercises_muscleGroupLabel => 'Muskelgruppe';

  @override
  String get exercises_materialLabel => 'Gerät';

  @override
  String get exercises_executionTitle => 'Ausführung';

  @override
  String get exercises_secondaryMuscles => 'Sekundäre Muskeln';

  @override
  String get exercises_benefits => 'Vorteile';

  @override
  String get exercises_viewProgress => 'Fortschritt anzeigen';

  @override
  String get exercises_addToWorkout => 'Zum Training hinzufügen';

  @override
  String get progress_maxWeight => 'Max. Gewicht';

  @override
  String get progress_volumeLabel => 'Volumen';

  @override
  String get progress_noData => 'Keine Daten für diese Übung';

  @override
  String get progress_needMoreSessions =>
      'Mindestens 2 Einheiten nötig, um den Fortschritt anzuzeigen';

  @override
  String get progress_lastVolume => 'Letztes Volumen';

  @override
  String get progress_lastWeight => 'Letztes Gewicht';

  @override
  String get progress_best => 'Bestleistung';

  @override
  String get progress_progressLabel => 'Fortschritt';

  @override
  String get progress_historyTitle => 'Verlauf';

  @override
  String get history_title => 'Verlauf';

  @override
  String get history_exportCsv => 'CSV exportieren';

  @override
  String get history_allWorkouts => 'Alle Trainings';

  @override
  String get history_noWorkoutsYet => 'Noch keine Trainings';

  @override
  String get history_noWorkoutsSubtitle =>
      'Schließe dein erstes Training im Tab Training ab und es erscheint hier.';

  @override
  String get history_weeklySummary => 'Wochenzusammenfassung';

  @override
  String get history_workouts => 'Trainings';

  @override
  String get history_total => 'Gesamt';

  @override
  String get history_volumeKg => 'Volumen';

  @override
  String get history_routinesByDay => 'Routinen nach Tag';

  @override
  String history_sessionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Einheiten',
      one: '1 Einheit',
    );
    return '$_temp0';
  }

  @override
  String history_dayRoutineTitle(String day) {
    return 'Trainings am $day';
  }

  @override
  String get history_dayRoutineHint =>
      'Blöcke desselben Tages erscheinen zusammen und in Reihenfolge.';

  @override
  String get history_dayMon => 'Mo';

  @override
  String get history_dayTue => 'Di';

  @override
  String get history_dayWed => 'Mi';

  @override
  String get history_dayThu => 'Do';

  @override
  String get history_dayFri => 'Fr';

  @override
  String get history_daySat => 'Sa';

  @override
  String get history_daySun => 'So';

  @override
  String get history_exercisesPerformed => 'Durchgeführte Übungen';

  @override
  String history_setsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Sätze',
      one: '1 Satz',
    );
    return '$_temp0';
  }

  @override
  String get history_setHeader => 'Satz';

  @override
  String get detail_monthJan => 'Januar';

  @override
  String get detail_monthFeb => 'Februar';

  @override
  String get detail_monthMar => 'März';

  @override
  String get detail_monthApr => 'April';

  @override
  String get detail_monthMay => 'Mai';

  @override
  String get detail_monthJun => 'Juni';

  @override
  String get detail_monthJul => 'Juli';

  @override
  String get detail_monthAug => 'August';

  @override
  String get detail_monthSep => 'September';

  @override
  String get detail_monthOct => 'Oktober';

  @override
  String get detail_monthNov => 'November';

  @override
  String get detail_monthDec => 'Dezember';

  @override
  String detail_dateFormat(int day, String month, int year) {
    return '$day. $month $year';
  }

  @override
  String get paywall_subtitle => 'Entfalte dein volles Potenzial';

  @override
  String get paywall_featureTemplates => 'Alle vordefinierten Trainings';

  @override
  String get paywall_featureMeasures =>
      'Taille, Brust, Hüfte und Fortschrittsfotos';

  @override
  String get paywall_featureExerciseProgress =>
      'Fortschrittsdiagramme pro Übung';

  @override
  String get paywall_allIncluded => 'Alles inklusive';

  @override
  String get paywall_weekly => 'Wöchentlich';

  @override
  String get paywall_monthly => 'Monatlich';

  @override
  String get paywall_yearly => 'Jährlich';

  @override
  String get paywall_bestValue => 'Bestes Angebot';

  @override
  String get paywall_perWeek => '/Woche';

  @override
  String get paywall_perMonth => '/Monat';

  @override
  String get paywall_perYear => '/Jahr';

  @override
  String get paywall_startTrial => 'Kostenlose Testphase starten';

  @override
  String get paywall_subscribe => 'Abonnieren';

  @override
  String get paywall_restorePurchases => 'Käufe wiederherstellen';

  @override
  String get paywall_legalText =>
      'Das Abo verlängert sich automatisch. Du kannst jederzeit\nim App Store kündigen.';

  @override
  String get paywall_legalTextPlay =>
      'Das Abo verlängert sich automatisch. Du kannst jederzeit\nbei Google Play kündigen.';

  @override
  String get paywall_legalTextTrial =>
      'Die kostenlose Testphase wird in ein kostenpflichtiges Abonnement umgewandelt. Jederzeit vor Ablauf kündbar. Das Abonnement verlängert sich automatisch.';

  @override
  String get paywall_termsLink => 'Nutzungsbedingungen';

  @override
  String get paywall_privacyLink => 'Datenschutzrichtlinie';

  @override
  String get paywall_purchaseError =>
      'Der Kauf konnte nicht abgeschlossen werden.';

  @override
  String get paywall_noPurchasesFound => 'Keine früheren Käufe gefunden.';

  @override
  String paywall_trialDays(int count) {
    return '$count Tage kostenlos';
  }

  @override
  String paywall_trialMonths(int count) {
    return '$count Monate kostenlos';
  }

  @override
  String paywall_trialThenPrice(String price) {
    return 'danach $price';
  }

  @override
  String get paywall_offersUnavailable =>
      'Angebote konnten nicht geladen werden';

  @override
  String get paywall_retry => 'Erneut versuchen';

  @override
  String rest_of(String time) {
    return 'von $time';
  }

  @override
  String get progressScreen_measurements => 'Maße';

  @override
  String get progressScreen_photos => 'Fotos';

  @override
  String get progressScreen_addMeasurement => 'Messung hinzufügen';

  @override
  String get progressScreen_weight => 'Gewicht';

  @override
  String get progressScreen_noEntries => 'Noch keine Einträge';

  @override
  String get progressScreen_noPhotos => 'Noch keine Fotos';

  @override
  String get progressScreen_camera => 'Kamera';

  @override
  String get progressScreen_gallery => 'Galerie';

  @override
  String get progressScreen_waist => 'Taille';

  @override
  String get progressScreen_chest => 'Brust';

  @override
  String get progressScreen_hips => 'Hüfte';

  @override
  String get progressScreen_record => 'Eintrag';

  @override
  String get progressScreen_noDataMetric => 'Keine Daten für diese Metrik';

  @override
  String get progressScreen_addMoreRecords =>
      'Füge mehr Einträge hinzu, um das Diagramm zu sehen';

  @override
  String get progressScreen_historyTitle => 'Verlauf';

  @override
  String get progressScreen_noEntriesSubtitle =>
      'Erfasse dein erstes Gewicht und Maße,\num deinen Fortschritt zu sehen.';

  @override
  String get progressScreen_addFirstRecord => 'Ersten Eintrag hinzufügen';

  @override
  String get progressScreen_progressPhotos => 'Fortschrittsfotos';

  @override
  String get progressScreen_progressPhotosHint =>
      'Verfolge deinen visuellen Fortschritt mit Fotos.\nVerfügbar mit LiftWave PRO.';

  @override
  String get progressScreen_unlockWithPro => 'Mit PRO freischalten';

  @override
  String get progressScreen_noPhotosSubtitle =>
      'Füge ein Foto hinzu, wenn du deine Maße erfasst,\num deinen visuellen Fortschritt zu sehen.';

  @override
  String get progressScreen_addPhoto => 'Foto hinzufügen';

  @override
  String get progressScreen_newRecord => 'Neuer Eintrag';

  @override
  String get progressScreen_photoAdded => 'Foto hinzugefügt';

  @override
  String get progressScreen_addPhotoOptional => 'Foto hinzufügen (optional)';

  @override
  String get progressScreen_saveRecord => 'Eintrag speichern';

  @override
  String get progressScreen_enterAtLeastOneValue =>
      'Gib mindestens einen Wert ein';

  @override
  String get progressScreen_monthShortJan => 'Jan';

  @override
  String get progressScreen_monthShortFeb => 'Feb';

  @override
  String get progressScreen_monthShortMar => 'Mär';

  @override
  String get progressScreen_monthShortApr => 'Apr';

  @override
  String get progressScreen_monthShortMay => 'Mai';

  @override
  String get progressScreen_monthShortJun => 'Jun';

  @override
  String get progressScreen_monthShortJul => 'Jul';

  @override
  String get progressScreen_monthShortAug => 'Aug';

  @override
  String get progressScreen_monthShortSep => 'Sep';

  @override
  String get progressScreen_monthShortOct => 'Okt';

  @override
  String get progressScreen_monthShortNov => 'Nov';

  @override
  String get progressScreen_monthShortDec => 'Dez';

  @override
  String get achievement_firstWorkout_title => 'Erste Einheit';

  @override
  String get achievement_firstWorkout_description =>
      'Schließe dein erstes Training ab';

  @override
  String get achievement_streak7_title => '7-Tage-Serie';

  @override
  String get achievement_streak7_description =>
      'Trainiere mindestens 1 Mal in 7 aufeinanderfolgenden Tagen';

  @override
  String get achievement_streak30_title => '30-Tage-Serie';

  @override
  String get achievement_streak30_description =>
      'Trainiere mindestens 1 Mal pro Woche über 30 Tage';

  @override
  String get achievement_volume1000_title => '1.000 kg gestemmt';

  @override
  String get achievement_volume1000_description =>
      'Erreiche 1.000 kg Gesamtvolumen';

  @override
  String get achievement_volume5000_title => '5.000 kg gestemmt';

  @override
  String get achievement_volume5000_description =>
      'Erreiche 5.000 kg Gesamtvolumen';

  @override
  String get achievement_volume10000_title => '10.000 kg gestemmt';

  @override
  String get achievement_volume10000_description =>
      'Erreiche 10.000 kg Gesamtvolumen';

  @override
  String get achievement_personalRecord_title => 'Neuer persönlicher Rekord';

  @override
  String get achievement_personalRecord_description =>
      'Übertreffe dein Maximalgewicht bei einer Übung';

  @override
  String get achievement_streak14_title => '14-Tage-Serie';

  @override
  String get achievement_streak14_description =>
      'Trainiere mindestens 1× an 14 aufeinanderfolgenden Tagen';

  @override
  String get achievement_streak100_title => '100-Tage-Serie';

  @override
  String get achievement_streak100_description =>
      'Halte die Serie 100 Tage mit mindestens 1 Training pro Woche';

  @override
  String get achievement_streak365_title => 'Ein Jahr durch';

  @override
  String get achievement_streak365_description =>
      'Halte die Serie ein volles Jahr durch';

  @override
  String get achievement_bench50_title => 'Bankdrücken 50 kg';

  @override
  String get achievement_bench50_description =>
      'Schaffe ein Bankdrücken mit 50 kg oder mehr';

  @override
  String get achievement_bench100_title => 'Bankdrücken 100 kg';

  @override
  String get achievement_bench100_description =>
      'Schaffe ein Bankdrücken mit 100 kg oder mehr';

  @override
  String get achievement_squat100_title => 'Kniebeuge 100 kg';

  @override
  String get achievement_squat100_description =>
      'Schaffe eine Kniebeuge mit 100 kg oder mehr';

  @override
  String get achievement_squat150_title => 'Kniebeuge 150 kg';

  @override
  String get achievement_squat150_description =>
      'Schaffe eine Kniebeuge mit 150 kg oder mehr';

  @override
  String get achievement_deadlift100_title => 'Kreuzheben 100 kg';

  @override
  String get achievement_deadlift100_description =>
      'Schaffe ein Kreuzheben mit 100 kg oder mehr';

  @override
  String get achievement_deadlift150_title => 'Kreuzheben 150 kg';

  @override
  String get achievement_deadlift150_description =>
      'Schaffe ein Kreuzheben mit 150 kg oder mehr';

  @override
  String get achievement_deadlift200_title => 'Kreuzheben 200 kg';

  @override
  String get achievement_deadlift200_description =>
      'Schaffe ein Kreuzheben mit 200 kg oder mehr';

  @override
  String get achievement_explorer10_title => 'Entdecker';

  @override
  String get achievement_explorer10_description =>
      'Nutze 10 verschiedene Übungen in deinen Trainings';

  @override
  String get achievement_master25_title => 'Meister';

  @override
  String get achievement_master25_description =>
      'Nutze 25 verschiedene Übungen in deinen Trainings';

  @override
  String get achievement_fullBodyGroups_title => 'Ganzkörper';

  @override
  String get achievement_fullBodyGroups_description =>
      'Trainiere jede Muskelgruppe mindestens einmal';

  @override
  String get achievement_crossfitFan_title => 'CrossFit-Fan';

  @override
  String get achievement_crossfitFan_description =>
      'Schaffe 10 verschiedene Übungen aus der CrossFit-Kategorie';

  @override
  String get achievement_time1h_title => '1 Stunde gesamt';

  @override
  String get achievement_time1h_description =>
      'Sammle 1 Stunde Trainingszeit insgesamt';

  @override
  String get achievement_time10h_title => '10 Stunden';

  @override
  String get achievement_time10h_description =>
      'Sammle 10 Stunden Trainingszeit insgesamt';

  @override
  String get achievement_time50h_title => '50 Stunden';

  @override
  String get achievement_time50h_description =>
      'Sammle 50 Stunden Trainingszeit insgesamt';

  @override
  String get achievement_time100h_title => '100 Stunden';

  @override
  String get achievement_time100h_description =>
      'Sammle 100 Stunden Trainingszeit insgesamt';

  @override
  String get achievement_earlyBird_title => 'Frühaufsteher';

  @override
  String get achievement_earlyBird_description =>
      'Starte ein Training vor 7:00 Uhr';

  @override
  String get achievement_nightOwl_title => 'Nachteule';

  @override
  String get achievement_nightOwl_description =>
      'Beende ein Training nach 22:00 Uhr';

  @override
  String get achievement_comeback_title => 'Comeback';

  @override
  String get achievement_comeback_description =>
      'Komm nach 30+ Tagen Pause zurück zum Training';

  @override
  String get achievement_marathoner_title => 'Marathonläufer';

  @override
  String get achievement_marathoner_description =>
      'Schaffe ein Training von mehr als 90 Minuten';

  @override
  String get achievement_efficient_title => 'Effizient';

  @override
  String get achievement_efficient_description =>
      'Schaffe ein Training mit 3+ Übungen in unter 30 Minuten';

  @override
  String get achievement_weekendWarrior_title => 'Wochenend-Krieger';

  @override
  String get achievement_weekendWarrior_description =>
      'Trainiere Samstag und Sonntag an 3 Wochenenden in Folge';

  @override
  String get achievement_weeklyVariety_title => 'Wöchentliche Vielfalt';

  @override
  String get achievement_weeklyVariety_description =>
      'Trainiere 5 verschiedene Muskelgruppen in einer Woche';

  @override
  String get csv_header =>
      'Datum,Training,Übung,Muskelgruppe,Satz,Wdh.,Gewicht (kg),Volumen (kg)';

  @override
  String get csv_subject => 'LiftWave – Trainingsverlauf';

  @override
  String get template_fullBody_subtitle =>
      'Alle Muskelgruppen in einer Einheit';

  @override
  String get template_fullBody_name => 'Ganzkörper';

  @override
  String get template_push_name => 'Drücken';

  @override
  String get template_pull_name => 'Ziehen';

  @override
  String get template_torso_name => 'Oberkörper';

  @override
  String get template_push_subtitle => 'Brust · Schultern · Trizeps';

  @override
  String get template_pull_subtitle => 'Rücken · Bizeps';

  @override
  String get template_torso_subtitle => 'Brust · Rücken · Schultern';

  @override
  String get template_legs_subtitle => 'Quadrizeps · Beinbeuger · Gesäß · Core';

  @override
  String get template_legs_name => 'Beine';

  @override
  String get ex_pecho_6_name => 'Schrägbankdrücken mit Langhantel';

  @override
  String get ex_pecho_6_desc =>
      'Stelle die Bank auf 30–45° ein. Greife die Langhantel etwas weiter als schulterbreit. Senke die Stange kontrolliert bis zum oberen Teil der Brust und drücke sie bis zur vollen Streckung nach oben. Halte den unteren Rücken an der Bank und die Schulterblätter zusammengezogen.';

  @override
  String get ex_pecho_6_b1 =>
      'Betont den oberen (klavikulären) Anteil der Brust';

  @override
  String get ex_pecho_6_b2 => 'Ermöglicht höhere Gewichte als mit Kurzhanteln';

  @override
  String get ex_pecho_6_b3 => 'Verbessert die Druckkraft aus erhöhten Winkeln';

  @override
  String get ex_pecho_7_name => 'Negativbankdrücken mit Kurzhanteln';

  @override
  String get ex_pecho_7_desc =>
      'Stelle die Bank auf eine Negativneigung von 15–30° ein. Mit einer Kurzhantel in jeder Hand auf Brusthöhe drücke nach oben und führe die Hanteln oben zusammen. Senke kontrolliert ab und spüre die Dehnung im unteren Anteil der Brust.';

  @override
  String get ex_pecho_7_b1 => 'Trainiert den unteren Anteil des Brustmuskels';

  @override
  String get ex_pecho_7_b2 => 'Reduziert die Beteiligung der Schultern';

  @override
  String get ex_pecho_7_b3 =>
      'Größerer Bewegungsumfang als beim Negativbankdrücken mit Langhantel';

  @override
  String get ex_pecho_8_name => 'Liegestütze';

  @override
  String get ex_pecho_8_desc =>
      'Stütze die Hände schulterbreit auf dem Boden ab, die Füße zusammen. Halte den Körper vom Kopf bis zu den Fersen gerade. Senke dich durch Beugen der Ellbogen, bis die Brust fast den Boden berührt, und drücke dich wieder hoch. Halte den Core während der gesamten Bewegung angespannt.';

  @override
  String get ex_pecho_8_b1 => 'Kein Equipment nötig';

  @override
  String get ex_pecho_8_b2 =>
      'Viele Varianten zur Steigerung (Diamant, mit erhöhten Füßen, mit Klatschen)';

  @override
  String get ex_pecho_8_b3 => 'Verbundübung, die auch den Core stärkt';

  @override
  String get ex_pecho_9_name => 'Überzüge mit Kurzhantel';

  @override
  String get ex_pecho_9_desc =>
      'Lege dich auf eine Flachbank und halte eine Kurzhantel mit beiden Händen über der Brust, Arme gestreckt. Senke die Hantel in einem Bogen hinter den Kopf, bis du die Dehnung in Brust und Latissimus spürst. Kehre in die Ausgangsposition zurück und spanne dabei die Brust an.';

  @override
  String get ex_pecho_9_b1 => 'Trainiert Brust und Latissimus gleichzeitig';

  @override
  String get ex_pecho_9_b2 =>
      'Verbessert die Mobilität von Schultern und Brustkorb';

  @override
  String get ex_pecho_9_b3 =>
      'Hervorragende Ergänzung zwischen Drück- und Rudersätzen';

  @override
  String get ex_esp_6_name => 'T-Bar-Rudern';

  @override
  String get ex_esp_6_desc =>
      'Stelle dich schulterbreit über die T-Bar-Stange. Beuge dich mit neutralem Rücken nach vorn und ziehe die Griffe zur Brust, die Ellbogen nach hinten. Ziehe die Schulterblätter in der Endposition zusammen und senke kontrolliert ab.';

  @override
  String get ex_esp_6_b1 => 'Entwickelt die Dicke des mittleren Rückens';

  @override
  String get ex_esp_6_b2 =>
      'Ermöglicht sehr hohe Gewichte bei geringerer Belastung des unteren Rückens als freies Rudern';

  @override
  String get ex_esp_6_b3 => 'Trainiert Haltung und Schulterblattstabilität';

  @override
  String get ex_esp_7_name => 'Rudern sitzend am Kabelzug';

  @override
  String get ex_esp_7_desc =>
      'Setze dich vor den unteren Kabelzug, die Füße abgestützt. Greife den Griff mit gestreckten Armen und neutralem Rücken. Ziehe die Hände zum Bauch, ziehe die Schulterblätter zusammen und halte den Oberkörper aufrecht. Kehre kontrolliert zurück, ohne den Rücken zu runden.';

  @override
  String get ex_esp_7_b1 => 'Konstante Spannung über die gesamte Bewegung';

  @override
  String get ex_esp_7_b2 =>
      'Einfache Gewichtssteigerung und zugängliche Technik';

  @override
  String get ex_esp_7_b3 => 'Hervorragend für die Dicke des mittleren Rückens';

  @override
  String get ex_esp_8_name => 'Shrugs mit Kurzhanteln';

  @override
  String get ex_esp_8_desc =>
      'Stehe aufrecht mit einer Kurzhantel in jeder Hand an den Seiten, Arme locker. Ziehe die Schultern zu den Ohren hoch, ohne die Ellbogen zu beugen. Halte die Kontraktion oben 1 Sekunde und senke langsam ab. Kreise nicht mit den Schultern, die Bewegung ist rein vertikal.';

  @override
  String get ex_esp_8_b1 => 'Direkte Isolation des oberen Trapezmuskels';

  @override
  String get ex_esp_8_b2 => 'Verbessert die Haltung und die Optik des Nackens';

  @override
  String get ex_esp_8_b3 =>
      'Stärkt die Schulterblattstabilität für andere Hebeübungen';

  @override
  String get ex_esp_9_name => 'Good Morning';

  @override
  String get ex_esp_9_desc =>
      'Lege die Langhantel wie bei der Kniebeuge auf dem Trapezmuskel ab. Mit hüftbreitem Stand und leicht gebeugten Knien beuge dich aus der Hüfte nach vorn und halte den Rücken neutral. Senke dich, bis der Oberkörper fast parallel zum Boden ist, und richte dich mit angespanntem Gesäß wieder auf.';

  @override
  String get ex_esp_9_b1 => 'Stärkt die hintere Kette und den unteren Rücken';

  @override
  String get ex_esp_9_b2 =>
      'Verbessert die Hüftbeugebewegung (Hip Hinge) für Kreuzheben und Kniebeuge';

  @override
  String get ex_esp_9_b3 => 'Wichtige Assistenzübung im Powerlifting';

  @override
  String get ex_pier_6_name => 'Frontkniebeuge';

  @override
  String get ex_pier_6_desc =>
      'Lege die Langhantel auf den vorderen Deltamuskeln ab, Ellbogen hoch, im Kreuzgriff oder Clean-Griff. Füße schulterbreit. Senke dich mit aufrechtem Oberkörper und nach vorn zeigenden Ellbogen, bis die Oberschenkel tiefer als parallel zum Boden sind. Drücke dich über die Fersen in die Ausgangsposition zurück.';

  @override
  String get ex_pier_6_b1 =>
      'Betont den Quadrizeps stärker als die Kniebeuge mit der Hantel im Nacken';

  @override
  String get ex_pier_6_b2 =>
      'Erfordert einen sehr starken Core und eine aufrechte Haltung';

  @override
  String get ex_pier_6_b3 =>
      'Technische Grundlage für Clean und Thruster im CrossFit';

  @override
  String get ex_pier_7_name => 'Bulgarische Kniebeuge';

  @override
  String get ex_pier_7_desc =>
      'Lege den Spann des hinteren Fußes auf eine Bank und halte eine Kurzhantel in jeder Hand. Mit dem vorderen Fuß weit vorn senke dich durch Beugen des vorderen Knies, bis der Oberschenkel parallel zum Boden ist. Drücke dich über die vordere Ferse wieder nach oben.';

  @override
  String get ex_pier_7_b1 =>
      'Einbeiniges Training, das Dysbalancen zwischen den Beinen korrigiert';

  @override
  String get ex_pier_7_b2 => 'Intensive Aktivierung von Gesäß und Quadrizeps';

  @override
  String get ex_pier_7_b3 => 'Verbessert Gleichgewicht und Hüftstabilität';

  @override
  String get ex_pier_8_name => 'Rumänisches Kreuzheben';

  @override
  String get ex_pier_8_desc =>
      'Stehe aufrecht mit der Langhantel auf Hüfthöhe, schulterbreit im Obergriff. Mit leicht gebeugten, fixierten Knien lasse die Stange an den Beinen entlang nach unten gleiten, indem du den Oberkörper aus der Hüfte nach vorn neigst, bis du Spannung in den Beinbeugern spürst. Richte dich mit angespanntem Gesäß wieder auf.';

  @override
  String get ex_pier_8_b1 => 'Intensive Isolation von Beinbeugern und Gesäß';

  @override
  String get ex_pier_8_b2 =>
      'Stärkt die hintere Kette und verbessert die Hüftbeugebewegung (Hip Hinge)';

  @override
  String get ex_pier_8_b3 =>
      'Reduziert das Verletzungsrisiko der Beinbeuger beim Laufen oder Springen';

  @override
  String get ex_pier_9_name => 'Beinstrecker-Maschine';

  @override
  String get ex_pier_9_desc =>
      'Setze dich in die Maschine mit angelehntem Rücken und der Rolle auf dem Spann. Strecke die Knie und hebe das Gewicht, bis die Beine fast gerade sind, ohne die Knie durchzudrücken. Spanne den Quadrizeps oben an und senke kontrolliert ab.';

  @override
  String get ex_pier_9_b1 => 'Direkte Isolation des Quadrizeps';

  @override
  String get ex_pier_9_b2 =>
      'Nützlich für Rehabilitation und gezieltes Hypertrophietraining';

  @override
  String get ex_pier_9_b3 => 'Präzise Gewichtseinstellung bei geringem Risiko';

  @override
  String get ex_pier_10_name => 'Wadenheben';

  @override
  String get ex_pier_10_desc =>
      'Positioniere die Schultern unter den Polstern der Wadenmaschine (oder nutze im Stehen eine Kurzhantel). Stelle die Fußballen auf eine Plattform, die Fersen hängen frei. Drücke dich über die Fußballen nach oben und spanne die Waden oben an. Senke langsam ab und spüre die Dehnung.';

  @override
  String get ex_pier_10_b1 =>
      'Isolation von Schollenmuskel und Zwillingswadenmuskel';

  @override
  String get ex_pier_10_b2 =>
      'Verbessert die Schnellkraft bei Sprüngen und Sprints';

  @override
  String get ex_pier_10_b3 =>
      'Reduziert das Verletzungsrisiko an Sprunggelenk und Achillessehne';

  @override
  String get ex_hom_5_name => 'Schulterdrücken mit Kurzhanteln';

  @override
  String get ex_hom_5_desc =>
      'Sitzend mit gerader Rückenlehne halte je eine Kurzhantel seitlich neben den Schultern, Handflächen nach vorn. Drücke die Hanteln nach oben, bis sie sich über dem Kopf fast berühren, ohne die Ellbogen durchzustrecken. Senke kontrolliert in die Ausgangsposition ab.';

  @override
  String get ex_hom_5_b1 =>
      'Größerer Bewegungsumfang als beim Drücken mit der Langhantel';

  @override
  String get ex_hom_5_b2 => 'Ermöglicht, jede Seite unabhängig zu trainieren';

  @override
  String get ex_hom_5_b3 =>
      'Weniger Belastung für die Schultern als mit der Langhantel';

  @override
  String get ex_hom_6_name => 'Frontheben';

  @override
  String get ex_hom_6_desc =>
      'Stehe aufrecht mit einer Kurzhantel in jeder Hand vor den Oberschenkeln, Handflächen zum Körper. Hebe die Arme abwechselnd oder gleichzeitig nach vorn bis auf Schulterhöhe und halte die Ellbogen fast gestreckt. Senke langsam ab, ohne zu schwingen.';

  @override
  String get ex_hom_6_b1 => 'Isolation des vorderen Deltamuskels';

  @override
  String get ex_hom_6_b2 => 'Verbessert die Optik der Schulter von vorn';

  @override
  String get ex_hom_6_b3 =>
      'Assistenzübung für Bankdrücken und Schulterdrücken';

  @override
  String get ex_hom_7_name => 'Vorgebeugtes Seitheben mit Kurzhanteln';

  @override
  String get ex_hom_7_desc =>
      'Beuge dich aus der Hüfte nach vorn, bis der Oberkörper fast parallel zum Boden ist, eine Kurzhantel in jeder Hand, die Arme hängen herab. Hebe die Arme seitlich bis auf Schulterhöhe, Ellbogen leicht gebeugt. Spanne den hinteren Deltamuskel oben an und senke kontrolliert ab.';

  @override
  String get ex_hom_7_b1 =>
      'Isolation des hinteren Deltamuskels, entscheidend für die Haltung';

  @override
  String get ex_hom_7_b2 => 'Gleicht die Auswirkungen von Druckübungen aus';

  @override
  String get ex_hom_7_b3 =>
      'Reduziert das Verletzungsrisiko der Rotatorenmanschette';

  @override
  String get ex_bra_6_name => 'Scottcurls';

  @override
  String get ex_bra_6_desc =>
      'Setze dich an die Scottbank und lege die Arme auf dem Polster ab. Greife die Stange (gerade oder SZ) im Untergriff. Beuge die Ellbogen und führe die Stange kontrolliert zu den Schultern. Senke langsam ab, ohne die Ellbogen am Ende durchzustrecken.';

  @override
  String get ex_bra_6_b1 => 'Isoliert den Bizeps, da die Schulter fixiert ist';

  @override
  String get ex_bra_6_b2 => 'Macht Schwungholen unmöglich, strikte Technik';

  @override
  String get ex_bra_6_b3 =>
      'Hervorragend für die maximale Kontraktion des Bizeps';

  @override
  String get ex_bra_7_name => 'Konzentrationscurls';

  @override
  String get ex_bra_7_desc =>
      'Setze dich mit gespreizten Beinen auf eine Bank. Stütze den Ellbogen des arbeitenden Arms an der Innenseite des Oberschenkels ab, die Kurzhantel hängt herab. Beuge den Ellbogen und führe die Hantel zur Schulter, sodass der Bizeps isoliert arbeitet. Spanne oben an und senke kontrolliert ab.';

  @override
  String get ex_bra_7_b1 =>
      'Reine Isolation des Bizeps mit maximaler Kontraktion';

  @override
  String get ex_bra_7_b2 =>
      'Ermöglicht den Fokus auf die Mind-Muscle-Connection';

  @override
  String get ex_bra_7_b3 => 'Ideal als Abschlussübung im Armtraining';

  @override
  String get ex_bra_8_name => 'Enges Bankdrücken';

  @override
  String get ex_bra_8_desc =>
      'Lege dich auf eine Flachbank und greife die Langhantel im engen Griff, schulterbreit. Senke die Stange kontrolliert, bis sie das Brustbein leicht berührt, und halte die Ellbogen eng am Körper. Drücke nach oben und betone dabei die Streckung des Trizeps.';

  @override
  String get ex_bra_8_b1 => 'Verbundübung mit Schwerpunkt auf dem Trizeps';

  @override
  String get ex_bra_8_b2 =>
      'Ermöglicht höhere Gewichte als eine Isolationsübung für den Trizeps';

  @override
  String get ex_bra_8_b3 =>
      'Überträgt sich auf die Kraft beim Bankdrücken und Schulterdrücken';

  @override
  String get ex_bra_9_name => 'Dips an der Bank';

  @override
  String get ex_bra_9_desc =>
      'Stütze die Hände hinter dir auf einer Bank ab, die Finger zeigen nach vorn. Strecke die Beine vor dir aus und stelle die Fersen auf (oder beuge die Knie, um es leichter zu machen). Senke dich, indem du die Ellbogen nach hinten bis 90° beugst, und drücke dich wieder hoch.';

  @override
  String get ex_bra_9_b1 => 'Isolation des Trizeps ganz ohne Equipment';

  @override
  String get ex_bra_9_b2 =>
      'Leicht zu steigern durch Zusatzgewicht auf dem Schoß';

  @override
  String get ex_bra_9_b3 =>
      'Verbessert die Druckkraft aus Positionen hinter dem Körper';

  @override
  String get ex_core_5_name => 'Russian Twists';

  @override
  String get ex_core_5_desc =>
      'Setze dich auf den Boden, die Knie gebeugt und die Füße angehoben oder aufgestellt, und lehne dich 45° nach hinten. Lege die Hände zusammen (oder halte ein Gewicht) und drehe den Oberkörper von Seite zu Seite, wobei du den Boden berührst oder das Gewicht zu jeder Seite führst. Halte den Core angespannt.';

  @override
  String get ex_core_5_b1 => 'Direkte Isolation der schrägen Bauchmuskeln';

  @override
  String get ex_core_5_b2 =>
      'Verbessert die Rumpfrotation, entscheidend im Sport';

  @override
  String get ex_core_5_b3 =>
      'Steigerung durch Zusatzgewicht möglich (Kurzhantel, Scheibe, Ball)';

  @override
  String get ex_core_6_name => 'Mountain Climbers';

  @override
  String get ex_core_6_desc =>
      'Gehe in den hohen Stütz, die Hände unter den Schultern. Ziehe abwechselnd und schnell ein Knie zur Brust, als würdest du auf der Stelle laufen. Halte die Hüfte tief und den Core während der gesamten Bewegung angespannt.';

  @override
  String get ex_core_6_b1 => 'Kombiniert Core-Training mit Cardio';

  @override
  String get ex_core_6_b2 => 'Kein Equipment nötig, ideal für HIIT';

  @override
  String get ex_core_6_b3 => 'Verbessert Koordination und Ausdauer';

  @override
  String get ex_core_7_name => 'Hollow Hold';

  @override
  String get ex_core_7_desc =>
      'Lege dich auf den Rücken, die Arme über den Kopf gestreckt und die Beine gestreckt. Hebe Arme und Beine leicht vom Boden ab und drücke den unteren Rücken in den Boden. Halte die „Boot“-Position mit vollständig angespanntem Core.';

  @override
  String get ex_core_7_b1 =>
      'Turnerische Grundlage für viele CrossFit-Bewegungen';

  @override
  String get ex_core_7_b2 => 'Stärkt den gesamten Core isometrisch';

  @override
  String get ex_core_7_b3 =>
      'Verbessert Haltung und Kraft für strikte Klimmzüge';

  @override
  String get ex_core_8_name => 'Seitstütz (Side Plank)';

  @override
  String get ex_core_8_desc =>
      'Lege dich auf die Seite, den Unterarm aufgestützt und den Ellbogen unter der Schulter. Hebe die Hüfte vom Boden ab, sodass der Körper von den Füßen bis zum Kopf eine gerade Linie bildet. Halte die Position, ohne die Hüfte absinken zu lassen. Wiederhole auf der anderen Seite.';

  @override
  String get ex_core_8_b1 =>
      'Intensive Isolation der schrägen Bauchmuskeln und des seitlichen Cores';

  @override
  String get ex_core_8_b2 =>
      'Verbessert die Stabilität von Hüfte und Wirbelsäule';

  @override
  String get ex_core_8_b3 => 'Ohne Equipment und gelenkschonend';

  @override
  String get ex_core_9_name => 'Dead Bug';

  @override
  String get ex_core_9_desc =>
      'Lege dich auf den Rücken, die Arme zur Decke gestreckt und die Knie 90° gebeugt über der Hüfte. Senke gleichzeitig den rechten Arm hinter den Kopf und das gestreckte linke Bein zum Boden. Kehre zurück und wechsle die Seiten, während der untere Rücken am Boden bleibt.';

  @override
  String get ex_core_9_b1 =>
      'Verbessert die Anti-Extensions-Stabilität des Cores';

  @override
  String get ex_core_9_b2 =>
      'Hervorragend für Anfänger und die Rehabilitation des unteren Rückens';

  @override
  String get ex_core_9_b3 => 'Trainiert die kontralaterale Koordination';

  @override
  String get ex_cf_1_name => 'Umsetzen (Clean)';

  @override
  String get ex_cf_1_desc =>
      'Greife die Langhantel vom Boden im Obergriff knapp außerhalb der Knie. Ziehe explosiv, indem du Hüfte und Knie streckst, ziehe die Schultern hoch und tauche unter die Stange, um sie in der Frontkniebeuge mit hohen Ellbogen aufzunehmen. Stehe auf und schließe den Lift ab.';

  @override
  String get ex_cf_1_b1 =>
      'Vollständige olympische Hebeübung für Explosivkraft';

  @override
  String get ex_cf_1_b2 =>
      'Entwickelt Koordination, Schnelligkeit und Kraft gleichzeitig';

  @override
  String get ex_cf_1_b3 => 'Grundlage vieler CrossFit-WODs';

  @override
  String get ex_cf_2_name => 'Power Clean';

  @override
  String get ex_cf_2_desc =>
      'Wie der Clean, aber ohne Aufnahme in der vollen Kniebeuge: Du nimmst die Stange in der Viertelkniebeuge mit hohen Ellbogen und in der Frontposition auf den Schultern auf. Schneller und mit geringeren Anforderungen an die Mobilität als der Clean.';

  @override
  String get ex_cf_2_b1 => 'Entwickelt die Explosivkraft der hinteren Kette';

  @override
  String get ex_cf_2_b2 => 'Technisch zugänglicher als der volle Clean';

  @override
  String get ex_cf_2_b3 =>
      'Hervorragend für Einsteiger in die olympischen Lifts';

  @override
  String get ex_cf_3_name => 'Reißen (Snatch)';

  @override
  String get ex_cf_3_desc =>
      'Greife die Langhantel vom Boden mit sehr weitem Griff. Ziehe explosiv und nimm die Stange mit gestreckten Armen über dem Kopf in einer tiefen Kniebeuge (Overhead Squat) auf. Stehe auf und halte die Stange dabei oben.';

  @override
  String get ex_cf_3_b1 =>
      'Der umfassendste und technisch anspruchsvollste olympische Lift';

  @override
  String get ex_cf_3_b2 =>
      'Entwickelt Explosivkraft, Mobilität und Stabilität gleichzeitig';

  @override
  String get ex_cf_3_b3 => 'Verbrennt mehr Kalorien als fast jede andere Übung';

  @override
  String get ex_cf_4_name => 'Power Snatch';

  @override
  String get ex_cf_4_desc =>
      'Wie der Snatch, aber die Stange wird in der Viertelkniebeuge mit über dem Kopf gestreckten Armen aufgenommen. Schneller und mit geringeren Anforderungen an die Mobilität von Sprunggelenken und Hüfte.';

  @override
  String get ex_cf_4_b1 => 'Zugänglicher als der volle Snatch';

  @override
  String get ex_cf_4_b2 => 'Entwickelt die Explosivkraft der hinteren Kette';

  @override
  String get ex_cf_4_b3 => 'Hervorragend für Mobilität und Koordination';

  @override
  String get ex_cf_5_name => 'Thruster';

  @override
  String get ex_cf_5_desc =>
      'Halte die Langhantel in der Frontposition (auf den vorderen Deltamuskeln). Führe eine volle Frontkniebeuge aus und nutze beim Hochkommen den Schwung der Beine, um die Stange mit gestreckten Armen über den Kopf zu drücken. Senke die Stange in die Frontposition ab und wiederhole.';

  @override
  String get ex_cf_5_b1 =>
      'Trainiert den ganzen Körper in einer einzigen Bewegung';

  @override
  String get ex_cf_5_b2 => 'Paradeübung in WODs wie „Fran“';

  @override
  String get ex_cf_5_b3 => 'Kombiniert Kraft und metabolische Ausdauer';

  @override
  String get ex_cf_6_name => 'Push Press';

  @override
  String get ex_cf_6_desc =>
      'Mit der Langhantel in der Frontposition auf den Schultern führe einen schnellen Dip aus, indem du die Knie leicht beugst. Strecke die Beine explosiv, um die Stange über den Kopf zu treiben, bis die Arme gestreckt sind. Senke kontrolliert in die Ausgangsposition ab.';

  @override
  String get ex_cf_6_b1 =>
      'Ermöglicht mehr Gewicht als das strikte Schulterdrücken';

  @override
  String get ex_cf_6_b2 =>
      'Entwickelt die Explosivkraft beim vertikalen Drücken';

  @override
  String get ex_cf_6_b3 =>
      'Überträgt sich auf den Jerk und andere olympische Lifts';

  @override
  String get ex_cf_7_name => 'Push Jerk';

  @override
  String get ex_cf_7_desc =>
      'Wie der Push Press, aber während du die Stange nach oben treibst, gibst du in den Beinen nach und nimmst die Stange in der Viertelkniebeuge mit bereits gestreckten Armen auf. Stehe anschließend auf und schließe den Lift ab. Ermöglicht mehr Gewicht als der Push Press.';

  @override
  String get ex_cf_7_b1 =>
      'Bewegt mehr Gewicht über den Kopf als jede Drückvariante';

  @override
  String get ex_cf_7_b2 =>
      'Technischer olympischer Lift mit hoher Explosivkraft';

  @override
  String get ex_cf_7_b3 => 'Bestandteil des Clean & Jerk';

  @override
  String get ex_cf_8_name => 'Wall Balls';

  @override
  String get ex_cf_8_desc =>
      'Stehe mit einem Medizinball vor der Brust, mit Blick zu einer Wand. Führe eine tiefe Kniebeuge aus und wirf den Ball beim Hochkommen auf ein hohes Ziel an der Wand (ca. 3 m). Fange den Ball auf Brusthöhe und gehe sofort in die nächste Kniebeuge.';

  @override
  String get ex_cf_8_b1 => 'Herz-Kreislauf- und Schnellkraftübung zugleich';

  @override
  String get ex_cf_8_b2 => 'Standardbewegung in vielen CrossFit-Benchmarks';

  @override
  String get ex_cf_8_b3 => 'Trainiert Koordination und Rhythmus';

  @override
  String get ex_cf_9_name => 'American Kettlebell Swing';

  @override
  String get ex_cf_9_desc =>
      'Stehe aufrecht, die Kettlebell hängt mit beiden Händen gehalten zwischen den Beinen. Beuge dich aus der Hüfte, um sie nach hinten zu führen, und strecke die Hüfte explosiv, um sie mit gestreckten Armen über den Kopf zu schwingen. Die Kraft kommt aus der Hüfte, nicht aus den Armen.';

  @override
  String get ex_cf_9_b1 => 'Entwickelt die Explosivkraft der Hüfte';

  @override
  String get ex_cf_9_b2 => 'Cardio und Kraft in einer einzigen Bewegung';

  @override
  String get ex_cf_9_b3 =>
      'Standard im CrossFit (der Russian Swing geht nur bis zur Brust)';

  @override
  String get ex_cf_10_name => 'Russian Kettlebell Swing';

  @override
  String get ex_cf_10_desc =>
      'Identisch mit dem American Swing, aber die Kettlebell wird nur bis auf Brust-/Augenhöhe geschwungen, nicht über den Kopf. Technisch einfacher und mit weniger Belastung für die Schultern.';

  @override
  String get ex_cf_10_b1 => 'Einstieg in das Training mit der Kettlebell';

  @override
  String get ex_cf_10_b2 => 'Weniger Schulterbelastung als beim American Swing';

  @override
  String get ex_cf_10_b3 => 'Ideal für Anfänger und hohe Wiederholungszahlen';

  @override
  String get ex_cf_11_name => 'Box Jumps';

  @override
  String get ex_cf_11_desc =>
      'Stelle dich vor eine Box oder stabile Plattform, beuge die Knie und springe auf die Box, sodass du mit den ganzen Füßen auf der Fläche landest. Strecke oben Hüfte und Knie. Springe herunter oder steige Schritt für Schritt ab, um die Belastung zu reduzieren.';

  @override
  String get ex_cf_11_b1 =>
      'Reine Plyometrie zur Entwicklung von Explosivkraft';

  @override
  String get ex_cf_11_b2 => 'Verbessert Sprunghöhe und Explosivität';

  @override
  String get ex_cf_11_b3 => 'Klassischer Bestandteil vieler WODs';

  @override
  String get ex_cf_12_name => 'Burpees';

  @override
  String get ex_cf_12_desc =>
      'Gehe aus dem Stand in die Hocke und stütze die Hände auf dem Boden ab. Springe mit den Füßen nach hinten in die Liegestützposition. Führe einen Liegestütz aus und berühre mit der Brust den Boden. Springe mit den Füßen zurück zu den Händen und springe senkrecht hoch, die Arme nach oben gestreckt.';

  @override
  String get ex_cf_12_b1 => 'Ganzkörperübung ohne Equipment';

  @override
  String get ex_cf_12_b2 => 'Intensives Cardio und Krafttraining zugleich';

  @override
  String get ex_cf_12_b3 =>
      'Standard in Benchmarks wie „Murph“ und vielen WODs';

  @override
  String get ex_cf_13_name => 'Toes-to-Bar';

  @override
  String get ex_cf_13_desc =>
      'Hänge an der Stange im Obergriff. Aktiviere den Latissimus und hebe die gestreckten (oder leicht gebeugten) Beine, bis die Füße die Stange berühren. Senke kontrolliert ab, ohne übermäßig zu schwingen. Nutze den „Kip“, um den Rhythmus zu halten.';

  @override
  String get ex_cf_13_b1 => 'Dynamisches, sehr anspruchsvolles Core-Training';

  @override
  String get ex_cf_13_b2 => 'Verbessert Griffkraft und Latissimus';

  @override
  String get ex_cf_13_b3 => 'Bestandteil vieler CrossFit-WODs';

  @override
  String get ex_cf_14_name => 'Knees-to-Elbow';

  @override
  String get ex_cf_14_desc =>
      'Hänge an der Stange im Obergriff. Beuge Hüfte und Knie und führe die Knie in einer dynamischen, kontrollierten Bewegung zu den Ellbogen. Senke kontrolliert ab. Nützlich als Vorstufe zu Toes-to-Bar.';

  @override
  String get ex_cf_14_b1 => 'Vorstufe zu Toes-to-Bar';

  @override
  String get ex_cf_14_b2 =>
      'Dynamisches Core-Training mit geringerem technischem Anspruch';

  @override
  String get ex_cf_14_b3 => 'Verbessert die Griffkraft';

  @override
  String get ex_cf_15_name => 'Muscle-Up';

  @override
  String get ex_cf_15_desc =>
      'Hänge dich im False Grip an die Ringe (oder die Stange). Ziehe den Körper explosiv nach oben, vollziehe den Übergang über die Ringe und drücke dich oben durch Strecken der Arme in den Stütz. Senke dich ab und kontrolliere dabei den umgekehrten Übergang.';

  @override
  String get ex_cf_15_b1 =>
      'Fortgeschrittene Turnbewegung aus Ziehen + Drücken';

  @override
  String get ex_cf_15_b2 =>
      'Wichtiger Meilenstein im CrossFit (RX in vielen WODs)';

  @override
  String get ex_cf_15_b3 => 'Entwickelt extreme Relativkraft zum Körpergewicht';

  @override
  String get ex_cf_16_name => 'Pistol Squat';

  @override
  String get ex_cf_16_desc =>
      'Stehe auf einem Bein und strecke das andere parallel zum Boden nach vorn. Senke dich in eine tiefe Kniebeuge, halte das Gleichgewicht und lass den Standfuß flach auf dem Boden. Drücke dich über die Ferse nach oben, ohne dass das freie Bein den Boden berührt. Wiederhole auf der anderen Seite.';

  @override
  String get ex_cf_16_b1 =>
      'Einbeinige Kniebeuge mit höchstem Schwierigkeitsgrad';

  @override
  String get ex_cf_16_b2 =>
      'Entwickelt die Mobilität von Sprunggelenk und Hüfte';

  @override
  String get ex_cf_16_b3 => 'Einbeiniges Training, das Asymmetrien korrigiert';

  @override
  String get ex_cf_17_name => 'Handstand Push-Up (HSPU)';

  @override
  String get ex_cf_17_desc =>
      'Stütze die Hände etwa 30 cm vor einer Wand auf dem Boden ab und schwinge dich hoch in den Handstand an der Wand. Senke dich durch Beugen der Ellbogen, bis der Kopf den Boden (oder ein AbMat) berührt. Drücke dich wieder nach oben. Nutze den „Kip“, wenn du Unterstützung brauchst.';

  @override
  String get ex_cf_17_b1 => 'Vertikales Drücken mit dem gesamten Körpergewicht';

  @override
  String get ex_cf_17_b2 => 'Verbessert die Stabilität von Schulter und Core';

  @override
  String get ex_cf_17_b3 => 'Wichtiger turnerischer Meilenstein im CrossFit';

  @override
  String get ex_cf_18_name => 'Turkish Get-Up';

  @override
  String get ex_cf_18_desc =>
      'Lege dich auf den Rücken und halte eine Kettlebell mit einem zur Decke gestreckten Arm. Stehe Schritt für Schritt auf (Ellbogen → Hand → Hüfte anheben → Bein durchschwingen → Kniestand → Stand) und halte die Kettlebell dabei stets oben. Kehre die Bewegung um.';

  @override
  String get ex_cf_18_b1 => 'Einzigartige funktionelle Ganzkörperbewegung';

  @override
  String get ex_cf_18_b2 => 'Verbessert Mobilität, Stabilität und Koordination';

  @override
  String get ex_cf_18_b3 => 'Hervorragendes Training für Schulter und Core';

  @override
  String get ex_cf_19_name => 'Double Unders';

  @override
  String get ex_cf_19_desc =>
      'Springe Seil und lasse es bei jedem Sprung zweimal unter den Füßen durchlaufen. Halte die Sprünge flach und den Rhythmus der Handgelenke schnell. Arme eng am Körper, Ellbogen nah an der Taille. Erfordert Koordination und ein Speed Rope.';

  @override
  String get ex_cf_19_b1 => 'Explosives Cardio mit hoher Intensität';

  @override
  String get ex_cf_19_b2 => 'Verbessert Koordination und Timing';

  @override
  String get ex_cf_19_b3 => 'Standard in Hunderten von CrossFit-WODs';

  @override
  String get ex_cf_20_name => 'Farmer\'s Carry';

  @override
  String get ex_cf_20_desc =>
      'Halte eine schwere Kurzhantel oder Kettlebell in jeder Hand an den Seiten. Gehe mit kurzen Schritten und halte dabei eine aufrechte Haltung, die Schultern zurück und den Core angespannt. Lege eine festgelegte Strecke zurück oder arbeite auf Zeit.';

  @override
  String get ex_cf_20_b1 => 'Stärkt Griff und Unterarme';

  @override
  String get ex_cf_20_b2 => 'Funktionelles Training für den ganzen Körper';

  @override
  String get ex_cf_20_b3 => 'Verbessert die Haltung und die Core-Stabilität';

  @override
  String get ex_cf_21_name => 'Goblet Squat';

  @override
  String get ex_cf_21_desc =>
      'Halte eine Kettlebell (oder Kurzhantel) vor der Brust auf Höhe des Brustbeins und greife sie an den „Hörnern“. Führe eine tiefe Kniebeuge aus, mit aufrechtem Oberkörper und nach vorn zeigenden Ellbogen. Drücke dich über die Fersen wieder nach oben.';

  @override
  String get ex_cf_21_b1 => 'Perfekter Einstieg in die Kniebeuge mit Gewicht';

  @override
  String get ex_cf_21_b2 =>
      'Vermittelt eine aufrechte Haltung und die richtige Tiefe';

  @override
  String get ex_cf_21_b3 => 'Hervorragend zur Aktivierung des Cores';

  @override
  String get ex_pecho_1_name => 'Bankdrücken';

  @override
  String get ex_pecho_2_name => 'Schrägbankdrücken mit Kurzhanteln';

  @override
  String get ex_pecho_3_name => 'Fliegende mit Kurzhanteln';

  @override
  String get ex_pecho_4_name => 'Dips am Barren';

  @override
  String get ex_pecho_5_name => 'Kabelzug-Crossover';

  @override
  String get ex_esp_1_name => 'Kreuzheben';

  @override
  String get ex_esp_2_name => 'Klimmzüge';

  @override
  String get ex_esp_3_name => 'Langhantelrudern';

  @override
  String get ex_esp_4_name => 'Kurzhantelrudern';

  @override
  String get ex_esp_5_name => 'Latzug';

  @override
  String get ex_pier_1_name => 'Kniebeugen mit Langhantel';

  @override
  String get ex_pier_2_name => 'Beinpresse';

  @override
  String get ex_pier_3_name => 'Hip Thrust';

  @override
  String get ex_pier_4_name => 'Ausfallschritte';

  @override
  String get ex_pier_5_name => 'Beinbeuger-Maschine';

  @override
  String get ex_hom_1_name => 'Schulterdrücken';

  @override
  String get ex_hom_2_name => 'Seitheben';

  @override
  String get ex_hom_3_name => 'Face Pull';

  @override
  String get ex_hom_4_name => 'Arnold-Press';

  @override
  String get ex_bra_1_name => 'Bizepscurls mit Kurzhanteln';

  @override
  String get ex_bra_2_name => 'SZ-Curls';

  @override
  String get ex_bra_3_name => 'Hammercurls';

  @override
  String get ex_bra_4_name => 'Trizepsdrücken am Kabelzug';

  @override
  String get ex_bra_5_name => 'Stirndrücken (French Press)';

  @override
  String get ex_core_1_name => 'Unterarmstütz (Plank)';

  @override
  String get ex_core_2_name => 'Crunches';

  @override
  String get ex_core_3_name => 'Beinheben im Hang';

  @override
  String get ex_core_4_name => 'Ab-Roller';

  @override
  String get ex_pecho_1_desc =>
      'Lege dich auf eine Flachbank, Füße fest auf dem Boden. Greife die Langhantel etwas weiter als schulterbreit. Senke die Stange kontrolliert bis zur Brust und drücke sie bis zur vollen Streckung nach oben. Halte die Schulterblätter während der gesamten Bewegung zusammengezogen.';

  @override
  String get ex_pecho_2_desc =>
      'Stelle die Bank auf 30–45° ein. Setze dich mit je einer Kurzhantel auf den Oberschenkeln hin. Beim Zurücklehnen bringe die Hanteln auf Brusthöhe, Ellbogen im 45°-Winkel zum Körper. Drücke nach oben und innen, bis die Hanteln sich oben fast berühren.';

  @override
  String get ex_pecho_3_desc =>
      'Lege dich auf eine Flachbank mit einer Kurzhantel in jeder Hand, Arme über der Brust gestreckt, Ellbogen leicht gebeugt. Senke die Arme in einem weiten Bogen, bis du die Dehnung in der Brust spürst, dann kehre in die Ausgangsposition zurück und spanne die Brustmuskeln oben an.';

  @override
  String get ex_pecho_4_desc =>
      'Stütze dich an den Barren mit gestreckten Armen ab. Neige den Oberkörper leicht nach vorn, um die Brust stärker zu aktivieren. Senke den Körper, indem du die Ellbogen beugst, bis die Oberarme parallel zum Boden sind. Drücke dich wieder hoch, ohne die Ellbogen durchzustrecken.';

  @override
  String get ex_pecho_5_desc =>
      'Stelle die Kabelzüge auf die obere Position. Greife die Griffe und mache einen Schritt nach vorn. Mit leicht gebeugten Ellbogen führe die Arme nach vorn und unten zusammen, bis sich die Hände vor dir treffen. Spanne die Brust in der Endposition an und kehre langsam zurück.';

  @override
  String get ex_esp_1_desc =>
      'Stelle dich vor die Langhantel mit hüftbreitem Stand. Greife sie im Ober- oder Wechselgriff knapp außerhalb der Knie. Halte den Rücken gerade und die Brust hoch. Drücke den Boden mit den Füßen weg, während du Hüfte und Knie streckst, bis du aufrecht stehst. Senke kontrolliert ab.';

  @override
  String get ex_esp_2_desc =>
      'Hänge an der Klimmzugstange im Obergriff (Handflächen nach vorn), weiter als schulterbreit. Aktiviere die Schulterblätter und ziehe den Körper nach oben, bis das Kinn über die Stange kommt. Lasse dich langsam und kontrolliert herab. Vermeide Schwung und halte den Core angespannt.';

  @override
  String get ex_esp_3_desc =>
      'Stelle dich schulterbreit hin und beuge den Oberkörper etwa 45° nach vorn mit neutralem Rücken. Greife die Langhantel im Obergriff etwas weiter als schulterbreit. Ziehe die Stange zum Bauch und ziehe die Schulterblätter zusammen. Senke kontrolliert ab, ohne den Oberkörper fallen zu lassen.';

  @override
  String get ex_esp_4_desc =>
      'Stütze das Knie und die Hand derselben Seite auf einer Bank ab. Mit dem Rücken parallel zum Boden und neutraler Wirbelsäule greife die Kurzhantel mit der freien Hand. Ziehe die Hantel zur Hüfte und ziehe das Schulterblatt zusammen. Der Ellbogen gleitet nah am Körper vorbei. Senke kontrolliert ab.';

  @override
  String get ex_esp_5_desc =>
      'Setze dich an die Latzugmaschine und greife die breite Stange im Obergriff. Mit dem Oberkörper leicht nach hinten geneigt ziehe die Stange zur Brust, ziehe die Schulterblätter zusammen und senke die Ellbogen. Nicht schwingen. Kehre langsam und kontrolliert in die Ausgangsposition zurück.';

  @override
  String get ex_pier_1_desc =>
      'Lege die Langhantel auf dem Trapezmuskel ab. Füße schulterbreit oder etwas weiter. Senke dich durch Beugen von Knien und Hüfte mit aufrechter Brust und neutralem Rücken, bis die Oberschenkel parallel zum Boden sind. Drücke dich über die Fersen nach oben zurück.';

  @override
  String get ex_pier_2_desc =>
      'Setze dich in die Maschine mit dem Rücken vollständig angelehnt. Stelle die Füße schulterbreit auf die Plattform. Löse die Sicherung und senke die Plattform, bis die Knie ca. 90° bilden, dann drücke bis fast zur vollen Streckung, ohne die Knie durchzudrücken.';

  @override
  String get ex_pier_3_desc =>
      'Lehne die Schulterblätter an eine stabile Bank, die Langhantel liegt auf der Hüfte (verwende ein Polster). Füße schulterbreit auf dem Boden. Senke die Hüfte zum Boden und drücke dann nach oben, spanne die Gesäßmuskeln an, bis die Hüfte parallel zum Boden ist.';

  @override
  String get ex_pier_4_desc =>
      'Stehe aufrecht mit einer Kurzhantel in jeder Hand. Mache einen großen Schritt nach vorn und senke das hintere Knie fast bis zum Boden. Das vordere Knie sollte nicht über die Zehenspitzen hinausragen. Drücke dich mit der Ferse des vorderen Fußes zurück in die Ausgangsposition. Wechsle die Beine ab.';

  @override
  String get ex_pier_5_desc =>
      'Lege dich bäuchlings auf die Maschine mit den Fersen unter der Rolle. Beuge die Knie und führe die Fersen kontrolliert zu den Gesäßmuskeln. Spanne in der Endposition die Beinbeuger an. Senke langsam ab, ohne das Gewicht abzusetzen.';

  @override
  String get ex_hom_1_desc =>
      'Stehend oder sitzend, mit der Langhantel auf Schulterhöhe im Obergriff etwas weiter als schulterbreit. Drücke die Stange senkrecht über den Kopf bis zur vollen Streckung. Senke kontrolliert in die Ausgangsposition. Halte den Core aktiv, um die Lendenwirbelsäule zu schützen.';

  @override
  String get ex_hom_2_desc =>
      'Stehe aufrecht mit einer Kurzhantel in jeder Hand an den Seiten, Handflächen nach innen. Mit leicht gebeugten Ellbogen hebe die Arme seitlich bis auf Schulterhöhe. Senke langsam ab. Vermeide Schwung oder Abfälschen – die Bewegung sollte sauber und kontrolliert sein.';

  @override
  String get ex_hom_3_desc =>
      'Befestige das Seil am oberen Kabelzug. Greife die Enden mit den Handflächen nach unten und tritt einen Schritt zurück. Ziehe das Seil zum Gesicht, spreize die Ellbogen auf Schulterhöhe und führe die Hände zu den Ohren. Spanne den hinteren Deltamuskel in der Endposition an.';

  @override
  String get ex_hom_4_desc =>
      'Sitzend mit den Kurzhanteln vor dir auf Schulterhöhe, Handflächen zu dir. Beim Hochdrücken drehe die Handflächen nach außen, sodass sie oben nach vorn zeigen. Senke ab und kehre die Drehbewegung um, bis du in der Ausgangsposition bist. Fließende, durchgehende Bewegung.';

  @override
  String get ex_bra_1_desc =>
      'Stehe aufrecht mit einer Kurzhantel in jeder Hand, Arme gestreckt, Handflächen nach vorn. Beuge die Ellbogen und führe die Hanteln zu den Schultern, ohne die Oberarme zu bewegen. Spanne den Bizeps oben an. Senke kontrolliert bis zur vollen Streckung ab.';

  @override
  String get ex_bra_2_desc =>
      'Stehe aufrecht mit der SZ-Stange im Untergriff, schulterbreit. Halte die Ellbogen eng am Körper und beuge bis die Stange auf Brusthöhe ist. Senke kontrolliert ab und spüre die volle Dehnung des Bizeps. Die SZ-Stange reduziert die Belastung der Handgelenke.';

  @override
  String get ex_bra_3_desc =>
      'Stehe aufrecht mit einer Kurzhantel in jeder Hand im neutralen Griff (Handflächen zueinander, wie beim Halten eines Hammers). Beuge die Ellbogen abwechselnd oder gleichzeitig und führe die Hanteln zu den Schultern. Halte die Ellbogen stets eng am Körper. Senke kontrolliert ab.';

  @override
  String get ex_bra_4_desc =>
      'Befestige das Seil oder die Stange am oberen Kabelzug. Greife das Zubehör mit gebeugten Ellbogen eng am Körper. Drücke nach unten und strecke die Ellbogen vollständig, ohne sie zu bewegen. Spreize die Hände leicht am Ende, wenn du das Seil verwendest. Kehre langsam und kontrolliert zurück.';

  @override
  String get ex_bra_5_desc =>
      'Lege dich auf eine Bank mit der SZ-Stange bei gestreckten Armen über der Brust. Mit den Ellbogen zur Decke gerichtet senke die Stange zur Stirn, indem du nur die Ellbogen beugst. Strecke wieder in die Ausgangsposition. Die Ellbogen bleiben fixiert; nur der Unterarm bewegt sich.';

  @override
  String get ex_core_1_desc =>
      'Stütze dich auf den Unterarmen und den Zehenspitzen ab. Halte den Körper gerade wie ein Brett: Hüfte weder angehoben noch durchhängend, Gesäß angespannt und Bauch eingezogen. Atme gleichmäßig. Halte die Position für die Zielzeit, ohne die Form zu verlieren.';

  @override
  String get ex_core_2_desc =>
      'Lege dich auf den Rücken mit angewinkelten Knien und aufgestellten Füßen. Lege die Hände hinter den Kopf, ohne am Nacken zu ziehen. Spanne den Bauch an und hebe die Schultern etwa 30° vom Boden ab, spanne die Bauchmuskeln oben an. Senke kontrolliert ab, ohne die Spannung vollständig zu lösen.';

  @override
  String get ex_core_3_desc =>
      'Hänge an der Klimmzugstange im Obergriff, schulterbreit. Mit leicht angewinkelten Beinen hebe die Knie oder Beine bis zur Waagerechten (oder höher) und spanne den Bauch an. Senke langsam ab, ohne zu schwingen. Die Bewegung kommt aus der Hüftbeugung, nicht aus Schwung.';

  @override
  String get ex_core_4_desc =>
      'Knie dich hin, das Ab-Wheel vor dir. Greife die Griffe und rolle langsam nach vorn, strecke den Körper bis fast zum Boden. Spanne den Core an, um in die Ausgangsposition zurückzukehren, ohne die Hüfte durchhängen zu lassen. Halte den Rücken neutral und den Bauch angespannt.';

  @override
  String get secondary_triceps => 'Trizeps';

  @override
  String get secondary_anteriorDeltoid => 'Vorderer Deltamuskel';

  @override
  String get secondary_biceps => 'Bizeps';

  @override
  String get secondary_glutes => 'Gesäßmuskeln';

  @override
  String get secondary_hamstrings => 'Beinbeuger';

  @override
  String get secondary_trapezius => 'Trapezmuskel';

  @override
  String get secondary_rhomboids => 'Rhomboiden';

  @override
  String get secondary_lowerBack => 'Unterer Rücken';

  @override
  String get secondary_quads => 'Quadrizeps';

  @override
  String get secondary_calves => 'Waden';

  @override
  String get secondary_rotatorCuff => 'Rotatorenmanschette';

  @override
  String get secondary_brachialis => 'Brachialis';

  @override
  String get secondary_brachioradialis => 'Brachioradialis';

  @override
  String get secondary_anconeus => 'Anconeus';

  @override
  String get secondary_obliques => 'Schräge Bauchmuskeln';

  @override
  String get secondary_hipFlexors => 'Hüftbeuger';

  @override
  String get secondary_deltoids => 'Deltamuskeln';

  @override
  String get secondary_lats => 'Latissimus';

  @override
  String get ex_pecho_1_b1 => 'Baut Masse und Kraft in der Brust auf';

  @override
  String get ex_pecho_1_b2 => 'Stärkt Trizeps und vordere Schultern';

  @override
  String get ex_pecho_1_b3 =>
      'Verbundübung mit hohem Transfer auf funktionelle Kraft';

  @override
  String get ex_pecho_2_b1 =>
      'Betont den oberen (klavikulären) Anteil der Brust';

  @override
  String get ex_pecho_2_b2 => 'Größerer Bewegungsumfang als mit der Langhantel';

  @override
  String get ex_pecho_2_b3 => 'Ermöglicht unilaterales Training jeder Seite';

  @override
  String get ex_pecho_3_b1 => 'Tiefe Isolation des großen Brustmuskels';

  @override
  String get ex_pecho_3_b2 => 'Verbessert Elastizität und Dehnung der Brust';

  @override
  String get ex_pecho_3_b3 => 'Ideal für Volumen und Definition';

  @override
  String get ex_pecho_4_b1 => 'Verbundübung für Brust, Trizeps und Schultern';

  @override
  String get ex_pecho_4_b2 => 'Kein zusätzliches Equipment nötig';

  @override
  String get ex_pecho_4_b3 =>
      'Progression durch Zusatzgewicht mit Gürtel möglich';

  @override
  String get ex_pecho_5_b1 =>
      'Konstante Spannung über den gesamten Bewegungsumfang';

  @override
  String get ex_pecho_5_b2 =>
      'Hervorragend für Definition und Isolation der Brust';

  @override
  String get ex_pecho_5_b3 => 'Mehrere Varianten je nach Kabelzughöhe';

  @override
  String get ex_esp_1_b1 => 'Ganzkörperübung, die die Gesamtkraft maximiert';

  @override
  String get ex_esp_1_b2 =>
      'Entwickelt die hintere Kette (Rücken, Gesäß, Beinbeuger)';

  @override
  String get ex_esp_1_b3 => 'Hohe Hormonausschüttung und anabole Wirkung';

  @override
  String get ex_esp_2_b1 =>
      'Entwickelt die Breite des Rückens (Latissimus dorsi)';

  @override
  String get ex_esp_2_b2 => 'Verbessert die relative Kraft zum Körpergewicht';

  @override
  String get ex_esp_2_b3 =>
      'Hervorragender Indikator für funktionelle Leistung';

  @override
  String get ex_esp_3_b1 => 'Entwickelt Dicke und Dichte des Rückens';

  @override
  String get ex_esp_3_b2 => 'Stärkt die Haltungsmuskulatur';

  @override
  String get ex_esp_3_b3 => 'Ideale Ergänzung zum Bankdrücken';

  @override
  String get ex_esp_4_b1 => 'Korrektur von Dysbalancen zwischen beiden Seiten';

  @override
  String get ex_esp_4_b2 =>
      'Größerer Bewegungsumfang als beim Langhantelrudern';

  @override
  String get ex_esp_4_b3 => 'Hervorragend für Anfänger, da leicht zu erlernen';

  @override
  String get ex_esp_5_b1 => 'Alternative zu Klimmzügen für Anfänger';

  @override
  String get ex_esp_5_b2 => 'Entwickelt die Breite des Rückens';

  @override
  String get ex_esp_5_b3 =>
      'Einfache Gewichtskontrolle und schrittweise Steigerung';

  @override
  String get ex_pier_1_b1 => 'Die umfassendste Übung für den Unterkörper';

  @override
  String get ex_pier_1_b2 =>
      'Setzt mehr anabole Hormone frei als jede andere Übung';

  @override
  String get ex_pier_1_b3 => 'Verbessert athletische Kraft und Funktionalität';

  @override
  String get ex_pier_2_b1 => 'Ermöglicht sicheres Training mit hohen Gewichten';

  @override
  String get ex_pier_2_b2 => 'Ideal für Anfänger oder Rehabilitation';

  @override
  String get ex_pier_2_b3 =>
      'Fußposition variierbar für verschiedene Schwerpunkte';

  @override
  String get ex_pier_3_b1 =>
      'Die effektivste Übung zur Aktivierung und Entwicklung der Gesäßmuskeln';

  @override
  String get ex_pier_3_b2 => 'Verbessert die Hüftstreckung und die Haltung';

  @override
  String get ex_pier_3_b3 =>
      'Reduziert das Verletzungsrisiko an Knie und Hüfte';

  @override
  String get ex_pier_4_b1 =>
      'Trainiert jedes Bein einzeln und korrigiert Dysbalancen';

  @override
  String get ex_pier_4_b2 => 'Verbessert Gleichgewicht und Stabilität';

  @override
  String get ex_pier_4_b3 =>
      'Hervorragend für die Entwicklung von Gesäß und Quadrizeps';

  @override
  String get ex_pier_5_b1 => 'Direkte Isolation der Beinbeuger';

  @override
  String get ex_pier_5_b2 =>
      'Beugt Verletzungen der hinteren Oberschenkelmuskulatur vor';

  @override
  String get ex_pier_5_b3 =>
      'Gleicht die Muskelentwicklung des Oberschenkels aus';

  @override
  String get ex_hom_1_b1 => 'Entwickelt alle drei Anteile des Deltamuskels';

  @override
  String get ex_hom_1_b2 => 'Verbessert die funktionelle Überkopfkraft';

  @override
  String get ex_hom_1_b3 =>
      'Stärkt die Rotatorenmanschette und Schulterstabilität';

  @override
  String get ex_hom_2_b1 =>
      'Isolation des seitlichen Deltamuskels für breitere Schultern';

  @override
  String get ex_hom_2_b2 => 'Verbessert die optische Breite des Oberkörpers';

  @override
  String get ex_hom_2_b3 =>
      'Geringes Verletzungsrisiko bei angemessenem Gewicht';

  @override
  String get ex_hom_3_b1 =>
      'Stärkt den hinteren Deltamuskel und verbessert die Haltung';

  @override
  String get ex_hom_3_b2 => 'Beugt Verletzungen der Rotatorenmanschette vor';

  @override
  String get ex_hom_3_b3 => 'Gleicht die Auswirkungen von Druckübungen aus';

  @override
  String get ex_hom_4_b1 =>
      'Aktiviert alle drei Deltoidanteile in einer Bewegung';

  @override
  String get ex_hom_4_b2 => 'Die Rotation verbessert die Schultermobilität';

  @override
  String get ex_hom_4_b3 =>
      'Umfassendere Variante als das konventionelle Schulterdrücken';

  @override
  String get ex_bra_1_b1 => 'Direkte Isolation des Bizeps';

  @override
  String get ex_bra_1_b2 => 'Trainiert jeden Arm unabhängig';

  @override
  String get ex_bra_1_b3 =>
      'Einfache Gewichtssteigerung und zugängliche Technik';

  @override
  String get ex_bra_2_b1 => 'Ermöglicht höhere Gewichte als mit Kurzhanteln';

  @override
  String get ex_bra_2_b2 =>
      'Die SZ-Stange reduziert die Belastung von Handgelenken und Ellbogen';

  @override
  String get ex_bra_2_b3 => 'Ideal für den Aufbau von Gesamtmasse im Bizeps';

  @override
  String get ex_bra_3_b1 => 'Betonung von Brachialis und Brachioradialis';

  @override
  String get ex_bra_3_b2 =>
      'Verleiht dem Arm Dicke und Volumen in der Frontalansicht';

  @override
  String get ex_bra_3_b3 =>
      'Weniger Handgelenkbelastung als beim Untergriff-Curl';

  @override
  String get ex_bra_4_b1 => 'Effektive Isolation aller drei Trizepsköpfe';

  @override
  String get ex_bra_4_b2 => 'Konstante Spannung dank Kabelzug';

  @override
  String get ex_bra_4_b3 =>
      'Hervorragend für Definition und Finish des Trizeps';

  @override
  String get ex_bra_5_b1 => 'Maximale Dehnung des langen Trizepskopfes';

  @override
  String get ex_bra_5_b2 => 'Entwickelt die Dicke des Trizeps';

  @override
  String get ex_bra_5_b3 =>
      'Kann mit Kurzhanteln oder gerader Stange ausgeführt werden';

  @override
  String get ex_core_1_b1 =>
      'Stärkt die tiefe Rumpfmuskulatur ohne Wirbelsäulenbelastung';

  @override
  String get ex_core_1_b2 => 'Verbessert Haltung und Lendenstabilität';

  @override
  String get ex_core_1_b3 => 'Reduziert das Risiko von Rückenverletzungen';

  @override
  String get ex_core_2_b1 =>
      'Grundlegende Isolationsübung für den geraden Bauchmuskel';

  @override
  String get ex_core_2_b2 => 'Einfach zu erlernen und auszuführen';

  @override
  String get ex_core_2_b3 => 'Basis für anspruchsvollere Bauchübungen';

  @override
  String get ex_core_3_b1 => 'Trainiert den unteren Core mit hoher Intensität';

  @override
  String get ex_core_3_b2 =>
      'Verbessert die Griffkraft und die Lendenmuskulatur';

  @override
  String get ex_core_3_b3 =>
      'Progressive Varianten: angewinkelte Knie → gestreckte Beine → L-Sit';

  @override
  String get ex_core_4_b1 =>
      'Eine der umfassendsten und anspruchsvollsten Core-Übungen';

  @override
  String get ex_core_4_b2 =>
      'Trainiert den Core in Extension, anders als klassische Bauchübungen';

  @override
  String get ex_core_4_b3 =>
      'Entwickelt funktionelle Kraft in der gesamten vorderen Kette';
}
