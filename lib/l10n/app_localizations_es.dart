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
  String get common_ok => 'OK';

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
  String get common_pro => 'PRO';

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
  String get nav_history => 'Historial';

  @override
  String get nav_rest => 'Descanso';

  @override
  String get nav_exercises => 'Ejercicios';

  @override
  String get login_tagline => 'Tu app de fitness personal';

  @override
  String get login_continueGoogle => 'Continuar con Google';

  @override
  String get login_continueApple => 'Continuar con Apple';

  @override
  String get login_continueEmail => 'Continuar con correo';

  @override
  String get login_legal =>
      'Al continuar, aceptas nuestros términos de servicio\ny política de privacidad.';

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
  String get home_startWorkout => 'Iniciar entrenamiento';

  @override
  String get home_thisWeek => 'Esta semana';

  @override
  String get home_weekTime => 'Tiempo semana';

  @override
  String get home_weekVolume => 'Volumen semana';

  @override
  String get home_quickAccess => 'Acceso rápido';

  @override
  String get home_lastWorkout => 'Último entrenamiento';

  @override
  String get home_viewAll => 'Ver todo';

  @override
  String get home_noWorkoutsYet => 'Aún sin entrenamientos';

  @override
  String get home_noWorkoutsSubtitle =>
      'Completa tu primer entrenamiento y aparecerá aquí.';

  @override
  String get home_goToTrain => 'Ir a Entrenar →';

  @override
  String get home_progress => 'Progreso';

  @override
  String get home_noRecordsYet => 'Sin registros aún';

  @override
  String get home_recordWeightMeasures => 'Registra tu peso y medidas';

  @override
  String get home_achievements => 'Logros';

  @override
  String get home_noAchievements =>
      'Completa entrenamientos para desbloquear logros';

  @override
  String get home_recentExercises => 'Ejercicios recientes';

  @override
  String get home_noRecentExercises =>
      'Tus ejercicios frecuentes aparecerán aquí';

  @override
  String home_frequentExercise(int count) {
    return '$count sesiones';
  }

  @override
  String get home_latestRecord => 'Último registro';

  @override
  String get home_waist => 'Cintura';

  @override
  String get home_hips => 'Cadera';

  @override
  String get home_exerciseLibrary => 'Biblioteca de ejercicios';

  @override
  String get home_viewAllExercises => 'Ver todos';

  @override
  String home_exercisesAvailable(int count) {
    return '$count ejercicios disponibles';
  }

  @override
  String get profile_proActive => 'Suscripción activa';

  @override
  String get profile_freePlan => 'Plan gratuito';

  @override
  String get profile_upgradePro => 'Actualizar a PRO';

  @override
  String get profile_redeemCode => 'Canjear código';

  @override
  String get profile_restorePurchases => 'Restaurar compras';

  @override
  String get profile_signOut => 'Cerrar sesión';

  @override
  String get profile_deleteAccount => 'Eliminar cuenta';

  @override
  String get profile_redeemTitle => 'Canjear código';

  @override
  String get profile_redeemSubtitle =>
      'Ingresa tu código promocional para desbloquear LiftWave PRO.';

  @override
  String get profile_codeHint => 'CÓDIGO';

  @override
  String get profile_redeem => 'Canjear';

  @override
  String get profile_proActivated => 'LiftWave PRO activado';

  @override
  String get profile_invalidCode => 'Código inválido';

  @override
  String get profile_purchasesRestored => 'Compras restauradas correctamente';

  @override
  String get profile_noPurchasesFound => 'No se encontraron compras previas';

  @override
  String get profile_deleteTitle => 'Eliminar cuenta';

  @override
  String get profile_deleteConfirm =>
      '¿Estás seguro? Esta acción es irreversible y se eliminarán todos tus datos.';

  @override
  String get profile_deleteReauthError =>
      'Para eliminar tu cuenta, cierra sesión, vuelve a iniciar y reintenta.';

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
  String get train_cancelWorkout => 'Cancelar entrenamiento';

  @override
  String get train_cancelConfirm =>
      '¿Seguro que quieres cancelar? Se perderá el progreso.';

  @override
  String get train_continue => 'Seguir';

  @override
  String get train_addExerciseFirst =>
      'Añade al menos un ejercicio antes de finalizar.';

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
    return '$count ejercicios';
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
  String get train_notesHint => 'Notas (opcional)';

  @override
  String get train_setHeader => 'SERIE';

  @override
  String get train_repsHeader => 'REPS';

  @override
  String get train_weightHeader => 'PESO (kg)';

  @override
  String get train_addSet => 'Añadir serie';

  @override
  String train_lastWeight(String weight) {
    return 'Último: $weight kg';
  }

  @override
  String get train_abbreviationExercises => 'ej.';

  @override
  String get train_orChooseRoutine => 'O elige una rutina';

  @override
  String get train_defaultRoutineName => 'Mi rutina';

  @override
  String get train_bodyweightLabel => 'Peso corporal';

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
  String exercises_exerciseCount(int count, String suffix) {
    return '$count ejercicio$suffix';
  }

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
  String get history_limitedHistory => 'Historial limitado';

  @override
  String history_unlockWorkouts(int count) {
    return 'Desbloquea tus $count entrenamientos con PRO';
  }

  @override
  String get history_weeklySummary => 'Resumen semanal';

  @override
  String get history_workouts => 'Entrenos';

  @override
  String get history_total => 'Total';

  @override
  String get history_volumeKg => 'Volumen kg';

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
    return '$count series';
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
  String get paywall_featureTemplates => 'Plantillas de entrenamiento';

  @override
  String get paywall_featureHistory => 'Historial ilimitado';

  @override
  String get paywall_featureTimer => 'Timer personalizado';

  @override
  String get paywall_featureDetails => 'Detalles de ejercicios';

  @override
  String get paywall_featureMeasures => 'Medidas corporales + fotos';

  @override
  String get paywall_featureStats => 'Estadísticas semanales';

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
  String get paywall_freeTrial => '7 días de prueba gratis';

  @override
  String get paywall_startTrial => 'Comenzar prueba gratis';

  @override
  String get paywall_restorePurchases => 'Restaurar compras';

  @override
  String get paywall_legalText =>
      'La suscripción se renueva automáticamente. Puedes cancelar\nen cualquier momento desde la App Store.';

  @override
  String get paywall_purchaseError => 'No se pudo completar la compra.';

  @override
  String get paywall_noPurchasesFound => 'No se encontraron compras previas.';

  @override
  String get rest_title => 'Descanso';

  @override
  String get rest_ready => '¡Listo! Hora de la siguiente serie';

  @override
  String get rest_almostReady => '¡Casi listo!';

  @override
  String get rest_resting => 'Descansando...';

  @override
  String rest_customTime(String time) {
    return 'Tiempo personalizado · $time';
  }

  @override
  String get rest_choosePreset => 'Elige un preajuste o personaliza';

  @override
  String rest_of(String time) {
    return 'de $time';
  }

  @override
  String get rest_presets => 'Preajustes';

  @override
  String get rest_customize => 'Personalizar';

  @override
  String get rest_customTimeTitle => 'Tiempo personalizado';

  @override
  String get rest_customTimeSubtitle =>
      'Introduce los minutos y segundos de descanso.';

  @override
  String get rest_minutes => 'Minutos';

  @override
  String get rest_seconds => 'Segundos';

  @override
  String get rest_setTime => 'Establecer tiempo';

  @override
  String get progressScreen_title => 'Progreso corporal';

  @override
  String get progressScreen_measurements => 'Medidas';

  @override
  String get progressScreen_photos => 'Fotos';

  @override
  String get progressScreen_addMeasurement => 'Añadir medida';

  @override
  String get progressScreen_weight => 'Peso';

  @override
  String get progressScreen_bodyFat => 'Grasa corp.';

  @override
  String get progressScreen_muscle => 'Músculo';

  @override
  String get progressScreen_noEntries => 'Sin registros aún';

  @override
  String get progressScreen_noEntriesHint =>
      'Toca el botón + para añadir tu primera medida';

  @override
  String get progressScreen_noPhotos => 'Sin fotos aún';

  @override
  String get progressScreen_noPhotosHint =>
      'Toca el botón + para añadir tu primera foto de progreso';

  @override
  String get progressScreen_current => 'Actual';

  @override
  String get progressScreen_change => 'Cambio';

  @override
  String get progressScreen_trend => 'Tendencia';

  @override
  String get progressScreen_addMeasurementTitle => 'Nueva medida';

  @override
  String get progressScreen_weightKg => 'Peso (kg)';

  @override
  String get progressScreen_bodyFatPercent => 'Grasa corporal (%)';

  @override
  String get progressScreen_muscleMassKg => 'Masa muscular (kg)';

  @override
  String get progressScreen_optional => 'Opcional';

  @override
  String get progressScreen_saveEntry => 'Guardar registro';

  @override
  String get progressScreen_deleteMeasurement => '¿Eliminar este registro?';

  @override
  String get progressScreen_deletePhoto => '¿Eliminar esta foto?';

  @override
  String get progressScreen_camera => 'Cámara';

  @override
  String get progressScreen_gallery => 'Galería';

  @override
  String get progressScreen_selectSource => 'Seleccionar fuente';

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
  String get csv_header =>
      'Fecha,Entrenamiento,Ejercicio,Grupo Muscular,Serie,Reps,Peso (kg),Volumen (kg)';

  @override
  String get csv_subject => 'LiftWave - Historial de entrenamientos';

  @override
  String get template_fullBody_subtitle =>
      'Todos los grupos musculares en una sesión';

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
