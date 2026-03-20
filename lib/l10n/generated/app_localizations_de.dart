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
  String get common_ok => 'OK';

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
  String get common_pro => 'PRO';

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
  String get nav_history => 'Verlauf';

  @override
  String get nav_rest => 'Pause';

  @override
  String get nav_exercises => 'Übungen';

  @override
  String get login_tagline => 'Deine persönliche Fitness-App';

  @override
  String get login_continueGoogle => 'Weiter mit Google';

  @override
  String get login_continueApple => 'Weiter mit Apple';

  @override
  String get login_continueEmail => 'Weiter mit E-Mail';

  @override
  String get login_legal =>
      'Mit der Nutzung akzeptierst du unsere Nutzungsbedingungen\nund Datenschutzrichtlinie.';

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
  String get home_startWorkout => 'Training starten';

  @override
  String get home_thisWeek => 'Diese Woche';

  @override
  String get home_weekTime => 'Wochenzeit';

  @override
  String get home_weekVolume => 'Wochenvolumen';

  @override
  String get home_quickAccess => 'Schnellzugriff';

  @override
  String get home_lastWorkout => 'Letztes Training';

  @override
  String get home_viewAll => 'Alle anzeigen';

  @override
  String get home_noWorkoutsYet => 'Noch keine Trainings';

  @override
  String get home_noWorkoutsSubtitle =>
      'Schließe dein erstes Training ab und es wird hier angezeigt.';

  @override
  String get home_goToTrain => 'Zum Training →';

  @override
  String get home_progress => 'Fortschritt';

  @override
  String get home_noRecordsYet => 'Noch keine Einträge';

  @override
  String get home_recordWeightMeasures => 'Erfasse dein Gewicht und deine Maße';

  @override
  String get home_achievements => 'Erfolge';

  @override
  String get home_noAchievements =>
      'Schließe Trainings ab, um Erfolge freizuschalten';

  @override
  String get home_recentExercises => 'Letzte Übungen';

  @override
  String get home_noRecentExercises => 'Deine häufigen Übungen erscheinen hier';

  @override
  String home_frequentExercise(int count) {
    return '$count Einheiten';
  }

  @override
  String get home_latestRecord => 'Letzter Eintrag';

  @override
  String get home_waist => 'Taille';

  @override
  String get home_hips => 'Hüfte';

  @override
  String get home_exerciseLibrary => 'Übungsbibliothek';

  @override
  String get home_viewAllExercises => 'Alle anzeigen';

  @override
  String home_exercisesAvailable(int count) {
    return '$count Übungen verfügbar';
  }

  @override
  String get profile_proActive => 'Abo aktiv';

  @override
  String get profile_freePlan => 'Kostenloser Plan';

  @override
  String get profile_upgradePro => 'Auf PRO upgraden';

  @override
  String get profile_redeemCode => 'Code einlösen';

  @override
  String get profile_restorePurchases => 'Käufe wiederherstellen';

  @override
  String get profile_signOut => 'Abmelden';

  @override
  String get profile_deleteAccount => 'Konto löschen';

  @override
  String get profile_redeemTitle => 'Code einlösen';

  @override
  String get profile_redeemSubtitle =>
      'Gib deinen Aktionscode ein, um LiftWave PRO freizuschalten.';

  @override
  String get profile_codeHint => 'CODE';

  @override
  String get profile_redeem => 'Einlösen';

  @override
  String get profile_proActivated => 'LiftWave PRO aktiviert';

  @override
  String get profile_invalidCode => 'Ungültiger Code';

  @override
  String get profile_purchasesRestored => 'Käufe erfolgreich wiederhergestellt';

  @override
  String get profile_noPurchasesFound => 'Keine früheren Käufe gefunden';

  @override
  String get profile_deleteTitle => 'Konto löschen';

  @override
  String get profile_deleteConfirm =>
      'Bist du sicher? Diese Aktion ist unwiderruflich und alle deine Daten werden gelöscht.';

  @override
  String get profile_deleteReauthError =>
      'Um dein Konto zu löschen, melde dich ab, erneut an und versuche es nochmal.';

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
  String get train_cancelWorkout => 'Training abbrechen';

  @override
  String get train_cancelConfirm =>
      'Wirklich abbrechen? Der Fortschritt geht verloren.';

  @override
  String get train_continue => 'Fortsetzen';

  @override
  String get train_addExerciseFirst =>
      'Füge mindestens eine Übung hinzu, bevor du abschließt.';

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
    return '$count Übungen';
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
  String get train_notesHint => 'Notizen (optional)';

  @override
  String get train_setHeader => 'SATZ';

  @override
  String get train_repsHeader => 'WDH.';

  @override
  String get train_weightHeader => 'GEWICHT (kg)';

  @override
  String get train_addSet => 'Satz hinzufügen';

  @override
  String train_lastWeight(String weight) {
    return 'Zuletzt: $weight kg';
  }

  @override
  String get train_abbreviationExercises => 'Üb.';

  @override
  String get train_orChooseRoutine => 'Oder wähle eine Routine';

  @override
  String get train_defaultRoutineName => 'Meine Routine';

  @override
  String get train_bodyweightLabel => 'Körpergewicht';

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
  String exercises_exerciseCount(int count, String suffix) {
    return '$count Übung$suffix';
  }

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
  String get history_limitedHistory => 'Eingeschränkter Verlauf';

  @override
  String history_unlockWorkouts(int count) {
    return 'Schalte deine $count Trainings mit PRO frei';
  }

  @override
  String get history_weeklySummary => 'Wochenzusammenfassung';

  @override
  String get history_workouts => 'Trainings';

  @override
  String get history_total => 'Gesamt';

  @override
  String get history_volumeKg => 'Volumen kg';

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
    return '$count Sätze';
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
  String get paywall_featureTemplates => 'Trainingsvorlagen';

  @override
  String get paywall_featureHistory => 'Unbegrenzter Verlauf';

  @override
  String get paywall_featureTimer => 'Individueller Timer';

  @override
  String get paywall_featureDetails => 'Übungsdetails';

  @override
  String get paywall_featureMeasures => 'Körpermaße + Fotos';

  @override
  String get paywall_featureStats => 'Wöchentliche Statistiken';

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
  String get paywall_freeTrial => '7 Tage kostenlos testen';

  @override
  String get paywall_startTrial => 'Kostenlose Testphase starten';

  @override
  String get paywall_restorePurchases => 'Käufe wiederherstellen';

  @override
  String get paywall_legalText =>
      'Das Abo verlängert sich automatisch. Du kannst jederzeit\nim App Store kündigen.';

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
  String get rest_title => 'Pause';

  @override
  String get rest_ready => 'Bereit! Zeit für den nächsten Satz';

  @override
  String get rest_almostReady => 'Fast bereit!';

  @override
  String get rest_resting => 'Pause läuft...';

  @override
  String rest_customTime(String time) {
    return 'Eigene Zeit · $time';
  }

  @override
  String get rest_choosePreset => 'Wähle eine Vorlage oder passe an';

  @override
  String rest_of(String time) {
    return 'von $time';
  }

  @override
  String get rest_presets => 'Vorlagen';

  @override
  String get rest_customize => 'Anpassen';

  @override
  String get rest_customTimeTitle => 'Eigene Zeit';

  @override
  String get rest_customTimeSubtitle =>
      'Gib die Minuten und Sekunden der Pause ein.';

  @override
  String get rest_minutes => 'Minuten';

  @override
  String get rest_seconds => 'Sekunden';

  @override
  String get rest_setTime => 'Zeit einstellen';

  @override
  String get progressScreen_title => 'Körperfortschritt';

  @override
  String get progressScreen_measurements => 'Maße';

  @override
  String get progressScreen_photos => 'Fotos';

  @override
  String get progressScreen_addMeasurement => 'Messung hinzufügen';

  @override
  String get progressScreen_weight => 'Gewicht';

  @override
  String get progressScreen_bodyFat => 'Körperfett';

  @override
  String get progressScreen_muscle => 'Muskel';

  @override
  String get progressScreen_noEntries => 'Noch keine Einträge';

  @override
  String get progressScreen_noEntriesHint =>
      'Tippe auf +, um deine erste Messung hinzuzufügen';

  @override
  String get progressScreen_noPhotos => 'Noch keine Fotos';

  @override
  String get progressScreen_noPhotosHint =>
      'Tippe auf +, um dein erstes Fortschrittsfoto hinzuzufügen';

  @override
  String get progressScreen_current => 'Aktuell';

  @override
  String get progressScreen_change => 'Änderung';

  @override
  String get progressScreen_trend => 'Trend';

  @override
  String get progressScreen_addMeasurementTitle => 'Neue Messung';

  @override
  String get progressScreen_weightKg => 'Gewicht (kg)';

  @override
  String get progressScreen_bodyFatPercent => 'Körperfett (%)';

  @override
  String get progressScreen_muscleMassKg => 'Muskelmasse (kg)';

  @override
  String get progressScreen_optional => 'Optional';

  @override
  String get progressScreen_saveEntry => 'Eintrag speichern';

  @override
  String get progressScreen_deleteMeasurement => 'Diesen Eintrag löschen?';

  @override
  String get progressScreen_deletePhoto => 'Dieses Foto löschen?';

  @override
  String get progressScreen_camera => 'Kamera';

  @override
  String get progressScreen_gallery => 'Galerie';

  @override
  String get progressScreen_selectSource => 'Quelle auswählen';

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
  String get csv_header =>
      'Datum,Training,Übung,Muskelgruppe,Satz,Wdh.,Gewicht (kg),Volumen (kg)';

  @override
  String get csv_subject => 'LiftWave – Trainingsverlauf';

  @override
  String get template_fullBody_subtitle =>
      'Alle Muskelgruppen in einer Einheit';

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
