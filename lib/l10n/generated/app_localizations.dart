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

  /// No description provided for @common_discardChangesTitle.
  ///
  /// In es, this message translates to:
  /// **'¿Descartar cambios?'**
  String get common_discardChangesTitle;

  /// No description provided for @common_discardChangesBody.
  ///
  /// In es, this message translates to:
  /// **'Los cambios que hiciste no se guardarán.'**
  String get common_discardChangesBody;

  /// No description provided for @common_keepEditing.
  ///
  /// In es, this message translates to:
  /// **'Seguir editando'**
  String get common_keepEditing;

  /// No description provided for @common_discard.
  ///
  /// In es, this message translates to:
  /// **'Descartar'**
  String get common_discard;

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

  /// No description provided for @muscle_crossfit.
  ///
  /// In es, this message translates to:
  /// **'CrossFit'**
  String get muscle_crossfit;

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

  /// No description provided for @equipment_rings.
  ///
  /// In es, this message translates to:
  /// **'Anillas'**
  String get equipment_rings;

  /// No description provided for @equipment_box.
  ///
  /// In es, this message translates to:
  /// **'Cajón'**
  String get equipment_box;

  /// No description provided for @equipment_rope.
  ///
  /// In es, this message translates to:
  /// **'Cuerda'**
  String get equipment_rope;

  /// No description provided for @equipment_ball.
  ///
  /// In es, this message translates to:
  /// **'Pelota'**
  String get equipment_ball;

  /// No description provided for @equipment_kettlebell.
  ///
  /// In es, this message translates to:
  /// **'Kettlebell'**
  String get equipment_kettlebell;

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

  /// No description provided for @nav_progress.
  ///
  /// In es, this message translates to:
  /// **'Progreso'**
  String get nav_progress;

  /// No description provided for @nav_profile.
  ///
  /// In es, this message translates to:
  /// **'Perfil'**
  String get nav_profile;

  /// No description provided for @home_todayTitle.
  ///
  /// In es, this message translates to:
  /// **'HOY TOCA'**
  String get home_todayTitle;

  /// No description provided for @home_inProgressTitle.
  ///
  /// In es, this message translates to:
  /// **'ENTRENAMIENTO EN CURSO'**
  String get home_inProgressTitle;

  /// No description provided for @home_continueWorkout.
  ///
  /// In es, this message translates to:
  /// **'Continuar entrenamiento'**
  String get home_continueWorkout;

  /// No description provided for @home_chooseAnother.
  ///
  /// In es, this message translates to:
  /// **'Elegir otra rutina'**
  String get home_chooseAnother;

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

  /// No description provided for @login_continueGuest.
  ///
  /// In es, this message translates to:
  /// **'Continuar sin cuenta'**
  String get login_continueGuest;

  /// No description provided for @guest_name.
  ///
  /// In es, this message translates to:
  /// **'Invitado'**
  String get guest_name;

  /// No description provided for @guest_saveProgressTitle.
  ///
  /// In es, this message translates to:
  /// **'Guarda tu progreso'**
  String get guest_saveProgressTitle;

  /// No description provided for @guest_saveProgressBody.
  ///
  /// In es, this message translates to:
  /// **'Estás usando LiftWave como invitado. Crea una cuenta gratis para no perder tus entrenamientos si cambias de teléfono o reinstalas la app.'**
  String get guest_saveProgressBody;

  /// No description provided for @guest_createAccount.
  ///
  /// In es, this message translates to:
  /// **'Crear cuenta'**
  String get guest_createAccount;

  /// No description provided for @guest_notNow.
  ///
  /// In es, this message translates to:
  /// **'Ahora no'**
  String get guest_notNow;

  /// No description provided for @guest_createAccountSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Crea una cuenta para no perder tu progreso'**
  String get guest_createAccountSubtitle;

  /// No description provided for @guest_accountCreated.
  ///
  /// In es, this message translates to:
  /// **'Cuenta creada. Tus entrenamientos están a salvo.'**
  String get guest_accountCreated;

  /// No description provided for @guest_existingAccountTitle.
  ///
  /// In es, this message translates to:
  /// **'Esta cuenta ya existe'**
  String get guest_existingAccountTitle;

  /// No description provided for @guest_existingAccountBody.
  ///
  /// In es, this message translates to:
  /// **'Si inicias sesión con ella, los entrenamientos que hiciste como invitado no se pasan a esa cuenta.'**
  String get guest_existingAccountBody;

  /// No description provided for @guest_signInAnyway.
  ///
  /// In es, this message translates to:
  /// **'Iniciar sesión igual'**
  String get guest_signInAnyway;

  /// No description provided for @guest_leave.
  ///
  /// In es, this message translates to:
  /// **'Salir del modo invitado'**
  String get guest_leave;

  /// No description provided for @guest_leaveBody.
  ///
  /// In es, this message translates to:
  /// **'Como no tienes una cuenta, se borrarán tus entrenamientos y datos. Esta acción no se puede deshacer.'**
  String get guest_leaveBody;

  /// No description provided for @train_reasonIncreaseLoad.
  ///
  /// In es, this message translates to:
  /// **'Hiciste {reps} reps con {weight}, el tope de tu rango ({min}–{max}). Toca subir el peso.'**
  String train_reasonIncreaseLoad(int reps, String weight, int min, int max);

  /// No description provided for @train_reasonAddRep.
  ///
  /// In es, this message translates to:
  /// **'Hiciste {reps} reps con {weight}. Suma una repetición antes de subir el peso.'**
  String train_reasonAddRep(int reps, String weight);

  /// No description provided for @train_reasonConsolidate.
  ///
  /// In es, this message translates to:
  /// **'Hiciste {reps} reps, por debajo de tu rango ({min}–{max}). Mantén {weight} hasta llegar a {min}.'**
  String train_reasonConsolidate(int reps, String weight, int min, int max);

  /// No description provided for @train_reasonBodyweight.
  ///
  /// In es, this message translates to:
  /// **'Hiciste {reps} reps. Intenta sumar una más.'**
  String train_reasonBodyweight(int reps);

  /// No description provided for @login_legalPrefix.
  ///
  /// In es, this message translates to:
  /// **'Al continuar, aceptas nuestros '**
  String get login_legalPrefix;

  /// No description provided for @login_termsLink.
  ///
  /// In es, this message translates to:
  /// **'términos de servicio'**
  String get login_termsLink;

  /// No description provided for @login_legalAnd.
  ///
  /// In es, this message translates to:
  /// **'y'**
  String get login_legalAnd;

  /// No description provided for @login_privacyLink.
  ///
  /// In es, this message translates to:
  /// **'política de privacidad'**
  String get login_privacyLink;

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

  /// No description provided for @restTimer_title.
  ///
  /// In es, this message translates to:
  /// **'Descanso'**
  String get restTimer_title;

  /// No description provided for @restTimer_openControls.
  ///
  /// In es, this message translates to:
  /// **'Abrir controles del temporizador de descanso'**
  String get restTimer_openControls;

  /// No description provided for @restTimer_addSeconds.
  ///
  /// In es, this message translates to:
  /// **'Añadir {seconds} segundos'**
  String restTimer_addSeconds(int seconds);

  /// No description provided for @restTimer_subtractSeconds.
  ///
  /// In es, this message translates to:
  /// **'Restar {seconds} segundos'**
  String restTimer_subtractSeconds(int seconds);

  /// No description provided for @restTimer_pause.
  ///
  /// In es, this message translates to:
  /// **'Pausar temporizador'**
  String get restTimer_pause;

  /// No description provided for @restTimer_resume.
  ///
  /// In es, this message translates to:
  /// **'Reanudar temporizador'**
  String get restTimer_resume;

  /// No description provided for @restTimer_dismiss.
  ///
  /// In es, this message translates to:
  /// **'Cerrar temporizador'**
  String get restTimer_dismiss;

  /// No description provided for @restTimer_reset.
  ///
  /// In es, this message translates to:
  /// **'Reiniciar temporizador'**
  String get restTimer_reset;

  /// No description provided for @restTimer_preset.
  ///
  /// In es, this message translates to:
  /// **'Usar descanso de {time}'**
  String restTimer_preset(String time);

  /// No description provided for @restTimer_resting.
  ///
  /// In es, this message translates to:
  /// **'DESCANSANDO'**
  String get restTimer_resting;

  /// No description provided for @restTimer_done.
  ///
  /// In es, this message translates to:
  /// **'¡LISTO!'**
  String get restTimer_done;

  /// No description provided for @home_lastWorkout.
  ///
  /// In es, this message translates to:
  /// **'Último entrenamiento'**
  String get home_lastWorkout;

  /// No description provided for @home_repeatWorkout.
  ///
  /// In es, this message translates to:
  /// **'Repetir entrenamiento'**
  String get home_repeatWorkout;

  /// No description provided for @editWorkout_title.
  ///
  /// In es, this message translates to:
  /// **'Editar entrenamiento'**
  String get editWorkout_title;

  /// No description provided for @editWorkout_saved.
  ///
  /// In es, this message translates to:
  /// **'Entrenamiento actualizado'**
  String get editWorkout_saved;

  /// No description provided for @detail_deleteWorkout.
  ///
  /// In es, this message translates to:
  /// **'Eliminar entrenamiento'**
  String get detail_deleteWorkout;

  /// No description provided for @detail_deleteWorkoutConfirm.
  ///
  /// In es, this message translates to:
  /// **'Se eliminará de tu historial. Esta acción no se puede deshacer.'**
  String get detail_deleteWorkoutConfirm;

  /// No description provided for @detail_workoutDeleted.
  ///
  /// In es, this message translates to:
  /// **'Entrenamiento eliminado'**
  String get detail_workoutDeleted;

  /// No description provided for @home_viewAll.
  ///
  /// In es, this message translates to:
  /// **'Ver todo'**
  String get home_viewAll;

  /// No description provided for @home_goToTrain.
  ///
  /// In es, this message translates to:
  /// **'Ir a Entrenar →'**
  String get home_goToTrain;

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

  /// No description provided for @home_exerciseLibrary.
  ///
  /// In es, this message translates to:
  /// **'Biblioteca de ejercicios'**
  String get home_exerciseLibrary;

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

  /// No description provided for @progressScreen_deleteMeasurementTitle.
  ///
  /// In es, this message translates to:
  /// **'¿Eliminar registro?'**
  String get progressScreen_deleteMeasurementTitle;

  /// No description provided for @progressScreen_deleteMeasurementBody.
  ///
  /// In es, this message translates to:
  /// **'Se eliminarán el registro y su foto. Esta acción no se puede deshacer.'**
  String get progressScreen_deleteMeasurementBody;

  /// No description provided for @profile_signOutConfirm.
  ///
  /// In es, this message translates to:
  /// **'¿Cerrar sesión? Tus datos quedan guardados en tu cuenta.'**
  String get profile_signOutConfirm;

  /// No description provided for @profile_deleteSubscriptionNote.
  ///
  /// In es, this message translates to:
  /// **'Eliminar la cuenta no cancela tu suscripción. Cancélala antes desde la tienda.'**
  String get profile_deleteSubscriptionNote;

  /// No description provided for @profile_manageSubscription.
  ///
  /// In es, this message translates to:
  /// **'Administrar suscripción'**
  String get profile_manageSubscription;

  /// No description provided for @profile_help.
  ///
  /// In es, this message translates to:
  /// **'Ayuda y soporte'**
  String get profile_help;

  /// No description provided for @rest_alertTitle.
  ///
  /// In es, this message translates to:
  /// **'Descanso terminado'**
  String get rest_alertTitle;

  /// No description provided for @rest_alertBody.
  ///
  /// In es, this message translates to:
  /// **'Es hora de tu siguiente serie.'**
  String get rest_alertBody;

  /// No description provided for @rest_alertChannel.
  ///
  /// In es, this message translates to:
  /// **'Temporizador de descanso'**
  String get rest_alertChannel;

  /// No description provided for @profile_restAlert.
  ///
  /// In es, this message translates to:
  /// **'Avisar al terminar el descanso'**
  String get profile_restAlert;

  /// No description provided for @profile_restAlertSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Notificación con sonido cuando la app no está en pantalla'**
  String get profile_restAlertSubtitle;

  /// No description provided for @profile_restAlertExact.
  ///
  /// In es, this message translates to:
  /// **'Permitir alarmas exactas'**
  String get profile_restAlertExact;

  /// No description provided for @profile_restAlertExactSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Sin este permiso, Android puede retrasar el aviso'**
  String get profile_restAlertExactSubtitle;

  /// No description provided for @editWorkout_date.
  ///
  /// In es, this message translates to:
  /// **'Fecha y hora'**
  String get editWorkout_date;

  /// No description provided for @editWorkout_duration.
  ///
  /// In es, this message translates to:
  /// **'Duración (min)'**
  String get editWorkout_duration;

  /// No description provided for @history_searchHint.
  ///
  /// In es, this message translates to:
  /// **'Buscar entrenamiento o ejercicio'**
  String get history_searchHint;

  /// No description provided for @history_noResults.
  ///
  /// In es, this message translates to:
  /// **'Sin resultados'**
  String get history_noResults;

  /// No description provided for @history_calendar.
  ///
  /// In es, this message translates to:
  /// **'Calendario'**
  String get history_calendar;

  /// No description provided for @progress_oneRm.
  ///
  /// In es, this message translates to:
  /// **'1RM est.'**
  String get progress_oneRm;

  /// No description provided for @progress_recordsTitle.
  ///
  /// In es, this message translates to:
  /// **'Récords'**
  String get progress_recordsTitle;

  /// No description provided for @progress_bestLift.
  ///
  /// In es, this message translates to:
  /// **'Mejor levantamiento'**
  String get progress_bestLift;

  /// No description provided for @progress_bestOneRm.
  ///
  /// In es, this message translates to:
  /// **'Mejor 1RM estimado'**
  String get progress_bestOneRm;

  /// No description provided for @setType_title.
  ///
  /// In es, this message translates to:
  /// **'Tipo de serie'**
  String get setType_title;

  /// No description provided for @setType_normal.
  ///
  /// In es, this message translates to:
  /// **'Normal'**
  String get setType_normal;

  /// No description provided for @setType_warmup.
  ///
  /// In es, this message translates to:
  /// **'Calentamiento'**
  String get setType_warmup;

  /// No description provided for @setType_drop.
  ///
  /// In es, this message translates to:
  /// **'Drop set'**
  String get setType_drop;

  /// No description provided for @setType_failure.
  ///
  /// In es, this message translates to:
  /// **'Al fallo'**
  String get setType_failure;

  /// No description provided for @setType_warmupHint.
  ///
  /// In es, this message translates to:
  /// **'No suma volumen ni récords'**
  String get setType_warmupHint;

  /// No description provided for @setType_warmupShort.
  ///
  /// In es, this message translates to:
  /// **'C'**
  String get setType_warmupShort;

  /// No description provided for @setType_dropShort.
  ///
  /// In es, this message translates to:
  /// **'D'**
  String get setType_dropShort;

  /// No description provided for @setType_failureShort.
  ///
  /// In es, this message translates to:
  /// **'F'**
  String get setType_failureShort;

  /// No description provided for @plates_title.
  ///
  /// In es, this message translates to:
  /// **'Calculadora de discos'**
  String get plates_title;

  /// No description provided for @plates_target.
  ///
  /// In es, this message translates to:
  /// **'Peso total'**
  String get plates_target;

  /// No description provided for @plates_bar.
  ///
  /// In es, this message translates to:
  /// **'Barra'**
  String get plates_bar;

  /// No description provided for @plates_perSide.
  ///
  /// In es, this message translates to:
  /// **'Por lado'**
  String get plates_perSide;

  /// No description provided for @plates_onlyBar.
  ///
  /// In es, this message translates to:
  /// **'Solo la barra'**
  String get plates_onlyBar;

  /// No description provided for @plates_belowBar.
  ///
  /// In es, this message translates to:
  /// **'El peso es menor que la barra'**
  String get plates_belowBar;

  /// No description provided for @plates_missing.
  ///
  /// In es, this message translates to:
  /// **'Faltan {amount} que no se pueden cargar con estos discos'**
  String plates_missing(String amount);

  /// No description provided for @train_secondsHeader.
  ///
  /// In es, this message translates to:
  /// **'SEG'**
  String get train_secondsHeader;

  /// No description provided for @train_secondsShort.
  ///
  /// In es, this message translates to:
  /// **'s'**
  String get train_secondsShort;

  /// No description provided for @train_startHold.
  ///
  /// In es, this message translates to:
  /// **'Iniciar'**
  String get train_startHold;

  /// No description provided for @train_measureByTime.
  ///
  /// In es, this message translates to:
  /// **'Medir por tiempo'**
  String get train_measureByTime;

  /// No description provided for @train_measureByReps.
  ///
  /// In es, this message translates to:
  /// **'Medir por repeticiones'**
  String get train_measureByReps;

  /// No description provided for @hold_running.
  ///
  /// In es, this message translates to:
  /// **'EN CURSO'**
  String get hold_running;

  /// No description provided for @hold_alertTitle.
  ///
  /// In es, this message translates to:
  /// **'Tiempo cumplido'**
  String get hold_alertTitle;

  /// No description provided for @hold_alertBody.
  ///
  /// In es, this message translates to:
  /// **'Terminaste la serie.'**
  String get hold_alertBody;

  /// No description provided for @train_reasonHold.
  ///
  /// In es, this message translates to:
  /// **'Aguantaste {seconds} s. Intenta sumar 5 s.'**
  String train_reasonHold(int seconds);

  /// No description provided for @superset_label.
  ///
  /// In es, this message translates to:
  /// **'Superserie'**
  String get superset_label;

  /// No description provided for @superset_linkNext.
  ///
  /// In es, this message translates to:
  /// **'Superserie con el siguiente'**
  String get superset_linkNext;

  /// No description provided for @superset_unlink.
  ///
  /// In es, this message translates to:
  /// **'Quitar de la superserie'**
  String get superset_unlink;

  /// No description provided for @superset_hint.
  ///
  /// In es, this message translates to:
  /// **'Alterna las series; el descanso empieza al terminar la ronda.'**
  String get superset_hint;

  /// No description provided for @widget_today.
  ///
  /// In es, this message translates to:
  /// **'Hoy toca'**
  String get widget_today;

  /// No description provided for @widget_weekOfTarget.
  ///
  /// In es, this message translates to:
  /// **'{done}/{target} esta semana'**
  String widget_weekOfTarget(String done, String target);

  /// No description provided for @widget_weekOne.
  ///
  /// In es, this message translates to:
  /// **'1 sesión esta semana'**
  String get widget_weekOne;

  /// No description provided for @widget_weekOther.
  ///
  /// In es, this message translates to:
  /// **'{count} sesiones esta semana'**
  String widget_weekOther(String count);

  /// No description provided for @reminders_title.
  ///
  /// In es, this message translates to:
  /// **'Recordatorios de entrenamiento'**
  String get reminders_title;

  /// No description provided for @reminders_off.
  ///
  /// In es, this message translates to:
  /// **'Desactivados'**
  String get reminders_off;

  /// No description provided for @reminders_enable.
  ///
  /// In es, this message translates to:
  /// **'Recordarme entrenar'**
  String get reminders_enable;

  /// No description provided for @reminders_enableSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Una notificación los días que elijas'**
  String get reminders_enableSubtitle;

  /// No description provided for @reminders_days.
  ///
  /// In es, this message translates to:
  /// **'Días'**
  String get reminders_days;

  /// No description provided for @reminders_time.
  ///
  /// In es, this message translates to:
  /// **'Hora'**
  String get reminders_time;

  /// No description provided for @reminders_notificationTitle.
  ///
  /// In es, this message translates to:
  /// **'Hora de entrenar'**
  String get reminders_notificationTitle;

  /// No description provided for @reminders_notificationBody.
  ///
  /// In es, this message translates to:
  /// **'Tu entrenamiento de hoy te espera.'**
  String get reminders_notificationBody;

  /// No description provided for @reminders_notificationRoutine.
  ///
  /// In es, this message translates to:
  /// **'Hoy toca: {routine}'**
  String reminders_notificationRoutine(String routine);

  /// No description provided for @reminders_permissionDenied.
  ///
  /// In es, this message translates to:
  /// **'Activa las notificaciones de LiftWave en los ajustes del sistema para recibir recordatorios.'**
  String get reminders_permissionDenied;

  /// No description provided for @health_sync.
  ///
  /// In es, this message translates to:
  /// **'Sincronizar con {store}'**
  String health_sync(String store);

  /// No description provided for @health_syncSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Guarda en {store} los entrenamientos y el peso corporal que registres'**
  String health_syncSubtitle(String store);

  /// No description provided for @health_enabled.
  ///
  /// In es, this message translates to:
  /// **'Listo. Tus próximos entrenamientos se guardarán en {store}.'**
  String health_enabled(String store);

  /// No description provided for @health_denied.
  ///
  /// In es, this message translates to:
  /// **'No se pudo activar. Revisa los permisos de LiftWave en {store}.'**
  String health_denied(String store);

  /// No description provided for @health_needsInstall.
  ///
  /// In es, this message translates to:
  /// **'Instala o actualiza Health Connect para activar la sincronización.'**
  String get health_needsInstall;

  /// No description provided for @health_install.
  ///
  /// In es, this message translates to:
  /// **'Instalar'**
  String get health_install;

  /// No description provided for @health_unsupported.
  ///
  /// In es, this message translates to:
  /// **'{store} no está disponible en este dispositivo.'**
  String health_unsupported(String store);

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

  /// No description provided for @restore_connectionError.
  ///
  /// In es, this message translates to:
  /// **'Sin conexión. Verifica tu internet e inténtalo de nuevo.'**
  String get restore_connectionError;

  /// No description provided for @restore_unknownError.
  ///
  /// In es, this message translates to:
  /// **'No se pudo restaurar. Inténtalo de nuevo.'**
  String get restore_unknownError;

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

  /// No description provided for @profile_trainingPreferences.
  ///
  /// In es, this message translates to:
  /// **'Preferencias de entrenamiento'**
  String get profile_trainingPreferences;

  /// No description provided for @profile_trainingPreferencesSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Objetivo, experiencia, días y equipamiento'**
  String get profile_trainingPreferencesSubtitle;

  /// No description provided for @profile_appearance.
  ///
  /// In es, this message translates to:
  /// **'Apariencia'**
  String get profile_appearance;

  /// No description provided for @appearance_system.
  ///
  /// In es, this message translates to:
  /// **'Automático (según el teléfono)'**
  String get appearance_system;

  /// No description provided for @appearance_light.
  ///
  /// In es, this message translates to:
  /// **'Claro'**
  String get appearance_light;

  /// No description provided for @appearance_dark.
  ///
  /// In es, this message translates to:
  /// **'Oscuro'**
  String get appearance_dark;

  /// No description provided for @onboarding_title.
  ///
  /// In es, this message translates to:
  /// **'Personaliza tu entrenamiento'**
  String get onboarding_title;

  /// No description provided for @onboarding_goalTitle.
  ///
  /// In es, this message translates to:
  /// **'¿Cuál es tu objetivo principal?'**
  String get onboarding_goalTitle;

  /// No description provided for @onboarding_goalSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Usaremos esto para adaptar tus próximas recomendaciones.'**
  String get onboarding_goalSubtitle;

  /// No description provided for @onboarding_goalMuscle.
  ///
  /// In es, this message translates to:
  /// **'Ganar masa muscular'**
  String get onboarding_goalMuscle;

  /// No description provided for @onboarding_goalStrength.
  ///
  /// In es, this message translates to:
  /// **'Ganar fuerza'**
  String get onboarding_goalStrength;

  /// No description provided for @onboarding_goalFatLoss.
  ///
  /// In es, this message translates to:
  /// **'Perder grasa'**
  String get onboarding_goalFatLoss;

  /// No description provided for @onboarding_goalFitness.
  ///
  /// In es, this message translates to:
  /// **'Mejorar mi condición'**
  String get onboarding_goalFitness;

  /// No description provided for @onboarding_experienceTitle.
  ///
  /// In es, this message translates to:
  /// **'¿Cuál es tu experiencia?'**
  String get onboarding_experienceTitle;

  /// No description provided for @onboarding_experienceSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Ajustaremos el volumen y la progresión a tu nivel.'**
  String get onboarding_experienceSubtitle;

  /// No description provided for @onboarding_experienceBeginner.
  ///
  /// In es, this message translates to:
  /// **'Principiante'**
  String get onboarding_experienceBeginner;

  /// No description provided for @onboarding_experienceBeginnerHint.
  ///
  /// In es, this message translates to:
  /// **'Menos de 1 año'**
  String get onboarding_experienceBeginnerHint;

  /// No description provided for @onboarding_experienceIntermediate.
  ///
  /// In es, this message translates to:
  /// **'Intermedio'**
  String get onboarding_experienceIntermediate;

  /// No description provided for @onboarding_experienceIntermediateHint.
  ///
  /// In es, this message translates to:
  /// **'Entre 1 y 3 años'**
  String get onboarding_experienceIntermediateHint;

  /// No description provided for @onboarding_experienceAdvanced.
  ///
  /// In es, this message translates to:
  /// **'Avanzado'**
  String get onboarding_experienceAdvanced;

  /// No description provided for @onboarding_experienceAdvancedHint.
  ///
  /// In es, this message translates to:
  /// **'Más de 3 años'**
  String get onboarding_experienceAdvancedHint;

  /// No description provided for @onboarding_daysTitle.
  ///
  /// In es, this message translates to:
  /// **'¿Cuántos días puedes entrenar?'**
  String get onboarding_daysTitle;

  /// No description provided for @onboarding_daysSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Elige una frecuencia que puedas mantener.'**
  String get onboarding_daysSubtitle;

  /// No description provided for @onboarding_daysSelected.
  ///
  /// In es, this message translates to:
  /// **'{count} días por semana'**
  String onboarding_daysSelected(int count);

  /// No description provided for @onboarding_equipmentTitle.
  ///
  /// In es, this message translates to:
  /// **'¿Qué equipamiento tienes?'**
  String get onboarding_equipmentTitle;

  /// No description provided for @onboarding_equipmentSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Selecciona todo lo que puedas usar habitualmente.'**
  String get onboarding_equipmentSubtitle;

  /// No description provided for @onboarding_continue.
  ///
  /// In es, this message translates to:
  /// **'Continuar'**
  String get onboarding_continue;

  /// No description provided for @onboarding_back.
  ///
  /// In es, this message translates to:
  /// **'Atrás'**
  String get onboarding_back;

  /// No description provided for @onboarding_finish.
  ///
  /// In es, this message translates to:
  /// **'Guardar y empezar'**
  String get onboarding_finish;

  /// No description provided for @onboarding_skip.
  ///
  /// In es, this message translates to:
  /// **'Ahora no'**
  String get onboarding_skip;

  /// No description provided for @onboarding_saved.
  ///
  /// In es, this message translates to:
  /// **'Preferencias guardadas'**
  String get onboarding_saved;

  /// No description provided for @weeklyPlan_title.
  ///
  /// In es, this message translates to:
  /// **'Plan semanal'**
  String get weeklyPlan_title;

  /// No description provided for @weeklyPlan_sessions.
  ///
  /// In es, this message translates to:
  /// **'{done}/{total} sesiones'**
  String weeklyPlan_sessions(int done, int total);

  /// No description provided for @weeklyPlan_adherence.
  ///
  /// In es, this message translates to:
  /// **'Adherencia'**
  String get weeklyPlan_adherence;

  /// No description provided for @weeklyPlan_remaining.
  ///
  /// In es, this message translates to:
  /// **'Restantes'**
  String get weeklyPlan_remaining;

  /// No description provided for @weeklyPlan_completedSets.
  ///
  /// In es, this message translates to:
  /// **'Series'**
  String get weeklyPlan_completedSets;

  /// No description provided for @weeklyPlan_muscleBalance.
  ///
  /// In es, this message translates to:
  /// **'SERIES POR MÚSCULO'**
  String get weeklyPlan_muscleBalance;

  /// No description provided for @weeklyPlan_completed.
  ///
  /// In es, this message translates to:
  /// **'Objetivo semanal completado. Buen trabajo.'**
  String get weeklyPlan_completed;

  /// No description provided for @weeklyPlan_nextSession.
  ///
  /// In es, this message translates to:
  /// **'PRÓXIMA SESIÓN'**
  String get weeklyPlan_nextSession;

  /// No description provided for @weeklyPlan_exerciseCount.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =1{1 ejercicio} other{{count} ejercicios}}'**
  String weeklyPlan_exerciseCount(int count);

  /// No description provided for @weeklyPlan_start.
  ///
  /// In es, this message translates to:
  /// **'Empezar'**
  String get weeklyPlan_start;

  /// No description provided for @weeklyPlan_noCompatible.
  ///
  /// In es, this message translates to:
  /// **'No hay suficientes ejercicios compatibles con tu equipamiento.'**
  String get weeklyPlan_noCompatible;

  /// No description provided for @weeklyPlan_adjustEquipment.
  ///
  /// In es, this message translates to:
  /// **'Ajustar'**
  String get weeklyPlan_adjustEquipment;

  /// No description provided for @weeklyPlan_setupTitle.
  ///
  /// In es, this message translates to:
  /// **'Configura tu plan'**
  String get weeklyPlan_setupTitle;

  /// No description provided for @weeklyPlan_setupSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Completa tus preferencias para recibir una sesión adaptada cada semana.'**
  String get weeklyPlan_setupSubtitle;

  /// No description provided for @weeklyPlan_configure.
  ///
  /// In es, this message translates to:
  /// **'Configurar'**
  String get weeklyPlan_configure;

  /// No description provided for @weeklyPlan_adaptiveName.
  ///
  /// In es, this message translates to:
  /// **'Sesión adaptativa'**
  String get weeklyPlan_adaptiveName;

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

  /// No description provided for @train_readyToStart.
  ///
  /// In es, this message translates to:
  /// **'Listo para empezar'**
  String get train_readyToStart;

  /// No description provided for @train_startSession.
  ///
  /// In es, this message translates to:
  /// **'Iniciar'**
  String get train_startSession;

  /// No description provided for @train_resumeTitle.
  ///
  /// In es, this message translates to:
  /// **'¿Continuar entrenamiento?'**
  String get train_resumeTitle;

  /// No description provided for @train_resumeBody.
  ///
  /// In es, this message translates to:
  /// **'Tenías un entrenamiento de \"{name}\" sin terminar. ¿Quieres continuar donde lo dejaste?'**
  String train_resumeBody(String name);

  /// No description provided for @train_resumeContinue.
  ///
  /// In es, this message translates to:
  /// **'Continuar'**
  String get train_resumeContinue;

  /// No description provided for @train_resumeDiscard.
  ///
  /// In es, this message translates to:
  /// **'Descartar'**
  String get train_resumeDiscard;

  /// No description provided for @train_cancelWorkout.
  ///
  /// In es, this message translates to:
  /// **'¿Descartar entrenamiento?'**
  String get train_cancelWorkout;

  /// No description provided for @train_cancelConfirm.
  ///
  /// In es, this message translates to:
  /// **'Se perderán las series registradas en esta sesión.'**
  String get train_cancelConfirm;

  /// No description provided for @train_continue.
  ///
  /// In es, this message translates to:
  /// **'Seguir entrenando'**
  String get train_continue;

  /// No description provided for @train_addExerciseFirst.
  ///
  /// In es, this message translates to:
  /// **'Añade al menos un ejercicio antes de finalizar.'**
  String get train_addExerciseFirst;

  /// No description provided for @train_completeSetFirst.
  ///
  /// In es, this message translates to:
  /// **'Completa al menos una serie antes de finalizar.'**
  String get train_completeSetFirst;

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
  /// **'{count, plural, =1{1 ejercicio} other{{count} ejercicios}}'**
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

  /// No description provided for @train_deleteExerciseConfirm.
  ///
  /// In es, this message translates to:
  /// **'¿Eliminar \"{name}\"? Se perderán las series completadas.'**
  String train_deleteExerciseConfirm(String name);

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
  /// **'PESO'**
  String get train_weightHeader;

  /// No description provided for @train_addSet.
  ///
  /// In es, this message translates to:
  /// **'Añadir serie'**
  String get train_addSet;

  /// No description provided for @train_nextSuggestion.
  ///
  /// In es, this message translates to:
  /// **'Próxima carga sugerida'**
  String get train_nextSuggestion;

  /// No description provided for @train_applySuggestion.
  ///
  /// In es, this message translates to:
  /// **'Aplicar'**
  String get train_applySuggestion;

  /// No description provided for @train_abbreviationExercises.
  ///
  /// In es, this message translates to:
  /// **'ej.'**
  String get train_abbreviationExercises;

  /// No description provided for @train_defaultRoutineName.
  ///
  /// In es, this message translates to:
  /// **'Mi rutina'**
  String get train_defaultRoutineName;

  /// No description provided for @train_createRoutine.
  ///
  /// In es, this message translates to:
  /// **'Crear rutina'**
  String get train_createRoutine;

  /// No description provided for @train_editRoutine.
  ///
  /// In es, this message translates to:
  /// **'Editar rutina'**
  String get train_editRoutine;

  /// No description provided for @train_routineUpdated.
  ///
  /// In es, this message translates to:
  /// **'Rutina \"{name}\" actualizada'**
  String train_routineUpdated(String name);

  /// No description provided for @train_addFirstExercise.
  ///
  /// In es, this message translates to:
  /// **'Añadir primer ejercicio'**
  String get train_addFirstExercise;

  /// No description provided for @train_addFirstExerciseHint.
  ///
  /// In es, this message translates to:
  /// **'Toca aquí o «Añadir ejercicio» para agregar el primero.'**
  String get train_addFirstExerciseHint;

  /// No description provided for @train_removeSet.
  ///
  /// In es, this message translates to:
  /// **'Eliminar serie'**
  String get train_removeSet;

  /// No description provided for @train_routinesHint.
  ///
  /// In es, this message translates to:
  /// **'Cada día puede tener una o varias rutinas. Al empezar el día se hacen todas, en orden.'**
  String get train_routinesHint;

  /// No description provided for @train_firstRoutineTitle.
  ///
  /// In es, this message translates to:
  /// **'Crea tu primera rutina'**
  String get train_firstRoutineTitle;

  /// No description provided for @train_firstRoutineBody.
  ///
  /// In es, this message translates to:
  /// **'Elige los ejercicios y asígnale un día de la semana: ese día aparecerá en Inicio, lista para empezar.'**
  String get train_firstRoutineBody;

  /// No description provided for @train_freeSessionHint.
  ///
  /// In es, this message translates to:
  /// **'¿Sin plan? Empieza una sesión libre y agrega ejercicios sobre la marcha.'**
  String get train_freeSessionHint;

  /// No description provided for @profile_keepScreenOn.
  ///
  /// In es, this message translates to:
  /// **'Pantalla encendida al entrenar'**
  String get profile_keepScreenOn;

  /// No description provided for @profile_keepScreenOnSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Evita que el teléfono se bloquee entre series'**
  String get profile_keepScreenOnSubtitle;

  /// No description provided for @profile_weightUnit.
  ///
  /// In es, this message translates to:
  /// **'Unidad de peso'**
  String get profile_weightUnit;

  /// No description provided for @weightUnit_kg.
  ///
  /// In es, this message translates to:
  /// **'Kilogramos (kg)'**
  String get weightUnit_kg;

  /// No description provided for @weightUnit_lb.
  ///
  /// In es, this message translates to:
  /// **'Libras (lb)'**
  String get weightUnit_lb;

  /// No description provided for @train_repShort.
  ///
  /// In es, this message translates to:
  /// **'rep'**
  String get train_repShort;

  /// No description provided for @rest_label.
  ///
  /// In es, this message translates to:
  /// **'Descanso'**
  String get rest_label;

  /// No description provided for @rest_forExercise.
  ///
  /// In es, this message translates to:
  /// **'Descanso para este ejercicio'**
  String get rest_forExercise;

  /// No description provided for @rest_default.
  ///
  /// In es, this message translates to:
  /// **'Predeterminado'**
  String get rest_default;

  /// No description provided for @rest_defaultHint.
  ///
  /// In es, this message translates to:
  /// **'Usa el tiempo elegido en el temporizador de descanso'**
  String get rest_defaultHint;

  /// No description provided for @train_newRecords.
  ///
  /// In es, this message translates to:
  /// **'Nuevos récords'**
  String get train_newRecords;

  /// No description provided for @train_recordLine.
  ///
  /// In es, this message translates to:
  /// **'{weight} (antes {previous})'**
  String train_recordLine(String weight, String previous);

  /// No description provided for @train_volumeUp.
  ///
  /// In es, this message translates to:
  /// **'+{kg} de volumen respecto a la última vez'**
  String train_volumeUp(String kg);

  /// No description provided for @train_volumeDown.
  ///
  /// In es, this message translates to:
  /// **'{kg} menos de volumen que la última vez'**
  String train_volumeDown(String kg);

  /// No description provided for @train_volumeSame.
  ///
  /// In es, this message translates to:
  /// **'Mismo volumen que la última vez'**
  String get train_volumeSame;

  /// No description provided for @train_discardWorkout.
  ///
  /// In es, this message translates to:
  /// **'Descartar'**
  String get train_discardWorkout;

  /// No description provided for @train_previousHeader.
  ///
  /// In es, this message translates to:
  /// **'ANTERIOR'**
  String get train_previousHeader;

  /// No description provided for @train_usePrevious.
  ///
  /// In es, this message translates to:
  /// **'Copiar valores anteriores'**
  String get train_usePrevious;

  /// No description provided for @train_removeCompletedSetTitle.
  ///
  /// In es, this message translates to:
  /// **'¿Eliminar la serie completada?'**
  String get train_removeCompletedSetTitle;

  /// No description provided for @train_removeCompletedSetBody.
  ///
  /// In es, this message translates to:
  /// **'La serie {setNumber} ya está completada y dejará de contar en tu entrenamiento.'**
  String train_removeCompletedSetBody(int setNumber);

  /// No description provided for @train_createRoutineHint.
  ///
  /// In es, this message translates to:
  /// **'Elige los ejercicios y déjala preparada para entrenarla cuando quieras.'**
  String get train_createRoutineHint;

  /// No description provided for @train_routineNameRequired.
  ///
  /// In es, this message translates to:
  /// **'Escribe un nombre para la rutina.'**
  String get train_routineNameRequired;

  /// No description provided for @train_addRoutineForDay.
  ///
  /// In es, this message translates to:
  /// **'Añadir otra rutina para el {day}'**
  String train_addRoutineForDay(String day);

  /// No description provided for @train_trainingDay.
  ///
  /// In es, this message translates to:
  /// **'Día de entrenamiento'**
  String get train_trainingDay;

  /// No description provided for @train_noAssignedDay.
  ///
  /// In es, this message translates to:
  /// **'Sin día asignado'**
  String get train_noAssignedDay;

  /// No description provided for @train_trainingDayHint.
  ///
  /// In es, this message translates to:
  /// **'Agrúpala por día para encontrar toda la rutina junta.'**
  String get train_trainingDayHint;

  /// No description provided for @train_organizeRoutine.
  ///
  /// In es, this message translates to:
  /// **'Organizar rutina'**
  String get train_organizeRoutine;

  /// No description provided for @train_blockCount.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =1{1 bloque} other{{count} bloques}}'**
  String train_blockCount(int count);

  /// No description provided for @train_noRoutinesForDay.
  ///
  /// In es, this message translates to:
  /// **'Todavía no hay bloques para este día.'**
  String get train_noRoutinesForDay;

  /// No description provided for @train_reorderBlocksHint.
  ///
  /// In es, this message translates to:
  /// **'Mantén presionado y arrastra para cambiar el orden.'**
  String get train_reorderBlocksHint;

  /// No description provided for @train_startCompleteRoutine.
  ///
  /// In es, this message translates to:
  /// **'Empezar rutina completa'**
  String get train_startCompleteRoutine;

  /// No description provided for @train_routineForDay.
  ///
  /// In es, this message translates to:
  /// **'Rutina del {day}'**
  String train_routineForDay(String day);

  /// No description provided for @train_bodyweightLabel.
  ///
  /// In es, this message translates to:
  /// **'Peso corporal'**
  String get train_bodyweightLabel;

  /// No description provided for @train_chooseWeight.
  ///
  /// In es, this message translates to:
  /// **'Elegir peso'**
  String get train_chooseWeight;

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

  /// No description provided for @exercises_countLabel.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =1{{count} ejercicio} other{{count} ejercicios}}'**
  String exercises_countLabel(num count);

  /// No description provided for @exercises_descriptionUnavailable.
  ///
  /// In es, this message translates to:
  /// **'Las instrucciones detalladas aún no están disponibles en este idioma.'**
  String get exercises_descriptionUnavailable;

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
  /// **'Volumen'**
  String get history_volumeKg;

  /// No description provided for @history_routinesByDay.
  ///
  /// In es, this message translates to:
  /// **'Rutinas por día'**
  String get history_routinesByDay;

  /// No description provided for @history_sessionCount.
  ///
  /// In es, this message translates to:
  /// **'{count, plural, =1{1 sesión} other{{count} sesiones}}'**
  String history_sessionCount(int count);

  /// No description provided for @history_dayRoutineTitle.
  ///
  /// In es, this message translates to:
  /// **'Entrenamientos del {day}'**
  String history_dayRoutineTitle(String day);

  /// No description provided for @history_dayRoutineHint.
  ///
  /// In es, this message translates to:
  /// **'Los bloques del mismo día aparecen juntos y en orden.'**
  String get history_dayRoutineHint;

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
  /// **'{count, plural, =1{1 serie} other{{count} series}}'**
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
  /// **'Todas las rutinas predefinidas'**
  String get paywall_featureTemplates;

  /// No description provided for @paywall_featureMeasures.
  ///
  /// In es, this message translates to:
  /// **'Cintura, pecho, cadera y fotos de progreso'**
  String get paywall_featureMeasures;

  /// No description provided for @paywall_featureExerciseProgress.
  ///
  /// In es, this message translates to:
  /// **'Gráficos de progreso por ejercicio'**
  String get paywall_featureExerciseProgress;

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

  /// No description provided for @paywall_startTrial.
  ///
  /// In es, this message translates to:
  /// **'Comenzar prueba gratis'**
  String get paywall_startTrial;

  /// No description provided for @paywall_subscribe.
  ///
  /// In es, this message translates to:
  /// **'Suscribirse'**
  String get paywall_subscribe;

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

  /// No description provided for @paywall_legalTextPlay.
  ///
  /// In es, this message translates to:
  /// **'La suscripción se renueva automáticamente. Puedes cancelar\nen cualquier momento desde Google Play.'**
  String get paywall_legalTextPlay;

  /// No description provided for @paywall_legalTextTrial.
  ///
  /// In es, this message translates to:
  /// **'La prueba gratis se convierte en suscripción de pago. Cancela en cualquier momento antes de que termine. La suscripción se renueva automáticamente.'**
  String get paywall_legalTextTrial;

  /// No description provided for @paywall_termsLink.
  ///
  /// In es, this message translates to:
  /// **'Términos de uso'**
  String get paywall_termsLink;

  /// No description provided for @paywall_privacyLink.
  ///
  /// In es, this message translates to:
  /// **'Política de privacidad'**
  String get paywall_privacyLink;

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

  /// No description provided for @paywall_trialDays.
  ///
  /// In es, this message translates to:
  /// **'{count} días gratis'**
  String paywall_trialDays(int count);

  /// No description provided for @paywall_trialMonths.
  ///
  /// In es, this message translates to:
  /// **'{count} meses gratis'**
  String paywall_trialMonths(int count);

  /// No description provided for @paywall_trialThenPrice.
  ///
  /// In es, this message translates to:
  /// **'luego {price}'**
  String paywall_trialThenPrice(String price);

  /// No description provided for @paywall_offersUnavailable.
  ///
  /// In es, this message translates to:
  /// **'No se pudieron cargar las ofertas'**
  String get paywall_offersUnavailable;

  /// No description provided for @paywall_retry.
  ///
  /// In es, this message translates to:
  /// **'Reintentar'**
  String get paywall_retry;

  /// No description provided for @rest_of.
  ///
  /// In es, this message translates to:
  /// **'de {time}'**
  String rest_of(String time);

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

  /// No description provided for @progressScreen_noEntries.
  ///
  /// In es, this message translates to:
  /// **'Sin registros aún'**
  String get progressScreen_noEntries;

  /// No description provided for @progressScreen_noPhotos.
  ///
  /// In es, this message translates to:
  /// **'Sin fotos aún'**
  String get progressScreen_noPhotos;

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

  /// No description provided for @achievement_streak14_title.
  ///
  /// In es, this message translates to:
  /// **'Racha de 14 días'**
  String get achievement_streak14_title;

  /// No description provided for @achievement_streak14_description.
  ///
  /// In es, this message translates to:
  /// **'Entrena al menos 1 vez durante 14 días consecutivos'**
  String get achievement_streak14_description;

  /// No description provided for @achievement_streak100_title.
  ///
  /// In es, this message translates to:
  /// **'Racha de 100 días'**
  String get achievement_streak100_title;

  /// No description provided for @achievement_streak100_description.
  ///
  /// In es, this message translates to:
  /// **'Mantén la racha 100 días con al menos 1 entrenamiento por semana'**
  String get achievement_streak100_description;

  /// No description provided for @achievement_streak365_title.
  ///
  /// In es, this message translates to:
  /// **'Un año entrenando'**
  String get achievement_streak365_title;

  /// No description provided for @achievement_streak365_description.
  ///
  /// In es, this message translates to:
  /// **'Mantén la racha durante 1 año completo'**
  String get achievement_streak365_description;

  /// No description provided for @achievement_bench50_title.
  ///
  /// In es, this message translates to:
  /// **'Press 50 kg'**
  String get achievement_bench50_title;

  /// No description provided for @achievement_bench50_description.
  ///
  /// In es, this message translates to:
  /// **'Completa un press de banca con 50 kg o más'**
  String get achievement_bench50_description;

  /// No description provided for @achievement_bench100_title.
  ///
  /// In es, this message translates to:
  /// **'Press 100 kg'**
  String get achievement_bench100_title;

  /// No description provided for @achievement_bench100_description.
  ///
  /// In es, this message translates to:
  /// **'Completa un press de banca con 100 kg o más'**
  String get achievement_bench100_description;

  /// No description provided for @achievement_squat100_title.
  ///
  /// In es, this message translates to:
  /// **'Sentadilla 100 kg'**
  String get achievement_squat100_title;

  /// No description provided for @achievement_squat100_description.
  ///
  /// In es, this message translates to:
  /// **'Completa una sentadilla con 100 kg o más'**
  String get achievement_squat100_description;

  /// No description provided for @achievement_squat150_title.
  ///
  /// In es, this message translates to:
  /// **'Sentadilla 150 kg'**
  String get achievement_squat150_title;

  /// No description provided for @achievement_squat150_description.
  ///
  /// In es, this message translates to:
  /// **'Completa una sentadilla con 150 kg o más'**
  String get achievement_squat150_description;

  /// No description provided for @achievement_deadlift100_title.
  ///
  /// In es, this message translates to:
  /// **'Peso muerto 100 kg'**
  String get achievement_deadlift100_title;

  /// No description provided for @achievement_deadlift100_description.
  ///
  /// In es, this message translates to:
  /// **'Completa un peso muerto con 100 kg o más'**
  String get achievement_deadlift100_description;

  /// No description provided for @achievement_deadlift150_title.
  ///
  /// In es, this message translates to:
  /// **'Peso muerto 150 kg'**
  String get achievement_deadlift150_title;

  /// No description provided for @achievement_deadlift150_description.
  ///
  /// In es, this message translates to:
  /// **'Completa un peso muerto con 150 kg o más'**
  String get achievement_deadlift150_description;

  /// No description provided for @achievement_deadlift200_title.
  ///
  /// In es, this message translates to:
  /// **'Peso muerto 200 kg'**
  String get achievement_deadlift200_title;

  /// No description provided for @achievement_deadlift200_description.
  ///
  /// In es, this message translates to:
  /// **'Completa un peso muerto con 200 kg o más'**
  String get achievement_deadlift200_description;

  /// No description provided for @achievement_explorer10_title.
  ///
  /// In es, this message translates to:
  /// **'Explorador'**
  String get achievement_explorer10_title;

  /// No description provided for @achievement_explorer10_description.
  ///
  /// In es, this message translates to:
  /// **'Usa 10 ejercicios diferentes en tus entrenamientos'**
  String get achievement_explorer10_description;

  /// No description provided for @achievement_master25_title.
  ///
  /// In es, this message translates to:
  /// **'Maestro'**
  String get achievement_master25_title;

  /// No description provided for @achievement_master25_description.
  ///
  /// In es, this message translates to:
  /// **'Usa 25 ejercicios diferentes en tus entrenamientos'**
  String get achievement_master25_description;

  /// No description provided for @achievement_fullBodyGroups_title.
  ///
  /// In es, this message translates to:
  /// **'Cuerpo completo'**
  String get achievement_fullBodyGroups_title;

  /// No description provided for @achievement_fullBodyGroups_description.
  ///
  /// In es, this message translates to:
  /// **'Entrena al menos una vez todos los grupos musculares'**
  String get achievement_fullBodyGroups_description;

  /// No description provided for @achievement_crossfitFan_title.
  ///
  /// In es, this message translates to:
  /// **'CrossFit Fan'**
  String get achievement_crossfitFan_title;

  /// No description provided for @achievement_crossfitFan_description.
  ///
  /// In es, this message translates to:
  /// **'Completa 10 ejercicios diferentes de la categoría CrossFit'**
  String get achievement_crossfitFan_description;

  /// No description provided for @achievement_time1h_title.
  ///
  /// In es, this message translates to:
  /// **'1 hora total'**
  String get achievement_time1h_title;

  /// No description provided for @achievement_time1h_description.
  ///
  /// In es, this message translates to:
  /// **'Acumula 1 hora total de entrenamiento'**
  String get achievement_time1h_description;

  /// No description provided for @achievement_time10h_title.
  ///
  /// In es, this message translates to:
  /// **'10 horas'**
  String get achievement_time10h_title;

  /// No description provided for @achievement_time10h_description.
  ///
  /// In es, this message translates to:
  /// **'Acumula 10 horas totales de entrenamiento'**
  String get achievement_time10h_description;

  /// No description provided for @achievement_time50h_title.
  ///
  /// In es, this message translates to:
  /// **'50 horas'**
  String get achievement_time50h_title;

  /// No description provided for @achievement_time50h_description.
  ///
  /// In es, this message translates to:
  /// **'Acumula 50 horas totales de entrenamiento'**
  String get achievement_time50h_description;

  /// No description provided for @achievement_time100h_title.
  ///
  /// In es, this message translates to:
  /// **'100 horas'**
  String get achievement_time100h_title;

  /// No description provided for @achievement_time100h_description.
  ///
  /// In es, this message translates to:
  /// **'Acumula 100 horas totales de entrenamiento'**
  String get achievement_time100h_description;

  /// No description provided for @achievement_earlyBird_title.
  ///
  /// In es, this message translates to:
  /// **'Madrugador'**
  String get achievement_earlyBird_title;

  /// No description provided for @achievement_earlyBird_description.
  ///
  /// In es, this message translates to:
  /// **'Empieza un entrenamiento antes de las 7:00 AM'**
  String get achievement_earlyBird_description;

  /// No description provided for @achievement_nightOwl_title.
  ///
  /// In es, this message translates to:
  /// **'Búho nocturno'**
  String get achievement_nightOwl_title;

  /// No description provided for @achievement_nightOwl_description.
  ///
  /// In es, this message translates to:
  /// **'Termina un entrenamiento después de las 22:00'**
  String get achievement_nightOwl_description;

  /// No description provided for @achievement_comeback_title.
  ///
  /// In es, this message translates to:
  /// **'Comeback'**
  String get achievement_comeback_title;

  /// No description provided for @achievement_comeback_description.
  ///
  /// In es, this message translates to:
  /// **'Vuelves a entrenar tras 30+ días sin actividad'**
  String get achievement_comeback_description;

  /// No description provided for @achievement_marathoner_title.
  ///
  /// In es, this message translates to:
  /// **'Maratoniano'**
  String get achievement_marathoner_title;

  /// No description provided for @achievement_marathoner_description.
  ///
  /// In es, this message translates to:
  /// **'Completa un entrenamiento de más de 90 minutos'**
  String get achievement_marathoner_description;

  /// No description provided for @achievement_efficient_title.
  ///
  /// In es, this message translates to:
  /// **'Eficiente'**
  String get achievement_efficient_title;

  /// No description provided for @achievement_efficient_description.
  ///
  /// In es, this message translates to:
  /// **'Completa un entrenamiento de 3+ ejercicios en menos de 30 minutos'**
  String get achievement_efficient_description;

  /// No description provided for @achievement_weekendWarrior_title.
  ///
  /// In es, this message translates to:
  /// **'Guerrero de fin de semana'**
  String get achievement_weekendWarrior_title;

  /// No description provided for @achievement_weekendWarrior_description.
  ///
  /// In es, this message translates to:
  /// **'Entrena sábado y domingo durante 3 fines de semana seguidos'**
  String get achievement_weekendWarrior_description;

  /// No description provided for @achievement_weeklyVariety_title.
  ///
  /// In es, this message translates to:
  /// **'Variedad semanal'**
  String get achievement_weeklyVariety_title;

  /// No description provided for @achievement_weeklyVariety_description.
  ///
  /// In es, this message translates to:
  /// **'Entrena 5 grupos musculares diferentes en una semana'**
  String get achievement_weeklyVariety_description;

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

  /// No description provided for @template_fullBody_name.
  ///
  /// In es, this message translates to:
  /// **'Full Body'**
  String get template_fullBody_name;

  /// No description provided for @template_push_name.
  ///
  /// In es, this message translates to:
  /// **'Empuje'**
  String get template_push_name;

  /// No description provided for @template_pull_name.
  ///
  /// In es, this message translates to:
  /// **'Tracción'**
  String get template_pull_name;

  /// No description provided for @template_torso_name.
  ///
  /// In es, this message translates to:
  /// **'Torso'**
  String get template_torso_name;

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

  /// No description provided for @ex_pecho_6_name.
  ///
  /// In es, this message translates to:
  /// **'Press inclinado con barra'**
  String get ex_pecho_6_name;

  /// No description provided for @ex_pecho_6_desc.
  ///
  /// In es, this message translates to:
  /// **'Ajusta el banco a 30-45°. Agarra la barra con un agarre algo más ancho que los hombros. Baja la barra controladamente hasta la parte alta del pecho y empuja hacia arriba hasta extensión completa. Mantén la zona lumbar pegada al banco y los omóplatos retraídos.'**
  String get ex_pecho_6_desc;

  /// No description provided for @ex_pecho_6_b1.
  ///
  /// In es, this message translates to:
  /// **'Enfatiza el pectoral superior (porción clavicular)'**
  String get ex_pecho_6_b1;

  /// No description provided for @ex_pecho_6_b2.
  ///
  /// In es, this message translates to:
  /// **'Permite cargar más peso que con mancuernas'**
  String get ex_pecho_6_b2;

  /// No description provided for @ex_pecho_6_b3.
  ///
  /// In es, this message translates to:
  /// **'Mejora la fuerza de empuje desde ángulos elevados'**
  String get ex_pecho_6_b3;

  /// No description provided for @ex_pecho_7_name.
  ///
  /// In es, this message translates to:
  /// **'Press declinado con mancuernas'**
  String get ex_pecho_7_name;

  /// No description provided for @ex_pecho_7_desc.
  ///
  /// In es, this message translates to:
  /// **'Ajusta el banco a una declinación de 15-30°. Con una mancuerna en cada mano a la altura del pecho, empuja hacia arriba juntando las mancuernas en la parte superior. Baja con control sintiendo el estiramiento de la porción inferior del pecho.'**
  String get ex_pecho_7_desc;

  /// No description provided for @ex_pecho_7_b1.
  ///
  /// In es, this message translates to:
  /// **'Trabaja la porción inferior del pectoral'**
  String get ex_pecho_7_b1;

  /// No description provided for @ex_pecho_7_b2.
  ///
  /// In es, this message translates to:
  /// **'Reduce la implicación de los hombros'**
  String get ex_pecho_7_b2;

  /// No description provided for @ex_pecho_7_b3.
  ///
  /// In es, this message translates to:
  /// **'Mayor rango que el press declinado con barra'**
  String get ex_pecho_7_b3;

  /// No description provided for @ex_pecho_8_name.
  ///
  /// In es, this message translates to:
  /// **'Flexiones'**
  String get ex_pecho_8_name;

  /// No description provided for @ex_pecho_8_desc.
  ///
  /// In es, this message translates to:
  /// **'Apoya las manos en el suelo a la anchura de los hombros y los pies juntos. Mantén el cuerpo recto desde la cabeza hasta los talones. Baja flexionando los codos hasta casi rozar el pecho con el suelo y empuja de vuelta. Mantén el core apretado durante todo el movimiento.'**
  String get ex_pecho_8_desc;

  /// No description provided for @ex_pecho_8_b1.
  ///
  /// In es, this message translates to:
  /// **'No requiere equipamiento'**
  String get ex_pecho_8_b1;

  /// No description provided for @ex_pecho_8_b2.
  ///
  /// In es, this message translates to:
  /// **'Múltiples variantes para progresar (diamante, declinadas, palmada)'**
  String get ex_pecho_8_b2;

  /// No description provided for @ex_pecho_8_b3.
  ///
  /// In es, this message translates to:
  /// **'Ejercicio compuesto que también fortalece el core'**
  String get ex_pecho_8_b3;

  /// No description provided for @ex_pecho_9_name.
  ///
  /// In es, this message translates to:
  /// **'Pullover con mancuerna'**
  String get ex_pecho_9_name;

  /// No description provided for @ex_pecho_9_desc.
  ///
  /// In es, this message translates to:
  /// **'Túmbate en banco plano sosteniendo una mancuerna con ambas manos sobre el pecho, brazos extendidos. Baja la mancuerna en arco por encima de la cabeza hasta sentir el estiramiento del pecho y los dorsales. Vuelve a la posición inicial contrayendo el pecho.'**
  String get ex_pecho_9_desc;

  /// No description provided for @ex_pecho_9_b1.
  ///
  /// In es, this message translates to:
  /// **'Trabaja simultáneamente pecho y dorsales'**
  String get ex_pecho_9_b1;

  /// No description provided for @ex_pecho_9_b2.
  ///
  /// In es, this message translates to:
  /// **'Mejora la movilidad de hombros y caja torácica'**
  String get ex_pecho_9_b2;

  /// No description provided for @ex_pecho_9_b3.
  ///
  /// In es, this message translates to:
  /// **'Excelente complemento entre series de press y remos'**
  String get ex_pecho_9_b3;

  /// No description provided for @ex_esp_6_name.
  ///
  /// In es, this message translates to:
  /// **'Remo en T'**
  String get ex_esp_6_name;

  /// No description provided for @ex_esp_6_desc.
  ///
  /// In es, this message translates to:
  /// **'Posiciónate sobre la barra en T con los pies a la anchura de los hombros. Inclínate hacia adelante manteniendo la espalda neutra y tira de las asas hacia el pecho llevando los codos atrás. Aprieta los omóplatos en la posición final y baja con control.'**
  String get ex_esp_6_desc;

  /// No description provided for @ex_esp_6_b1.
  ///
  /// In es, this message translates to:
  /// **'Desarrolla el grosor de la espalda media'**
  String get ex_esp_6_b1;

  /// No description provided for @ex_esp_6_b2.
  ///
  /// In es, this message translates to:
  /// **'Permite cargas muy altas con menor estrés lumbar que el remo libre'**
  String get ex_esp_6_b2;

  /// No description provided for @ex_esp_6_b3.
  ///
  /// In es, this message translates to:
  /// **'Trabaja la postura y la estabilidad escapular'**
  String get ex_esp_6_b3;

  /// No description provided for @ex_esp_7_name.
  ///
  /// In es, this message translates to:
  /// **'Remo bajo en polea'**
  String get ex_esp_7_name;

  /// No description provided for @ex_esp_7_desc.
  ///
  /// In es, this message translates to:
  /// **'Siéntate frente a la polea baja con los pies apoyados. Agarra el accesorio con los brazos extendidos y la espalda neutra. Tira de las manos hacia el abdomen retrayendo los omóplatos y manteniendo el torso erguido. Regresa controladamente sin redondear la espalda.'**
  String get ex_esp_7_desc;

  /// No description provided for @ex_esp_7_b1.
  ///
  /// In es, this message translates to:
  /// **'Tensión constante a lo largo del movimiento'**
  String get ex_esp_7_b1;

  /// No description provided for @ex_esp_7_b2.
  ///
  /// In es, this message translates to:
  /// **'Fácil progresión de peso y técnica accesible'**
  String get ex_esp_7_b2;

  /// No description provided for @ex_esp_7_b3.
  ///
  /// In es, this message translates to:
  /// **'Excelente para desarrollar grosor de espalda media'**
  String get ex_esp_7_b3;

  /// No description provided for @ex_esp_8_name.
  ///
  /// In es, this message translates to:
  /// **'Encogimientos con mancuernas'**
  String get ex_esp_8_name;

  /// No description provided for @ex_esp_8_desc.
  ///
  /// In es, this message translates to:
  /// **'De pie con una mancuerna en cada mano a los costados, brazos relajados. Eleva los hombros hacia las orejas sin doblar los codos. Mantén la contracción 1 segundo en la cima y baja lentamente. No rotes los hombros, el movimiento es puramente vertical.'**
  String get ex_esp_8_desc;

  /// No description provided for @ex_esp_8_b1.
  ///
  /// In es, this message translates to:
  /// **'Aislamiento directo del trapecio superior'**
  String get ex_esp_8_b1;

  /// No description provided for @ex_esp_8_b2.
  ///
  /// In es, this message translates to:
  /// **'Mejora la postura y la apariencia del cuello'**
  String get ex_esp_8_b2;

  /// No description provided for @ex_esp_8_b3.
  ///
  /// In es, this message translates to:
  /// **'Fortalece la estabilidad escapular para otros levantamientos'**
  String get ex_esp_8_b3;

  /// No description provided for @ex_esp_9_name.
  ///
  /// In es, this message translates to:
  /// **'Good morning'**
  String get ex_esp_9_name;

  /// No description provided for @ex_esp_9_desc.
  ///
  /// In es, this message translates to:
  /// **'Coloca la barra sobre los trapecios como en una sentadilla. Con los pies a la anchura de las caderas y rodillas ligeramente flexionadas, inclínate hacia adelante desde las caderas manteniendo la espalda neutra. Baja hasta que el torso esté casi paralelo al suelo y vuelve apretando glúteos.'**
  String get ex_esp_9_desc;

  /// No description provided for @ex_esp_9_b1.
  ///
  /// In es, this message translates to:
  /// **'Fortalece la cadena posterior y la zona lumbar'**
  String get ex_esp_9_b1;

  /// No description provided for @ex_esp_9_b2.
  ///
  /// In es, this message translates to:
  /// **'Mejora la bisagra de cadera para peso muerto y sentadilla'**
  String get ex_esp_9_b2;

  /// No description provided for @ex_esp_9_b3.
  ///
  /// In es, this message translates to:
  /// **'Trabajo accesorio clave para powerlifting'**
  String get ex_esp_9_b3;

  /// No description provided for @ex_pier_6_name.
  ///
  /// In es, this message translates to:
  /// **'Sentadilla frontal'**
  String get ex_pier_6_name;

  /// No description provided for @ex_pier_6_desc.
  ///
  /// In es, this message translates to:
  /// **'Coloca la barra sobre los deltoides frontales, codos altos y agarre cruzado o limpio. Pies a la anchura de los hombros. Baja manteniendo el torso vertical y los codos al frente hasta que los muslos pasen la paralela. Empuja con los talones para volver a la posición inicial.'**
  String get ex_pier_6_desc;

  /// No description provided for @ex_pier_6_b1.
  ///
  /// In es, this message translates to:
  /// **'Enfatiza más los cuádriceps que la sentadilla trasera'**
  String get ex_pier_6_b1;

  /// No description provided for @ex_pier_6_b2.
  ///
  /// In es, this message translates to:
  /// **'Exige un core muy fuerte y postura erguida'**
  String get ex_pier_6_b2;

  /// No description provided for @ex_pier_6_b3.
  ///
  /// In es, this message translates to:
  /// **'Base técnica para clean y thruster en CrossFit'**
  String get ex_pier_6_b3;

  /// No description provided for @ex_pier_7_name.
  ///
  /// In es, this message translates to:
  /// **'Sentadilla búlgara'**
  String get ex_pier_7_name;

  /// No description provided for @ex_pier_7_desc.
  ///
  /// In es, this message translates to:
  /// **'Coloca el empeine del pie de atrás sobre un banco, sosteniendo una mancuerna en cada mano. Con el pie delantero adelantado, baja flexionando la rodilla delantera hasta que el muslo esté paralelo al suelo. Empuja a través del talón delantero para volver arriba.'**
  String get ex_pier_7_desc;

  /// No description provided for @ex_pier_7_b1.
  ///
  /// In es, this message translates to:
  /// **'Trabajo unilateral que corrige desequilibrios entre piernas'**
  String get ex_pier_7_b1;

  /// No description provided for @ex_pier_7_b2.
  ///
  /// In es, this message translates to:
  /// **'Activación intensa de glúteos y cuádriceps'**
  String get ex_pier_7_b2;

  /// No description provided for @ex_pier_7_b3.
  ///
  /// In es, this message translates to:
  /// **'Mejora el equilibrio y la estabilidad de cadera'**
  String get ex_pier_7_b3;

  /// No description provided for @ex_pier_8_name.
  ///
  /// In es, this message translates to:
  /// **'Peso muerto rumano'**
  String get ex_pier_8_name;

  /// No description provided for @ex_pier_8_desc.
  ///
  /// In es, this message translates to:
  /// **'De pie con la barra a la altura de las caderas, agarre prono a la anchura de los hombros. Con las rodillas ligeramente flexionadas y fijas, desliza la barra por las piernas inclinando el torso desde las caderas hasta sentir tensión en isquios. Vuelve apretando glúteos.'**
  String get ex_pier_8_desc;

  /// No description provided for @ex_pier_8_b1.
  ///
  /// In es, this message translates to:
  /// **'Aislamiento intenso de isquiotibiales y glúteos'**
  String get ex_pier_8_b1;

  /// No description provided for @ex_pier_8_b2.
  ///
  /// In es, this message translates to:
  /// **'Fortalece la cadena posterior y mejora la bisagra de cadera'**
  String get ex_pier_8_b2;

  /// No description provided for @ex_pier_8_b3.
  ///
  /// In es, this message translates to:
  /// **'Reduce el riesgo de lesiones de isquios al correr o saltar'**
  String get ex_pier_8_b3;

  /// No description provided for @ex_pier_9_name.
  ///
  /// In es, this message translates to:
  /// **'Extensión de cuádriceps'**
  String get ex_pier_9_name;

  /// No description provided for @ex_pier_9_desc.
  ///
  /// In es, this message translates to:
  /// **'Siéntate en la máquina con la espalda apoyada y el rodillo sobre el empeine. Extiende las rodillas levantando el peso hasta que las piernas estén casi rectas, sin bloquear las rodillas. Aprieta los cuádriceps en la cima y baja con control.'**
  String get ex_pier_9_desc;

  /// No description provided for @ex_pier_9_b1.
  ///
  /// In es, this message translates to:
  /// **'Aislamiento directo del cuádriceps'**
  String get ex_pier_9_b1;

  /// No description provided for @ex_pier_9_b2.
  ///
  /// In es, this message translates to:
  /// **'Útil para rehabilitación y trabajo de hipertrofia focalizado'**
  String get ex_pier_9_b2;

  /// No description provided for @ex_pier_9_b3.
  ///
  /// In es, this message translates to:
  /// **'Ajuste de carga preciso y de bajo riesgo'**
  String get ex_pier_9_b3;

  /// No description provided for @ex_pier_10_name.
  ///
  /// In es, this message translates to:
  /// **'Elevación de talones'**
  String get ex_pier_10_name;

  /// No description provided for @ex_pier_10_desc.
  ///
  /// In es, this message translates to:
  /// **'Coloca los hombros bajo las almohadillas de la máquina de gemelos (o usa una mancuerna de pie). Apoya las puntas de los pies en una plataforma con los talones colgando. Sube empujando las puntas y aprieta los gemelos en la cima. Baja lentamente sintiendo el estiramiento.'**
  String get ex_pier_10_desc;

  /// No description provided for @ex_pier_10_b1.
  ///
  /// In es, this message translates to:
  /// **'Aislamiento del sóleo y gemelos'**
  String get ex_pier_10_b1;

  /// No description provided for @ex_pier_10_b2.
  ///
  /// In es, this message translates to:
  /// **'Mejora la potencia en saltos y sprints'**
  String get ex_pier_10_b2;

  /// No description provided for @ex_pier_10_b3.
  ///
  /// In es, this message translates to:
  /// **'Reduce el riesgo de lesiones en tobillo y tendón de Aquiles'**
  String get ex_pier_10_b3;

  /// No description provided for @ex_hom_5_name.
  ///
  /// In es, this message translates to:
  /// **'Press de hombros con mancuernas'**
  String get ex_hom_5_name;

  /// No description provided for @ex_hom_5_desc.
  ///
  /// In es, this message translates to:
  /// **'Sentado con respaldo recto, sostén una mancuerna a cada lado de los hombros, palmas hacia adelante. Empuja las mancuernas hacia arriba hasta casi juntarlas por encima de la cabeza, sin bloquear los codos. Baja con control hasta la posición inicial.'**
  String get ex_hom_5_desc;

  /// No description provided for @ex_hom_5_b1.
  ///
  /// In es, this message translates to:
  /// **'Mayor rango de movimiento que el press con barra'**
  String get ex_hom_5_b1;

  /// No description provided for @ex_hom_5_b2.
  ///
  /// In es, this message translates to:
  /// **'Permite trabajar cada lado de forma independiente'**
  String get ex_hom_5_b2;

  /// No description provided for @ex_hom_5_b3.
  ///
  /// In es, this message translates to:
  /// **'Reduce el estrés en hombros respecto a la barra'**
  String get ex_hom_5_b3;

  /// No description provided for @ex_hom_6_name.
  ///
  /// In es, this message translates to:
  /// **'Elevaciones frontales'**
  String get ex_hom_6_name;

  /// No description provided for @ex_hom_6_desc.
  ///
  /// In es, this message translates to:
  /// **'De pie con una mancuerna en cada mano frente a los muslos, palmas hacia el cuerpo. Eleva los brazos alternados o simultáneamente al frente hasta la altura de los hombros, manteniendo los codos casi extendidos. Baja lentamente sin balancearse.'**
  String get ex_hom_6_desc;

  /// No description provided for @ex_hom_6_b1.
  ///
  /// In es, this message translates to:
  /// **'Aislamiento del deltoides anterior'**
  String get ex_hom_6_b1;

  /// No description provided for @ex_hom_6_b2.
  ///
  /// In es, this message translates to:
  /// **'Mejora la apariencia frontal del hombro'**
  String get ex_hom_6_b2;

  /// No description provided for @ex_hom_6_b3.
  ///
  /// In es, this message translates to:
  /// **'Trabajo accesorio de press de banca y press militar'**
  String get ex_hom_6_b3;

  /// No description provided for @ex_hom_7_name.
  ///
  /// In es, this message translates to:
  /// **'Pájaros con mancuernas'**
  String get ex_hom_7_name;

  /// No description provided for @ex_hom_7_desc.
  ///
  /// In es, this message translates to:
  /// **'Inclínate hacia adelante desde la cadera con el torso casi paralelo al suelo, mancuerna en cada mano y brazos colgando. Eleva los brazos lateralmente hasta la altura de los hombros, codos ligeramente flexionados. Aprieta el deltoides posterior arriba y baja con control.'**
  String get ex_hom_7_desc;

  /// No description provided for @ex_hom_7_b1.
  ///
  /// In es, this message translates to:
  /// **'Aislamiento del deltoides posterior, área clave para postura'**
  String get ex_hom_7_b1;

  /// No description provided for @ex_hom_7_b2.
  ///
  /// In es, this message translates to:
  /// **'Contrarresta los efectos del trabajo de empuje'**
  String get ex_hom_7_b2;

  /// No description provided for @ex_hom_7_b3.
  ///
  /// In es, this message translates to:
  /// **'Reduce el riesgo de lesiones del manguito rotador'**
  String get ex_hom_7_b3;

  /// No description provided for @ex_bra_6_name.
  ///
  /// In es, this message translates to:
  /// **'Curl predicador'**
  String get ex_bra_6_name;

  /// No description provided for @ex_bra_6_desc.
  ///
  /// In es, this message translates to:
  /// **'Siéntate en el banco predicador con los brazos apoyados sobre la almohadilla. Agarra la barra (recta o Z) con agarre supino. Flexiona los codos llevando la barra hacia los hombros, controlando el movimiento. Baja lentamente sin bloquear los codos al final.'**
  String get ex_bra_6_desc;

  /// No description provided for @ex_bra_6_b1.
  ///
  /// In es, this message translates to:
  /// **'Aísla el bíceps al inmovilizar el hombro'**
  String get ex_bra_6_b1;

  /// No description provided for @ex_bra_6_b2.
  ///
  /// In es, this message translates to:
  /// **'Imposibilita usar impulso, técnica estricta'**
  String get ex_bra_6_b2;

  /// No description provided for @ex_bra_6_b3.
  ///
  /// In es, this message translates to:
  /// **'Excelente para la contracción máxima del bíceps'**
  String get ex_bra_6_b3;

  /// No description provided for @ex_bra_7_name.
  ///
  /// In es, this message translates to:
  /// **'Curl concentrado'**
  String get ex_bra_7_name;

  /// No description provided for @ex_bra_7_desc.
  ///
  /// In es, this message translates to:
  /// **'Siéntate en un banco con las piernas abiertas. Apoya el codo del brazo de trabajo contra la cara interna del muslo, mancuerna colgando. Flexiona el codo llevando la mancuerna hacia el hombro, aislando el bíceps. Aprieta arriba y baja con control.'**
  String get ex_bra_7_desc;

  /// No description provided for @ex_bra_7_b1.
  ///
  /// In es, this message translates to:
  /// **'Aislamiento puro del bíceps con máxima contracción'**
  String get ex_bra_7_b1;

  /// No description provided for @ex_bra_7_b2.
  ///
  /// In es, this message translates to:
  /// **'Permite enfocarse en la conexión mente-músculo'**
  String get ex_bra_7_b2;

  /// No description provided for @ex_bra_7_b3.
  ///
  /// In es, this message translates to:
  /// **'Ideal como ejercicio final del entreno de brazos'**
  String get ex_bra_7_b3;

  /// No description provided for @ex_bra_8_name.
  ///
  /// In es, this message translates to:
  /// **'Press cerrado de banca'**
  String get ex_bra_8_name;

  /// No description provided for @ex_bra_8_desc.
  ///
  /// In es, this message translates to:
  /// **'Túmbate en banco plano y agarra la barra con un agarre cerrado a la anchura de los hombros. Baja la barra controladamente hasta rozar el esternón manteniendo los codos pegados al cuerpo. Empuja hacia arriba enfatizando la extensión de tríceps.'**
  String get ex_bra_8_desc;

  /// No description provided for @ex_bra_8_b1.
  ///
  /// In es, this message translates to:
  /// **'Ejercicio compuesto que enfatiza los tríceps'**
  String get ex_bra_8_b1;

  /// No description provided for @ex_bra_8_b2.
  ///
  /// In es, this message translates to:
  /// **'Permite cargar más peso que un aislamiento de tríceps'**
  String get ex_bra_8_b2;

  /// No description provided for @ex_bra_8_b3.
  ///
  /// In es, this message translates to:
  /// **'Transfiere a fuerza en press de banca y press militar'**
  String get ex_bra_8_b3;

  /// No description provided for @ex_bra_9_name.
  ///
  /// In es, this message translates to:
  /// **'Fondos en banco'**
  String get ex_bra_9_name;

  /// No description provided for @ex_bra_9_desc.
  ///
  /// In es, this message translates to:
  /// **'Apoya las manos en un banco a tu espalda con los dedos hacia adelante. Extiende las piernas frente a ti apoyando los talones (o con rodillas flexionadas para facilitar). Baja flexionando los codos hacia atrás hasta 90° y empuja para subir.'**
  String get ex_bra_9_desc;

  /// No description provided for @ex_bra_9_b1.
  ///
  /// In es, this message translates to:
  /// **'Aislamiento del tríceps sin necesidad de equipamiento'**
  String get ex_bra_9_b1;

  /// No description provided for @ex_bra_9_b2.
  ///
  /// In es, this message translates to:
  /// **'Fácil de progresar añadiendo peso en el regazo'**
  String get ex_bra_9_b2;

  /// No description provided for @ex_bra_9_b3.
  ///
  /// In es, this message translates to:
  /// **'Mejora la fuerza de empuje desde posiciones detrás del cuerpo'**
  String get ex_bra_9_b3;

  /// No description provided for @ex_core_5_name.
  ///
  /// In es, this message translates to:
  /// **'Russian twists'**
  String get ex_core_5_name;

  /// No description provided for @ex_core_5_desc.
  ///
  /// In es, this message translates to:
  /// **'Sentado en el suelo con las rodillas flexionadas y los pies elevados o apoyados, inclínate hacia atrás 45°. Junta las manos (o sostén un peso) y gira el torso de lado a lado tocando el suelo o llevando el peso a cada lateral. Mantén el core apretado.'**
  String get ex_core_5_desc;

  /// No description provided for @ex_core_5_b1.
  ///
  /// In es, this message translates to:
  /// **'Aislamiento directo de los oblicuos'**
  String get ex_core_5_b1;

  /// No description provided for @ex_core_5_b2.
  ///
  /// In es, this message translates to:
  /// **'Mejora la rotación del torso, clave en deportes'**
  String get ex_core_5_b2;

  /// No description provided for @ex_core_5_b3.
  ///
  /// In es, this message translates to:
  /// **'Se puede progresar añadiendo peso (mancuerna, disco, balón)'**
  String get ex_core_5_b3;

  /// No description provided for @ex_core_6_name.
  ///
  /// In es, this message translates to:
  /// **'Mountain climbers'**
  String get ex_core_6_name;

  /// No description provided for @ex_core_6_desc.
  ///
  /// In es, this message translates to:
  /// **'Adopta la posición de plancha alta con las manos bajo los hombros. Lleva una rodilla hacia el pecho de forma alternada y rápida, como si corrieras en el sitio. Mantén la cadera baja y el core apretado durante todo el movimiento.'**
  String get ex_core_6_desc;

  /// No description provided for @ex_core_6_b1.
  ///
  /// In es, this message translates to:
  /// **'Combina trabajo de core con cardio'**
  String get ex_core_6_b1;

  /// No description provided for @ex_core_6_b2.
  ///
  /// In es, this message translates to:
  /// **'No requiere equipamiento, ideal para HIIT'**
  String get ex_core_6_b2;

  /// No description provided for @ex_core_6_b3.
  ///
  /// In es, this message translates to:
  /// **'Mejora la coordinación y la resistencia'**
  String get ex_core_6_b3;

  /// No description provided for @ex_core_7_name.
  ///
  /// In es, this message translates to:
  /// **'Hollow hold'**
  String get ex_core_7_name;

  /// No description provided for @ex_core_7_desc.
  ///
  /// In es, this message translates to:
  /// **'Túmbate boca arriba con brazos extendidos por encima de la cabeza y piernas estiradas. Eleva ligeramente los brazos y las piernas del suelo, llevando la zona lumbar contra el suelo. Mantén la posición de \"barco\" con el core completamente contraído.'**
  String get ex_core_7_desc;

  /// No description provided for @ex_core_7_b1.
  ///
  /// In es, this message translates to:
  /// **'Base gimnástica para muchos movimientos de CrossFit'**
  String get ex_core_7_b1;

  /// No description provided for @ex_core_7_b2.
  ///
  /// In es, this message translates to:
  /// **'Fortalece el core en su totalidad de forma isométrica'**
  String get ex_core_7_b2;

  /// No description provided for @ex_core_7_b3.
  ///
  /// In es, this message translates to:
  /// **'Mejora la postura y la fuerza para dominadas estrictas'**
  String get ex_core_7_b3;

  /// No description provided for @ex_core_8_name.
  ///
  /// In es, this message translates to:
  /// **'Plancha lateral'**
  String get ex_core_8_name;

  /// No description provided for @ex_core_8_desc.
  ///
  /// In es, this message translates to:
  /// **'Túmbate de lado con el antebrazo apoyado y el codo bajo el hombro. Eleva la cadera del suelo formando una línea recta desde los pies hasta la cabeza. Mantén la posición sin que la cadera se hunda. Repite del otro lado.'**
  String get ex_core_8_desc;

  /// No description provided for @ex_core_8_b1.
  ///
  /// In es, this message translates to:
  /// **'Aislamiento intenso de oblicuos y core lateral'**
  String get ex_core_8_b1;

  /// No description provided for @ex_core_8_b2.
  ///
  /// In es, this message translates to:
  /// **'Mejora la estabilidad de cadera y columna'**
  String get ex_core_8_b2;

  /// No description provided for @ex_core_8_b3.
  ///
  /// In es, this message translates to:
  /// **'Sin equipamiento y bajo impacto'**
  String get ex_core_8_b3;

  /// No description provided for @ex_core_9_name.
  ///
  /// In es, this message translates to:
  /// **'Dead bug'**
  String get ex_core_9_name;

  /// No description provided for @ex_core_9_desc.
  ///
  /// In es, this message translates to:
  /// **'Túmbate boca arriba con brazos extendidos hacia el techo y rodillas flexionadas a 90° sobre las caderas. Baja simultáneamente el brazo derecho por detrás de la cabeza y la pierna izquierda extendida hacia el suelo. Vuelve y alterna lados manteniendo la zona lumbar pegada al suelo.'**
  String get ex_core_9_desc;

  /// No description provided for @ex_core_9_b1.
  ///
  /// In es, this message translates to:
  /// **'Mejora la estabilidad anti-extensión del core'**
  String get ex_core_9_b1;

  /// No description provided for @ex_core_9_b2.
  ///
  /// In es, this message translates to:
  /// **'Excelente para principiantes y rehabilitación lumbar'**
  String get ex_core_9_b2;

  /// No description provided for @ex_core_9_b3.
  ///
  /// In es, this message translates to:
  /// **'Trabaja la coordinación contralateral'**
  String get ex_core_9_b3;

  /// No description provided for @ex_cf_1_name.
  ///
  /// In es, this message translates to:
  /// **'Cargada (Clean)'**
  String get ex_cf_1_name;

  /// No description provided for @ex_cf_1_desc.
  ///
  /// In es, this message translates to:
  /// **'Desde el suelo, agarra la barra con agarre prono justo por fuera de las rodillas. Tira explosivamente extendiendo caderas y rodillas, encoge los hombros y desliza el cuerpo bajo la barra recibiéndola en sentadilla frontal con los codos altos. Levántate completando el lift.'**
  String get ex_cf_1_desc;

  /// No description provided for @ex_cf_1_b1.
  ///
  /// In es, this message translates to:
  /// **'Levantamiento olímpico completo de potencia explosiva'**
  String get ex_cf_1_b1;

  /// No description provided for @ex_cf_1_b2.
  ///
  /// In es, this message translates to:
  /// **'Desarrolla coordinación, velocidad y fuerza simultáneamente'**
  String get ex_cf_1_b2;

  /// No description provided for @ex_cf_1_b3.
  ///
  /// In es, this message translates to:
  /// **'Base de muchos WODs de CrossFit'**
  String get ex_cf_1_b3;

  /// No description provided for @ex_cf_2_name.
  ///
  /// In es, this message translates to:
  /// **'Power Clean'**
  String get ex_cf_2_name;

  /// No description provided for @ex_cf_2_desc.
  ///
  /// In es, this message translates to:
  /// **'Igual que el Clean pero sin recibir en sentadilla completa: recibes la barra en cuarto de sentadilla con codos altos y la frontal en los hombros. Más rápido y menos exigente de movilidad que el Clean.'**
  String get ex_cf_2_desc;

  /// No description provided for @ex_cf_2_b1.
  ///
  /// In es, this message translates to:
  /// **'Desarrolla potencia explosiva de la cadena posterior'**
  String get ex_cf_2_b1;

  /// No description provided for @ex_cf_2_b2.
  ///
  /// In es, this message translates to:
  /// **'Más accesible técnicamente que el Clean completo'**
  String get ex_cf_2_b2;

  /// No description provided for @ex_cf_2_b3.
  ///
  /// In es, this message translates to:
  /// **'Excelente para principiantes en lifts olímpicos'**
  String get ex_cf_2_b3;

  /// No description provided for @ex_cf_3_name.
  ///
  /// In es, this message translates to:
  /// **'Arrancada (Snatch)'**
  String get ex_cf_3_name;

  /// No description provided for @ex_cf_3_desc.
  ///
  /// In es, this message translates to:
  /// **'Desde el suelo, agarra la barra con agarre muy ancho. Tira explosivamente y recibe la barra por encima de la cabeza con los brazos extendidos en una sentadilla profunda (overhead squat). Levántate manteniendo la barra arriba.'**
  String get ex_cf_3_desc;

  /// No description provided for @ex_cf_3_b1.
  ///
  /// In es, this message translates to:
  /// **'El lift olímpico más completo y técnicamente exigente'**
  String get ex_cf_3_b1;

  /// No description provided for @ex_cf_3_b2.
  ///
  /// In es, this message translates to:
  /// **'Desarrolla potencia, movilidad y estabilidad simultáneamente'**
  String get ex_cf_3_b2;

  /// No description provided for @ex_cf_3_b3.
  ///
  /// In es, this message translates to:
  /// **'Quema más calorías que casi cualquier otro ejercicio'**
  String get ex_cf_3_b3;

  /// No description provided for @ex_cf_4_name.
  ///
  /// In es, this message translates to:
  /// **'Power Snatch'**
  String get ex_cf_4_name;

  /// No description provided for @ex_cf_4_desc.
  ///
  /// In es, this message translates to:
  /// **'Igual que el Snatch pero recibiendo la barra en cuarto de sentadilla con los brazos extendidos por encima de la cabeza. Más rápido y menos exigente de movilidad de tobillos y caderas.'**
  String get ex_cf_4_desc;

  /// No description provided for @ex_cf_4_b1.
  ///
  /// In es, this message translates to:
  /// **'Más accesible que el Snatch completo'**
  String get ex_cf_4_b1;

  /// No description provided for @ex_cf_4_b2.
  ///
  /// In es, this message translates to:
  /// **'Desarrolla potencia explosiva de cadena posterior'**
  String get ex_cf_4_b2;

  /// No description provided for @ex_cf_4_b3.
  ///
  /// In es, this message translates to:
  /// **'Excelente para movilidad y coordinación'**
  String get ex_cf_4_b3;

  /// No description provided for @ex_cf_5_name.
  ///
  /// In es, this message translates to:
  /// **'Thruster'**
  String get ex_cf_5_name;

  /// No description provided for @ex_cf_5_desc.
  ///
  /// In es, this message translates to:
  /// **'Sostén la barra en posición frontal (sobre los deltoides delanteros). Realiza una sentadilla frontal completa y, al subir, usa el impulso de las piernas para empujar la barra por encima de la cabeza con los brazos extendidos. Baja la barra a la posición frontal y repite.'**
  String get ex_cf_5_desc;

  /// No description provided for @ex_cf_5_b1.
  ///
  /// In es, this message translates to:
  /// **'Trabaja todo el cuerpo en un solo movimiento'**
  String get ex_cf_5_b1;

  /// No description provided for @ex_cf_5_b2.
  ///
  /// In es, this message translates to:
  /// **'Ejercicio estrella de WODs como \"Fran\"'**
  String get ex_cf_5_b2;

  /// No description provided for @ex_cf_5_b3.
  ///
  /// In es, this message translates to:
  /// **'Combina fuerza y resistencia metabólica'**
  String get ex_cf_5_b3;

  /// No description provided for @ex_cf_6_name.
  ///
  /// In es, this message translates to:
  /// **'Push Press'**
  String get ex_cf_6_name;

  /// No description provided for @ex_cf_6_desc.
  ///
  /// In es, this message translates to:
  /// **'Con la barra en posición frontal sobre los hombros, realiza un dip rápido flexionando ligeramente las rodillas. Extiende explosivamente las piernas para impulsar la barra por encima de la cabeza hasta los brazos extendidos. Baja con control a la posición inicial.'**
  String get ex_cf_6_desc;

  /// No description provided for @ex_cf_6_b1.
  ///
  /// In es, this message translates to:
  /// **'Permite mover más peso que el press militar estricto'**
  String get ex_cf_6_b1;

  /// No description provided for @ex_cf_6_b2.
  ///
  /// In es, this message translates to:
  /// **'Desarrolla potencia de empuje vertical'**
  String get ex_cf_6_b2;

  /// No description provided for @ex_cf_6_b3.
  ///
  /// In es, this message translates to:
  /// **'Transfiere a Jerk y otros lifts olímpicos'**
  String get ex_cf_6_b3;

  /// No description provided for @ex_cf_7_name.
  ///
  /// In es, this message translates to:
  /// **'Push Jerk'**
  String get ex_cf_7_name;

  /// No description provided for @ex_cf_7_desc.
  ///
  /// In es, this message translates to:
  /// **'Igual que el Push Press pero al impulsar la barra arriba, sueltas las piernas para recibir la barra en cuarto de sentadilla con los brazos ya extendidos. Después, levántate completando el lift. Permite cargar más peso que el Push Press.'**
  String get ex_cf_7_desc;

  /// No description provided for @ex_cf_7_b1.
  ///
  /// In es, this message translates to:
  /// **'Mueve más peso por encima de la cabeza que cualquier press'**
  String get ex_cf_7_b1;

  /// No description provided for @ex_cf_7_b2.
  ///
  /// In es, this message translates to:
  /// **'Lift olímpico técnico y de alta potencia'**
  String get ex_cf_7_b2;

  /// No description provided for @ex_cf_7_b3.
  ///
  /// In es, this message translates to:
  /// **'Componente del Clean & Jerk'**
  String get ex_cf_7_b3;

  /// No description provided for @ex_cf_8_name.
  ///
  /// In es, this message translates to:
  /// **'Wall Balls'**
  String get ex_cf_8_name;

  /// No description provided for @ex_cf_8_desc.
  ///
  /// In es, this message translates to:
  /// **'De pie con un balón medicinal frente al pecho, mirando a una pared. Realiza una sentadilla profunda y al subir lanza la pelota hacia un objetivo alto en la pared (~3 m). Atrapa la pelota a la altura del pecho y desciende inmediatamente a la siguiente sentadilla.'**
  String get ex_cf_8_desc;

  /// No description provided for @ex_cf_8_b1.
  ///
  /// In es, this message translates to:
  /// **'Ejercicio cardiovascular y de potencia simultáneo'**
  String get ex_cf_8_b1;

  /// No description provided for @ex_cf_8_b2.
  ///
  /// In es, this message translates to:
  /// **'Movimiento estándar en muchos benchmarks de CrossFit'**
  String get ex_cf_8_b2;

  /// No description provided for @ex_cf_8_b3.
  ///
  /// In es, this message translates to:
  /// **'Trabaja la coordinación y el ritmo'**
  String get ex_cf_8_b3;

  /// No description provided for @ex_cf_9_name.
  ///
  /// In es, this message translates to:
  /// **'Kettlebell Swing americano'**
  String get ex_cf_9_name;

  /// No description provided for @ex_cf_9_desc.
  ///
  /// In es, this message translates to:
  /// **'De pie con la kettlebell colgando entre las piernas con ambas manos. Bisagra de cadera para llevarla atrás y extiende explosivamente las caderas para impulsarla por encima de la cabeza con los brazos extendidos. La fuerza viene de la cadera, no de los brazos.'**
  String get ex_cf_9_desc;

  /// No description provided for @ex_cf_9_b1.
  ///
  /// In es, this message translates to:
  /// **'Desarrolla potencia explosiva de cadera'**
  String get ex_cf_9_b1;

  /// No description provided for @ex_cf_9_b2.
  ///
  /// In es, this message translates to:
  /// **'Cardio y fuerza en un solo movimiento'**
  String get ex_cf_9_b2;

  /// No description provided for @ex_cf_9_b3.
  ///
  /// In es, this message translates to:
  /// **'Estándar en CrossFit (los rusos van solo hasta el pecho)'**
  String get ex_cf_9_b3;

  /// No description provided for @ex_cf_10_name.
  ///
  /// In es, this message translates to:
  /// **'Kettlebell Swing ruso'**
  String get ex_cf_10_name;

  /// No description provided for @ex_cf_10_desc.
  ///
  /// In es, this message translates to:
  /// **'Idéntico al swing americano pero la kettlebell solo se eleva hasta la altura del pecho/ojos, no por encima de la cabeza. Más fácil técnicamente y de menor estrés en hombros.'**
  String get ex_cf_10_desc;

  /// No description provided for @ex_cf_10_b1.
  ///
  /// In es, this message translates to:
  /// **'Punto de entrada al trabajo con kettlebell'**
  String get ex_cf_10_b1;

  /// No description provided for @ex_cf_10_b2.
  ///
  /// In es, this message translates to:
  /// **'Menos estrés de hombro que el swing americano'**
  String get ex_cf_10_b2;

  /// No description provided for @ex_cf_10_b3.
  ///
  /// In es, this message translates to:
  /// **'Ideal para principiantes y altas repeticiones'**
  String get ex_cf_10_b3;

  /// No description provided for @ex_cf_11_name.
  ///
  /// In es, this message translates to:
  /// **'Box Jumps'**
  String get ex_cf_11_name;

  /// No description provided for @ex_cf_11_desc.
  ///
  /// In es, this message translates to:
  /// **'Frente a un cajón o plataforma estable, flexiona las rodillas y salta sobre el cajón aterrizando con los pies completamente sobre la superficie. Extiende caderas y rodillas en la cima. Baja saltando o paso a paso para reducir impacto.'**
  String get ex_cf_11_desc;

  /// No description provided for @ex_cf_11_b1.
  ///
  /// In es, this message translates to:
  /// **'Pliometría pura para desarrollar potencia'**
  String get ex_cf_11_b1;

  /// No description provided for @ex_cf_11_b2.
  ///
  /// In es, this message translates to:
  /// **'Mejora el salto vertical y la explosividad'**
  String get ex_cf_11_b2;

  /// No description provided for @ex_cf_11_b3.
  ///
  /// In es, this message translates to:
  /// **'Componente clásico de muchos WODs'**
  String get ex_cf_11_b3;

  /// No description provided for @ex_cf_12_name.
  ///
  /// In es, this message translates to:
  /// **'Burpees'**
  String get ex_cf_12_name;

  /// No description provided for @ex_cf_12_desc.
  ///
  /// In es, this message translates to:
  /// **'De pie, agáchate y apoya las manos en el suelo. Salta con los pies hacia atrás hasta la posición de plancha. Realiza una flexión tocando el pecho al suelo. Salta con los pies de vuelta hacia las manos y salta vertical extendiendo los brazos arriba.'**
  String get ex_cf_12_desc;

  /// No description provided for @ex_cf_12_b1.
  ///
  /// In es, this message translates to:
  /// **'Ejercicio full-body sin equipamiento'**
  String get ex_cf_12_b1;

  /// No description provided for @ex_cf_12_b2.
  ///
  /// In es, this message translates to:
  /// **'Cardio intenso y trabajo de fuerza simultáneo'**
  String get ex_cf_12_b2;

  /// No description provided for @ex_cf_12_b3.
  ///
  /// In es, this message translates to:
  /// **'Estándar de benchmarks como \"Murph\" y muchos WODs'**
  String get ex_cf_12_b3;

  /// No description provided for @ex_cf_13_name.
  ///
  /// In es, this message translates to:
  /// **'Toes-to-Bar'**
  String get ex_cf_13_name;

  /// No description provided for @ex_cf_13_desc.
  ///
  /// In es, this message translates to:
  /// **'Cuelga de la barra con agarre prono. Activa los dorsales y eleva las piernas extendidas (o con ligera flexión) hasta tocar la barra con los pies. Baja con control sin balanceo excesivo. Usa el \"kip\" para mantener cadencia.'**
  String get ex_cf_13_desc;

  /// No description provided for @ex_cf_13_b1.
  ///
  /// In es, this message translates to:
  /// **'Trabajo dinámico de core de alta exigencia'**
  String get ex_cf_13_b1;

  /// No description provided for @ex_cf_13_b2.
  ///
  /// In es, this message translates to:
  /// **'Mejora la fuerza de agarre y los dorsales'**
  String get ex_cf_13_b2;

  /// No description provided for @ex_cf_13_b3.
  ///
  /// In es, this message translates to:
  /// **'Componente de muchos WODs de CrossFit'**
  String get ex_cf_13_b3;

  /// No description provided for @ex_cf_14_name.
  ///
  /// In es, this message translates to:
  /// **'Knees-to-Elbow'**
  String get ex_cf_14_name;

  /// No description provided for @ex_cf_14_desc.
  ///
  /// In es, this message translates to:
  /// **'Cuelga de la barra con agarre prono. Flexiona las caderas y rodillas llevando las rodillas hacia los codos en un movimiento dinámico controlado. Baja con control. Útil como progresión hacia los Toes-to-Bar.'**
  String get ex_cf_14_desc;

  /// No description provided for @ex_cf_14_b1.
  ///
  /// In es, this message translates to:
  /// **'Progresión hacia Toes-to-Bar'**
  String get ex_cf_14_b1;

  /// No description provided for @ex_cf_14_b2.
  ///
  /// In es, this message translates to:
  /// **'Trabajo de core dinámico sin tanta exigencia técnica'**
  String get ex_cf_14_b2;

  /// No description provided for @ex_cf_14_b3.
  ///
  /// In es, this message translates to:
  /// **'Mejora la fuerza de agarre'**
  String get ex_cf_14_b3;

  /// No description provided for @ex_cf_15_name.
  ///
  /// In es, this message translates to:
  /// **'Muscle-Up'**
  String get ex_cf_15_name;

  /// No description provided for @ex_cf_15_desc.
  ///
  /// In es, this message translates to:
  /// **'Cuélgate de las anillas (o barra) con agarre falso. Tira explosivamente del cuerpo hacia arriba haciendo una transición sobre las anillas y, en la cima, empuja extendiendo los brazos hasta quedar en soporte arriba. Baja controlando la transición inversa.'**
  String get ex_cf_15_desc;

  /// No description provided for @ex_cf_15_b1.
  ///
  /// In es, this message translates to:
  /// **'Movimiento gimnástico avanzado de tracción + empuje'**
  String get ex_cf_15_b1;

  /// No description provided for @ex_cf_15_b2.
  ///
  /// In es, this message translates to:
  /// **'Hito clave en CrossFit (RX en muchos WODs)'**
  String get ex_cf_15_b2;

  /// No description provided for @ex_cf_15_b3.
  ///
  /// In es, this message translates to:
  /// **'Desarrolla fuerza relativa al peso corporal extrema'**
  String get ex_cf_15_b3;

  /// No description provided for @ex_cf_16_name.
  ///
  /// In es, this message translates to:
  /// **'Pistol Squat'**
  String get ex_cf_16_name;

  /// No description provided for @ex_cf_16_desc.
  ///
  /// In es, this message translates to:
  /// **'De pie sobre una pierna, extiende la otra al frente paralela al suelo. Baja en sentadilla profunda manteniendo el equilibrio y el pie de apoyo plano. Sube empujando con el talón sin que la pierna libre toque el suelo. Repite del otro lado.'**
  String get ex_cf_16_desc;

  /// No description provided for @ex_cf_16_b1.
  ///
  /// In es, this message translates to:
  /// **'Sentadilla unilateral de máxima dificultad'**
  String get ex_cf_16_b1;

  /// No description provided for @ex_cf_16_b2.
  ///
  /// In es, this message translates to:
  /// **'Desarrolla movilidad de tobillo y cadera'**
  String get ex_cf_16_b2;

  /// No description provided for @ex_cf_16_b3.
  ///
  /// In es, this message translates to:
  /// **'Trabajo unilateral que corrige asimetrías'**
  String get ex_cf_16_b3;

  /// No description provided for @ex_cf_17_name.
  ///
  /// In es, this message translates to:
  /// **'Handstand Push-Up (HSPU)'**
  String get ex_cf_17_name;

  /// No description provided for @ex_cf_17_desc.
  ///
  /// In es, this message translates to:
  /// **'Apoya las manos en el suelo a unos 30 cm de una pared y patea hacia arriba hasta quedar en parada de manos contra la pared. Baja flexionando los codos hasta que la cabeza toque el suelo (o un abmat). Empuja para volver arriba. Usa el \"kip\" si necesitas asistencia.'**
  String get ex_cf_17_desc;

  /// No description provided for @ex_cf_17_b1.
  ///
  /// In es, this message translates to:
  /// **'Press vertical con peso corporal completo'**
  String get ex_cf_17_b1;

  /// No description provided for @ex_cf_17_b2.
  ///
  /// In es, this message translates to:
  /// **'Mejora la estabilidad de hombro y core'**
  String get ex_cf_17_b2;

  /// No description provided for @ex_cf_17_b3.
  ///
  /// In es, this message translates to:
  /// **'Hito gimnástico clave en CrossFit'**
  String get ex_cf_17_b3;

  /// No description provided for @ex_cf_18_name.
  ///
  /// In es, this message translates to:
  /// **'Turkish Get-Up'**
  String get ex_cf_18_name;

  /// No description provided for @ex_cf_18_desc.
  ///
  /// In es, this message translates to:
  /// **'Túmbate boca arriba sosteniendo una kettlebell con un brazo extendido hacia el techo. Levántate paso a paso (codo → mano → bisagra de cadera → barrida de pierna → arrodillado → de pie) manteniendo siempre la kettlebell arriba. Invierte el movimiento.'**
  String get ex_cf_18_desc;

  /// No description provided for @ex_cf_18_b1.
  ///
  /// In es, this message translates to:
  /// **'Movimiento funcional total-body único'**
  String get ex_cf_18_b1;

  /// No description provided for @ex_cf_18_b2.
  ///
  /// In es, this message translates to:
  /// **'Mejora la movilidad, estabilidad y coordinación'**
  String get ex_cf_18_b2;

  /// No description provided for @ex_cf_18_b3.
  ///
  /// In es, this message translates to:
  /// **'Excelente trabajo de hombro y core'**
  String get ex_cf_18_b3;

  /// No description provided for @ex_cf_19_name.
  ///
  /// In es, this message translates to:
  /// **'Double Unders'**
  String get ex_cf_19_name;

  /// No description provided for @ex_cf_19_desc.
  ///
  /// In es, this message translates to:
  /// **'Salta a la cuerda haciéndola pasar dos veces bajo los pies en cada salto. Mantén los saltos bajos y el ritmo de muñeca rápido. Brazos pegados al cuerpo, codos cerca de la cintura. Requiere coordinación y cuerda de velocidad.'**
  String get ex_cf_19_desc;

  /// No description provided for @ex_cf_19_b1.
  ///
  /// In es, this message translates to:
  /// **'Cardio explosivo de alta intensidad'**
  String get ex_cf_19_b1;

  /// No description provided for @ex_cf_19_b2.
  ///
  /// In es, this message translates to:
  /// **'Mejora la coordinación y el timing'**
  String get ex_cf_19_b2;

  /// No description provided for @ex_cf_19_b3.
  ///
  /// In es, this message translates to:
  /// **'Estándar en cientos de WODs de CrossFit'**
  String get ex_cf_19_b3;

  /// No description provided for @ex_cf_20_name.
  ///
  /// In es, this message translates to:
  /// **'Farmer\'s Carry'**
  String get ex_cf_20_name;

  /// No description provided for @ex_cf_20_desc.
  ///
  /// In es, this message translates to:
  /// **'Sostén una mancuerna o kettlebell pesada en cada mano a los costados. Camina con pasos cortos manteniendo la postura erguida, hombros atrás y core apretado. Recorre una distancia determinada o trabaja por tiempo.'**
  String get ex_cf_20_desc;

  /// No description provided for @ex_cf_20_b1.
  ///
  /// In es, this message translates to:
  /// **'Fortalece el agarre y los antebrazos'**
  String get ex_cf_20_b1;

  /// No description provided for @ex_cf_20_b2.
  ///
  /// In es, this message translates to:
  /// **'Trabajo funcional de todo el cuerpo'**
  String get ex_cf_20_b2;

  /// No description provided for @ex_cf_20_b3.
  ///
  /// In es, this message translates to:
  /// **'Mejora la postura y la estabilidad del core'**
  String get ex_cf_20_b3;

  /// No description provided for @ex_cf_21_name.
  ///
  /// In es, this message translates to:
  /// **'Goblet Squat'**
  String get ex_cf_21_name;

  /// No description provided for @ex_cf_21_desc.
  ///
  /// In es, this message translates to:
  /// **'Sostén una kettlebell (o mancuerna) frente al pecho a la altura del esternón, agarrándola por las \"campanas\". Realiza una sentadilla profunda manteniendo el torso vertical y los codos al frente. Empuja con los talones para volver arriba.'**
  String get ex_cf_21_desc;

  /// No description provided for @ex_cf_21_b1.
  ///
  /// In es, this message translates to:
  /// **'Punto de entrada perfecto a la sentadilla con carga'**
  String get ex_cf_21_b1;

  /// No description provided for @ex_cf_21_b2.
  ///
  /// In es, this message translates to:
  /// **'Enseña postura erguida y profundidad correcta'**
  String get ex_cf_21_b2;

  /// No description provided for @ex_cf_21_b3.
  ///
  /// In es, this message translates to:
  /// **'Excelente para activar el core'**
  String get ex_cf_21_b3;

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
