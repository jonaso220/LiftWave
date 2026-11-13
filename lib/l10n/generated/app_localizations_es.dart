// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class SEs extends S {
  SEs([String locale = 'es']) : super(locale);

  @override
  String get common_cancel => 'Cancelar';

  @override
  String get common_delete => 'Eliminar';

  @override
  String get common_save => 'Guardar';

  @override
  String get common_or => 'o';

  @override
  String get common_today => 'Hoy';

  @override
  String get common_yesterday => 'Ayer';

  @override
  String common_daysAgo(int count) {
    return 'Hace $count días';
  }

  @override
  String get common_exercises => 'Ejercicios';

  @override
  String get common_sets => 'Series';

  @override
  String get common_volume => 'Volumen';

  @override
  String get common_reps => 'Reps';

  @override
  String get common_weight => 'Peso';

  @override
  String get common_duration => 'Duración';

  @override
  String get common_bodyweight => 'Corporal';

  @override
  String get common_custom => 'CUSTOM';

  @override
  String get common_discardChangesTitle => '¿Descartar cambios?';

  @override
  String get common_discardChangesBody =>
      'Los cambios que hiciste no se guardarán.';

  @override
  String get common_keepEditing => 'Seguir editando';

  @override
  String get common_discard => 'Descartar';

  @override
  String get muscle_all => 'Todos';

  @override
  String get muscle_chest => 'Pecho';

  @override
  String get muscle_back => 'Espalda';

  @override
  String get muscle_legs => 'Piernas';

  @override
  String get muscle_shoulders => 'Hombros';

  @override
  String get muscle_arms => 'Brazos';

  @override
  String get muscle_core => 'Core';

  @override
  String get muscle_crossfit => 'CrossFit';

  @override
  String get equipment_all => 'Todos';

  @override
  String get equipment_barbell => 'Barra';

  @override
  String get equipment_dumbbells => 'Mancuernas';

  @override
  String get equipment_machine => 'Máquina';

  @override
  String get equipment_cable => 'Polea';

  @override
  String get equipment_bodyweight => 'Peso corporal';

  @override
  String get equipment_pullupBar => 'Barra fija';

  @override
  String get equipment_noEquipment => 'Sin material';

  @override
  String get equipment_parallelBars => 'Paralelas';

  @override
  String get equipment_rings => 'Anillas';

  @override
  String get equipment_box => 'Cajón';

  @override
  String get equipment_rope => 'Cuerda';

  @override
  String get equipment_ball => 'Pelota';

  @override
  String get equipment_kettlebell => 'Kettlebell';

  @override
  String get difficulty_beginner => 'Principiante';

  @override
  String get difficulty_intermediate => 'Intermedio';

  @override
  String get difficulty_advanced => 'Avanzado';

  @override
  String get nav_home => 'Inicio';

  @override
  String get nav_train => 'Entrenar';

  @override
  String get nav_progress => 'Progreso';

  @override
  String get nav_profile => 'Perfil';

  @override
  String get home_todayTitle => 'HOY TOCA';

  @override
  String get home_inProgressTitle => 'ENTRENAMIENTO EN CURSO';

  @override
  String get home_continueWorkout => 'Continuar entrenamiento';

  @override
  String get home_chooseAnother => 'Elegir otra rutina';

  @override
  String get login_tagline => 'Tu app de fitness personal';

  @override
  String get login_continueGoogle => 'Continuar con Google';

  @override
  String get login_continueApple => 'Continuar con Apple';

  @override
  String get login_continueEmail => 'Continuar con correo';

  @override
  String get login_continueGuest => 'Continuar sin cuenta';

  @override
  String get guest_name => 'Invitado';

  @override
  String get guest_saveProgressTitle => 'Guarda tu progreso';

  @override
  String get guest_saveProgressBody =>
      'Estás usando LiftWave como invitado. Crea una cuenta gratis para no perder tus entrenamientos si cambias de teléfono o reinstalas la app.';

  @override
  String get guest_createAccount => 'Crear cuenta';

  @override
  String get guest_notNow => 'Ahora no';

  @override
  String get guest_createAccountSubtitle =>
      'Crea una cuenta para no perder tu progreso';

  @override
  String get guest_accountCreated =>
      'Cuenta creada. Tus entrenamientos están a salvo.';

  @override
  String get guest_existingAccountTitle => 'Esta cuenta ya existe';

  @override
  String get guest_existingAccountBody =>
      'Si inicias sesión con ella, los entrenamientos que hiciste como invitado no se pasan a esa cuenta.';

  @override
  String get guest_signInAnyway => 'Iniciar sesión igual';

  @override
  String get guest_leave => 'Salir del modo invitado';

  @override
  String get guest_leaveBody =>
      'Como no tienes una cuenta, se borrarán tus entrenamientos y datos. Esta acción no se puede deshacer.';

  @override
  String train_reasonIncreaseLoad(int reps, String weight, int min, int max) {
    return 'Hiciste $reps reps con $weight, el tope de tu rango ($min–$max). Toca subir el peso.';
  }

  @override
  String train_reasonAddRep(int reps, String weight) {
    return 'Hiciste $reps reps con $weight. Suma una repetición antes de subir el peso.';
  }

  @override
  String train_reasonConsolidate(int reps, String weight, int min, int max) {
    return 'Hiciste $reps reps, por debajo de tu rango ($min–$max). Mantén $weight hasta llegar a $min.';
  }

  @override
  String train_reasonBodyweight(int reps) {
    return 'Hiciste $reps reps. Intenta sumar una más.';
  }

  @override
  String get login_legalPrefix => 'Al continuar, aceptas nuestros ';

  @override
  String get login_termsLink => 'términos de servicio';

  @override
  String get login_legalAnd => 'y';

  @override
  String get login_privacyLink => 'política de privacidad';

  @override
  String get login_googleError => 'No se pudo iniciar sesión con Google.';

  @override
  String get login_appleError => 'No se pudo iniciar sesión con Apple.';

  @override
  String get emailAuth_titleLogin => 'Iniciar sesión';

  @override
  String get emailAuth_titleRegister => 'Crear cuenta';

  @override
  String get emailAuth_greetingLogin => 'Nos alegra verte';

  @override
  String get emailAuth_greetingRegister => '¡Bienvenido!';

  @override
  String get emailAuth_subtitleLogin => 'Ingresa con tu correo y contraseña';

  @override
  String get emailAuth_subtitleRegister => 'Crea tu cuenta para empezar';

  @override
  String get emailAuth_nameLabel => 'Nombre';

  @override
  String get emailAuth_nameHint => 'Tu nombre';

  @override
  String get emailAuth_nameError => 'Introduce tu nombre';

  @override
  String get emailAuth_emailLabel => 'Correo electrónico';

  @override
  String get emailAuth_emailHint => 'correo@ejemplo.com';

  @override
  String get emailAuth_emailErrorEmpty => 'Introduce tu correo';

  @override
  String get emailAuth_emailErrorInvalid => 'Correo no válido';

  @override
  String get emailAuth_passwordLabel => 'Contraseña';

  @override
  String get emailAuth_passwordHintLogin => 'Tu contraseña';

  @override
  String get emailAuth_passwordHintRegister => 'Mínimo 6 caracteres';

  @override
  String get emailAuth_passwordErrorEmpty => 'Introduce tu contraseña';

  @override
  String get emailAuth_passwordErrorShort => 'Mínimo 6 caracteres';

  @override
  String get emailAuth_forgotPassword => '¿Olvidaste tu contraseña?';

  @override
  String get emailAuth_hasAccount => '¿Ya tienes cuenta? ';

  @override
  String get emailAuth_noAccount => '¿No tienes cuenta? ';

  @override
  String get emailAuth_loginLink => 'Inicia sesión';

  @override
  String get emailAuth_registerLink => 'Regístrate';

  @override
  String get emailAuth_unexpectedError =>
      'Error inesperado. Inténtalo de nuevo.';

  @override
  String get emailAuth_emailFirst => 'Escribe tu correo primero.';

  @override
  String emailAuth_resetSent(String email) {
    return 'Correo de recuperación enviado a $email';
  }

  @override
  String get emailAuth_resetError =>
      'No se pudo enviar el correo de recuperación.';

  @override
  String get authError_userNotFound => 'No existe una cuenta con ese correo.';

  @override
  String get authError_wrongPassword => 'Contraseña incorrecta.';

  @override
  String get authError_emailAlreadyInUse => 'Este correo ya está registrado.';

  @override
  String get authError_weakPassword =>
      'La contraseña es muy débil (mínimo 6 caracteres).';

  @override
  String get authError_invalidEmail => 'El correo no es válido.';

  @override
  String get authError_tooManyRequests =>
      'Demasiados intentos. Espera unos minutos.';

  @override
  String get authError_networkFailed => 'Sin conexión a internet.';

  @override
  String get authError_default =>
      'Error al iniciar sesión. Inténtalo de nuevo.';

  @override
  String home_greetingMorning(String name) {
    return '¡Buenos días, $name!';
  }

  @override
  String get home_greetingMorningNoName => '¡Buenos días!';

  @override
  String home_greetingAfternoon(String name) {
    return '¡Buenas tardes, $name!';
  }

  @override
  String get home_greetingAfternoonNoName => '¡Buenas tardes!';

  @override
  String home_greetingEvening(String name) {
    return '¡Buenas noches, $name!';
  }

  @override
  String get home_greetingEveningNoName => '¡Buenas noches!';

  @override
  String get home_weekMotivationZero =>
      'Aún no has entrenado esta semana. ¡Empieza hoy!';

  @override
  String get home_weekMotivationOne =>
      'Llevas 1 entrenamiento esta semana. ¡Sigue así!';

  @override
  String home_weekMotivationMany(int count) {
    return 'Llevas $count entrenamientos esta semana. ¡Sigue así!';
  }

  @override
  String get home_thisWeek => 'Esta semana';

  @override
  String get home_weekTime => 'Tiempo semana';

  @override
  String get home_weekVolume => 'Volumen semana';

  @override
  String get restTimer_title => 'Descanso';

  @override
  String get restTimer_openControls =>
      'Abrir controles del temporizador de descanso';

  @override
  String restTimer_addSeconds(int seconds) {
    return 'Añadir $seconds segundos';
  }

  @override
  String restTimer_subtractSeconds(int seconds) {
    return 'Restar $seconds segundos';
  }

  @override
  String get restTimer_pause => 'Pausar temporizador';

  @override
  String get restTimer_resume => 'Reanudar temporizador';

  @override
  String get restTimer_dismiss => 'Cerrar temporizador';

  @override
  String get restTimer_reset => 'Reiniciar temporizador';

  @override
  String restTimer_preset(String time) {
    return 'Usar descanso de $time';
  }

  @override
  String get restTimer_resting => 'DESCANSANDO';

  @override
  String get restTimer_done => '¡LISTO!';

  @override
  String get home_lastWorkout => 'Último entrenamiento';

  @override
  String get home_repeatWorkout => 'Repetir entrenamiento';

  @override
  String get editWorkout_title => 'Editar entrenamiento';

  @override
  String get editWorkout_saved => 'Entrenamiento actualizado';

  @override
  String get detail_deleteWorkout => 'Eliminar entrenamiento';

  @override
  String get detail_deleteWorkoutConfirm =>
      'Se eliminará de tu historial. Esta acción no se puede deshacer.';

  @override
  String get detail_workoutDeleted => 'Entrenamiento eliminado';

  @override
  String get home_viewAll => 'Ver todo';

  @override
  String get home_goToTrain => 'Ir a Entrenar →';

  @override
  String get home_achievements => 'Logros';

  @override
  String get home_noAchievements =>
      'Completa entrenamientos para desbloquear logros';

  @override
  String get home_exerciseLibrary => 'Biblioteca de ejercicios';

  @override
  String get profile_proActive => 'Suscripción activa';

  @override
  String get profile_freePlan => 'Plan gratuito';

  @override
  String get profile_upgradePro => 'Actualizar a PRO';

  @override
  String get profile_restorePurchases => 'Restaurar compras';

  @override
  String get profile_signOut => 'Cerrar sesión';

  @override
  String get profile_deleteAccount => 'Eliminar cuenta';

  @override
  String get progressScreen_deleteMeasurementTitle => '¿Eliminar registro?';

  @override
  String get progressScreen_deleteMeasurementBody =>
      'Se eliminarán el registro y su foto. Esta acción no se puede deshacer.';

  @override
  String get profile_signOutConfirm =>
      '¿Cerrar sesión? Tus datos quedan guardados en tu cuenta.';

  @override
  String get profile_deleteSubscriptionNote =>
      'Eliminar la cuenta no cancela tu suscripción. Cancélala antes desde la tienda.';

  @override
  String get profile_manageSubscription => 'Administrar suscripción';

  @override
  String get profile_help => 'Ayuda y soporte';

  @override
  String get rest_alertTitle => 'Descanso terminado';

  @override
  String get rest_alertBody => 'Es hora de tu siguiente serie.';

  @override
  String get rest_alertChannel => 'Temporizador de descanso';

  @override
  String get profile_restAlert => 'Avisar al terminar el descanso';

  @override
  String get profile_restAlertSubtitle =>
      'Notificación con sonido cuando la app no está en pantalla';

  @override
  String get profile_restAlertExact => 'Permitir alarmas exactas';

  @override
  String get profile_restAlertExactSubtitle =>
      'Sin este permiso, Android puede retrasar el aviso';

  @override
  String get editWorkout_date => 'Fecha y hora';

  @override
  String get editWorkout_duration => 'Duración (min)';

  @override
  String get history_searchHint => 'Buscar entrenamiento o ejercicio';

  @override
  String get history_noResults => 'Sin resultados';

  @override
  String get history_calendar => 'Calendario';

  @override
  String get progress_oneRm => '1RM est.';

  @override
  String get progress_recordsTitle => 'Récords';

  @override
  String get progress_bestLift => 'Mejor levantamiento';

  @override
  String get progress_bestOneRm => 'Mejor 1RM estimado';

  @override
  String get setType_title => 'Tipo de serie';

  @override
  String get setType_normal => 'Normal';

  @override
  String get setType_warmup => 'Calentamiento';

  @override
  String get setType_drop => 'Drop set';

  @override
  String get setType_failure => 'Al fallo';

  @override
  String get setType_warmupHint => 'No suma volumen ni récords';

  @override
  String get setType_warmupShort => 'C';

  @override
  String get setType_dropShort => 'D';

  @override
  String get setType_failureShort => 'F';

  @override
  String get plates_title => 'Calculadora de discos';

  @override
  String get plates_target => 'Peso total';

  @override
  String get plates_bar => 'Barra';

  @override
  String get plates_perSide => 'Por lado';

  @override
  String get plates_onlyBar => 'Solo la barra';

  @override
  String get plates_belowBar => 'El peso es menor que la barra';

  @override
  String plates_missing(String amount) {
    return 'Faltan $amount que no se pueden cargar con estos discos';
  }

  @override
  String get train_secondsHeader => 'SEG';

  @override
  String get train_secondsShort => 's';

  @override
  String get train_startHold => 'Iniciar';

  @override
  String get train_measureByTime => 'Medir por tiempo';

  @override
  String get train_measureByReps => 'Medir por repeticiones';

  @override
  String get hold_running => 'EN CURSO';

  @override
  String get hold_alertTitle => 'Tiempo cumplido';

  @override
  String get hold_alertBody => 'Terminaste la serie.';

  @override
  String train_reasonHold(int seconds) {
    return 'Aguantaste $seconds s. Intenta sumar 5 s.';
  }

  @override
  String get superset_label => 'Superserie';

  @override
  String get superset_linkNext => 'Superserie con el siguiente';

  @override
  String get superset_unlink => 'Quitar de la superserie';

  @override
  String get superset_hint =>
      'Alterna las series; el descanso empieza al terminar la ronda.';

  @override
  String get widget_today => 'Hoy toca';

  @override
  String widget_weekOfTarget(String done, String target) {
    return '$done/$target esta semana';
  }

  @override
  String get widget_weekOne => '1 sesión esta semana';

  @override
  String widget_weekOther(String count) {
    return '$count sesiones esta semana';
  }

  @override
  String get reminders_title => 'Recordatorios de entrenamiento';

  @override
  String get reminders_off => 'Desactivados';

  @override
  String get reminders_enable => 'Recordarme entrenar';

  @override
  String get reminders_enableSubtitle => 'Una notificación los días que elijas';

  @override
  String get reminders_days => 'Días';

  @override
  String get reminders_time => 'Hora';

  @override
  String get reminders_notificationTitle => 'Hora de entrenar';

  @override
  String get reminders_notificationBody => 'Tu entrenamiento de hoy te espera.';

  @override
  String reminders_notificationRoutine(String routine) {
    return 'Hoy toca: $routine';
  }

  @override
  String get reminders_permissionDenied =>
      'Activa las notificaciones de LiftWave en los ajustes del sistema para recibir recordatorios.';

  @override
  String health_sync(String store) {
    return 'Sincronizar con $store';
  }

  @override
  String health_syncSubtitle(String store) {
    return 'Guarda en $store los entrenamientos y el peso corporal que registres';
  }

  @override
  String health_enabled(String store) {
    return 'Listo. Tus próximos entrenamientos se guardarán en $store.';
  }

  @override
  String health_denied(String store) {
    return 'No se pudo activar. Revisa los permisos de LiftWave en $store.';
  }

  @override
  String get health_needsInstall =>
      'Instala o actualiza Health Connect para activar la sincronización.';

  @override
  String get health_install => 'Instalar';

  @override
  String health_unsupported(String store) {
    return '$store no está disponible en este dispositivo.';
  }

  @override
  String get profile_purchasesRestored => 'Compras restauradas correctamente';

  @override
  String get profile_noPurchasesFound => 'No se encontraron compras previas';

  @override
  String get restore_connectionError =>
      'Sin conexión. Verifica tu internet e inténtalo de nuevo.';

  @override
  String get restore_unknownError =>
      'No se pudo restaurar. Inténtalo de nuevo.';

  @override
  String get profile_deleteTitle => 'Eliminar cuenta';

  @override
  String get profile_deleteConfirm =>
      '¿Estás seguro? Esta acción es irreversible y se eliminarán todos tus datos.';

  @override
  String get profile_deleteReauthError =>
      'Para eliminar tu cuenta, cierra sesión, vuelve a iniciar y reintenta.';

  @override
  String get profile_trainingPreferences => 'Preferencias de entrenamiento';

  @override
  String get profile_trainingPreferencesSubtitle =>
      'Objetivo, experiencia, días y equipamiento';

  @override
  String get profile_appearance => 'Apariencia';

  @override
  String get appearance_system => 'Automático (según el teléfono)';

  @override
  String get appearance_light => 'Claro';

  @override
  String get appearance_dark => 'Oscuro';

  @override
  String get onboarding_title => 'Personaliza tu entrenamiento';

  @override
  String get onboarding_goalTitle => '¿Cuál es tu objetivo principal?';

  @override
  String get onboarding_goalSubtitle =>
      'Usaremos esto para adaptar tus próximas recomendaciones.';

  @override
  String get onboarding_goalMuscle => 'Ganar masa muscular';

  @override
  String get onboarding_goalStrength => 'Ganar fuerza';

  @override
  String get onboarding_goalFatLoss => 'Perder grasa';

  @override
  String get onboarding_goalFitness => 'Mejorar mi condición';

  @override
  String get onboarding_experienceTitle => '¿Cuál es tu experiencia?';

  @override
  String get onboarding_experienceSubtitle =>
      'Ajustaremos el volumen y la progresión a tu nivel.';

  @override
  String get onboarding_experienceBeginner => 'Principiante';

  @override
  String get onboarding_experienceBeginnerHint => 'Menos de 1 año';

  @override
  String get onboarding_experienceIntermediate => 'Intermedio';

  @override
  String get onboarding_experienceIntermediateHint => 'Entre 1 y 3 años';

  @override
  String get onboarding_experienceAdvanced => 'Avanzado';

  @override
  String get onboarding_experienceAdvancedHint => 'Más de 3 años';

  @override
  String get onboarding_daysTitle => '¿Cuántos días puedes entrenar?';

  @override
  String get onboarding_daysSubtitle =>
      'Elige una frecuencia que puedas mantener.';

  @override
  String onboarding_daysSelected(int count) {
    return '$count días por semana';
  }

  @override
  String get onboarding_equipmentTitle => '¿Qué equipamiento tienes?';

  @override
  String get onboarding_equipmentSubtitle =>
      'Selecciona todo lo que puedas usar habitualmente.';

  @override
  String get onboarding_continue => 'Continuar';

  @override
  String get onboarding_back => 'Atrás';

  @override
  String get onboarding_finish => 'Guardar y empezar';

  @override
  String get onboarding_skip => 'Ahora no';

  @override
  String get onboarding_saved => 'Preferencias guardadas';

  @override
  String get weeklyPlan_title => 'Plan semanal';

  @override
  String weeklyPlan_sessions(int done, int total) {
    return '$done/$total sesiones';
  }

  @override
  String get weeklyPlan_adherence => 'Adherencia';

  @override
  String get weeklyPlan_remaining => 'Restantes';

  @override
  String get weeklyPlan_completedSets => 'Series';

  @override
  String get weeklyPlan_muscleBalance => 'SERIES POR MÚSCULO';

  @override
  String get weeklyPlan_completed =>
      'Objetivo semanal completado. Buen trabajo.';

  @override
  String get weeklyPlan_nextSession => 'PRÓXIMA SESIÓN';

  @override
  String weeklyPlan_exerciseCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ejercicios',
      one: '1 ejercicio',
    );
    return '$_temp0';
  }

  @override
  String get weeklyPlan_start => 'Empezar';

  @override
  String get weeklyPlan_noCompatible =>
      'No hay suficientes ejercicios compatibles con tu equipamiento.';

  @override
  String get weeklyPlan_adjustEquipment => 'Ajustar';

  @override
  String get weeklyPlan_setupTitle => 'Configura tu plan';

  @override
  String get weeklyPlan_setupSubtitle =>
      'Completa tus preferencias para recibir una sesión adaptada cada semana.';

  @override
  String get weeklyPlan_configure => 'Configurar';

  @override
  String get weeklyPlan_adaptiveName => 'Sesión adaptativa';

  @override
  String get train_title => 'Entrenar';

  @override
  String get train_readyTitle => '¿Listo para entrenar?';

  @override
  String get train_readySubtitle =>
      'Inicia una sesión libre o elige una rutina preconfigurada.';

  @override
  String get train_freeSession => 'Sesión libre';

  @override
  String get train_freeWorkout => 'Entrenamiento libre';

  @override
  String get train_myRoutines => 'Mis rutinas';

  @override
  String get train_predefinedRoutines => 'Rutinas predefinidas';

  @override
  String get train_inProgress => 'En curso';

  @override
  String get train_readyToStart => 'Listo para empezar';

  @override
  String get train_startSession => 'Iniciar';

  @override
  String get train_resumeTitle => '¿Continuar entrenamiento?';

  @override
  String train_resumeBody(String name) {
    return 'Tenías un entrenamiento de \"$name\" sin terminar. ¿Quieres continuar donde lo dejaste?';
  }

  @override
  String get train_resumeContinue => 'Continuar';

  @override
  String get train_resumeDiscard => 'Descartar';

  @override
  String get train_cancelWorkout => '¿Descartar entrenamiento?';

  @override
  String get train_cancelConfirm =>
      'Se perderán las series registradas en esta sesión.';

  @override
  String get train_continue => 'Seguir entrenando';

  @override
  String get train_addExerciseFirst =>
      'Añade al menos un ejercicio antes de finalizar.';

  @override
  String get train_completeSetFirst =>
      'Completa al menos una serie antes de finalizar.';

  @override
  String get train_workoutCompleted => '¡Entrenamiento completado!';

  @override
  String get train_completedSets => 'Series completadas';

  @override
  String get train_totalVolume => 'Volumen total';

  @override
  String get train_saveAsRoutine => 'Guardar como rutina';

  @override
  String get train_finish => 'Finalizar';

  @override
  String get train_newAchievement => '¡Nuevo logro!';

  @override
  String get train_great => '¡Genial!';

  @override
  String get train_routineNameHint => 'Nombre de la rutina';

  @override
  String train_routineSaved(String name) {
    return 'Rutina \"$name\" guardada';
  }

  @override
  String get train_deleteRoutine => 'Eliminar rutina';

  @override
  String train_deleteRoutineConfirm(String name) {
    return '¿Eliminar \"$name\"?';
  }

  @override
  String get train_noExercisesYet => 'Sin ejercicios aún';

  @override
  String get train_addExerciseHint =>
      'Toca el botón de abajo para añadir el primer ejercicio.';

  @override
  String get train_addExercise => 'Añadir ejercicio';

  @override
  String get train_exercise => 'Ejercicio';

  @override
  String train_exerciseCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ejercicios',
      one: '1 ejercicio',
    );
    return '$_temp0';
  }

  @override
  String train_startTemplate(String name) {
    return 'Empezar $name';
  }

  @override
  String train_setsProgress(int done, int total) {
    return '$done/$total series ✓';
  }

  @override
  String get train_viewProgress => 'Ver progreso';

  @override
  String get train_deleteExercise => 'Eliminar ejercicio';

  @override
  String train_deleteExerciseConfirm(String name) {
    return '¿Eliminar \"$name\"? Se perderán las series completadas.';
  }

  @override
  String get train_notesHint => 'Notas (opcional)';

  @override
  String get train_setHeader => 'SERIE';

  @override
  String get train_repsHeader => 'REPS';

  @override
  String get train_weightHeader => 'PESO';

  @override
  String get train_addSet => 'Añadir serie';

  @override
  String get train_nextSuggestion => 'Próxima carga sugerida';

  @override
  String get train_applySuggestion => 'Aplicar';

  @override
  String get train_abbreviationExercises => 'ej.';

  @override
  String get train_defaultRoutineName => 'Mi rutina';

  @override
  String get train_createRoutine => 'Crear rutina';

  @override
  String get train_editRoutine => 'Editar rutina';

  @override
  String train_routineUpdated(String name) {
    return 'Rutina \"$name\" actualizada';
  }

  @override
  String get train_addFirstExercise => 'Añadir primer ejercicio';

  @override
  String get train_addFirstExerciseHint =>
      'Toca aquí o «Añadir ejercicio» para agregar el primero.';

  @override
  String get train_removeSet => 'Eliminar serie';

  @override
  String get train_routinesHint =>
      'Cada día puede tener una o varias rutinas. Al empezar el día se hacen todas, en orden.';

  @override
  String get train_firstRoutineTitle => 'Crea tu primera rutina';

  @override
  String get train_firstRoutineBody =>
      'Elige los ejercicios y asígnale un día de la semana: ese día aparecerá en Inicio, lista para empezar.';

  @override
  String get train_freeSessionHint =>
      '¿Sin plan? Empieza una sesión libre y agrega ejercicios sobre la marcha.';

  @override
  String get profile_keepScreenOn => 'Pantalla encendida al entrenar';

  @override
  String get profile_keepScreenOnSubtitle =>
      'Evita que el teléfono se bloquee entre series';

  @override
  String get profile_weightUnit => 'Unidad de peso';

  @override
  String get weightUnit_kg => 'Kilogramos (kg)';

  @override
  String get weightUnit_lb => 'Libras (lb)';

  @override
  String get train_repShort => 'rep';

  @override
  String get rest_label => 'Descanso';

  @override
  String get rest_forExercise => 'Descanso para este ejercicio';

  @override
  String get rest_default => 'Predeterminado';

  @override
  String get rest_defaultHint =>
      'Usa el tiempo elegido en el temporizador de descanso';

  @override
  String get train_newRecords => 'Nuevos récords';

  @override
  String train_recordLine(String weight, String previous) {
    return '$weight (antes $previous)';
  }

  @override
  String train_volumeUp(String kg) {
    return '+$kg de volumen respecto a la última vez';
  }

  @override
  String train_volumeDown(String kg) {
    return '$kg menos de volumen que la última vez';
  }

  @override
  String get train_volumeSame => 'Mismo volumen que la última vez';

  @override
  String get train_discardWorkout => 'Descartar';

  @override
  String get train_previousHeader => 'ANTERIOR';

  @override
  String get train_usePrevious => 'Copiar valores anteriores';

  @override
  String get train_removeCompletedSetTitle => '¿Eliminar la serie completada?';

  @override
  String train_removeCompletedSetBody(int setNumber) {
    return 'La serie $setNumber ya está completada y dejará de contar en tu entrenamiento.';
  }

  @override
  String get train_createRoutineHint =>
      'Elige los ejercicios y déjala preparada para entrenarla cuando quieras.';

  @override
  String get train_routineNameRequired => 'Escribe un nombre para la rutina.';

  @override
  String train_addRoutineForDay(String day) {
    return 'Añadir otra rutina para el $day';
  }

  @override
  String get train_trainingDay => 'Día de entrenamiento';

  @override
  String get train_noAssignedDay => 'Sin día asignado';

  @override
  String get train_trainingDayHint =>
      'Agrúpala por día para encontrar toda la rutina junta.';

  @override
  String get train_organizeRoutine => 'Organizar rutina';

  @override
  String train_blockCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bloques',
      one: '1 bloque',
    );
    return '$_temp0';
  }

  @override
  String get train_noRoutinesForDay => 'Todavía no hay bloques para este día.';

  @override
  String get train_reorderBlocksHint =>
      'Mantén presionado y arrastra para cambiar el orden.';

  @override
  String get train_startCompleteRoutine => 'Empezar rutina completa';

  @override
  String train_routineForDay(String day) {
    return 'Rutina del $day';
  }

  @override
  String get train_bodyweightLabel => 'Peso corporal';

  @override
  String get train_chooseWeight => 'Elegir peso';

  @override
  String get picker_title => 'Seleccionar ejercicio';

  @override
  String get picker_searchHint => 'Buscar ejercicio...';

  @override
  String get picker_createManual => 'Crear ejercicio manual';

  @override
  String get picker_createManualSubtitle => 'Nombre, grupo muscular y equipo';

  @override
  String get picker_createTitle => 'Crear ejercicio';

  @override
  String get picker_nameLabel => 'Nombre';

  @override
  String get picker_nameHint => 'Ej: Curl martillo';

  @override
  String get picker_muscleGroupLabel => 'Grupo muscular';

  @override
  String get picker_equipmentLabel => 'Equipamiento';

  @override
  String get picker_addExercise => 'Añadir ejercicio';

  @override
  String get exercises_title => 'Ejercicios';

  @override
  String get exercises_searchHint => 'Buscar ejercicios...';

  @override
  String get exercises_muscleFilter => 'Músculo';

  @override
  String get exercises_equipmentFilter => 'Material';

  @override
  String exercises_countLabel(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ejercicios',
      one: '$count ejercicio',
    );
    return '$_temp0';
  }

  @override
  String get exercises_descriptionUnavailable =>
      'Las instrucciones detalladas aún no están disponibles en este idioma.';

  @override
  String get exercises_clearFilters => 'Limpiar filtros';

  @override
  String get exercises_noResults => 'Sin resultados';

  @override
  String get exercises_noResultsHint =>
      'Prueba con otros filtros o términos de búsqueda';

  @override
  String get exercises_deleteTitle => 'Eliminar ejercicio';

  @override
  String exercises_deleteConfirm(String name) {
    return '¿Eliminar \"$name\" de tu lista de ejercicios?';
  }

  @override
  String get exercises_muscleGroupLabel => 'Grupo muscular';

  @override
  String get exercises_materialLabel => 'Material';

  @override
  String get exercises_executionTitle => 'Ejecución';

  @override
  String get exercises_secondaryMuscles => 'Músculos secundarios';

  @override
  String get exercises_benefits => 'Beneficios';

  @override
  String get exercises_viewProgress => 'Ver progreso';

  @override
  String get exercises_addToWorkout => 'Añadir al entrenamiento';

  @override
  String get progress_maxWeight => 'Peso máx.';

  @override
  String get progress_volumeLabel => 'Volumen';

  @override
  String get progress_noData => 'Sin datos para este ejercicio';

  @override
  String get progress_needMoreSessions =>
      'Se necesitan al menos 2 sesiones para ver el progreso';

  @override
  String get progress_lastVolume => 'Último volumen';

  @override
  String get progress_lastWeight => 'Último peso';

  @override
  String get progress_best => 'Mejor';

  @override
  String get progress_progressLabel => 'Progreso';

  @override
  String get progress_historyTitle => 'Historial';

  @override
  String get history_title => 'Historial';

  @override
  String get history_exportCsv => 'Exportar CSV';

  @override
  String get history_allWorkouts => 'Todos los entrenamientos';

  @override
  String get history_noWorkoutsYet => 'Sin entrenamientos aún';

  @override
  String get history_noWorkoutsSubtitle =>
      'Completa tu primer entrenamiento en la pestaña Entrenar y aparecerá aquí.';

  @override
  String get history_weeklySummary => 'Resumen semanal';

  @override
  String get history_workouts => 'Entrenos';

  @override
  String get history_total => 'Total';

  @override
  String get history_volumeKg => 'Volumen';

  @override
  String get history_routinesByDay => 'Rutinas por día';

  @override
  String history_sessionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sesiones',
      one: '1 sesión',
    );
    return '$_temp0';
  }

  @override
  String history_dayRoutineTitle(String day) {
    return 'Entrenamientos del $day';
  }

  @override
  String get history_dayRoutineHint =>
      'Los bloques del mismo día aparecen juntos y en orden.';

  @override
  String get history_dayMon => 'L';

  @override
  String get history_dayTue => 'M';

  @override
  String get history_dayWed => 'X';

  @override
  String get history_dayThu => 'J';

  @override
  String get history_dayFri => 'V';

  @override
  String get history_daySat => 'S';

  @override
  String get history_daySun => 'D';

  @override
  String get history_exercisesPerformed => 'Ejercicios realizados';

  @override
  String history_setsCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count series',
      one: '1 serie',
    );
    return '$_temp0';
  }

  @override
  String get history_setHeader => 'Serie';

  @override
  String get detail_monthJan => 'enero';

  @override
  String get detail_monthFeb => 'febrero';

  @override
  String get detail_monthMar => 'marzo';

  @override
  String get detail_monthApr => 'abril';

  @override
  String get detail_monthMay => 'mayo';

  @override
  String get detail_monthJun => 'junio';

  @override
  String get detail_monthJul => 'julio';

  @override
  String get detail_monthAug => 'agosto';

  @override
  String get detail_monthSep => 'septiembre';

  @override
  String get detail_monthOct => 'octubre';

  @override
  String get detail_monthNov => 'noviembre';

  @override
  String get detail_monthDec => 'diciembre';

  @override
  String detail_dateFormat(int day, String month, int year) {
    return '$day de $month de $year';
  }

  @override
  String get paywall_subtitle => 'Desbloquea todo tu potencial';

  @override
  String get paywall_featureTemplates => 'Todas las rutinas predefinidas';

  @override
  String get paywall_featureMeasures =>
      'Cintura, pecho, cadera y fotos de progreso';

  @override
  String get paywall_featureExerciseProgress =>
      'Gráficos de progreso por ejercicio';

  @override
  String get paywall_allIncluded => 'Todo incluido';

  @override
  String get paywall_weekly => 'Semanal';

  @override
  String get paywall_monthly => 'Mensual';

  @override
  String get paywall_yearly => 'Anual';

  @override
  String get paywall_bestValue => 'Mejor valor';

  @override
  String get paywall_perWeek => '/semana';

  @override
  String get paywall_perMonth => '/mes';

  @override
  String get paywall_perYear => '/año';

  @override
  String get paywall_startTrial => 'Comenzar prueba gratis';

  @override
  String get paywall_subscribe => 'Suscribirse';

  @override
  String get paywall_restorePurchases => 'Restaurar compras';

  @override
  String get paywall_legalText =>
      'La suscripción se renueva automáticamente. Puedes cancelar\nen cualquier momento desde la App Store.';

  @override
  String get paywall_legalTextPlay =>
      'La suscripción se renueva automáticamente. Puedes cancelar\nen cualquier momento desde Google Play.';

  @override
  String get paywall_legalTextTrial =>
      'La prueba gratis se convierte en suscripción de pago. Cancela en cualquier momento antes de que termine. La suscripción se renueva automáticamente.';

  @override
  String get paywall_termsLink => 'Términos de uso';

  @override
  String get paywall_privacyLink => 'Política de privacidad';

  @override
  String get paywall_purchaseError => 'No se pudo completar la compra.';

  @override
  String get paywall_noPurchasesFound => 'No se encontraron compras previas.';

  @override
  String paywall_trialDays(int count) {
    return '$count días gratis';
  }

  @override
  String paywall_trialMonths(int count) {
    return '$count meses gratis';
  }

  @override
  String paywall_trialThenPrice(String price) {
    return 'luego $price';
  }

  @override
  String get paywall_offersUnavailable => 'No se pudieron cargar las ofertas';

  @override
  String get paywall_retry => 'Reintentar';

  @override
  String rest_of(String time) {
    return 'de $time';
  }

  @override
  String get progressScreen_measurements => 'Medidas';

  @override
  String get progressScreen_photos => 'Fotos';

  @override
  String get progressScreen_addMeasurement => 'Añadir medida';

  @override
  String get progressScreen_weight => 'Peso';

  @override
  String get progressScreen_noEntries => 'Sin registros aún';

  @override
  String get progressScreen_noPhotos => 'Sin fotos aún';

  @override
  String get progressScreen_camera => 'Cámara';

  @override
  String get progressScreen_gallery => 'Galería';

  @override
  String get progressScreen_waist => 'Cintura';

  @override
  String get progressScreen_chest => 'Pecho';

  @override
  String get progressScreen_hips => 'Cadera';

  @override
  String get progressScreen_record => 'registro';

  @override
  String get progressScreen_noDataMetric => 'Sin datos para esta métrica';

  @override
  String get progressScreen_addMoreRecords =>
      'Añade más registros para ver la gráfica';

  @override
  String get progressScreen_historyTitle => 'Historial';

  @override
  String get progressScreen_noEntriesSubtitle =>
      'Registra tu primer peso y medidas\npara ver tu evolución.';

  @override
  String get progressScreen_addFirstRecord => 'Añadir primer registro';

  @override
  String get progressScreen_progressPhotos => 'Fotos de progreso';

  @override
  String get progressScreen_progressPhotosHint =>
      'Registra tu progreso visual con fotos.\nDisponible con LiftWave PRO.';

  @override
  String get progressScreen_unlockWithPro => 'Desbloquear con PRO';

  @override
  String get progressScreen_noPhotosSubtitle =>
      'Añade una foto al registrar tus medidas\npara ver tu progreso visual.';

  @override
  String get progressScreen_addPhoto => 'Añadir foto';

  @override
  String get progressScreen_newRecord => 'Nuevo registro';

  @override
  String get progressScreen_photoAdded => 'Foto añadida';

  @override
  String get progressScreen_addPhotoOptional => 'Añadir foto (opcional)';

  @override
  String get progressScreen_saveRecord => 'Guardar registro';

  @override
  String get progressScreen_enterAtLeastOneValue =>
      'Introduce al menos un valor';

  @override
  String get progressScreen_monthShortJan => 'ene';

  @override
  String get progressScreen_monthShortFeb => 'feb';

  @override
  String get progressScreen_monthShortMar => 'mar';

  @override
  String get progressScreen_monthShortApr => 'abr';

  @override
  String get progressScreen_monthShortMay => 'may';

  @override
  String get progressScreen_monthShortJun => 'jun';

  @override
  String get progressScreen_monthShortJul => 'jul';

  @override
  String get progressScreen_monthShortAug => 'ago';

  @override
  String get progressScreen_monthShortSep => 'sep';

  @override
  String get progressScreen_monthShortOct => 'oct';

  @override
  String get progressScreen_monthShortNov => 'nov';

  @override
  String get progressScreen_monthShortDec => 'dic';

  @override
  String get achievement_firstWorkout_title => 'Primera sesión';

  @override
  String get achievement_firstWorkout_description =>
      'Completa tu primer entrenamiento';

  @override
  String get achievement_streak7_title => 'Racha de 7 días';

  @override
  String get achievement_streak7_description =>
      'Entrena al menos 1 vez en 7 días consecutivos';

  @override
  String get achievement_streak30_title => 'Racha de 30 días';

  @override
  String get achievement_streak30_description =>
      'Entrena al menos 1 vez por semana durante 30 días';

  @override
  String get achievement_volume1000_title => '1.000 kg levantados';

  @override
  String get achievement_volume1000_description =>
      'Acumula 1.000 kg de volumen total';

  @override
  String get achievement_volume5000_title => '5.000 kg levantados';

  @override
  String get achievement_volume5000_description =>
      'Acumula 5.000 kg de volumen total';

  @override
  String get achievement_volume10000_title => '10.000 kg levantados';

  @override
  String get achievement_volume10000_description =>
      'Acumula 10.000 kg de volumen total';

  @override
  String get achievement_personalRecord_title => 'Nuevo récord personal';

  @override
  String get achievement_personalRecord_description =>
      'Supera tu peso máximo en un ejercicio';

  @override
  String get achievement_streak14_title => 'Racha de 14 días';

  @override
  String get achievement_streak14_description =>
      'Entrena al menos 1 vez durante 14 días consecutivos';

  @override
  String get achievement_streak100_title => 'Racha de 100 días';

  @override
  String get achievement_streak100_description =>
      'Mantén la racha 100 días con al menos 1 entrenamiento por semana';

  @override
  String get achievement_streak365_title => 'Un año entrenando';

  @override
  String get achievement_streak365_description =>
      'Mantén la racha durante 1 año completo';

  @override
  String get achievement_bench50_title => 'Press 50 kg';

  @override
  String get achievement_bench50_description =>
      'Completa un press de banca con 50 kg o más';

  @override
  String get achievement_bench100_title => 'Press 100 kg';

  @override
  String get achievement_bench100_description =>
      'Completa un press de banca con 100 kg o más';

  @override
  String get achievement_squat100_title => 'Sentadilla 100 kg';

  @override
  String get achievement_squat100_description =>
      'Completa una sentadilla con 100 kg o más';

  @override
  String get achievement_squat150_title => 'Sentadilla 150 kg';

  @override
  String get achievement_squat150_description =>
      'Completa una sentadilla con 150 kg o más';

  @override
  String get achievement_deadlift100_title => 'Peso muerto 100 kg';

  @override
  String get achievement_deadlift100_description =>
      'Completa un peso muerto con 100 kg o más';

  @override
  String get achievement_deadlift150_title => 'Peso muerto 150 kg';

  @override
  String get achievement_deadlift150_description =>
      'Completa un peso muerto con 150 kg o más';

  @override
  String get achievement_deadlift200_title => 'Peso muerto 200 kg';

  @override
  String get achievement_deadlift200_description =>
      'Completa un peso muerto con 200 kg o más';

  @override
  String get achievement_explorer10_title => 'Explorador';

  @override
  String get achievement_explorer10_description =>
      'Usa 10 ejercicios diferentes en tus entrenamientos';

  @override
  String get achievement_master25_title => 'Maestro';

  @override
  String get achievement_master25_description =>
      'Usa 25 ejercicios diferentes en tus entrenamientos';

  @override
  String get achievement_fullBodyGroups_title => 'Cuerpo completo';

  @override
  String get achievement_fullBodyGroups_description =>
      'Entrena al menos una vez todos los grupos musculares';

  @override
  String get achievement_crossfitFan_title => 'CrossFit Fan';

  @override
  String get achievement_crossfitFan_description =>
      'Completa 10 ejercicios diferentes de la categoría CrossFit';

  @override
  String get achievement_time1h_title => '1 hora total';

  @override
  String get achievement_time1h_description =>
      'Acumula 1 hora total de entrenamiento';

  @override
  String get achievement_time10h_title => '10 horas';

  @override
  String get achievement_time10h_description =>
      'Acumula 10 horas totales de entrenamiento';

  @override
  String get achievement_time50h_title => '50 horas';

  @override
  String get achievement_time50h_description =>
      'Acumula 50 horas totales de entrenamiento';

  @override
  String get achievement_time100h_title => '100 horas';

  @override
  String get achievement_time100h_description =>
      'Acumula 100 horas totales de entrenamiento';

  @override
  String get achievement_earlyBird_title => 'Madrugador';

  @override
  String get achievement_earlyBird_description =>
      'Empieza un entrenamiento antes de las 7:00 AM';

  @override
  String get achievement_nightOwl_title => 'Búho nocturno';

  @override
  String get achievement_nightOwl_description =>
      'Termina un entrenamiento después de las 22:00';

  @override
  String get achievement_comeback_title => 'Comeback';

  @override
  String get achievement_comeback_description =>
      'Vuelves a entrenar tras 30+ días sin actividad';

  @override
  String get achievement_marathoner_title => 'Maratoniano';

  @override
  String get achievement_marathoner_description =>
      'Completa un entrenamiento de más de 90 minutos';

  @override
  String get achievement_efficient_title => 'Eficiente';

  @override
  String get achievement_efficient_description =>
      'Completa un entrenamiento de 3+ ejercicios en menos de 30 minutos';

  @override
  String get achievement_weekendWarrior_title => 'Guerrero de fin de semana';

  @override
  String get achievement_weekendWarrior_description =>
      'Entrena sábado y domingo durante 3 fines de semana seguidos';

  @override
  String get achievement_weeklyVariety_title => 'Variedad semanal';

  @override
  String get achievement_weeklyVariety_description =>
      'Entrena 5 grupos musculares diferentes en una semana';

  @override
  String get csv_header =>
      'Fecha,Entrenamiento,Ejercicio,Grupo Muscular,Serie,Reps,Peso (kg),Volumen (kg)';

  @override
  String get csv_subject => 'LiftWave - Historial de entrenamientos';

  @override
  String get template_fullBody_subtitle =>
      'Todos los grupos musculares en una sesión';

  @override
  String get template_fullBody_name => 'Full Body';

  @override
  String get template_push_name => 'Empuje';

  @override
  String get template_pull_name => 'Tracción';

  @override
  String get template_torso_name => 'Torso';

  @override
  String get template_push_subtitle => 'Pecho · Hombros · Tríceps';

  @override
  String get template_pull_subtitle => 'Espalda · Bíceps';

  @override
  String get template_torso_subtitle => 'Pecho · Espalda · Hombros';

  @override
  String get template_legs_subtitle => 'Cuádriceps · Isquios · Glúteos · Core';

  @override
  String get template_legs_name => 'Piernas';

  @override
  String get ex_pecho_6_name => 'Press inclinado con barra';

  @override
  String get ex_pecho_6_desc =>
      'Ajusta el banco a 30-45°. Agarra la barra con un agarre algo más ancho que los hombros. Baja la barra controladamente hasta la parte alta del pecho y empuja hacia arriba hasta extensión completa. Mantén la zona lumbar pegada al banco y los omóplatos retraídos.';

  @override
  String get ex_pecho_6_b1 =>
      'Enfatiza el pectoral superior (porción clavicular)';

  @override
  String get ex_pecho_6_b2 => 'Permite cargar más peso que con mancuernas';

  @override
  String get ex_pecho_6_b3 =>
      'Mejora la fuerza de empuje desde ángulos elevados';

  @override
  String get ex_pecho_7_name => 'Press declinado con mancuernas';

  @override
  String get ex_pecho_7_desc =>
      'Ajusta el banco a una declinación de 15-30°. Con una mancuerna en cada mano a la altura del pecho, empuja hacia arriba juntando las mancuernas en la parte superior. Baja con control sintiendo el estiramiento de la porción inferior del pecho.';

  @override
  String get ex_pecho_7_b1 => 'Trabaja la porción inferior del pectoral';

  @override
  String get ex_pecho_7_b2 => 'Reduce la implicación de los hombros';

  @override
  String get ex_pecho_7_b3 => 'Mayor rango que el press declinado con barra';

  @override
  String get ex_pecho_8_name => 'Flexiones';

  @override
  String get ex_pecho_8_desc =>
      'Apoya las manos en el suelo a la anchura de los hombros y los pies juntos. Mantén el cuerpo recto desde la cabeza hasta los talones. Baja flexionando los codos hasta casi rozar el pecho con el suelo y empuja de vuelta. Mantén el core apretado durante todo el movimiento.';

  @override
  String get ex_pecho_8_b1 => 'No requiere equipamiento';

  @override
  String get ex_pecho_8_b2 =>
      'Múltiples variantes para progresar (diamante, declinadas, palmada)';

  @override
  String get ex_pecho_8_b3 =>
      'Ejercicio compuesto que también fortalece el core';

  @override
  String get ex_pecho_9_name => 'Pullover con mancuerna';

  @override
  String get ex_pecho_9_desc =>
      'Túmbate en banco plano sosteniendo una mancuerna con ambas manos sobre el pecho, brazos extendidos. Baja la mancuerna en arco por encima de la cabeza hasta sentir el estiramiento del pecho y los dorsales. Vuelve a la posición inicial contrayendo el pecho.';

  @override
  String get ex_pecho_9_b1 => 'Trabaja simultáneamente pecho y dorsales';

  @override
  String get ex_pecho_9_b2 => 'Mejora la movilidad de hombros y caja torácica';

  @override
  String get ex_pecho_9_b3 =>
      'Excelente complemento entre series de press y remos';

  @override
  String get ex_esp_6_name => 'Remo en T';

  @override
  String get ex_esp_6_desc =>
      'Posiciónate sobre la barra en T con los pies a la anchura de los hombros. Inclínate hacia adelante manteniendo la espalda neutra y tira de las asas hacia el pecho llevando los codos atrás. Aprieta los omóplatos en la posición final y baja con control.';

  @override
  String get ex_esp_6_b1 => 'Desarrolla el grosor de la espalda media';

  @override
  String get ex_esp_6_b2 =>
      'Permite cargas muy altas con menor estrés lumbar que el remo libre';

  @override
  String get ex_esp_6_b3 => 'Trabaja la postura y la estabilidad escapular';

  @override
  String get ex_esp_7_name => 'Remo bajo en polea';

  @override
  String get ex_esp_7_desc =>
      'Siéntate frente a la polea baja con los pies apoyados. Agarra el accesorio con los brazos extendidos y la espalda neutra. Tira de las manos hacia el abdomen retrayendo los omóplatos y manteniendo el torso erguido. Regresa controladamente sin redondear la espalda.';

  @override
  String get ex_esp_7_b1 => 'Tensión constante a lo largo del movimiento';

  @override
  String get ex_esp_7_b2 => 'Fácil progresión de peso y técnica accesible';

  @override
  String get ex_esp_7_b3 =>
      'Excelente para desarrollar grosor de espalda media';

  @override
  String get ex_esp_8_name => 'Encogimientos con mancuernas';

  @override
  String get ex_esp_8_desc =>
      'De pie con una mancuerna en cada mano a los costados, brazos relajados. Eleva los hombros hacia las orejas sin doblar los codos. Mantén la contracción 1 segundo en la cima y baja lentamente. No rotes los hombros, el movimiento es puramente vertical.';

  @override
  String get ex_esp_8_b1 => 'Aislamiento directo del trapecio superior';

  @override
  String get ex_esp_8_b2 => 'Mejora la postura y la apariencia del cuello';

  @override
  String get ex_esp_8_b3 =>
      'Fortalece la estabilidad escapular para otros levantamientos';

  @override
  String get ex_esp_9_name => 'Good morning';

  @override
  String get ex_esp_9_desc =>
      'Coloca la barra sobre los trapecios como en una sentadilla. Con los pies a la anchura de las caderas y rodillas ligeramente flexionadas, inclínate hacia adelante desde las caderas manteniendo la espalda neutra. Baja hasta que el torso esté casi paralelo al suelo y vuelve apretando glúteos.';

  @override
  String get ex_esp_9_b1 => 'Fortalece la cadena posterior y la zona lumbar';

  @override
  String get ex_esp_9_b2 =>
      'Mejora la bisagra de cadera para peso muerto y sentadilla';

  @override
  String get ex_esp_9_b3 => 'Trabajo accesorio clave para powerlifting';

  @override
  String get ex_pier_6_name => 'Sentadilla frontal';

  @override
  String get ex_pier_6_desc =>
      'Coloca la barra sobre los deltoides frontales, codos altos y agarre cruzado o limpio. Pies a la anchura de los hombros. Baja manteniendo el torso vertical y los codos al frente hasta que los muslos pasen la paralela. Empuja con los talones para volver a la posición inicial.';

  @override
  String get ex_pier_6_b1 =>
      'Enfatiza más los cuádriceps que la sentadilla trasera';

  @override
  String get ex_pier_6_b2 => 'Exige un core muy fuerte y postura erguida';

  @override
  String get ex_pier_6_b3 => 'Base técnica para clean y thruster en CrossFit';

  @override
  String get ex_pier_7_name => 'Sentadilla búlgara';

  @override
  String get ex_pier_7_desc =>
      'Coloca el empeine del pie de atrás sobre un banco, sosteniendo una mancuerna en cada mano. Con el pie delantero adelantado, baja flexionando la rodilla delantera hasta que el muslo esté paralelo al suelo. Empuja a través del talón delantero para volver arriba.';

  @override
  String get ex_pier_7_b1 =>
      'Trabajo unilateral que corrige desequilibrios entre piernas';

  @override
  String get ex_pier_7_b2 => 'Activación intensa de glúteos y cuádriceps';

  @override
  String get ex_pier_7_b3 => 'Mejora el equilibrio y la estabilidad de cadera';

  @override
  String get ex_pier_8_name => 'Peso muerto rumano';

  @override
  String get ex_pier_8_desc =>
      'De pie con la barra a la altura de las caderas, agarre prono a la anchura de los hombros. Con las rodillas ligeramente flexionadas y fijas, desliza la barra por las piernas inclinando el torso desde las caderas hasta sentir tensión en isquios. Vuelve apretando glúteos.';

  @override
  String get ex_pier_8_b1 => 'Aislamiento intenso de isquiotibiales y glúteos';

  @override
  String get ex_pier_8_b2 =>
      'Fortalece la cadena posterior y mejora la bisagra de cadera';

  @override
  String get ex_pier_8_b3 =>
      'Reduce el riesgo de lesiones de isquios al correr o saltar';

  @override
  String get ex_pier_9_name => 'Extensión de cuádriceps';

  @override
  String get ex_pier_9_desc =>
      'Siéntate en la máquina con la espalda apoyada y el rodillo sobre el empeine. Extiende las rodillas levantando el peso hasta que las piernas estén casi rectas, sin bloquear las rodillas. Aprieta los cuádriceps en la cima y baja con control.';

  @override
  String get ex_pier_9_b1 => 'Aislamiento directo del cuádriceps';

  @override
  String get ex_pier_9_b2 =>
      'Útil para rehabilitación y trabajo de hipertrofia focalizado';

  @override
  String get ex_pier_9_b3 => 'Ajuste de carga preciso y de bajo riesgo';

  @override
  String get ex_pier_10_name => 'Elevación de talones';

  @override
  String get ex_pier_10_desc =>
      'Coloca los hombros bajo las almohadillas de la máquina de gemelos (o usa una mancuerna de pie). Apoya las puntas de los pies en una plataforma con los talones colgando. Sube empujando las puntas y aprieta los gemelos en la cima. Baja lentamente sintiendo el estiramiento.';

  @override
  String get ex_pier_10_b1 => 'Aislamiento del sóleo y gemelos';

  @override
  String get ex_pier_10_b2 => 'Mejora la potencia en saltos y sprints';

  @override
  String get ex_pier_10_b3 =>
      'Reduce el riesgo de lesiones en tobillo y tendón de Aquiles';

  @override
  String get ex_hom_5_name => 'Press de hombros con mancuernas';

  @override
  String get ex_hom_5_desc =>
      'Sentado con respaldo recto, sostén una mancuerna a cada lado de los hombros, palmas hacia adelante. Empuja las mancuernas hacia arriba hasta casi juntarlas por encima de la cabeza, sin bloquear los codos. Baja con control hasta la posición inicial.';

  @override
  String get ex_hom_5_b1 => 'Mayor rango de movimiento que el press con barra';

  @override
  String get ex_hom_5_b2 => 'Permite trabajar cada lado de forma independiente';

  @override
  String get ex_hom_5_b3 => 'Reduce el estrés en hombros respecto a la barra';

  @override
  String get ex_hom_6_name => 'Elevaciones frontales';

  @override
  String get ex_hom_6_desc =>
      'De pie con una mancuerna en cada mano frente a los muslos, palmas hacia el cuerpo. Eleva los brazos alternados o simultáneamente al frente hasta la altura de los hombros, manteniendo los codos casi extendidos. Baja lentamente sin balancearse.';

  @override
  String get ex_hom_6_b1 => 'Aislamiento del deltoides anterior';

  @override
  String get ex_hom_6_b2 => 'Mejora la apariencia frontal del hombro';

  @override
  String get ex_hom_6_b3 =>
      'Trabajo accesorio de press de banca y press militar';

  @override
  String get ex_hom_7_name => 'Pájaros con mancuernas';

  @override
  String get ex_hom_7_desc =>
      'Inclínate hacia adelante desde la cadera con el torso casi paralelo al suelo, mancuerna en cada mano y brazos colgando. Eleva los brazos lateralmente hasta la altura de los hombros, codos ligeramente flexionados. Aprieta el deltoides posterior arriba y baja con control.';

  @override
  String get ex_hom_7_b1 =>
      'Aislamiento del deltoides posterior, área clave para postura';

  @override
  String get ex_hom_7_b2 => 'Contrarresta los efectos del trabajo de empuje';

  @override
  String get ex_hom_7_b3 => 'Reduce el riesgo de lesiones del manguito rotador';

  @override
  String get ex_bra_6_name => 'Curl predicador';

  @override
  String get ex_bra_6_desc =>
      'Siéntate en el banco predicador con los brazos apoyados sobre la almohadilla. Agarra la barra (recta o Z) con agarre supino. Flexiona los codos llevando la barra hacia los hombros, controlando el movimiento. Baja lentamente sin bloquear los codos al final.';

  @override
  String get ex_bra_6_b1 => 'Aísla el bíceps al inmovilizar el hombro';

  @override
  String get ex_bra_6_b2 => 'Imposibilita usar impulso, técnica estricta';

  @override
  String get ex_bra_6_b3 => 'Excelente para la contracción máxima del bíceps';

  @override
  String get ex_bra_7_name => 'Curl concentrado';

  @override
  String get ex_bra_7_desc =>
      'Siéntate en un banco con las piernas abiertas. Apoya el codo del brazo de trabajo contra la cara interna del muslo, mancuerna colgando. Flexiona el codo llevando la mancuerna hacia el hombro, aislando el bíceps. Aprieta arriba y baja con control.';

  @override
  String get ex_bra_7_b1 =>
      'Aislamiento puro del bíceps con máxima contracción';

  @override
  String get ex_bra_7_b2 => 'Permite enfocarse en la conexión mente-músculo';

  @override
  String get ex_bra_7_b3 => 'Ideal como ejercicio final del entreno de brazos';

  @override
  String get ex_bra_8_name => 'Press cerrado de banca';

  @override
  String get ex_bra_8_desc =>
      'Túmbate en banco plano y agarra la barra con un agarre cerrado a la anchura de los hombros. Baja la barra controladamente hasta rozar el esternón manteniendo los codos pegados al cuerpo. Empuja hacia arriba enfatizando la extensión de tríceps.';

  @override
  String get ex_bra_8_b1 => 'Ejercicio compuesto que enfatiza los tríceps';

  @override
  String get ex_bra_8_b2 =>
      'Permite cargar más peso que un aislamiento de tríceps';

  @override
  String get ex_bra_8_b3 =>
      'Transfiere a fuerza en press de banca y press militar';

  @override
  String get ex_bra_9_name => 'Fondos en banco';

  @override
  String get ex_bra_9_desc =>
      'Apoya las manos en un banco a tu espalda con los dedos hacia adelante. Extiende las piernas frente a ti apoyando los talones (o con rodillas flexionadas para facilitar). Baja flexionando los codos hacia atrás hasta 90° y empuja para subir.';

  @override
  String get ex_bra_9_b1 =>
      'Aislamiento del tríceps sin necesidad de equipamiento';

  @override
  String get ex_bra_9_b2 => 'Fácil de progresar añadiendo peso en el regazo';

  @override
  String get ex_bra_9_b3 =>
      'Mejora la fuerza de empuje desde posiciones detrás del cuerpo';

  @override
  String get ex_core_5_name => 'Russian twists';

  @override
  String get ex_core_5_desc =>
      'Sentado en el suelo con las rodillas flexionadas y los pies elevados o apoyados, inclínate hacia atrás 45°. Junta las manos (o sostén un peso) y gira el torso de lado a lado tocando el suelo o llevando el peso a cada lateral. Mantén el core apretado.';

  @override
  String get ex_core_5_b1 => 'Aislamiento directo de los oblicuos';

  @override
  String get ex_core_5_b2 => 'Mejora la rotación del torso, clave en deportes';

  @override
  String get ex_core_5_b3 =>
      'Se puede progresar añadiendo peso (mancuerna, disco, balón)';

  @override
  String get ex_core_6_name => 'Mountain climbers';

  @override
  String get ex_core_6_desc =>
      'Adopta la posición de plancha alta con las manos bajo los hombros. Lleva una rodilla hacia el pecho de forma alternada y rápida, como si corrieras en el sitio. Mantén la cadera baja y el core apretado durante todo el movimiento.';

  @override
  String get ex_core_6_b1 => 'Combina trabajo de core con cardio';

  @override
  String get ex_core_6_b2 => 'No requiere equipamiento, ideal para HIIT';

  @override
  String get ex_core_6_b3 => 'Mejora la coordinación y la resistencia';

  @override
  String get ex_core_7_name => 'Hollow hold';

  @override
  String get ex_core_7_desc =>
      'Túmbate boca arriba con brazos extendidos por encima de la cabeza y piernas estiradas. Eleva ligeramente los brazos y las piernas del suelo, llevando la zona lumbar contra el suelo. Mantén la posición de \"barco\" con el core completamente contraído.';

  @override
  String get ex_core_7_b1 =>
      'Base gimnástica para muchos movimientos de CrossFit';

  @override
  String get ex_core_7_b2 =>
      'Fortalece el core en su totalidad de forma isométrica';

  @override
  String get ex_core_7_b3 =>
      'Mejora la postura y la fuerza para dominadas estrictas';

  @override
  String get ex_core_8_name => 'Plancha lateral';

  @override
  String get ex_core_8_desc =>
      'Túmbate de lado con el antebrazo apoyado y el codo bajo el hombro. Eleva la cadera del suelo formando una línea recta desde los pies hasta la cabeza. Mantén la posición sin que la cadera se hunda. Repite del otro lado.';

  @override
  String get ex_core_8_b1 => 'Aislamiento intenso de oblicuos y core lateral';

  @override
  String get ex_core_8_b2 => 'Mejora la estabilidad de cadera y columna';

  @override
  String get ex_core_8_b3 => 'Sin equipamiento y bajo impacto';

  @override
  String get ex_core_9_name => 'Dead bug';

  @override
  String get ex_core_9_desc =>
      'Túmbate boca arriba con brazos extendidos hacia el techo y rodillas flexionadas a 90° sobre las caderas. Baja simultáneamente el brazo derecho por detrás de la cabeza y la pierna izquierda extendida hacia el suelo. Vuelve y alterna lados manteniendo la zona lumbar pegada al suelo.';

  @override
  String get ex_core_9_b1 => 'Mejora la estabilidad anti-extensión del core';

  @override
  String get ex_core_9_b2 =>
      'Excelente para principiantes y rehabilitación lumbar';

  @override
  String get ex_core_9_b3 => 'Trabaja la coordinación contralateral';

  @override
  String get ex_cf_1_name => 'Cargada (Clean)';

  @override
  String get ex_cf_1_desc =>
      'Desde el suelo, agarra la barra con agarre prono justo por fuera de las rodillas. Tira explosivamente extendiendo caderas y rodillas, encoge los hombros y desliza el cuerpo bajo la barra recibiéndola en sentadilla frontal con los codos altos. Levántate completando el lift.';

  @override
  String get ex_cf_1_b1 =>
      'Levantamiento olímpico completo de potencia explosiva';

  @override
  String get ex_cf_1_b2 =>
      'Desarrolla coordinación, velocidad y fuerza simultáneamente';

  @override
  String get ex_cf_1_b3 => 'Base de muchos WODs de CrossFit';

  @override
  String get ex_cf_2_name => 'Power Clean';

  @override
  String get ex_cf_2_desc =>
      'Igual que el Clean pero sin recibir en sentadilla completa: recibes la barra en cuarto de sentadilla con codos altos y la frontal en los hombros. Más rápido y menos exigente de movilidad que el Clean.';

  @override
  String get ex_cf_2_b1 =>
      'Desarrolla potencia explosiva de la cadena posterior';

  @override
  String get ex_cf_2_b2 => 'Más accesible técnicamente que el Clean completo';

  @override
  String get ex_cf_2_b3 => 'Excelente para principiantes en lifts olímpicos';

  @override
  String get ex_cf_3_name => 'Arrancada (Snatch)';

  @override
  String get ex_cf_3_desc =>
      'Desde el suelo, agarra la barra con agarre muy ancho. Tira explosivamente y recibe la barra por encima de la cabeza con los brazos extendidos en una sentadilla profunda (overhead squat). Levántate manteniendo la barra arriba.';

  @override
  String get ex_cf_3_b1 =>
      'El lift olímpico más completo y técnicamente exigente';

  @override
  String get ex_cf_3_b2 =>
      'Desarrolla potencia, movilidad y estabilidad simultáneamente';

  @override
  String get ex_cf_3_b3 =>
      'Quema más calorías que casi cualquier otro ejercicio';

  @override
  String get ex_cf_4_name => 'Power Snatch';

  @override
  String get ex_cf_4_desc =>
      'Igual que el Snatch pero recibiendo la barra en cuarto de sentadilla con los brazos extendidos por encima de la cabeza. Más rápido y menos exigente de movilidad de tobillos y caderas.';

  @override
  String get ex_cf_4_b1 => 'Más accesible que el Snatch completo';

  @override
  String get ex_cf_4_b2 => 'Desarrolla potencia explosiva de cadena posterior';

  @override
  String get ex_cf_4_b3 => 'Excelente para movilidad y coordinación';

  @override
  String get ex_cf_5_name => 'Thruster';

  @override
  String get ex_cf_5_desc =>
      'Sostén la barra en posición frontal (sobre los deltoides delanteros). Realiza una sentadilla frontal completa y, al subir, usa el impulso de las piernas para empujar la barra por encima de la cabeza con los brazos extendidos. Baja la barra a la posición frontal y repite.';

  @override
  String get ex_cf_5_b1 => 'Trabaja todo el cuerpo en un solo movimiento';

  @override
  String get ex_cf_5_b2 => 'Ejercicio estrella de WODs como \"Fran\"';

  @override
  String get ex_cf_5_b3 => 'Combina fuerza y resistencia metabólica';

  @override
  String get ex_cf_6_name => 'Push Press';

  @override
  String get ex_cf_6_desc =>
      'Con la barra en posición frontal sobre los hombros, realiza un dip rápido flexionando ligeramente las rodillas. Extiende explosivamente las piernas para impulsar la barra por encima de la cabeza hasta los brazos extendidos. Baja con control a la posición inicial.';

  @override
  String get ex_cf_6_b1 =>
      'Permite mover más peso que el press militar estricto';

  @override
  String get ex_cf_6_b2 => 'Desarrolla potencia de empuje vertical';

  @override
  String get ex_cf_6_b3 => 'Transfiere a Jerk y otros lifts olímpicos';

  @override
  String get ex_cf_7_name => 'Push Jerk';

  @override
  String get ex_cf_7_desc =>
      'Igual que el Push Press pero al impulsar la barra arriba, sueltas las piernas para recibir la barra en cuarto de sentadilla con los brazos ya extendidos. Después, levántate completando el lift. Permite cargar más peso que el Push Press.';

  @override
  String get ex_cf_7_b1 =>
      'Mueve más peso por encima de la cabeza que cualquier press';

  @override
  String get ex_cf_7_b2 => 'Lift olímpico técnico y de alta potencia';

  @override
  String get ex_cf_7_b3 => 'Componente del Clean & Jerk';

  @override
  String get ex_cf_8_name => 'Wall Balls';

  @override
  String get ex_cf_8_desc =>
      'De pie con un balón medicinal frente al pecho, mirando a una pared. Realiza una sentadilla profunda y al subir lanza la pelota hacia un objetivo alto en la pared (~3 m). Atrapa la pelota a la altura del pecho y desciende inmediatamente a la siguiente sentadilla.';

  @override
  String get ex_cf_8_b1 => 'Ejercicio cardiovascular y de potencia simultáneo';

  @override
  String get ex_cf_8_b2 =>
      'Movimiento estándar en muchos benchmarks de CrossFit';

  @override
  String get ex_cf_8_b3 => 'Trabaja la coordinación y el ritmo';

  @override
  String get ex_cf_9_name => 'Kettlebell Swing americano';

  @override
  String get ex_cf_9_desc =>
      'De pie con la kettlebell colgando entre las piernas con ambas manos. Bisagra de cadera para llevarla atrás y extiende explosivamente las caderas para impulsarla por encima de la cabeza con los brazos extendidos. La fuerza viene de la cadera, no de los brazos.';

  @override
  String get ex_cf_9_b1 => 'Desarrolla potencia explosiva de cadera';

  @override
  String get ex_cf_9_b2 => 'Cardio y fuerza en un solo movimiento';

  @override
  String get ex_cf_9_b3 =>
      'Estándar en CrossFit (los rusos van solo hasta el pecho)';

  @override
  String get ex_cf_10_name => 'Kettlebell Swing ruso';

  @override
  String get ex_cf_10_desc =>
      'Idéntico al swing americano pero la kettlebell solo se eleva hasta la altura del pecho/ojos, no por encima de la cabeza. Más fácil técnicamente y de menor estrés en hombros.';

  @override
  String get ex_cf_10_b1 => 'Punto de entrada al trabajo con kettlebell';

  @override
  String get ex_cf_10_b2 => 'Menos estrés de hombro que el swing americano';

  @override
  String get ex_cf_10_b3 => 'Ideal para principiantes y altas repeticiones';

  @override
  String get ex_cf_11_name => 'Box Jumps';

  @override
  String get ex_cf_11_desc =>
      'Frente a un cajón o plataforma estable, flexiona las rodillas y salta sobre el cajón aterrizando con los pies completamente sobre la superficie. Extiende caderas y rodillas en la cima. Baja saltando o paso a paso para reducir impacto.';

  @override
  String get ex_cf_11_b1 => 'Pliometría pura para desarrollar potencia';

  @override
  String get ex_cf_11_b2 => 'Mejora el salto vertical y la explosividad';

  @override
  String get ex_cf_11_b3 => 'Componente clásico de muchos WODs';

  @override
  String get ex_cf_12_name => 'Burpees';

  @override
  String get ex_cf_12_desc =>
      'De pie, agáchate y apoya las manos en el suelo. Salta con los pies hacia atrás hasta la posición de plancha. Realiza una flexión tocando el pecho al suelo. Salta con los pies de vuelta hacia las manos y salta vertical extendiendo los brazos arriba.';

  @override
  String get ex_cf_12_b1 => 'Ejercicio full-body sin equipamiento';

  @override
  String get ex_cf_12_b2 => 'Cardio intenso y trabajo de fuerza simultáneo';

  @override
  String get ex_cf_12_b3 =>
      'Estándar de benchmarks como \"Murph\" y muchos WODs';

  @override
  String get ex_cf_13_name => 'Toes-to-Bar';

  @override
  String get ex_cf_13_desc =>
      'Cuelga de la barra con agarre prono. Activa los dorsales y eleva las piernas extendidas (o con ligera flexión) hasta tocar la barra con los pies. Baja con control sin balanceo excesivo. Usa el \"kip\" para mantener cadencia.';

  @override
  String get ex_cf_13_b1 => 'Trabajo dinámico de core de alta exigencia';

  @override
  String get ex_cf_13_b2 => 'Mejora la fuerza de agarre y los dorsales';

  @override
  String get ex_cf_13_b3 => 'Componente de muchos WODs de CrossFit';

  @override
  String get ex_cf_14_name => 'Knees-to-Elbow';

  @override
  String get ex_cf_14_desc =>
      'Cuelga de la barra con agarre prono. Flexiona las caderas y rodillas llevando las rodillas hacia los codos en un movimiento dinámico controlado. Baja con control. Útil como progresión hacia los Toes-to-Bar.';

  @override
  String get ex_cf_14_b1 => 'Progresión hacia Toes-to-Bar';

  @override
  String get ex_cf_14_b2 =>
      'Trabajo de core dinámico sin tanta exigencia técnica';

  @override
  String get ex_cf_14_b3 => 'Mejora la fuerza de agarre';

  @override
  String get ex_cf_15_name => 'Muscle-Up';

  @override
  String get ex_cf_15_desc =>
      'Cuélgate de las anillas (o barra) con agarre falso. Tira explosivamente del cuerpo hacia arriba haciendo una transición sobre las anillas y, en la cima, empuja extendiendo los brazos hasta quedar en soporte arriba. Baja controlando la transición inversa.';

  @override
  String get ex_cf_15_b1 =>
      'Movimiento gimnástico avanzado de tracción + empuje';

  @override
  String get ex_cf_15_b2 => 'Hito clave en CrossFit (RX en muchos WODs)';

  @override
  String get ex_cf_15_b3 =>
      'Desarrolla fuerza relativa al peso corporal extrema';

  @override
  String get ex_cf_16_name => 'Pistol Squat';

  @override
  String get ex_cf_16_desc =>
      'De pie sobre una pierna, extiende la otra al frente paralela al suelo. Baja en sentadilla profunda manteniendo el equilibrio y el pie de apoyo plano. Sube empujando con el talón sin que la pierna libre toque el suelo. Repite del otro lado.';

  @override
  String get ex_cf_16_b1 => 'Sentadilla unilateral de máxima dificultad';

  @override
  String get ex_cf_16_b2 => 'Desarrolla movilidad de tobillo y cadera';

  @override
  String get ex_cf_16_b3 => 'Trabajo unilateral que corrige asimetrías';

  @override
  String get ex_cf_17_name => 'Handstand Push-Up (HSPU)';

  @override
  String get ex_cf_17_desc =>
      'Apoya las manos en el suelo a unos 30 cm de una pared y patea hacia arriba hasta quedar en parada de manos contra la pared. Baja flexionando los codos hasta que la cabeza toque el suelo (o un abmat). Empuja para volver arriba. Usa el \"kip\" si necesitas asistencia.';

  @override
  String get ex_cf_17_b1 => 'Press vertical con peso corporal completo';

  @override
  String get ex_cf_17_b2 => 'Mejora la estabilidad de hombro y core';

  @override
  String get ex_cf_17_b3 => 'Hito gimnástico clave en CrossFit';

  @override
  String get ex_cf_18_name => 'Turkish Get-Up';

  @override
  String get ex_cf_18_desc =>
      'Túmbate boca arriba sosteniendo una kettlebell con un brazo extendido hacia el techo. Levántate paso a paso (codo → mano → bisagra de cadera → barrida de pierna → arrodillado → de pie) manteniendo siempre la kettlebell arriba. Invierte el movimiento.';

  @override
  String get ex_cf_18_b1 => 'Movimiento funcional total-body único';

  @override
  String get ex_cf_18_b2 => 'Mejora la movilidad, estabilidad y coordinación';

  @override
  String get ex_cf_18_b3 => 'Excelente trabajo de hombro y core';

  @override
  String get ex_cf_19_name => 'Double Unders';

  @override
  String get ex_cf_19_desc =>
      'Salta a la cuerda haciéndola pasar dos veces bajo los pies en cada salto. Mantén los saltos bajos y el ritmo de muñeca rápido. Brazos pegados al cuerpo, codos cerca de la cintura. Requiere coordinación y cuerda de velocidad.';

  @override
  String get ex_cf_19_b1 => 'Cardio explosivo de alta intensidad';

  @override
  String get ex_cf_19_b2 => 'Mejora la coordinación y el timing';

  @override
  String get ex_cf_19_b3 => 'Estándar en cientos de WODs de CrossFit';

  @override
  String get ex_cf_20_name => 'Farmer\'s Carry';

  @override
  String get ex_cf_20_desc =>
      'Sostén una mancuerna o kettlebell pesada en cada mano a los costados. Camina con pasos cortos manteniendo la postura erguida, hombros atrás y core apretado. Recorre una distancia determinada o trabaja por tiempo.';

  @override
  String get ex_cf_20_b1 => 'Fortalece el agarre y los antebrazos';

  @override
  String get ex_cf_20_b2 => 'Trabajo funcional de todo el cuerpo';

  @override
  String get ex_cf_20_b3 => 'Mejora la postura y la estabilidad del core';

  @override
  String get ex_cf_21_name => 'Goblet Squat';

  @override
  String get ex_cf_21_desc =>
      'Sostén una kettlebell (o mancuerna) frente al pecho a la altura del esternón, agarrándola por las \"campanas\". Realiza una sentadilla profunda manteniendo el torso vertical y los codos al frente. Empuja con los talones para volver arriba.';

  @override
  String get ex_cf_21_b1 =>
      'Punto de entrada perfecto a la sentadilla con carga';

  @override
  String get ex_cf_21_b2 => 'Enseña postura erguida y profundidad correcta';

  @override
  String get ex_cf_21_b3 => 'Excelente para activar el core';

  @override
  String get ex_pecho_1_name => 'Press de banca';

  @override
  String get ex_pecho_2_name => 'Press inclinado con mancuernas';

  @override
  String get ex_pecho_3_name => 'Aperturas con mancuernas';

  @override
  String get ex_pecho_4_name => 'Fondos en paralelas';

  @override
  String get ex_pecho_5_name => 'Cruce de poleas';

  @override
  String get ex_esp_1_name => 'Peso muerto';

  @override
  String get ex_esp_2_name => 'Dominadas';

  @override
  String get ex_esp_3_name => 'Remo con barra';

  @override
  String get ex_esp_4_name => 'Remo con mancuerna';

  @override
  String get ex_esp_5_name => 'Jalón al pecho';

  @override
  String get ex_pier_1_name => 'Sentadilla con barra';

  @override
  String get ex_pier_2_name => 'Prensa de piernas';

  @override
  String get ex_pier_3_name => 'Hip thrust';

  @override
  String get ex_pier_4_name => 'Zancadas';

  @override
  String get ex_pier_5_name => 'Curl de isquiotibiales';

  @override
  String get ex_hom_1_name => 'Press militar';

  @override
  String get ex_hom_2_name => 'Elevaciones laterales';

  @override
  String get ex_hom_3_name => 'Face pull';

  @override
  String get ex_hom_4_name => 'Press Arnold';

  @override
  String get ex_bra_1_name => 'Curl de bíceps con mancuernas';

  @override
  String get ex_bra_2_name => 'Curl en barra Z';

  @override
  String get ex_bra_3_name => 'Curl martillo';

  @override
  String get ex_bra_4_name => 'Extensión de tríceps en polea';

  @override
  String get ex_bra_5_name => 'Press francés';

  @override
  String get ex_core_1_name => 'Plancha';

  @override
  String get ex_core_2_name => 'Crunch abdominal';

  @override
  String get ex_core_3_name => 'Elevación de piernas colgado';

  @override
  String get ex_core_4_name => 'Rueda abdominal';

  @override
  String get ex_pecho_1_desc =>
      'Túmbate en un banco plano con los pies apoyados en el suelo. Agarra la barra con un agarre más ancho que los hombros. Baja la barra controladamente hasta rozar el pecho y empuja hasta la extensión completa. Mantén los omóplatos retraídos durante todo el movimiento.';

  @override
  String get ex_pecho_2_desc =>
      'Ajusta el banco a 30-45°. Siéntate con una mancuerna en cada mano apoyadas sobre los muslos. Al reclinarte, lleva las mancuernas a la altura del pecho con los codos a 45° del cuerpo. Empuja hacia arriba y adentro hasta casi juntar las mancuernas en la parte superior.';

  @override
  String get ex_pecho_3_desc =>
      'Túmbate en banco plano con una mancuerna en cada mano, brazos extendidos sobre el pecho y codos ligeramente flexionados. Baja los brazos en arco amplio hasta sentir el estiramiento del pecho, luego vuelve a la posición inicial apretando el pecho en la parte superior.';

  @override
  String get ex_pecho_4_desc =>
      'Sujétate a las barras paralelas con los brazos extendidos. Inclina el torso ligeramente hacia adelante para activar más el pecho. Baja el cuerpo flexionando los codos hasta que los brazos estén paralelos al suelo. Empuja para volver al inicio sin bloquear los codos.';

  @override
  String get ex_pecho_5_desc =>
      'Coloca las poleas en la posición alta. Agarra los tiradores y da un paso adelante. Con los codos ligeramente flexionados, cruza los brazos hacia adelante y abajo hasta que las manos se junten frente a ti. Contrae el pecho en la posición final y regresa lentamente.';

  @override
  String get ex_esp_1_desc =>
      'Colócate frente a la barra con los pies a la anchura de las caderas. Agárrala con agarre prono o mixto justo por fuera de las rodillas. Mantén la espalda recta y el pecho alto. Empuja el suelo con los pies mientras extiendes caderas y rodillas hasta estar completamente erguido. Baja controladamente.';

  @override
  String get ex_esp_2_desc =>
      'Cuelga de la barra con agarre prono (palmas hacia afuera) más ancho que los hombros. Activa los omóplatos y tira del cuerpo hacia arriba hasta que la barbilla supere la barra. Baja lentamente con control. Evita el balanceo y mantén el core apretado durante todo el movimiento.';

  @override
  String get ex_esp_3_desc =>
      'Con los pies a la anchura de los hombros, inclínate hacia adelante unos 45° manteniendo la espalda neutra. Agarra la barra con agarre prono, un poco más ancho que los hombros. Tira de la barra hacia el abdomen retrayendo los omóplatos. Baja controladamente sin dejar caer el torso.';

  @override
  String get ex_esp_4_desc =>
      'Apoya la rodilla y la mano del mismo lado en un banco. Con la espalda paralela al suelo y neutra, agarra la mancuerna con la mano libre. Tira de la mancuerna hacia la cadera retrayendo el omóplato. El codo debe pasar rozando el costado. Baja con control completo.';

  @override
  String get ex_esp_5_desc =>
      'Siéntate en la máquina de jalón y agarra la barra ancha con agarre prono. Con el torso ligeramente inclinado hacia atrás, tira de la barra hacia el pecho retrayendo los omóplatos y bajando los codos. No te columpiés. Regresa lentamente a la posición inicial con control.';

  @override
  String get ex_pier_1_desc =>
      'Coloca la barra sobre los trapecios. Pies a la anchura de los hombros o ligeramente más abiertos. Baja flexionando rodillas y caderas manteniendo el pecho alto y la espalda neutra hasta que los muslos queden paralelos al suelo. Empuja a través de los talones para volver arriba.';

  @override
  String get ex_pier_2_desc =>
      'Siéntate en la máquina con la espalda completamente apoyada. Coloca los pies a la anchura de los hombros en la plataforma. Libera los seguros y baja la plataforma hasta que las rodillas formen ~90°, luego empuja hasta casi la extensión completa sin bloquear las rodillas.';

  @override
  String get ex_pier_3_desc =>
      'Apoya los omóplatos en un banco resistente con la barra sobre las caderas (usa una almohadilla). Pies apoyados en el suelo a la anchura de los hombros. Baja las caderas al suelo y luego empuja hacia arriba apretando los glúteos hasta que las caderas estén paralelas al suelo.';

  @override
  String get ex_pier_4_desc =>
      'De pie con una mancuerna en cada mano. Da un paso largo hacia adelante y baja la rodilla trasera hasta casi tocar el suelo. La rodilla delantera no debe sobrepasar la punta del pie. Empuja con el talón delantero para volver a la posición inicial. Alterna las piernas.';

  @override
  String get ex_pier_5_desc =>
      'Túmbate boca abajo en la máquina con los talones bajo el rodillo. Flexiona las rodillas llevando los talones hacia los glúteos en un movimiento controlado. En la posición final aprieta los isquiotibiales. Baja lentamente sin dejar que los pesos descansen.';

  @override
  String get ex_hom_1_desc =>
      'De pie o sentado, con la barra a la altura de los hombros y agarre prono ligeramente más ancho que ellos. Empuja la barra verticalmente por encima de la cabeza hasta la extensión completa. Baja de forma controlada hasta la posición inicial. Mantén el core activo para proteger la lumbar.';

  @override
  String get ex_hom_2_desc =>
      'De pie con una mancuerna en cada mano a los costados, palmas hacia dentro. Con los codos ligeramente flexionados, eleva los brazos lateralmente hasta la altura de los hombros. Baja lentamente. Evita balancearte o usar impulso; el movimiento debe ser puro y controlado.';

  @override
  String get ex_hom_3_desc =>
      'Coloca la cuerda en la polea alta. Agarra los extremos con las palmas hacia abajo y da un paso atrás. Tira de la cuerda hacia tu cara separando los codos a la altura de los hombros y llevando las manos hacia las orejas. Aprieta los deltoides posteriores en el punto final.';

  @override
  String get ex_hom_4_desc =>
      'Sentado con las mancuernas frente a ti a la altura de los hombros, palmas hacia ti. Al empujar hacia arriba, rota las palmas hacia afuera de forma que en la cima estén mirando al frente. Baja invirtiendo el movimiento de rotación hasta la posición inicial. Movimiento fluido y continuo.';

  @override
  String get ex_bra_1_desc =>
      'De pie con una mancuerna en cada mano, brazos extendidos y palmas al frente. Flexiona los codos llevando las mancuernas hacia los hombros sin mover la parte superior del brazo. Aprieta el bíceps en la cima. Baja controladamente hasta la extensión completa.';

  @override
  String get ex_bra_2_desc =>
      'De pie con la barra Z en agarre supino a la anchura de los hombros. Mantén los codos pegados a los costados y flexiona hasta llevar la barra a la altura del pecho. Baja controladamente sintiendo el estiramiento completo del bíceps. La barra Z reduce la tensión en las muñecas.';

  @override
  String get ex_bra_3_desc =>
      'De pie con una mancuerna en cada mano en agarre neutro (palmas enfrentadas, como si sujetaras un martillo). Flexiona los codos alternando o simultáneamente, llevando las mancuernas hacia los hombros. Mantén los codos pegados al cuerpo en todo momento. Baja con control.';

  @override
  String get ex_bra_4_desc =>
      'Coloca la cuerda o barra en la polea alta. Agarra el accesorio con los codos flexionados y pegados al torso. Empuja hacia abajo extendiendo los codos completamente sin moverlos. Separa ligeramente las manos al final si usas cuerda. Regresa lentamente resistiendo el peso.';

  @override
  String get ex_bra_5_desc =>
      'Túmbate en banco con la barra Z a brazos extendidos sobre el pecho. Con los codos apuntando al techo, baja la barra hacia la frente flexionando solo los codos. Extiende nuevamente a la posición inicial. Los codos deben permanecer fijos; solo se mueve el antebrazo.';

  @override
  String get ex_core_1_desc =>
      'Apoya los antebrazos y las puntas de los pies en el suelo. Mantén el cuerpo recto como una tabla: cadera sin elevar ni hundir, glúteos apretados y abdomen contraído. Respira de forma constante. Mantén la posición el tiempo objetivo sin comprometer la forma.';

  @override
  String get ex_core_2_desc =>
      'Túmbate boca arriba con rodillas flexionadas y pies apoyados. Coloca las manos detrás de la cabeza sin tirar del cuello. Contrae el abdomen elevando los hombros del suelo unos 30° y apretando el recto abdominal en la cima. Baja controladamente sin relajar completamente el abdomen.';

  @override
  String get ex_core_3_desc =>
      'Cuélgate de la barra con agarre prono a la anchura de los hombros. Con piernas ligeramente flexionadas, eleva las rodillas o piernas hasta la horizontal (o más arriba) contrayendo el abdomen. Baja lentamente sin balancearte. El movimiento debe venir de la flexión de cadera, no del impulso.';

  @override
  String get ex_core_4_desc =>
      'Arrodíllate con la rueda frente a ti. Agarra las asas y rueda hacia adelante extendiendo el cuerpo lentamente hasta casi tocar el suelo. Contrae el core para volver a la posición inicial sin hundir la cadera. Mantén la espalda neutra y el abdomen apretado durante todo el movimiento.';

  @override
  String get secondary_triceps => 'Tríceps';

  @override
  String get secondary_anteriorDeltoid => 'Deltoides anterior';

  @override
  String get secondary_biceps => 'Bíceps';

  @override
  String get secondary_glutes => 'Glúteos';

  @override
  String get secondary_hamstrings => 'Isquiotibiales';

  @override
  String get secondary_trapezius => 'Trapecios';

  @override
  String get secondary_rhomboids => 'Romboides';

  @override
  String get secondary_lowerBack => 'Espalda baja';

  @override
  String get secondary_quads => 'Cuádriceps';

  @override
  String get secondary_calves => 'Gemelos';

  @override
  String get secondary_rotatorCuff => 'Manguito rotador';

  @override
  String get secondary_brachialis => 'Braquial';

  @override
  String get secondary_brachioradialis => 'Braquiorradial';

  @override
  String get secondary_anconeus => 'Anconeo';

  @override
  String get secondary_obliques => 'Oblicuos';

  @override
  String get secondary_hipFlexors => 'Hip flexors';

  @override
  String get secondary_deltoids => 'Deltoides';

  @override
  String get secondary_lats => 'Dorsal';

  @override
  String get ex_pecho_1_b1 => 'Desarrolla masa y fuerza en el pecho';

  @override
  String get ex_pecho_1_b2 => 'Fortalece los tríceps y hombros anteriores';

  @override
  String get ex_pecho_1_b3 =>
      'Ejercicio compuesto de alta transferencia a la fuerza funcional';

  @override
  String get ex_pecho_2_b1 =>
      'Enfatiza la porción clavicular (superior) del pecho';

  @override
  String get ex_pecho_2_b2 => 'Mayor rango de movimiento que la barra';

  @override
  String get ex_pecho_2_b3 =>
      'Permite trabajar cada lado de forma independiente';

  @override
  String get ex_pecho_3_b1 => 'Aislamiento profundo del pectoral mayor';

  @override
  String get ex_pecho_3_b2 =>
      'Mejora la elasticidad y el estiramiento del pecho';

  @override
  String get ex_pecho_3_b3 => 'Ideal para añadir volumen y definición';

  @override
  String get ex_pecho_4_b1 =>
      'Ejercicio compuesto que trabaja pecho, tríceps y hombros';

  @override
  String get ex_pecho_4_b2 => 'No requiere equipamiento adicional';

  @override
  String get ex_pecho_4_b3 => 'Se puede progresar añadiendo peso con cinturón';

  @override
  String get ex_pecho_5_b1 =>
      'Tensión constante a lo largo de todo el rango de movimiento';

  @override
  String get ex_pecho_5_b2 =>
      'Excelente para definición y aislamiento del pecho';

  @override
  String get ex_pecho_5_b3 => 'Múltiples variantes según altura de la polea';

  @override
  String get ex_esp_1_b1 =>
      'Ejercicio total del cuerpo que maximiza la fuerza global';

  @override
  String get ex_esp_1_b2 =>
      'Desarrolla la cadena posterior (espalda, glúteos, isquios)';

  @override
  String get ex_esp_1_b3 => 'Alta liberación hormonal y efecto anabólico';

  @override
  String get ex_esp_2_b1 =>
      'Desarrolla el ancho de la espalda (latissimus dorsi)';

  @override
  String get ex_esp_2_b2 => 'Mejora la fuerza relativa al peso corporal';

  @override
  String get ex_esp_2_b3 => 'Excelente indicador de rendimiento funcional';

  @override
  String get ex_esp_3_b1 => 'Desarrolla el espesor y grosor de la espalda';

  @override
  String get ex_esp_3_b2 => 'Fortalece los músculos posturales';

  @override
  String get ex_esp_3_b3 => 'Complemento ideal del press de banca';

  @override
  String get ex_esp_4_b1 => 'Corrección de desequilibrios entre los dos lados';

  @override
  String get ex_esp_4_b2 => 'Mayor rango de movimiento que el remo con barra';

  @override
  String get ex_esp_4_b3 =>
      'Excelente para principiantes por ser fácil de aprender';

  @override
  String get ex_esp_5_b1 => 'Alternativa a las dominadas para principiantes';

  @override
  String get ex_esp_5_b2 => 'Desarrolla el ancho de la espalda';

  @override
  String get ex_esp_5_b3 => 'Control del peso fácil y progresión gradual';

  @override
  String get ex_pier_1_b1 => 'El ejercicio más completo para el tren inferior';

  @override
  String get ex_pier_1_b2 =>
      'Libera más hormonas anabólicas que cualquier otro ejercicio';

  @override
  String get ex_pier_1_b3 => 'Mejora la potencia atlética y la funcionalidad';

  @override
  String get ex_pier_2_b1 =>
      'Permite trabajar con cargas altas de forma segura';

  @override
  String get ex_pier_2_b2 => 'Ideal para principiantes o rehabilitación';

  @override
  String get ex_pier_2_b3 =>
      'Se puede variar la posición de los pies para enfocar distintas zonas';

  @override
  String get ex_pier_3_b1 =>
      'El ejercicio más eficaz para activar y desarrollar los glúteos';

  @override
  String get ex_pier_3_b2 => 'Mejora la extensión de cadera y la postura';

  @override
  String get ex_pier_3_b3 => 'Reduce el riesgo de lesiones de rodilla y cadera';

  @override
  String get ex_pier_4_b1 =>
      'Trabaja cada pierna de forma unilateral, corrigiendo desequilibrios';

  @override
  String get ex_pier_4_b2 => 'Mejora el equilibrio y la estabilidad';

  @override
  String get ex_pier_4_b3 =>
      'Excelente para el desarrollo de glúteos y cuádriceps';

  @override
  String get ex_pier_5_b1 => 'Aislamiento directo de los isquiotibiales';

  @override
  String get ex_pier_5_b2 => 'Previene lesiones de tendón de la corva';

  @override
  String get ex_pier_5_b3 => 'Equilibra el desarrollo muscular del muslo';

  @override
  String get ex_hom_1_b1 => 'Desarrolla los tres haces del deltoides';

  @override
  String get ex_hom_1_b2 =>
      'Mejora la fuerza funcional por encima de la cabeza';

  @override
  String get ex_hom_1_b3 =>
      'Fortalece el manguito rotador y la estabilidad del hombro';

  @override
  String get ex_hom_2_b1 =>
      'Aislamiento del deltoides lateral para hombros más anchos';

  @override
  String get ex_hom_2_b2 => 'Mejora la apariencia de anchura del torso';

  @override
  String get ex_hom_2_b3 =>
      'Bajo riesgo de lesión cuando se usa peso apropiado';

  @override
  String get ex_hom_3_b1 =>
      'Fortalece los deltoides posteriores y mejora la postura';

  @override
  String get ex_hom_3_b2 => 'Previene lesiones del manguito rotador';

  @override
  String get ex_hom_3_b3 => 'Contrarresta los efectos del trabajo de empuje';

  @override
  String get ex_hom_4_b1 =>
      'Activa los tres haces del deltoides en un solo movimiento';

  @override
  String get ex_hom_4_b2 => 'La rotación mejora la movilidad del hombro';

  @override
  String get ex_hom_4_b3 =>
      'Variante más completa que el press de hombros convencional';

  @override
  String get ex_bra_1_b1 => 'Aislamiento directo del bíceps braquial';

  @override
  String get ex_bra_1_b2 => 'Trabaja cada brazo de forma independiente';

  @override
  String get ex_bra_1_b3 => 'Fácil progresión de peso y técnica accesible';

  @override
  String get ex_bra_2_b1 => 'Permite usar más carga que con mancuernas';

  @override
  String get ex_bra_2_b2 => 'La barra EZ reduce la tensión en muñecas y codos';

  @override
  String get ex_bra_2_b3 => 'Ideal para desarrollar masa global del bíceps';

  @override
  String get ex_bra_3_b1 => 'Énfasis en el braquial y braquiorradial';

  @override
  String get ex_bra_3_b2 => 'Da grosor y volumen al brazo visto de frente';

  @override
  String get ex_bra_3_b3 => 'Menor estrés en las muñecas que el curl supino';

  @override
  String get ex_bra_4_b1 =>
      'Aislamiento efectivo de los tres haces del tríceps';

  @override
  String get ex_bra_4_b2 => 'Tensión constante gracias a la polea';

  @override
  String get ex_bra_4_b3 => 'Excelente para definición y acabado del tríceps';

  @override
  String get ex_bra_5_b1 =>
      'Máximo estiramiento de la cabeza larga del tríceps';

  @override
  String get ex_bra_5_b2 => 'Desarrolla el espesor del tríceps';

  @override
  String get ex_bra_5_b3 => 'Se puede usar con mancuernas o barra recta';

  @override
  String get ex_core_1_b1 => 'Fortalece el core profundo sin carga espinal';

  @override
  String get ex_core_1_b2 => 'Mejora la postura y estabilidad lumbar';

  @override
  String get ex_core_1_b3 => 'Reduce el riesgo de lesiones de espalda';

  @override
  String get ex_core_2_b1 =>
      'Ejercicio básico de aislamiento del recto abdominal';

  @override
  String get ex_core_2_b2 => 'Fácil de aprender y ejecutar';

  @override
  String get ex_core_2_b3 =>
      'Base para progresiones de abdominales más exigentes';

  @override
  String get ex_core_3_b1 => 'Trabaja el core inferior con alta intensidad';

  @override
  String get ex_core_3_b2 => 'Mejora la fuerza de agarre y de la zona lumbar';

  @override
  String get ex_core_3_b3 =>
      'Versión progresiva: rodillas dobladas → piernas rectas → L-sit';

  @override
  String get ex_core_4_b1 =>
      'Uno de los ejercicios de core más completos y exigentes';

  @override
  String get ex_core_4_b2 =>
      'Trabaja el core en extensión, diferente a los abdominales tradicionales';

  @override
  String get ex_core_4_b3 =>
      'Desarrolla fuerza funcional en toda la cadena anterior';
}
