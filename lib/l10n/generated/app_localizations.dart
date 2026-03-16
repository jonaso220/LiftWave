import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of S
/// returned by `S.of(context)`.
///
/// Applications need to include `S.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: S.localizationsDelegates,
///   supportedLocales: S.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the S.supportedLocales
/// property.
abstract class S {
  S(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S)!;
  }

  static const LocalizationsDelegate<S> delegate = _SDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('es'),
    Locale('de'),
    Locale('en'),
    Locale('fr'),
    Locale('ja'),
    Locale('ko'),
    Locale('pt'),
  ];

  /// No description provided for @common_cancel.
  ///
  /// In es, this message translates to:
  /// **'Cancelar'**
  String get common_cancel;

  /// No description provided for @common_delete.
  ///
  /// In es, this message translates to:
  /// **'Eliminar'**
  String get common_delete;

  /// No description provided for @common_save.
  ///
  /// In es, this message translates to:
  /// **'Guardar'**
  String get common_save;

  /// No description provided for @common_ok.
  ///
  /// In es, this message translates to:
  /// **'OK'**
  String get common_ok;

  /// No description provided for @common_or.
  ///
  /// In es, this message translates to:
  /// **'o'**
  String get common_or;

  /// No description provided for @common_today.
  ///
  /// In es, this message translates to:
  /// **'Hoy'**
  String get common_today;

  /// No description provided for @common_yesterday.
  ///
  /// In es, this message translates to:
  /// **'Ayer'**
  String get common_yesterday;

  /// No description provided for @common_daysAgo.
  ///
  /// In es, this message translates to:
  /// **'Hace {count} días'**
  String common_daysAgo(int count);

  /// No description provided for @common_exercises.
  ///
  /// In es, this message translates to:
  /// **'Ejercicios'**
  String get common_exercises;

  /// No description provided for @common_sets.
  ///
  /// In es, this message translates to:
  /// **'Series'**
  String get common_sets;

  /// No description provided for @common_volume.
  ///
  /// In es, this message translates to:
  /// **'Volumen'**
  String get common_volume;

  /// No description provided for @common_reps.
  ///
  /// In es, this message translates to:
  /// **'Reps'**
  String get common_reps;

  /// No description provided for @common_weight.
  ///
  /// In es, this message translates to:
  /// **'Peso'**
  String get common_weight;

  /// No description provided for @common_duration.
  ///
  /// In es, this message translates to:
  /// **'Duración'**
  String get common_duration;

  /// No description provided for @common_bodyweight.
  ///
  /// In es, this message translates to:
  /// **'Corporal'**
  String get common_bodyweight;

  /// No description provided for @common_custom.
  ///
  /// In es, this message translates to:
  /// **'CUSTOM'**
  String get common_custom;

  /// No description provided for @common_pro.
  ///
  /// In es, this message translates to:
  /// **'PRO'**
  String get common_pro;

  /// No description provided for @muscle_all.
  ///
  /// In es, this message translates to:
  /// **'Todos'**
  String get muscle_all;

  /// No description provided for @muscle_chest.
  ///
  /// In es, this message translates to:
  /// **'Pecho'**
  String get muscle_chest;

  /// No description provided for @muscle_back.
  ///
  /// In es, this message translates to:
  /// **'Espalda'**
  String get muscle_back;

  /// No description provided for @muscle_legs.
  ///
  /// In es, this message translates to:
  /// **'Piernas'**
  String get muscle_legs;

  /// No description provided for @muscle_shoulders.
  ///
  /// In es, this message translates to:
  /// **'Hombros'**
  String get muscle_shoulders;

  /// No description provided for @muscle_arms.
  ///
  /// In es, this message translates to:
  /// **'Brazos'**
  String get muscle_arms;

  /// No description provided for @muscle_core.
  ///
  /// In es, this message translates to:
  /// **'Core'**
  String get muscle_core;

  /// No description provided for @equipment_all.
  ///
  /// In es, this message translates to:
  /// **'Todos'**
  String get equipment_all;

  /// No description provided for @equipment_barbell.
  ///
  /// In es, this message translates to:
  /// **'Barra'**
  String get equipment_barbell;

  /// No description provided for @equipment_dumbbells.
  ///
  /// In es, this message translates to:
  /// **'Mancuernas'**
  String get equipment_dumbbells;

  /// No description provided for @equipment_machine.
  ///
  /// In es, this message translates to:
  /// **'Máquina'**
  String get equipment_machine;

  /// No description provided for @equipment_cable.
  ///
  /// In es, this message translates to:
  /// **'Polea'**
  String get equipment_cable;

  /// No description provided for @equipment_bodyweight.
  ///
  /// In es, this message translates to:
  /// **'Peso corporal'**
  String get equipment_bodyweight;

  /// No description provided for @equipment_pullupBar.
  ///
  /// In es, this message translates to:
  /// **'Barra fija'**
  String get equipment_pullupBar;

  /// No description provided for @equipment_noEquipment.
  ///
  /// In es, this message translates to:
  /// **'Sin material'**
  String get equipment_noEquipment;

  /// No description provided for @equipment_parallelBars.
  ///
  /// In es, this message translates to:
  /// **'Paralelas'**
  String get equipment_parallelBars;

  /// No description provided for @difficulty_beginner.
  ///
  /// In es, this message translates to:
  /// **'Principiante'**
  String get difficulty_beginner;

  /// No description provided for @difficulty_intermediate.
  ///
  /// In es, this message translates to:
  /// **'Intermedio'**
  String get difficulty_intermediate;

  /// No description provided for @difficulty_advanced.
  ///
  /// In es, this message translates to:
  /// **'Avanzado'**
  String get difficulty_advanced;

  /// No description provided for @nav_home.
  ///
  /// In es, this message translates to:
  /// **'Inicio'**
  String get nav_home;

  /// No description provided for @nav_train.
  ///
  /// In es, this message translates to:
  /// **'Entrenar'**
  String get nav_train;

  /// No description provided for @nav_history.
  ///
  /// In es, this message translates to:
  /// **'Historial'**
  String get nav_history;

  /// No description provided for @nav_rest.
  ///
  /// In es, this message translates to:
  /// **'Descanso'**
  String get nav_rest;

  /// No description provided for @nav_exercises.
  ///
  /// In es, this message translates to:
  /// **'Ejercicios'**
  String get nav_exercises;

  /// No description provided for @login_tagline.
  ///
  /// In es, this message translates to:
  /// **'Tu app de fitness personal'**
  String get login_tagline;

  /// No description provided for @login_continueGoogle.
  ///
  /// In es, this message translates to:
  /// **'Continuar con Google'**
  String get login_continueGoogle;

  /// No description provided for @login_continueApple.
  ///
  /// In es, this message translates to:
  /// **'Continuar con Apple'**
  String get login_continueApple;

  /// No description provided for @login_continueEmail.
  ///
  /// In es, this message translates to:
  /// **'Continuar con correo'**
  String get login_continueEmail;

  /// No description provided for @login_legal.
  ///
  /// In es, this message translates to:
  /// **'Al continuar, aceptas nuestros términos de servicio\ny política de privacidad.'**
  String get login_legal;

  /// No description provided for @login_googleError.
  ///
  /// In es, this message translates to:
  /// **'No se pudo iniciar sesión con Google.'**
  String get login_googleError;

  /// No description provided for @login_appleError.
  ///
  /// In es, this message translates to:
  /// **'No se pudo iniciar sesión con Apple.'**
  String get login_appleError;

  /// No description provided for @emailAuth_titleLogin.
  ///
  /// In es, this message translates to:
  /// **'Iniciar sesión'**
  String get emailAuth_titleLogin;

  /// No description provided for @emailAuth_titleRegister.
  ///
  /// In es, this message translates to:
  /// **'Crear cuenta'**
  String get emailAuth_titleRegister;

  /// No description provided for @emailAuth_greetingLogin.
  ///
  /// In es, this message translates to:
  /// **'Nos alegra verte'**
  String get emailAuth_greetingLogin;

  /// No description provided for @emailAuth_greetingRegister.
  ///
  /// In es, this message translates to:
  /// **'¡Bienvenido!'**
  String get emailAuth_greetingRegister;

  /// No description provided for @emailAuth_subtitleLogin.
  ///
  /// In es, this message translates to:
  /// **'Ingresa con tu correo y contraseña'**
  String get emailAuth_subtitleLogin;

  /// No description provided for @emailAuth_subtitleRegister.
  ///
  /// In es, this message translates to:
  /// **'Crea tu cuenta para empezar'**
  String get emailAuth_subtitleRegister;

  /// No description provided for @emailAuth_nameLabel.
  ///
  /// In es, this message translates to:
  /// **'Nombre'**
  String get emailAuth_nameLabel;

  /// No description provided for @emailAuth_nameHint.
  ///
  /// In es, this message translates to:
  /// **'Tu nombre'**
  String get emailAuth_nameHint;

  /// No description provided for @emailAuth_nameError.
  ///
  /// In es, this message translates to:
  /// **'Introduce tu nombre'**
  String get emailAuth_nameError;

  /// No description provided for @emailAuth_emailLabel.
  ///
  /// In es, this message translates to:
  /// **'Correo electrónico'**
  String get emailAuth_emailLabel;

  /// No description provided for @emailAuth_emailHint.
  ///
  /// In es, this message translates to:
  /// **'correo@ejemplo.com'**
  String get emailAuth_emailHint;

  /// No description provided for @emailAuth_emailErrorEmpty.
  ///
  /// In es, this message translates to:
  /// **'Introduce tu correo'**
  String get emailAuth_emailErrorEmpty;

  /// No description provided for @emailAuth_emailErrorInvalid.
  ///
  /// In es, this message translates to:
  /// **'Correo no válido'**
  String get emailAuth_emailErrorInvalid;

  /// No description provided for @emailAuth_passwordLabel.
  ///
  /// In es, this message translates to:
  /// **'Contraseña'**
  String get emailAuth_passwordLabel;

  /// No description provided for @emailAuth_passwordHintLogin.
  ///
  /// In es, this message translates to:
  /// **'Tu contraseña'**
  String get emailAuth_passwordHintLogin;

  /// No description provided for @emailAuth_passwordHintRegister.
  ///
  /// In es, this message translates to:
  /// **'Mínimo 6 caracteres'**
  String get emailAuth_passwordHintRegister;

  /// No description provided for @emailAuth_passwordErrorEmpty.
  ///
  /// In es, this message translates to:
  /// **'Introduce tu contraseña'**
  String get emailAuth_passwordErrorEmpty;

  /// No description provided for @emailAuth_passwordErrorShort.
  ///
  /// In es, this message translates to:
  /// **'Mínimo 6 caracteres'**
  String get emailAuth_passwordErrorShort;

  /// No description provided for @emailAuth_forgotPassword.
  ///
  /// In es, this message translates to:
  /// **'¿Olvidaste tu contraseña?'**
  String get emailAuth_forgotPassword;

  /// No description provided for @emailAuth_hasAccount.
  ///
  /// In es, this message translates to:
  /// **'¿Ya tienes cuenta? '**
  String get emailAuth_hasAccount;

  /// No description provided for @emailAuth_noAccount.
  ///
  /// In es, this message translates to:
  /// **'¿No tienes cuenta? '**
  String get emailAuth_noAccount;

  /// No description provided for @emailAuth_loginLink.
  ///
  /// In es, this message translates to:
  /// **'Inicia sesión'**
  String get emailAuth_loginLink;

  /// No description provided for @emailAuth_registerLink.
  ///
  /// In es, this message translates to:
  /// **'Regístrate'**
  String get emailAuth_registerLink;

  /// No description provided for @emailAuth_unexpectedError.
  ///
  /// In es, this message translates to:
  /// **'Error inesperado. Inténtalo de nuevo.'**
  String get emailAuth_unexpectedError;

  /// No description provided for @emailAuth_emailFirst.
  ///
  /// In es, this message translates to:
  /// **'Escribe tu correo primero.'**
  String get emailAuth_emailFirst;

  /// No description provided for @emailAuth_resetSent.
  ///
  /// In es, this message translates to:
  /// **'Correo de recuperación enviado a {email}'**
  String emailAuth_resetSent(String email);

  /// No description provided for @emailAuth_resetError.
  ///
  /// In es, this message translates to:
  /// **'No se pudo enviar el correo de recuperación.'**
  String get emailAuth_resetError;

  /// No description provided for @authError_userNotFound.
  ///
  /// In es, this message translates to:
  /// **'No existe una cuenta con ese correo.'**
  String get authError_userNotFound;

  /// No description provided for @authError_wrongPassword.
  ///
  /// In es, this message translates to:
  /// **'Contraseña incorrecta.'**
  String get authError_wrongPassword;

  /// No description provided for @authError_emailAlreadyInUse.
  ///
  /// In es, this message translates to:
  /// **'Este correo ya está registrado.'**
  String get authError_emailAlreadyInUse;

  /// No description provided for @authError_weakPassword.
  ///
  /// In es, this message translates to:
  /// **'La contraseña es muy débil (mínimo 6 caracteres).'**
  String get authError_weakPassword;

  /// No description provided for @authError_invalidEmail.
  ///
  /// In es, this message translates to:
  /// **'El correo no es válido.'**
  String get authError_invalidEmail;

  /// No description provided for @authError_tooManyRequests.
  ///
  /// In es, this message translates to:
  /// **'Demasiados intentos. Espera unos minutos.'**
  String get authError_tooManyRequests;

  /// No description provided for @authError_networkFailed.
  ///
  /// In es, this message translates to:
  /// **'Sin conexión a internet.'**
  String get authError_networkFailed;

  /// No description provided for @authError_default.
  ///
  /// In es, this message translates to:
  /// **'Error al iniciar sesión. Inténtalo de nuevo.'**
  String get authError_default;

  /// No description provided for @home_greetingMorning.
  ///
  /// In es, this message translates to:
  /// **'¡Buenos días, {name}!'**
  String home_greetingMorning(String name);

  /// No description provided for @home_greetingMorningNoName.
  ///
  /// In es, this message translates to:
  /// **'¡Buenos días!'**
  String get home_greetingMorningNoName;

  /// No description provided for @home_greetingAfternoon.
  ///
  /// In es, this message translates to:
  /// **'¡Buenas tardes, {name}!'**
  String home_greetingAfternoon(String name);

  /// No description provided for @home_greetingAfternoonNoName.
  ///
  /// In es, this message translates to:
  /// **'¡Buenas tardes!'**
  String get home_greetingAfternoonNoName;

  /// No description provided for @home_greetingEvening.
  ///
  /// In es, this message translates to:
  /// **'¡Buenas noches, {name}!'**
  String home_greetingEvening(String name);

  /// No description provided for @home_greetingEveningNoName.
  ///
  /// In es, this message translates to:
  /// **'¡Buenas noches!'**
  String get home_greetingEveningNoName;

  /// No description provided for @home_weekMotivationZero.
  ///
  /// In es, this message translates to:
  /// **'Aún no has entrenado esta semana. ¡Empieza hoy!'**
  String get home_weekMotivationZero;

  /// No description provided for @home_weekMotivationOne.
  ///
  /// In es, this message translates to:
  /// **'Llevas 1 entrenamiento esta semana. ¡Sigue así!'**
  String get home_weekMotivationOne;

  /// No description provided for @home_weekMotivationMany.
  ///
  /// In es, this message translates to:
  /// **'Llevas {count} entrenamientos esta semana. ¡Sigue así!'**
  String home_weekMotivationMany(int count);

  /// No description provided for @home_startWorkout.
  ///
  /// In es, this message translates to:
  /// **'Iniciar entrenamiento'**
  String get home_startWorkout;

  /// No description provided for @home_thisWeek.
  ///
  /// In es, this message translates to:
  /// **'Esta semana'**
  String get home_thisWeek;

  /// No description provided for @home_weekTime.
  ///
  /// In es, this message translates to:
  /// **'Tiempo semana'**
  String get home_weekTime;

  /// No description provided for @home_weekVolume.
  ///
  /// In es, this message translates to:
  /// **'Volumen semana'**
  String get home_weekVolume;

  /// No description provided for @home_quickAccess.
  ///
  /// In es, this message translates to:
  /// **'Acceso rápido'**
  String get home_quickAccess;

  /// No description provided for @home_lastWorkout.
  ///
  /// In es, this message translates to:
  /// **'Último entrenamiento'**
  String get home_lastWorkout;

  /// No description provided for @home_viewAll.
  ///
  /// In es, this message translates to:
  /// **'Ver todo'**
  String get home_viewAll;

  /// No description provided for @home_noWorkoutsYet.
  ///
  /// In es, this message translates to:
  /// **'Aún sin entrenamientos'**
  String get home_noWorkoutsYet;

  /// No description provided for @home_noWorkoutsSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Completa tu primer entrenamiento y aparecerá aquí.'**
  String get home_noWorkoutsSubtitle;

  /// No description provided for @home_goToTrain.
  ///
  /// In es, this message translates to:
  /// **'Ir a Entrenar →'**
  String get home_goToTrain;

  /// No description provided for @home_progress.
  ///
  /// In es, this message translates to:
  /// **'Progreso'**
  String get home_progress;

  /// No description provided for @home_noRecordsYet.
  ///
  /// In es, this message translates to:
  /// **'Sin registros aún'**
  String get home_noRecordsYet;

  /// No description provided for @home_recordWeightMeasures.
  ///
  /// In es, this message translates to:
  /// **'Registra tu peso y medidas'**
  String get home_recordWeightMeasures;

  /// No description provided for @home_achievements.
  ///
  /// In es, this message translates to:
  /// **'Logros'**
  String get home_achievements;

  /// No description provided for @home_noAchievements.
  ///
  /// In es, this message translates to:
  /// **'Completa entrenamientos para desbloquear logros'**
  String get home_noAchievements;

  /// No description provided for @home_recentExercises.
  ///
  /// In es, this message translates to:
  /// **'Ejercicios recientes'**
  String get home_recentExercises;

  /// No description provided for @home_noRecentExercises.
  ///
  /// In es, this message translates to:
  /// **'Tus ejercicios frecuentes aparecerán aquí'**
  String get home_noRecentExercises;

  /// No description provided for @home_frequentExercise.
  ///
  /// In es, this message translates to:
  /// **'{count} sesiones'**
  String home_frequentExercise(int count);

  /// No description provided for @home_latestRecord.
  ///
  /// In es, this message translates to:
  /// **'Último registro'**
  String get home_latestRecord;

  /// No description provided for @home_waist.
  ///
  /// In es, this message translates to:
  /// **'Cintura'**
  String get home_waist;

  /// No description provided for @home_hips.
  ///
  /// In es, this message translates to:
  /// **'Cadera'**
  String get home_hips;

  /// No description provided for @home_exerciseLibrary.
  ///
  /// In es, this message translates to:
  /// **'Biblioteca de ejercicios'**
  String get home_exerciseLibrary;

  /// No description provided for @home_viewAllExercises.
  ///
  /// In es, this message translates to:
  /// **'Ver todos'**
  String get home_viewAllExercises;

  /// No description provided for @home_exercisesAvailable.
  ///
  /// In es, this message translates to:
  /// **'{count} ejercicios disponibles'**
  String home_exercisesAvailable(int count);

  /// No description provided for @profile_proActive.
  ///
  /// In es, this message translates to:
  /// **'Suscripción activa'**
  String get profile_proActive;

  /// No description provided for @profile_freePlan.
  ///
  /// In es, this message translates to:
  /// **'Plan gratuito'**
  String get profile_freePlan;

  /// No description provided for @profile_upgradePro.
  ///
  /// In es, this message translates to:
  /// **'Actualizar a PRO'**
  String get profile_upgradePro;

  /// No description provided for @profile_redeemCode.
  ///
  /// In es, this message translates to:
  /// **'Canjear código'**
  String get profile_redeemCode;

  /// No description provided for @profile_restorePurchases.
  ///
  /// In es, this message translates to:
  /// **'Restaurar compras'**
  String get profile_restorePurchases;

  /// No description provided for @profile_signOut.
  ///
  /// In es, this message translates to:
  /// **'Cerrar sesión'**
  String get profile_signOut;

  /// No description provided for @profile_deleteAccount.
  ///
  /// In es, this message translates to:
  /// **'Eliminar cuenta'**
  String get profile_deleteAccount;

  /// No description provided for @profile_redeemTitle.
  ///
  /// In es, this message translates to:
  /// **'Canjear código'**
  String get profile_redeemTitle;

  /// No description provided for @profile_redeemSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Ingresa tu código promocional para desbloquear LiftWave PRO.'**
  String get profile_redeemSubtitle;

  /// No description provided for @profile_codeHint.
  ///
  /// In es, this message translates to:
  /// **'CÓDIGO'**
  String get profile_codeHint;

  /// No description provided for @profile_redeem.
  ///
  /// In es, this message translates to:
  /// **'Canjear'**
  String get profile_redeem;

  /// No description provided for @profile_proActivated.
  ///
  /// In es, this message translates to:
  /// **'LiftWave PRO activado'**
  String get profile_proActivated;

  /// No description provided for @profile_invalidCode.
  ///
  /// In es, this message translates to:
  /// **'Código inválido'**
  String get profile_invalidCode;

  /// No description provided for @profile_purchasesRestored.
  ///
  /// In es, this message translates to:
  /// **'Compras restauradas correctamente'**
  String get profile_purchasesRestored;

  /// No description provided for @profile_noPurchasesFound.
  ///
  /// In es, this message translates to:
  /// **'No se encontraron compras previas'**
  String get profile_noPurchasesFound;

  /// No description provided for @profile_deleteTitle.
  ///
  /// In es, this message translates to:
  /// **'Eliminar cuenta'**
  String get profile_deleteTitle;

  /// No description provided for @profile_deleteConfirm.
  ///
  /// In es, this message translates to:
  /// **'¿Estás seguro? Esta acción es irreversible y se eliminarán todos tus datos.'**
  String get profile_deleteConfirm;

  /// No description provided for @profile_deleteReauthError.
  ///
  /// In es, this message translates to:
  /// **'Para eliminar tu cuenta, cierra sesión, vuelve a iniciar y reintenta.'**
  String get profile_deleteReauthError;

  /// No description provided for @train_title.
  ///
  /// In es, this message translates to:
  /// **'Entrenar'**
  String get train_title;

  /// No description provided for @train_readyTitle.
  ///
  /// In es, this message translates to:
  /// **'¿Listo para entrenar?'**
  String get train_readyTitle;

  /// No description provided for @train_readySubtitle.
  ///
  /// In es, this message translates to:
  /// **'Inicia una sesión libre o elige una rutina preconfigurada.'**
  String get train_readySubtitle;

  /// No description provided for @train_freeSession.
  ///
  /// In es, this message translates to:
  /// **'Sesión libre'**
  String get train_freeSession;

  /// No description provided for @train_freeWorkout.
  ///
  /// In es, this message translates to:
  /// **'Entrenamiento libre'**
  String get train_freeWorkout;

  /// No description provided for @train_myRoutines.
  ///
  /// In es, this message translates to:
  /// **'Mis rutinas'**
  String get train_myRoutines;

  /// No description provided for @train_predefinedRoutines.
  ///
  /// In es, this message translates to:
  /// **'Rutinas predefinidas'**
  String get train_predefinedRoutines;

  /// No description provided for @train_inProgress.
  ///
  /// In es, this message translates to:
  /// **'En curso'**
  String get train_inProgress;

  /// No description provided for @train_cancelWorkout.
  ///
  /// In es, this message translates to:
  /// **'Cancelar entrenamiento'**
  String get train_cancelWorkout;

  /// No description provided for @train_cancelConfirm.
  ///
  /// In es, this message translates to:
  /// **'¿Seguro que quieres cancelar? Se perderá el progreso.'**
  String get train_cancelConfirm;

  /// No description provided for @train_continue.
  ///
  /// In es, this message translates to:
  /// **'Seguir'**
  String get train_continue;

  /// No description provided for @train_addExerciseFirst.
  ///
  /// In es, this message translates to:
  /// **'Añade al menos un ejercicio antes de finalizar.'**
  String get train_addExerciseFirst;

  /// No description provided for @train_workoutCompleted.
  ///
  /// In es, this message translates to:
  /// **'¡Entrenamiento completado!'**
  String get train_workoutCompleted;

  /// No description provided for @train_completedSets.
  ///
  /// In es, this message translates to:
  /// **'Series completadas'**
  String get train_completedSets;

  /// No description provided for @train_totalVolume.
  ///
  /// In es, this message translates to:
  /// **'Volumen total'**
  String get train_totalVolume;

  /// No description provided for @train_saveAsRoutine.
  ///
  /// In es, this message translates to:
  /// **'Guardar como rutina'**
  String get train_saveAsRoutine;

  /// No description provided for @train_finish.
  ///
  /// In es, this message translates to:
  /// **'Finalizar'**
  String get train_finish;

  /// No description provided for @train_newAchievement.
  ///
  /// In es, this message translates to:
  /// **'¡Nuevo logro!'**
  String get train_newAchievement;

  /// No description provided for @train_great.
  ///
  /// In es, this message translates to:
  /// **'¡Genial!'**
  String get train_great;

  /// No description provided for @train_routineNameHint.
  ///
  /// In es, this message translates to:
  /// **'Nombre de la rutina'**
  String get train_routineNameHint;

  /// No description provided for @train_routineSaved.
  ///
  /// In es, this message translates to:
  /// **'Rutina \"{name}\" guardada'**
  String train_routineSaved(String name);

  /// No description provided for @train_deleteRoutine.
  ///
  /// In es, this message translates to:
  /// **'Eliminar rutina'**
  String get train_deleteRoutine;

  /// No description provided for @train_deleteRoutineConfirm.
  ///
  /// In es, this message translates to:
  /// **'¿Eliminar \"{name}\"?'**
  String train_deleteRoutineConfirm(String name);

  /// No description provided for @train_noExercisesYet.
  ///
  /// In es, this message translates to:
  /// **'Sin ejercicios aún'**
  String get train_noExercisesYet;

  /// No description provided for @train_addExerciseHint.
  ///
  /// In es, this message translates to:
  /// **'Toca el botón de abajo para añadir el primer ejercicio.'**
  String get train_addExerciseHint;

  /// No description provided for @train_addExercise.
  ///
  /// In es, this message translates to:
  /// **'Añadir ejercicio'**
  String get train_addExercise;

  /// No description provided for @train_exercise.
  ///
  /// In es, this message translates to:
  /// **'Ejercicio'**
  String get train_exercise;

  /// No description provided for @train_exerciseCount.
  ///
  /// In es, this message translates to:
  /// **'{count} ejercicios'**
  String train_exerciseCount(int count);

  /// No description provided for @train_startTemplate.
  ///
  /// In es, this message translates to:
  /// **'Empezar {name}'**
  String train_startTemplate(String name);

  /// No description provided for @train_setsProgress.
  ///
  /// In es, this message translates to:
  /// **'{done}/{total} series ✓'**
  String train_setsProgress(int done, int total);

  /// No description provided for @train_viewProgress.
  ///
  /// In es, this message translates to:
  /// **'Ver progreso'**
  String get train_viewProgress;

  /// No description provided for @train_deleteExercise.
  ///
  /// In es, this message translates to:
  /// **'Eliminar ejercicio'**
  String get train_deleteExercise;

  /// No description provided for @train_notesHint.
  ///
  /// In es, this message translates to:
  /// **'Notas (opcional)'**
  String get train_notesHint;

  /// No description provided for @train_setHeader.
  ///
  /// In es, this message translates to:
  /// **'SERIE'**
  String get train_setHeader;

  /// No description provided for @train_repsHeader.
  ///
  /// In es, this message translates to:
  /// **'REPS'**
  String get train_repsHeader;

  /// No description provided for @train_weightHeader.
  ///
  /// In es, this message translates to:
  /// **'PESO (kg)'**
  String get train_weightHeader;

  /// No description provided for @train_addSet.
  ///
  /// In es, this message translates to:
  /// **'Añadir serie'**
  String get train_addSet;

  /// No description provided for @train_lastWeight.
  ///
  /// In es, this message translates to:
  /// **'Último: {weight} kg'**
  String train_lastWeight(String weight);

  /// No description provided for @train_abbreviationExercises.
  ///
  /// In es, this message translates to:
  /// **'ej.'**
  String get train_abbreviationExercises;

  /// No description provided for @train_orChooseRoutine.
  ///
  /// In es, this message translates to:
  /// **'O elige una rutina'**
  String get train_orChooseRoutine;

  /// No description provided for @train_defaultRoutineName.
  ///
  /// In es, this message translates to:
  /// **'Mi rutina'**
  String get train_defaultRoutineName;

  /// No description provided for @train_bodyweightLabel.
  ///
  /// In es, this message translates to:
  /// **'Peso corporal'**
  String get train_bodyweightLabel;

  /// No description provided for @picker_title.
  ///
  /// In es, this message translates to:
  /// **'Seleccionar ejercicio'**
  String get picker_title;

  /// No description provided for @picker_searchHint.
  ///
  /// In es, this message translates to:
  /// **'Buscar ejercicio...'**
  String get picker_searchHint;

  /// No description provided for @picker_createManual.
  ///
  /// In es, this message translates to:
  /// **'Crear ejercicio manual'**
  String get picker_createManual;

  /// No description provided for @picker_createManualSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Nombre, grupo muscular y equipo'**
  String get picker_createManualSubtitle;

  /// No description provided for @picker_createTitle.
  ///
  /// In es, this message translates to:
  /// **'Crear ejercicio'**
  String get picker_createTitle;

  /// No description provided for @picker_nameLabel.
  ///
  /// In es, this message translates to:
  /// **'Nombre'**
  String get picker_nameLabel;

  /// No description provided for @picker_nameHint.
  ///
  /// In es, this message translates to:
  /// **'Ej: Curl martillo'**
  String get picker_nameHint;

  /// No description provided for @picker_muscleGroupLabel.
  ///
  /// In es, this message translates to:
  /// **'Grupo muscular'**
  String get picker_muscleGroupLabel;

  /// No description provided for @picker_equipmentLabel.
  ///
  /// In es, this message translates to:
  /// **'Equipamiento'**
  String get picker_equipmentLabel;

  /// No description provided for @picker_addExercise.
  ///
  /// In es, this message translates to:
  /// **'Añadir ejercicio'**
  String get picker_addExercise;

  /// No description provided for @exercises_title.
  ///
  /// In es, this message translates to:
  /// **'Ejercicios'**
  String get exercises_title;

  /// No description provided for @exercises_searchHint.
  ///
  /// In es, this message translates to:
  /// **'Buscar ejercicios...'**
  String get exercises_searchHint;

  /// No description provided for @exercises_muscleFilter.
  ///
  /// In es, this message translates to:
  /// **'Músculo'**
  String get exercises_muscleFilter;

  /// No description provided for @exercises_equipmentFilter.
  ///
  /// In es, this message translates to:
  /// **'Material'**
  String get exercises_equipmentFilter;

  /// No description provided for @exercises_exerciseCount.
  ///
  /// In es, this message translates to:
  /// **'{count} ejercicio{suffix}'**
  String exercises_exerciseCount(int count, String suffix);

  /// No description provided for @exercises_clearFilters.
  ///
  /// In es, this message translates to:
  /// **'Limpiar filtros'**
  String get exercises_clearFilters;

  /// No description provided for @exercises_noResults.
  ///
  /// In es, this message translates to:
  /// **'Sin resultados'**
  String get exercises_noResults;

  /// No description provided for @exercises_noResultsHint.
  ///
  /// In es, this message translates to:
  /// **'Prueba con otros filtros o términos de búsqueda'**
  String get exercises_noResultsHint;

  /// No description provided for @exercises_deleteTitle.
  ///
  /// In es, this message translates to:
  /// **'Eliminar ejercicio'**
  String get exercises_deleteTitle;

  /// No description provided for @exercises_deleteConfirm.
  ///
  /// In es, this message translates to:
  /// **'¿Eliminar \"{name}\" de tu lista de ejercicios?'**
  String exercises_deleteConfirm(String name);

  /// No description provided for @exercises_muscleGroupLabel.
  ///
  /// In es, this message translates to:
  /// **'Grupo muscular'**
  String get exercises_muscleGroupLabel;

  /// No description provided for @exercises_materialLabel.
  ///
  /// In es, this message translates to:
  /// **'Material'**
  String get exercises_materialLabel;

  /// No description provided for @exercises_executionTitle.
  ///
  /// In es, this message translates to:
  /// **'Ejecución'**
  String get exercises_executionTitle;

  /// No description provided for @exercises_secondaryMuscles.
  ///
  /// In es, this message translates to:
  /// **'Músculos secundarios'**
  String get exercises_secondaryMuscles;

  /// No description provided for @exercises_benefits.
  ///
  /// In es, this message translates to:
  /// **'Beneficios'**
  String get exercises_benefits;

  /// No description provided for @exercises_viewProgress.
  ///
  /// In es, this message translates to:
  /// **'Ver progreso'**
  String get exercises_viewProgress;

  /// No description provided for @exercises_addToWorkout.
  ///
  /// In es, this message translates to:
  /// **'Añadir al entrenamiento'**
  String get exercises_addToWorkout;

  /// No description provided for @progress_maxWeight.
  ///
  /// In es, this message translates to:
  /// **'Peso máx.'**
  String get progress_maxWeight;

  /// No description provided for @progress_volumeLabel.
  ///
  /// In es, this message translates to:
  /// **'Volumen'**
  String get progress_volumeLabel;

  /// No description provided for @progress_noData.
  ///
  /// In es, this message translates to:
  /// **'Sin datos para este ejercicio'**
  String get progress_noData;

  /// No description provided for @progress_needMoreSessions.
  ///
  /// In es, this message translates to:
  /// **'Se necesitan al menos 2 sesiones para ver el progreso'**
  String get progress_needMoreSessions;

  /// No description provided for @progress_lastVolume.
  ///
  /// In es, this message translates to:
  /// **'Último volumen'**
  String get progress_lastVolume;

  /// No description provided for @progress_lastWeight.
  ///
  /// In es, this message translates to:
  /// **'Último peso'**
  String get progress_lastWeight;

  /// No description provided for @progress_best.
  ///
  /// In es, this message translates to:
  /// **'Mejor'**
  String get progress_best;

  /// No description provided for @progress_progressLabel.
  ///
  /// In es, this message translates to:
  /// **'Progreso'**
  String get progress_progressLabel;

  /// No description provided for @progress_historyTitle.
  ///
  /// In es, this message translates to:
  /// **'Historial'**
  String get progress_historyTitle;

  /// No description provided for @history_title.
  ///
  /// In es, this message translates to:
  /// **'Historial'**
  String get history_title;

  /// No description provided for @history_exportCsv.
  ///
  /// In es, this message translates to:
  /// **'Exportar CSV'**
  String get history_exportCsv;

  /// No description provided for @history_allWorkouts.
  ///
  /// In es, this message translates to:
  /// **'Todos los entrenamientos'**
  String get history_allWorkouts;

  /// No description provided for @history_noWorkoutsYet.
  ///
  /// In es, this message translates to:
  /// **'Sin entrenamientos aún'**
  String get history_noWorkoutsYet;

  /// No description provided for @history_noWorkoutsSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Completa tu primer entrenamiento en la pestaña Entrenar y aparecerá aquí.'**
  String get history_noWorkoutsSubtitle;

  /// No description provided for @history_limitedHistory.
  ///
  /// In es, this message translates to:
  /// **'Historial limitado'**
  String get history_limitedHistory;

  /// No description provided for @history_unlockWorkouts.
  ///
  /// In es, this message translates to:
  /// **'Desbloquea tus {count} entrenamientos con PRO'**
  String history_unlockWorkouts(int count);

  /// No description provided for @history_weeklySummary.
  ///
  /// In es, this message translates to:
  /// **'Resumen semanal'**
  String get history_weeklySummary;

  /// No description provided for @history_workouts.
  ///
  /// In es, this message translates to:
  /// **'Entrenos'**
  String get history_workouts;

  /// No description provided for @history_total.
  ///
  /// In es, this message translates to:
  /// **'Total'**
  String get history_total;

  /// No description provided for @history_volumeKg.
  ///
  /// In es, this message translates to:
  /// **'Volumen kg'**
  String get history_volumeKg;

  /// No description provided for @history_dayMon.
  ///
  /// In es, this message translates to:
  /// **'L'**
  String get history_dayMon;

  /// No description provided for @history_dayTue.
  ///
  /// In es, this message translates to:
  /// **'M'**
  String get history_dayTue;

  /// No description provided for @history_dayWed.
  ///
  /// In es, this message translates to:
  /// **'X'**
  String get history_dayWed;

  /// No description provided for @history_dayThu.
  ///
  /// In es, this message translates to:
  /// **'J'**
  String get history_dayThu;

  /// No description provided for @history_dayFri.
  ///
  /// In es, this message translates to:
  /// **'V'**
  String get history_dayFri;

  /// No description provided for @history_daySat.
  ///
  /// In es, this message translates to:
  /// **'S'**
  String get history_daySat;

  /// No description provided for @history_daySun.
  ///
  /// In es, this message translates to:
  /// **'D'**
  String get history_daySun;

  /// No description provided for @history_exercisesPerformed.
  ///
  /// In es, this message translates to:
  /// **'Ejercicios realizados'**
  String get history_exercisesPerformed;

  /// No description provided for @history_setsCount.
  ///
  /// In es, this message translates to:
  /// **'{count} series'**
  String history_setsCount(int count);

  /// No description provided for @history_setHeader.
  ///
  /// In es, this message translates to:
  /// **'Serie'**
  String get history_setHeader;

  /// No description provided for @detail_monthJan.
  ///
  /// In es, this message translates to:
  /// **'enero'**
  String get detail_monthJan;

  /// No description provided for @detail_monthFeb.
  ///
  /// In es, this message translates to:
  /// **'febrero'**
  String get detail_monthFeb;

  /// No description provided for @detail_monthMar.
  ///
  /// In es, this message translates to:
  /// **'marzo'**
  String get detail_monthMar;

  /// No description provided for @detail_monthApr.
  ///
  /// In es, this message translates to:
  /// **'abril'**
  String get detail_monthApr;

  /// No description provided for @detail_monthMay.
  ///
  /// In es, this message translates to:
  /// **'mayo'**
  String get detail_monthMay;

  /// No description provided for @detail_monthJun.
  ///
  /// In es, this message translates to:
  /// **'junio'**
  String get detail_monthJun;

  /// No description provided for @detail_monthJul.
  ///
  /// In es, this message translates to:
  /// **'julio'**
  String get detail_monthJul;

  /// No description provided for @detail_monthAug.
  ///
  /// In es, this message translates to:
  /// **'agosto'**
  String get detail_monthAug;

  /// No description provided for @detail_monthSep.
  ///
  /// In es, this message translates to:
  /// **'septiembre'**
  String get detail_monthSep;

  /// No description provided for @detail_monthOct.
  ///
  /// In es, this message translates to:
  /// **'octubre'**
  String get detail_monthOct;

  /// No description provided for @detail_monthNov.
  ///
  /// In es, this message translates to:
  /// **'noviembre'**
  String get detail_monthNov;

  /// No description provided for @detail_monthDec.
  ///
  /// In es, this message translates to:
  /// **'diciembre'**
  String get detail_monthDec;

  /// No description provided for @detail_dateFormat.
  ///
  /// In es, this message translates to:
  /// **'{day} de {month} de {year}'**
  String detail_dateFormat(int day, String month, int year);

  /// No description provided for @paywall_subtitle.
  ///
  /// In es, this message translates to:
  /// **'Desbloquea todo tu potencial'**
  String get paywall_subtitle;

  /// No description provided for @paywall_featureTemplates.
  ///
  /// In es, this message translates to:
  /// **'Plantillas de entrenamiento'**
  String get paywall_featureTemplates;

  /// No description provided for @paywall_featureHistory.
  ///
  /// In es, this message translates to:
  /// **'Historial ilimitado'**
  String get paywall_featureHistory;

  /// No description provided for @paywall_featureTimer.
  ///
  /// In es, this message translates to:
  /// **'Timer personalizado'**
  String get paywall_featureTimer;

  /// No description provided for @paywall_featureDetails.
  ///
  /// In es, this message translates to:
  /// **'Detalles de ejercicios'**
  String get paywall_featureDetails;

  /// No description provided for @paywall_featureMeasures.
  ///
  /// In es, this message translates to:
  /// **'Medidas corporales + fotos'**
  String get paywall_featureMeasures;

  /// No description provided for @paywall_featureStats.
  ///
  /// In es, this message translates to:
  /// **'Estadísticas semanales'**
  String get paywall_featureStats;

  /// No description provided for @paywall_allIncluded.
  ///
  /// In es, this message translates to:
  /// **'Todo incluido'**
  String get paywall_allIncluded;

  /// No description provided for @paywall_weekly.
  ///
  /// In es, this message translates to:
  /// **'Semanal'**
  String get paywall_weekly;

  /// No description provided for @paywall_monthly.
  ///
  /// In es, this message translates to:
  /// **'Mensual'**
  String get paywall_monthly;

  /// No description provided for @paywall_yearly.
  ///
  /// In es, this message translates to:
  /// **'Anual'**
  String get paywall_yearly;

  /// No description provided for @paywall_bestValue.
  ///
  /// In es, this message translates to:
  /// **'Mejor valor'**
  String get paywall_bestValue;

  /// No description provided for @paywall_perWeek.
  ///
  /// In es, this message translates to:
  /// **'/semana'**
  String get paywall_perWeek;

  /// No description provided for @paywall_perMonth.
  ///
  /// In es, this message translates to:
  /// **'/mes'**
  String get paywall_perMonth;

  /// No description provided for @paywall_perYear.
  ///
  /// In es, this message translates to:
  /// **'/año'**
  String get paywall_perYear;

  /// No description provided for @paywall_freeTrial.
  ///
  /// In es, this message translates to:
  /// **'7 días de prueba gratis'**
  String get paywall_freeTrial;

  /// No description provided for @paywall_startTrial.
  ///
  /// In es, this message translates to:
  /// **'Comenzar prueba gratis'**
  String get paywall_startTrial;

  /// No description provided for @paywall_restorePurchases.
  ///
  /// In es, this message translates to:
  /// **'Restaurar compras'**
  String get paywall_restorePurchases;

  /// No description provided for @paywall_legalText.
  ///
  /// In es, this message translates to:
  /// **'La suscripción se renueva automáticamente. Puedes cancelar\nen cualquier momento desde la App Store.'**
  String get paywall_legalText;

  /// No description provided for @paywall_purchaseError.
  ///
  /// In es, this message translates to:
  /// **'No se pudo completar la compra.'**
  String get paywall_purchaseError;

  /// No description provided for @paywall_noPurchasesFound.
  ///
  /// In es, this message translates to:
  /// **'No se encontraron compras previas.'**
  String get paywall_noPurchasesFound;

  /// No description provided for @rest_title.
  ///
  /// In es, this message translates to:
  /// **'Descanso'**
  String get rest_title;

  /// No description provided for @rest_ready.
  ///
  /// In es, this message translates to:
  /// **'¡Listo! Hora de la siguiente serie'**
  String get rest_ready;

  /// No description provided for @rest_almostReady.
  ///
  /// In es, this message translates to:
  /// **'¡Casi listo!'**
  String get rest_almostReady;

  /// No description provided for @rest_resting.
  ///
  /// In es, this message translates to:
  /// **'Descansando...'**
  String get rest_resting;

  /// No description provided for @rest_customTime.
  ///
  /// In es, this message translates to:
  /// **'Tiempo personalizado · {time}'**
  String rest_customTime(String time);

  /// No description provided for @rest_choosePreset.
  ///
  /// In es, this message translates to:
  /// **'Elige un preajuste o personaliza'**
  String get rest_choosePreset;

  /// No description provided for @rest_of.
  ///
  /// In es, this message translates to:
  /// **'de {time}'**
  String rest_of(String time);

  /// No description provided for @rest_presets.
  ///
  /// In es, this message translates to:
  /// **'Preajustes'**
  String get rest_presets;

  /// No description provided for @rest_customize.
  ///
  /// In es, this message translates to:
  /// **'Personalizar'**
  String get rest_customize;

  /// No description provided for @rest_customTimeTitle.
  ///
  /// In es, this message translates to:
  /// **'Tiempo personalizado'**
  String get rest_customTimeTitle;

  /// No description provided for @rest_customTimeSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Introduce los minutos y segundos de descanso.'**
  String get rest_customTimeSubtitle;

  /// No description provided for @rest_minutes.
  ///
  /// In es, this message translates to:
  /// **'Minutos'**
  String get rest_minutes;

  /// No description provided for @rest_seconds.
  ///
  /// In es, this message translates to:
  /// **'Segundos'**
  String get rest_seconds;

  /// No description provided for @rest_setTime.
  ///
  /// In es, this message translates to:
  /// **'Establecer tiempo'**
  String get rest_setTime;

  /// No description provided for @progressScreen_title.
  ///
  /// In es, this message translates to:
  /// **'Progreso corporal'**
  String get progressScreen_title;

  /// No description provided for @progressScreen_measurements.
  ///
  /// In es, this message translates to:
  /// **'Medidas'**
  String get progressScreen_measurements;

  /// No description provided for @progressScreen_photos.
  ///
  /// In es, this message translates to:
  /// **'Fotos'**
  String get progressScreen_photos;

  /// No description provided for @progressScreen_addMeasurement.
  ///
  /// In es, this message translates to:
  /// **'Añadir medida'**
  String get progressScreen_addMeasurement;

  /// No description provided for @progressScreen_weight.
  ///
  /// In es, this message translates to:
  /// **'Peso'**
  String get progressScreen_weight;

  /// No description provided for @progressScreen_bodyFat.
  ///
  /// In es, this message translates to:
  /// **'Grasa corp.'**
  String get progressScreen_bodyFat;

  /// No description provided for @progressScreen_muscle.
  ///
  /// In es, this message translates to:
  /// **'Músculo'**
  String get progressScreen_muscle;

  /// No description provided for @progressScreen_noEntries.
  ///
  /// In es, this message translates to:
  /// **'Sin registros aún'**
  String get progressScreen_noEntries;

  /// No description provided for @progressScreen_noEntriesHint.
  ///
  /// In es, this message translates to:
  /// **'Toca el botón + para añadir tu primera medida'**
  String get progressScreen_noEntriesHint;

  /// No description provided for @progressScreen_noPhotos.
  ///
  /// In es, this message translates to:
  /// **'Sin fotos aún'**
  String get progressScreen_noPhotos;

  /// No description provided for @progressScreen_noPhotosHint.
  ///
  /// In es, this message translates to:
  /// **'Toca el botón + para añadir tu primera foto de progreso'**
  String get progressScreen_noPhotosHint;

  /// No description provided for @progressScreen_current.
  ///
  /// In es, this message translates to:
  /// **'Actual'**
  String get progressScreen_current;

  /// No description provided for @progressScreen_change.
  ///
  /// In es, this message translates to:
  /// **'Cambio'**
  String get progressScreen_change;

  /// No description provided for @progressScreen_trend.
  ///
  /// In es, this message translates to:
  /// **'Tendencia'**
  String get progressScreen_trend;

  /// No description provided for @progressScreen_addMeasurementTitle.
  ///
  /// In es, this message translates to:
  /// **'Nueva medida'**
  String get progressScreen_addMeasurementTitle;

  /// No description provided for @progressScreen_weightKg.
  ///
  /// In es, this message translates to:
  /// **'Peso (kg)'**
  String get progressScreen_weightKg;

  /// No description provided for @progressScreen_bodyFatPercent.
  ///
  /// In es, this message translates to:
  /// **'Grasa corporal (%)'**
  String get progressScreen_bodyFatPercent;

  /// No description provided for @progressScreen_muscleMassKg.
  ///
  /// In es, this message translates to:
  /// **'Masa muscular (kg)'**
  String get progressScreen_muscleMassKg;

  /// No description provided for @progressScreen_optional.
  ///
  /// In es, this message translates to:
  /// **'Opcional'**
  String get progressScreen_optional;

  /// No description provided for @progressScreen_saveEntry.
  ///
  /// In es, this message translates to:
  /// **'Guardar registro'**
  String get progressScreen_saveEntry;

  /// No description provided for @progressScreen_deleteMeasurement.
  ///
  /// In es, this message translates to:
  /// **'¿Eliminar este registro?'**
  String get progressScreen_deleteMeasurement;

  /// No description provided for @progressScreen_deletePhoto.
  ///
  /// In es, this message translates to:
  /// **'¿Eliminar esta foto?'**
  String get progressScreen_deletePhoto;

  /// No description provided for @progressScreen_camera.
  ///
  /// In es, this message translates to:
  /// **'Cámara'**
  String get progressScreen_camera;

  /// No description provided for @progressScreen_gallery.
  ///
  /// In es, this message translates to:
  /// **'Galería'**
  String get progressScreen_gallery;

  /// No description provided for @progressScreen_selectSource.
  ///
  /// In es, this message translates to:
  /// **'Seleccionar fuente'**
  String get progressScreen_selectSource;

  /// No description provided for @progressScreen_waist.
  ///
  /// In es, this message translates to:
  /// **'Cintura'**
  String get progressScreen_waist;

  /// No description provided for @progressScreen_chest.
  ///
  /// In es, this message translates to:
  /// **'Pecho'**
  String get progressScreen_chest;

  /// No description provided for @progressScreen_hips.
  ///
  /// In es, this message translates to:
  /// **'Cadera'**
  String get progressScreen_hips;

  /// No description provided for @progressScreen_record.
  ///
  /// In es, this message translates to:
  /// **'registro'**
  String get progressScreen_record;

  /// No description provided for @progressScreen_noDataMetric.
  ///
  /// In es, this message translates to:
  /// **'Sin datos para esta métrica'**
  String get progressScreen_noDataMetric;

  /// No description provided for @progressScreen_addMoreRecords.
  ///
  /// In es, this message translates to:
  /// **'Añade más registros para ver la gráfica'**
  String get progressScreen_addMoreRecords;

  /// No description provided for @progressScreen_historyTitle.
  ///
  /// In es, this message translates to:
  /// **'Historial'**
  String get progressScreen_historyTitle;

  /// No description provided for @progressScreen_noEntriesSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Registra tu primer peso y medidas\npara ver tu evolución.'**
  String get progressScreen_noEntriesSubtitle;

  /// No description provided for @progressScreen_addFirstRecord.
  ///
  /// In es, this message translates to:
  /// **'Añadir primer registro'**
  String get progressScreen_addFirstRecord;

  /// No description provided for @progressScreen_progressPhotos.
  ///
  /// In es, this message translates to:
  /// **'Fotos de progreso'**
  String get progressScreen_progressPhotos;

  /// No description provided for @progressScreen_progressPhotosHint.
  ///
  /// In es, this message translates to:
  /// **'Registra tu progreso visual con fotos.\nDisponible con LiftWave PRO.'**
  String get progressScreen_progressPhotosHint;

  /// No description provided for @progressScreen_unlockWithPro.
  ///
  /// In es, this message translates to:
  /// **'Desbloquear con PRO'**
  String get progressScreen_unlockWithPro;

  /// No description provided for @progressScreen_noPhotosSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Añade una foto al registrar tus medidas\npara ver tu progreso visual.'**
  String get progressScreen_noPhotosSubtitle;

  /// No description provided for @progressScreen_addPhoto.
  ///
  /// In es, this message translates to:
  /// **'Añadir foto'**
  String get progressScreen_addPhoto;

  /// No description provided for @progressScreen_newRecord.
  ///
  /// In es, this message translates to:
  /// **'Nuevo registro'**
  String get progressScreen_newRecord;

  /// No description provided for @progressScreen_photoAdded.
  ///
  /// In es, this message translates to:
  /// **'Foto añadida'**
  String get progressScreen_photoAdded;

  /// No description provided for @progressScreen_addPhotoOptional.
  ///
  /// In es, this message translates to:
  /// **'Añadir foto (opcional)'**
  String get progressScreen_addPhotoOptional;

  /// No description provided for @progressScreen_saveRecord.
  ///
  /// In es, this message translates to:
  /// **'Guardar registro'**
  String get progressScreen_saveRecord;

  /// No description provided for @progressScreen_enterAtLeastOneValue.
  ///
  /// In es, this message translates to:
  /// **'Introduce al menos un valor'**
  String get progressScreen_enterAtLeastOneValue;

  /// No description provided for @progressScreen_monthShortJan.
  ///
  /// In es, this message translates to:
  /// **'ene'**
  String get progressScreen_monthShortJan;

  /// No description provided for @progressScreen_monthShortFeb.
  ///
  /// In es, this message translates to:
  /// **'feb'**
  String get progressScreen_monthShortFeb;

  /// No description provided for @progressScreen_monthShortMar.
  ///
  /// In es, this message translates to:
  /// **'mar'**
  String get progressScreen_monthShortMar;

  /// No description provided for @progressScreen_monthShortApr.
  ///
  /// In es, this message translates to:
  /// **'abr'**
  String get progressScreen_monthShortApr;

  /// No description provided for @progressScreen_monthShortMay.
  ///
  /// In es, this message translates to:
  /// **'may'**
  String get progressScreen_monthShortMay;

  /// No description provided for @progressScreen_monthShortJun.
  ///
  /// In es, this message translates to:
  /// **'jun'**
  String get progressScreen_monthShortJun;

  /// No description provided for @progressScreen_monthShortJul.
  ///
  /// In es, this message translates to:
  /// **'jul'**
  String get progressScreen_monthShortJul;

  /// No description provided for @progressScreen_monthShortAug.
  ///
  /// In es, this message translates to:
  /// **'ago'**
  String get progressScreen_monthShortAug;

  /// No description provided for @progressScreen_monthShortSep.
  ///
  /// In es, this message translates to:
  /// **'sep'**
  String get progressScreen_monthShortSep;

  /// No description provided for @progressScreen_monthShortOct.
  ///
  /// In es, this message translates to:
  /// **'oct'**
  String get progressScreen_monthShortOct;

  /// No description provided for @progressScreen_monthShortNov.
  ///
  /// In es, this message translates to:
  /// **'nov'**
  String get progressScreen_monthShortNov;

  /// No description provided for @progressScreen_monthShortDec.
  ///
  /// In es, this message translates to:
  /// **'dic'**
  String get progressScreen_monthShortDec;

  /// No description provided for @achievement_firstWorkout_title.
  ///
  /// In es, this message translates to:
  /// **'Primera sesión'**
  String get achievement_firstWorkout_title;

  /// No description provided for @achievement_firstWorkout_description.
  ///
  /// In es, this message translates to:
  /// **'Completa tu primer entrenamiento'**
  String get achievement_firstWorkout_description;

  /// No description provided for @achievement_streak7_title.
  ///
  /// In es, this message translates to:
  /// **'Racha de 7 días'**
  String get achievement_streak7_title;

  /// No description provided for @achievement_streak7_description.
  ///
  /// In es, this message translates to:
  /// **'Entrena al menos 1 vez en 7 días consecutivos'**
  String get achievement_streak7_description;

  /// No description provided for @achievement_streak30_title.
  ///
  /// In es, this message translates to:
  /// **'Racha de 30 días'**
  String get achievement_streak30_title;

  /// No description provided for @achievement_streak30_description.
  ///
  /// In es, this message translates to:
  /// **'Entrena al menos 1 vez por semana durante 30 días'**
  String get achievement_streak30_description;

  /// No description provided for @achievement_volume1000_title.
  ///
  /// In es, this message translates to:
  /// **'1.000 kg levantados'**
  String get achievement_volume1000_title;

  /// No description provided for @achievement_volume1000_description.
  ///
  /// In es, this message translates to:
  /// **'Acumula 1.000 kg de volumen total'**
  String get achievement_volume1000_description;

  /// No description provided for @achievement_volume5000_title.
  ///
  /// In es, this message translates to:
  /// **'5.000 kg levantados'**
  String get achievement_volume5000_title;

  /// No description provided for @achievement_volume5000_description.
  ///
  /// In es, this message translates to:
  /// **'Acumula 5.000 kg de volumen total'**
  String get achievement_volume5000_description;

  /// No description provided for @achievement_volume10000_title.
  ///
  /// In es, this message translates to:
  /// **'10.000 kg levantados'**
  String get achievement_volume10000_title;

  /// No description provided for @achievement_volume10000_description.
  ///
  /// In es, this message translates to:
  /// **'Acumula 10.000 kg de volumen total'**
  String get achievement_volume10000_description;

  /// No description provided for @achievement_personalRecord_title.
  ///
  /// In es, this message translates to:
  /// **'Nuevo récord personal'**
  String get achievement_personalRecord_title;

  /// No description provided for @achievement_personalRecord_description.
  ///
  /// In es, this message translates to:
  /// **'Supera tu peso máximo en un ejercicio'**
  String get achievement_personalRecord_description;

  /// No description provided for @csv_header.
  ///
  /// In es, this message translates to:
  /// **'Fecha,Entrenamiento,Ejercicio,Grupo Muscular,Serie,Reps,Peso (kg),Volumen (kg)'**
  String get csv_header;

  /// No description provided for @csv_subject.
  ///
  /// In es, this message translates to:
  /// **'LiftWave - Historial de entrenamientos'**
  String get csv_subject;

  /// No description provided for @template_fullBody_subtitle.
  ///
  /// In es, this message translates to:
  /// **'Todos los grupos musculares en una sesión'**
  String get template_fullBody_subtitle;

  /// No description provided for @template_push_subtitle.
  ///
  /// In es, this message translates to:
  /// **'Pecho · Hombros · Tríceps'**
  String get template_push_subtitle;

  /// No description provided for @template_pull_subtitle.
  ///
  /// In es, this message translates to:
  /// **'Espalda · Bíceps'**
  String get template_pull_subtitle;

  /// No description provided for @template_torso_subtitle.
  ///
  /// In es, this message translates to:
  /// **'Pecho · Espalda · Hombros'**
  String get template_torso_subtitle;

  /// No description provided for @template_legs_subtitle.
  ///
  /// In es, this message translates to:
  /// **'Cuádriceps · Isquios · Glúteos · Core'**
  String get template_legs_subtitle;

  /// No description provided for @template_legs_name.
  ///
  /// In es, this message translates to:
  /// **'Piernas'**
  String get template_legs_name;

  /// No description provided for @ex_pecho_1_name.
  ///
  /// In es, this message translates to:
  /// **'Press de banca'**
  String get ex_pecho_1_name;

  /// No description provided for @ex_pecho_2_name.
  ///
  /// In es, this message translates to:
  /// **'Press inclinado con mancuernas'**
  String get ex_pecho_2_name;

  /// No description provided for @ex_pecho_3_name.
  ///
  /// In es, this message translates to:
  /// **'Aperturas con mancuernas'**
  String get ex_pecho_3_name;

  /// No description provided for @ex_pecho_4_name.
  ///
  /// In es, this message translates to:
  /// **'Fondos en paralelas'**
  String get ex_pecho_4_name;

  /// No description provided for @ex_pecho_5_name.
  ///
  /// In es, this message translates to:
  /// **'Cruce de poleas'**
  String get ex_pecho_5_name;

  /// No description provided for @ex_esp_1_name.
  ///
  /// In es, this message translates to:
  /// **'Peso muerto'**
  String get ex_esp_1_name;

  /// No description provided for @ex_esp_2_name.
  ///
  /// In es, this message translates to:
  /// **'Dominadas'**
  String get ex_esp_2_name;

  /// No description provided for @ex_esp_3_name.
  ///
  /// In es, this message translates to:
  /// **'Remo con barra'**
  String get ex_esp_3_name;

  /// No description provided for @ex_esp_4_name.
  ///
  /// In es, this message translates to:
  /// **'Remo con mancuerna'**
  String get ex_esp_4_name;

  /// No description provided for @ex_esp_5_name.
  ///
  /// In es, this message translates to:
  /// **'Jalón al pecho'**
  String get ex_esp_5_name;

  /// No description provided for @ex_pier_1_name.
  ///
  /// In es, this message translates to:
  /// **'Sentadilla con barra'**
  String get ex_pier_1_name;

  /// No description provided for @ex_pier_2_name.
  ///
  /// In es, this message translates to:
  /// **'Prensa de piernas'**
  String get ex_pier_2_name;

  /// No description provided for @ex_pier_3_name.
  ///
  /// In es, this message translates to:
  /// **'Hip thrust'**
  String get ex_pier_3_name;

  /// No description provided for @ex_pier_4_name.
  ///
  /// In es, this message translates to:
  /// **'Zancadas'**
  String get ex_pier_4_name;

  /// No description provided for @ex_pier_5_name.
  ///
  /// In es, this message translates to:
  /// **'Curl de isquiotibiales'**
  String get ex_pier_5_name;

  /// No description provided for @ex_hom_1_name.
  ///
  /// In es, this message translates to:
  /// **'Press militar'**
  String get ex_hom_1_name;

  /// No description provided for @ex_hom_2_name.
  ///
  /// In es, this message translates to:
  /// **'Elevaciones laterales'**
  String get ex_hom_2_name;

  /// No description provided for @ex_hom_3_name.
  ///
  /// In es, this message translates to:
  /// **'Face pull'**
  String get ex_hom_3_name;

  /// No description provided for @ex_hom_4_name.
  ///
  /// In es, this message translates to:
  /// **'Press Arnold'**
  String get ex_hom_4_name;

  /// No description provided for @ex_bra_1_name.
  ///
  /// In es, this message translates to:
  /// **'Curl de bíceps con mancuernas'**
  String get ex_bra_1_name;

  /// No description provided for @ex_bra_2_name.
  ///
  /// In es, this message translates to:
  /// **'Curl en barra Z'**
  String get ex_bra_2_name;

  /// No description provided for @ex_bra_3_name.
  ///
  /// In es, this message translates to:
  /// **'Curl martillo'**
  String get ex_bra_3_name;

  /// No description provided for @ex_bra_4_name.
  ///
  /// In es, this message translates to:
  /// **'Extensión de tríceps en polea'**
  String get ex_bra_4_name;

  /// No description provided for @ex_bra_5_name.
  ///
  /// In es, this message translates to:
  /// **'Press francés'**
  String get ex_bra_5_name;

  /// No description provided for @ex_core_1_name.
  ///
  /// In es, this message translates to:
  /// **'Plancha'**
  String get ex_core_1_name;

  /// No description provided for @ex_core_2_name.
  ///
  /// In es, this message translates to:
  /// **'Crunch abdominal'**
  String get ex_core_2_name;

  /// No description provided for @ex_core_3_name.
  ///
  /// In es, this message translates to:
  /// **'Elevación de piernas colgado'**
  String get ex_core_3_name;

  /// No description provided for @ex_core_4_name.
  ///
  /// In es, this message translates to:
  /// **'Rueda abdominal'**
  String get ex_core_4_name;

  /// No description provided for @ex_pecho_1_desc.
  ///
  /// In es, this message translates to:
  /// **'Túmbate en un banco plano con los pies apoyados en el suelo. Agarra la barra con un agarre más ancho que los hombros. Baja la barra controladamente hasta rozar el pecho y empuja hasta la extensión completa. Mantén los omóplatos retraídos durante todo el movimiento.'**
  String get ex_pecho_1_desc;

  /// No description provided for @ex_pecho_2_desc.
  ///
  /// In es, this message translates to:
  /// **'Ajusta el banco a 30-45°. Siéntate con una mancuerna en cada mano apoyadas sobre los muslos. Al reclinarte, lleva las mancuernas a la altura del pecho con los codos a 45° del cuerpo. Empuja hacia arriba y adentro hasta casi juntar las mancuernas en la parte superior.'**
  String get ex_pecho_2_desc;

  /// No description provided for @ex_pecho_3_desc.
  ///
  /// In es, this message translates to:
  /// **'Túmbate en banco plano con una mancuerna en cada mano, brazos extendidos sobre el pecho y codos ligeramente flexionados. Baja los brazos en arco amplio hasta sentir el estiramiento del pecho, luego vuelve a la posición inicial apretando el pecho en la parte superior.'**
  String get ex_pecho_3_desc;

  /// No description provided for @ex_pecho_4_desc.
  ///
  /// In es, this message translates to:
  /// **'Sujétate a las barras paralelas con los brazos extendidos. Inclina el torso ligeramente hacia adelante para activar más el pecho. Baja el cuerpo flexionando los codos hasta que los brazos estén paralelos al suelo. Empuja para volver al inicio sin bloquear los codos.'**
  String get ex_pecho_4_desc;

  /// No description provided for @ex_pecho_5_desc.
  ///
  /// In es, this message translates to:
  /// **'Coloca las poleas en la posición alta. Agarra los tiradores y da un paso adelante. Con los codos ligeramente flexionados, cruza los brazos hacia adelante y abajo hasta que las manos se junten frente a ti. Contrae el pecho en la posición final y regresa lentamente.'**
  String get ex_pecho_5_desc;

  /// No description provided for @ex_esp_1_desc.
  ///
  /// In es, this message translates to:
  /// **'Colócate frente a la barra con los pies a la anchura de las caderas. Agárrala con agarre prono o mixto justo por fuera de las rodillas. Mantén la espalda recta y el pecho alto. Empuja el suelo con los pies mientras extiendes caderas y rodillas hasta estar completamente erguido. Baja controladamente.'**
  String get ex_esp_1_desc;

  /// No description provided for @ex_esp_2_desc.
  ///
  /// In es, this message translates to:
  /// **'Cuelga de la barra con agarre prono (palmas hacia afuera) más ancho que los hombros. Activa los omóplatos y tira del cuerpo hacia arriba hasta que la barbilla supere la barra. Baja lentamente con control. Evita el balanceo y mantén el core apretado durante todo el movimiento.'**
  String get ex_esp_2_desc;

  /// No description provided for @ex_esp_3_desc.
  ///
  /// In es, this message translates to:
  /// **'Con los pies a la anchura de los hombros, inclínate hacia adelante unos 45° manteniendo la espalda neutra. Agarra la barra con agarre prono, un poco más ancho que los hombros. Tira de la barra hacia el abdomen retrayendo los omóplatos. Baja controladamente sin dejar caer el torso.'**
  String get ex_esp_3_desc;

  /// No description provided for @ex_esp_4_desc.
  ///
  /// In es, this message translates to:
  /// **'Apoya la rodilla y la mano del mismo lado en un banco. Con la espalda paralela al suelo y neutra, agarra la mancuerna con la mano libre. Tira de la mancuerna hacia la cadera retrayendo el omóplato. El codo debe pasar rozando el costado. Baja con control completo.'**
  String get ex_esp_4_desc;

  /// No description provided for @ex_esp_5_desc.
  ///
  /// In es, this message translates to:
  /// **'Siéntate en la máquina de jalón y agarra la barra ancha con agarre prono. Con el torso ligeramente inclinado hacia atrás, tira de la barra hacia el pecho retrayendo los omóplatos y bajando los codos. No te columpiés. Regresa lentamente a la posición inicial con control.'**
  String get ex_esp_5_desc;

  /// No description provided for @ex_pier_1_desc.
  ///
  /// In es, this message translates to:
  /// **'Coloca la barra sobre los trapecios. Pies a la anchura de los hombros o ligeramente más abiertos. Baja flexionando rodillas y caderas manteniendo el pecho alto y la espalda neutra hasta que los muslos queden paralelos al suelo. Empuja a través de los talones para volver arriba.'**
  String get ex_pier_1_desc;

  /// No description provided for @ex_pier_2_desc.
  ///
  /// In es, this message translates to:
  /// **'Siéntate en la máquina con la espalda completamente apoyada. Coloca los pies a la anchura de los hombros en la plataforma. Libera los seguros y baja la plataforma hasta que las rodillas formen ~90°, luego empuja hasta casi la extensión completa sin bloquear las rodillas.'**
  String get ex_pier_2_desc;

  /// No description provided for @ex_pier_3_desc.
  ///
  /// In es, this message translates to:
  /// **'Apoya los omóplatos en un banco resistente con la barra sobre las caderas (usa una almohadilla). Pies apoyados en el suelo a la anchura de los hombros. Baja las caderas al suelo y luego empuja hacia arriba apretando los glúteos hasta que las caderas estén paralelas al suelo.'**
  String get ex_pier_3_desc;

  /// No description provided for @ex_pier_4_desc.
  ///
  /// In es, this message translates to:
  /// **'De pie con una mancuerna en cada mano. Da un paso largo hacia adelante y baja la rodilla trasera hasta casi tocar el suelo. La rodilla delantera no debe sobrepasar la punta del pie. Empuja con el talón delantero para volver a la posición inicial. Alterna las piernas.'**
  String get ex_pier_4_desc;

  /// No description provided for @ex_pier_5_desc.
  ///
  /// In es, this message translates to:
  /// **'Túmbate boca abajo en la máquina con los talones bajo el rodillo. Flexiona las rodillas llevando los talones hacia los glúteos en un movimiento controlado. En la posición final aprieta los isquiotibiales. Baja lentamente sin dejar que los pesos descansen.'**
  String get ex_pier_5_desc;

  /// No description provided for @ex_hom_1_desc.
  ///
  /// In es, this message translates to:
  /// **'De pie o sentado, con la barra a la altura de los hombros y agarre prono ligeramente más ancho que ellos. Empuja la barra verticalmente por encima de la cabeza hasta la extensión completa. Baja de forma controlada hasta la posición inicial. Mantén el core activo para proteger la lumbar.'**
  String get ex_hom_1_desc;

  /// No description provided for @ex_hom_2_desc.
  ///
  /// In es, this message translates to:
  /// **'De pie con una mancuerna en cada mano a los costados, palmas hacia dentro. Con los codos ligeramente flexionados, eleva los brazos lateralmente hasta la altura de los hombros. Baja lentamente. Evita balancearte o usar impulso; el movimiento debe ser puro y controlado.'**
  String get ex_hom_2_desc;

  /// No description provided for @ex_hom_3_desc.
  ///
  /// In es, this message translates to:
  /// **'Coloca la cuerda en la polea alta. Agarra los extremos con las palmas hacia abajo y da un paso atrás. Tira de la cuerda hacia tu cara separando los codos a la altura de los hombros y llevando las manos hacia las orejas. Aprieta los deltoides posteriores en el punto final.'**
  String get ex_hom_3_desc;

  /// No description provided for @ex_hom_4_desc.
  ///
  /// In es, this message translates to:
  /// **'Sentado con las mancuernas frente a ti a la altura de los hombros, palmas hacia ti. Al empujar hacia arriba, rota las palmas hacia afuera de forma que en la cima estén mirando al frente. Baja invirtiendo el movimiento de rotación hasta la posición inicial. Movimiento fluido y continuo.'**
  String get ex_hom_4_desc;

  /// No description provided for @ex_bra_1_desc.
  ///
  /// In es, this message translates to:
  /// **'De pie con una mancuerna en cada mano, brazos extendidos y palmas al frente. Flexiona los codos llevando las mancuernas hacia los hombros sin mover la parte superior del brazo. Aprieta el bíceps en la cima. Baja controladamente hasta la extensión completa.'**
  String get ex_bra_1_desc;

  /// No description provided for @ex_bra_2_desc.
  ///
  /// In es, this message translates to:
  /// **'De pie con la barra Z en agarre supino a la anchura de los hombros. Mantén los codos pegados a los costados y flexiona hasta llevar la barra a la altura del pecho. Baja controladamente sintiendo el estiramiento completo del bíceps. La barra Z reduce la tensión en las muñecas.'**
  String get ex_bra_2_desc;

  /// No description provided for @ex_bra_3_desc.
  ///
  /// In es, this message translates to:
  /// **'De pie con una mancuerna en cada mano en agarre neutro (palmas enfrentadas, como si sujetaras un martillo). Flexiona los codos alternando o simultáneamente, llevando las mancuernas hacia los hombros. Mantén los codos pegados al cuerpo en todo momento. Baja con control.'**
  String get ex_bra_3_desc;

  /// No description provided for @ex_bra_4_desc.
  ///
  /// In es, this message translates to:
  /// **'Coloca la cuerda o barra en la polea alta. Agarra el accesorio con los codos flexionados y pegados al torso. Empuja hacia abajo extendiendo los codos completamente sin moverlos. Separa ligeramente las manos al final si usas cuerda. Regresa lentamente resistiendo el peso.'**
  String get ex_bra_4_desc;

  /// No description provided for @ex_bra_5_desc.
  ///
  /// In es, this message translates to:
  /// **'Túmbate en banco con la barra Z a brazos extendidos sobre el pecho. Con los codos apuntando al techo, baja la barra hacia la frente flexionando solo los codos. Extiende nuevamente a la posición inicial. Los codos deben permanecer fijos; solo se mueve el antebrazo.'**
  String get ex_bra_5_desc;

  /// No description provided for @ex_core_1_desc.
  ///
  /// In es, this message translates to:
  /// **'Apoya los antebrazos y las puntas de los pies en el suelo. Mantén el cuerpo recto como una tabla: cadera sin elevar ni hundir, glúteos apretados y abdomen contraído. Respira de forma constante. Mantén la posición el tiempo objetivo sin comprometer la forma.'**
  String get ex_core_1_desc;

  /// No description provided for @ex_core_2_desc.
  ///
  /// In es, this message translates to:
  /// **'Túmbate boca arriba con rodillas flexionadas y pies apoyados. Coloca las manos detrás de la cabeza sin tirar del cuello. Contrae el abdomen elevando los hombros del suelo unos 30° y apretando el recto abdominal en la cima. Baja controladamente sin relajar completamente el abdomen.'**
  String get ex_core_2_desc;

  /// No description provided for @ex_core_3_desc.
  ///
  /// In es, this message translates to:
  /// **'Cuélgate de la barra con agarre prono a la anchura de los hombros. Con piernas ligeramente flexionadas, eleva las rodillas o piernas hasta la horizontal (o más arriba) contrayendo el abdomen. Baja lentamente sin balancearte. El movimiento debe venir de la flexión de cadera, no del impulso.'**
  String get ex_core_3_desc;

  /// No description provided for @ex_core_4_desc.
  ///
  /// In es, this message translates to:
  /// **'Arrodíllate con la rueda frente a ti. Agarra las asas y rueda hacia adelante extendiendo el cuerpo lentamente hasta casi tocar el suelo. Contrae el core para volver a la posición inicial sin hundir la cadera. Mantén la espalda neutra y el abdomen apretado durante todo el movimiento.'**
  String get ex_core_4_desc;

  /// No description provided for @secondary_triceps.
  ///
  /// In es, this message translates to:
  /// **'Tríceps'**
  String get secondary_triceps;

  /// No description provided for @secondary_anteriorDeltoid.
  ///
  /// In es, this message translates to:
  /// **'Deltoides anterior'**
  String get secondary_anteriorDeltoid;

  /// No description provided for @secondary_biceps.
  ///
  /// In es, this message translates to:
  /// **'Bíceps'**
  String get secondary_biceps;

  /// No description provided for @secondary_glutes.
  ///
  /// In es, this message translates to:
  /// **'Glúteos'**
  String get secondary_glutes;

  /// No description provided for @secondary_hamstrings.
  ///
  /// In es, this message translates to:
  /// **'Isquiotibiales'**
  String get secondary_hamstrings;

  /// No description provided for @secondary_trapezius.
  ///
  /// In es, this message translates to:
  /// **'Trapecios'**
  String get secondary_trapezius;

  /// No description provided for @secondary_rhomboids.
  ///
  /// In es, this message translates to:
  /// **'Romboides'**
  String get secondary_rhomboids;

  /// No description provided for @secondary_lowerBack.
  ///
  /// In es, this message translates to:
  /// **'Espalda baja'**
  String get secondary_lowerBack;

  /// No description provided for @secondary_quads.
  ///
  /// In es, this message translates to:
  /// **'Cuádriceps'**
  String get secondary_quads;

  /// No description provided for @secondary_calves.
  ///
  /// In es, this message translates to:
  /// **'Gemelos'**
  String get secondary_calves;

  /// No description provided for @secondary_rotatorCuff.
  ///
  /// In es, this message translates to:
  /// **'Manguito rotador'**
  String get secondary_rotatorCuff;

  /// No description provided for @secondary_brachialis.
  ///
  /// In es, this message translates to:
  /// **'Braquial'**
  String get secondary_brachialis;

  /// No description provided for @secondary_brachioradialis.
  ///
  /// In es, this message translates to:
  /// **'Braquiorradial'**
  String get secondary_brachioradialis;

  /// No description provided for @secondary_anconeus.
  ///
  /// In es, this message translates to:
  /// **'Anconeo'**
  String get secondary_anconeus;

  /// No description provided for @secondary_obliques.
  ///
  /// In es, this message translates to:
  /// **'Oblicuos'**
  String get secondary_obliques;

  /// No description provided for @secondary_hipFlexors.
  ///
  /// In es, this message translates to:
  /// **'Hip flexors'**
  String get secondary_hipFlexors;

  /// No description provided for @secondary_deltoids.
  ///
  /// In es, this message translates to:
  /// **'Deltoides'**
  String get secondary_deltoids;

  /// No description provided for @secondary_lats.
  ///
  /// In es, this message translates to:
  /// **'Dorsal'**
  String get secondary_lats;

  /// No description provided for @ex_pecho_1_b1.
  ///
  /// In es, this message translates to:
  /// **'Desarrolla masa y fuerza en el pecho'**
  String get ex_pecho_1_b1;

  /// No description provided for @ex_pecho_1_b2.
  ///
  /// In es, this message translates to:
  /// **'Fortalece los tríceps y hombros anteriores'**
  String get ex_pecho_1_b2;

  /// No description provided for @ex_pecho_1_b3.
  ///
  /// In es, this message translates to:
  /// **'Ejercicio compuesto de alta transferencia a la fuerza funcional'**
  String get ex_pecho_1_b3;

  /// No description provided for @ex_pecho_2_b1.
  ///
  /// In es, this message translates to:
  /// **'Enfatiza la porción clavicular (superior) del pecho'**
  String get ex_pecho_2_b1;

  /// No description provided for @ex_pecho_2_b2.
  ///
  /// In es, this message translates to:
  /// **'Mayor rango de movimiento que la barra'**
  String get ex_pecho_2_b2;

  /// No description provided for @ex_pecho_2_b3.
  ///
  /// In es, this message translates to:
  /// **'Permite trabajar cada lado de forma independiente'**
  String get ex_pecho_2_b3;

  /// No description provided for @ex_pecho_3_b1.
  ///
  /// In es, this message translates to:
  /// **'Aislamiento profundo del pectoral mayor'**
  String get ex_pecho_3_b1;

  /// No description provided for @ex_pecho_3_b2.
  ///
  /// In es, this message translates to:
  /// **'Mejora la elasticidad y el estiramiento del pecho'**
  String get ex_pecho_3_b2;

  /// No description provided for @ex_pecho_3_b3.
  ///
  /// In es, this message translates to:
  /// **'Ideal para añadir volumen y definición'**
  String get ex_pecho_3_b3;

  /// No description provided for @ex_pecho_4_b1.
  ///
  /// In es, this message translates to:
  /// **'Ejercicio compuesto que trabaja pecho, tríceps y hombros'**
  String get ex_pecho_4_b1;

  /// No description provided for @ex_pecho_4_b2.
  ///
  /// In es, this message translates to:
  /// **'No requiere equipamiento adicional'**
  String get ex_pecho_4_b2;

  /// No description provided for @ex_pecho_4_b3.
  ///
  /// In es, this message translates to:
  /// **'Se puede progresar añadiendo peso con cinturón'**
  String get ex_pecho_4_b3;

  /// No description provided for @ex_pecho_5_b1.
  ///
  /// In es, this message translates to:
  /// **'Tensión constante a lo largo de todo el rango de movimiento'**
  String get ex_pecho_5_b1;

  /// No description provided for @ex_pecho_5_b2.
  ///
  /// In es, this message translates to:
  /// **'Excelente para definición y aislamiento del pecho'**
  String get ex_pecho_5_b2;

  /// No description provided for @ex_pecho_5_b3.
  ///
  /// In es, this message translates to:
  /// **'Múltiples variantes según altura de la polea'**
  String get ex_pecho_5_b3;

  /// No description provided for @ex_esp_1_b1.
  ///
  /// In es, this message translates to:
  /// **'Ejercicio total del cuerpo que maximiza la fuerza global'**
  String get ex_esp_1_b1;

  /// No description provided for @ex_esp_1_b2.
  ///
  /// In es, this message translates to:
  /// **'Desarrolla la cadena posterior (espalda, glúteos, isquios)'**
  String get ex_esp_1_b2;

  /// No description provided for @ex_esp_1_b3.
  ///
  /// In es, this message translates to:
  /// **'Alta liberación hormonal y efecto anabólico'**
  String get ex_esp_1_b3;

  /// No description provided for @ex_esp_2_b1.
  ///
  /// In es, this message translates to:
  /// **'Desarrolla el ancho de la espalda (latissimus dorsi)'**
  String get ex_esp_2_b1;

  /// No description provided for @ex_esp_2_b2.
  ///
  /// In es, this message translates to:
  /// **'Mejora la fuerza relativa al peso corporal'**
  String get ex_esp_2_b2;

  /// No description provided for @ex_esp_2_b3.
  ///
  /// In es, this message translates to:
  /// **'Excelente indicador de rendimiento funcional'**
  String get ex_esp_2_b3;

  /// No description provided for @ex_esp_3_b1.
  ///
  /// In es, this message translates to:
  /// **'Desarrolla el espesor y grosor de la espalda'**
  String get ex_esp_3_b1;

  /// No description provided for @ex_esp_3_b2.
  ///
  /// In es, this message translates to:
  /// **'Fortalece los músculos posturales'**
  String get ex_esp_3_b2;

  /// No description provided for @ex_esp_3_b3.
  ///
  /// In es, this message translates to:
  /// **'Complemento ideal del press de banca'**
  String get ex_esp_3_b3;

  /// No description provided for @ex_esp_4_b1.
  ///
  /// In es, this message translates to:
  /// **'Corrección de desequilibrios entre los dos lados'**
  String get ex_esp_4_b1;

  /// No description provided for @ex_esp_4_b2.
  ///
  /// In es, this message translates to:
  /// **'Mayor rango de movimiento que el remo con barra'**
  String get ex_esp_4_b2;

  /// No description provided for @ex_esp_4_b3.
  ///
  /// In es, this message translates to:
  /// **'Excelente para principiantes por ser fácil de aprender'**
  String get ex_esp_4_b3;

  /// No description provided for @ex_esp_5_b1.
  ///
  /// In es, this message translates to:
  /// **'Alternativa a las dominadas para principiantes'**
  String get ex_esp_5_b1;

  /// No description provided for @ex_esp_5_b2.
  ///
  /// In es, this message translates to:
  /// **'Desarrolla el ancho de la espalda'**
  String get ex_esp_5_b2;

  /// No description provided for @ex_esp_5_b3.
  ///
  /// In es, this message translates to:
  /// **'Control del peso fácil y progresión gradual'**
  String get ex_esp_5_b3;

  /// No description provided for @ex_pier_1_b1.
  ///
  /// In es, this message translates to:
  /// **'El ejercicio más completo para el tren inferior'**
  String get ex_pier_1_b1;

  /// No description provided for @ex_pier_1_b2.
  ///
  /// In es, this message translates to:
  /// **'Libera más hormonas anabólicas que cualquier otro ejercicio'**
  String get ex_pier_1_b2;

  /// No description provided for @ex_pier_1_b3.
  ///
  /// In es, this message translates to:
  /// **'Mejora la potencia atlética y la funcionalidad'**
  String get ex_pier_1_b3;

  /// No description provided for @ex_pier_2_b1.
  ///
  /// In es, this message translates to:
  /// **'Permite trabajar con cargas altas de forma segura'**
  String get ex_pier_2_b1;

  /// No description provided for @ex_pier_2_b2.
  ///
  /// In es, this message translates to:
  /// **'Ideal para principiantes o rehabilitación'**
  String get ex_pier_2_b2;

  /// No description provided for @ex_pier_2_b3.
  ///
  /// In es, this message translates to:
  /// **'Se puede variar la posición de los pies para enfocar distintas zonas'**
  String get ex_pier_2_b3;

  /// No description provided for @ex_pier_3_b1.
  ///
  /// In es, this message translates to:
  /// **'El ejercicio más eficaz para activar y desarrollar los glúteos'**
  String get ex_pier_3_b1;

  /// No description provided for @ex_pier_3_b2.
  ///
  /// In es, this message translates to:
  /// **'Mejora la extensión de cadera y la postura'**
  String get ex_pier_3_b2;

  /// No description provided for @ex_pier_3_b3.
  ///
  /// In es, this message translates to:
  /// **'Reduce el riesgo de lesiones de rodilla y cadera'**
  String get ex_pier_3_b3;

  /// No description provided for @ex_pier_4_b1.
  ///
  /// In es, this message translates to:
  /// **'Trabaja cada pierna de forma unilateral, corrigiendo desequilibrios'**
  String get ex_pier_4_b1;

  /// No description provided for @ex_pier_4_b2.
  ///
  /// In es, this message translates to:
  /// **'Mejora el equilibrio y la estabilidad'**
  String get ex_pier_4_b2;

  /// No description provided for @ex_pier_4_b3.
  ///
  /// In es, this message translates to:
  /// **'Excelente para el desarrollo de glúteos y cuádriceps'**
  String get ex_pier_4_b3;

  /// No description provided for @ex_pier_5_b1.
  ///
  /// In es, this message translates to:
  /// **'Aislamiento directo de los isquiotibiales'**
  String get ex_pier_5_b1;

  /// No description provided for @ex_pier_5_b2.
  ///
  /// In es, this message translates to:
  /// **'Previene lesiones de tendón de la corva'**
  String get ex_pier_5_b2;

  /// No description provided for @ex_pier_5_b3.
  ///
  /// In es, this message translates to:
  /// **'Equilibra el desarrollo muscular del muslo'**
  String get ex_pier_5_b3;

  /// No description provided for @ex_hom_1_b1.
  ///
  /// In es, this message translates to:
  /// **'Desarrolla los tres haces del deltoides'**
  String get ex_hom_1_b1;

  /// No description provided for @ex_hom_1_b2.
  ///
  /// In es, this message translates to:
  /// **'Mejora la fuerza funcional por encima de la cabeza'**
  String get ex_hom_1_b2;

  /// No description provided for @ex_hom_1_b3.
  ///
  /// In es, this message translates to:
  /// **'Fortalece el manguito rotador y la estabilidad del hombro'**
  String get ex_hom_1_b3;

  /// No description provided for @ex_hom_2_b1.
  ///
  /// In es, this message translates to:
  /// **'Aislamiento del deltoides lateral para hombros más anchos'**
  String get ex_hom_2_b1;

  /// No description provided for @ex_hom_2_b2.
  ///
  /// In es, this message translates to:
  /// **'Mejora la apariencia de anchura del torso'**
  String get ex_hom_2_b2;

  /// No description provided for @ex_hom_2_b3.
  ///
  /// In es, this message translates to:
  /// **'Bajo riesgo de lesión cuando se usa peso apropiado'**
  String get ex_hom_2_b3;

  /// No description provided for @ex_hom_3_b1.
  ///
  /// In es, this message translates to:
  /// **'Fortalece los deltoides posteriores y mejora la postura'**
  String get ex_hom_3_b1;

  /// No description provided for @ex_hom_3_b2.
  ///
  /// In es, this message translates to:
  /// **'Previene lesiones del manguito rotador'**
  String get ex_hom_3_b2;

  /// No description provided for @ex_hom_3_b3.
  ///
  /// In es, this message translates to:
  /// **'Contrarresta los efectos del trabajo de empuje'**
  String get ex_hom_3_b3;

  /// No description provided for @ex_hom_4_b1.
  ///
  /// In es, this message translates to:
  /// **'Activa los tres haces del deltoides en un solo movimiento'**
  String get ex_hom_4_b1;

  /// No description provided for @ex_hom_4_b2.
  ///
  /// In es, this message translates to:
  /// **'La rotación mejora la movilidad del hombro'**
  String get ex_hom_4_b2;

  /// No description provided for @ex_hom_4_b3.
  ///
  /// In es, this message translates to:
  /// **'Variante más completa que el press de hombros convencional'**
  String get ex_hom_4_b3;

  /// No description provided for @ex_bra_1_b1.
  ///
  /// In es, this message translates to:
  /// **'Aislamiento directo del bíceps braquial'**
  String get ex_bra_1_b1;

  /// No description provided for @ex_bra_1_b2.
  ///
  /// In es, this message translates to:
  /// **'Trabaja cada brazo de forma independiente'**
  String get ex_bra_1_b2;

  /// No description provided for @ex_bra_1_b3.
  ///
  /// In es, this message translates to:
  /// **'Fácil progresión de peso y técnica accesible'**
  String get ex_bra_1_b3;

  /// No description provided for @ex_bra_2_b1.
  ///
  /// In es, this message translates to:
  /// **'Permite usar más carga que con mancuernas'**
  String get ex_bra_2_b1;

  /// No description provided for @ex_bra_2_b2.
  ///
  /// In es, this message translates to:
  /// **'La barra EZ reduce la tensión en muñecas y codos'**
  String get ex_bra_2_b2;

  /// No description provided for @ex_bra_2_b3.
  ///
  /// In es, this message translates to:
  /// **'Ideal para desarrollar masa global del bíceps'**
  String get ex_bra_2_b3;

  /// No description provided for @ex_bra_3_b1.
  ///
  /// In es, this message translates to:
  /// **'Énfasis en el braquial y braquiorradial'**
  String get ex_bra_3_b1;

  /// No description provided for @ex_bra_3_b2.
  ///
  /// In es, this message translates to:
  /// **'Da grosor y volumen al brazo visto de frente'**
  String get ex_bra_3_b2;

  /// No description provided for @ex_bra_3_b3.
  ///
  /// In es, this message translates to:
  /// **'Menor estrés en las muñecas que el curl supino'**
  String get ex_bra_3_b3;

  /// No description provided for @ex_bra_4_b1.
  ///
  /// In es, this message translates to:
  /// **'Aislamiento efectivo de los tres haces del tríceps'**
  String get ex_bra_4_b1;

  /// No description provided for @ex_bra_4_b2.
  ///
  /// In es, this message translates to:
  /// **'Tensión constante gracias a la polea'**
  String get ex_bra_4_b2;

  /// No description provided for @ex_bra_4_b3.
  ///
  /// In es, this message translates to:
  /// **'Excelente para definición y acabado del tríceps'**
  String get ex_bra_4_b3;

  /// No description provided for @ex_bra_5_b1.
  ///
  /// In es, this message translates to:
  /// **'Máximo estiramiento de la cabeza larga del tríceps'**
  String get ex_bra_5_b1;

  /// No description provided for @ex_bra_5_b2.
  ///
  /// In es, this message translates to:
  /// **'Desarrolla el espesor del tríceps'**
  String get ex_bra_5_b2;

  /// No description provided for @ex_bra_5_b3.
  ///
  /// In es, this message translates to:
  /// **'Se puede usar con mancuernas o barra recta'**
  String get ex_bra_5_b3;

  /// No description provided for @ex_core_1_b1.
  ///
  /// In es, this message translates to:
  /// **'Fortalece el core profundo sin carga espinal'**
  String get ex_core_1_b1;

  /// No description provided for @ex_core_1_b2.
  ///
  /// In es, this message translates to:
  /// **'Mejora la postura y estabilidad lumbar'**
  String get ex_core_1_b2;

  /// No description provided for @ex_core_1_b3.
  ///
  /// In es, this message translates to:
  /// **'Reduce el riesgo de lesiones de espalda'**
  String get ex_core_1_b3;

  /// No description provided for @ex_core_2_b1.
  ///
  /// In es, this message translates to:
  /// **'Ejercicio básico de aislamiento del recto abdominal'**
  String get ex_core_2_b1;

  /// No description provided for @ex_core_2_b2.
  ///
  /// In es, this message translates to:
  /// **'Fácil de aprender y ejecutar'**
  String get ex_core_2_b2;

  /// No description provided for @ex_core_2_b3.
  ///
  /// In es, this message translates to:
  /// **'Base para progresiones de abdominales más exigentes'**
  String get ex_core_2_b3;

  /// No description provided for @ex_core_3_b1.
  ///
  /// In es, this message translates to:
  /// **'Trabaja el core inferior con alta intensidad'**
  String get ex_core_3_b1;

  /// No description provided for @ex_core_3_b2.
  ///
  /// In es, this message translates to:
  /// **'Mejora la fuerza de agarre y de la zona lumbar'**
  String get ex_core_3_b2;

  /// No description provided for @ex_core_3_b3.
  ///
  /// In es, this message translates to:
  /// **'Versión progresiva: rodillas dobladas → piernas rectas → L-sit'**
  String get ex_core_3_b3;

  /// No description provided for @ex_core_4_b1.
  ///
  /// In es, this message translates to:
  /// **'Uno de los ejercicios de core más completos y exigentes'**
  String get ex_core_4_b1;

  /// No description provided for @ex_core_4_b2.
  ///
  /// In es, this message translates to:
  /// **'Trabaja el core en extensión, diferente a los abdominales tradicionales'**
  String get ex_core_4_b2;

  /// No description provided for @ex_core_4_b3.
  ///
  /// In es, this message translates to:
  /// **'Desarrolla fuerza funcional en toda la cadena anterior'**
  String get ex_core_4_b3;
}

class _SDelegate extends LocalizationsDelegate<S> {
  const _SDelegate();

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(lookupS(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'de',
    'en',
    'es',
    'fr',
    'ja',
    'ko',
    'pt',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_SDelegate old) => false;
}

S lookupS(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return SDe();
    case 'en':
      return SEn();
    case 'es':
      return SEs();
    case 'fr':
      return SFr();
    case 'ja':
      return SJa();
    case 'ko':
      return SKo();
    case 'pt':
      return SPt();
  }

  throw FlutterError(
    'S.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
