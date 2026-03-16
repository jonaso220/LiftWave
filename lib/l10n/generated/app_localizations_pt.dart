// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class SPt extends S {
  SPt([String locale = 'pt']) : super(locale);

  @override
  String get common_cancel => 'Cancelar';

  @override
  String get common_delete => 'Excluir';

  @override
  String get common_save => 'Salvar';

  @override
  String get common_ok => 'OK';

  @override
  String get common_or => 'ou';

  @override
  String get common_today => 'Hoje';

  @override
  String get common_yesterday => 'Ontem';

  @override
  String common_daysAgo(int count) {
    return 'Há $count dias';
  }

  @override
  String get common_exercises => 'Exercícios';

  @override
  String get common_sets => 'Séries';

  @override
  String get common_volume => 'Volume';

  @override
  String get common_reps => 'Reps';

  @override
  String get common_weight => 'Peso';

  @override
  String get common_duration => 'Duração';

  @override
  String get common_bodyweight => 'Corporal';

  @override
  String get common_custom => 'CUSTOM';

  @override
  String get common_pro => 'PRO';

  @override
  String get muscle_all => 'Todos';

  @override
  String get muscle_chest => 'Peito';

  @override
  String get muscle_back => 'Costas';

  @override
  String get muscle_legs => 'Pernas';

  @override
  String get muscle_shoulders => 'Ombros';

  @override
  String get muscle_arms => 'Braços';

  @override
  String get muscle_core => 'Core';

  @override
  String get equipment_all => 'Todos';

  @override
  String get equipment_barbell => 'Barra';

  @override
  String get equipment_dumbbells => 'Halteres';

  @override
  String get equipment_machine => 'Máquina';

  @override
  String get equipment_cable => 'Polia';

  @override
  String get equipment_bodyweight => 'Peso corporal';

  @override
  String get equipment_pullupBar => 'Barra fixa';

  @override
  String get equipment_noEquipment => 'Sem equipamento';

  @override
  String get equipment_parallelBars => 'Barras paralelas';

  @override
  String get difficulty_beginner => 'Iniciante';

  @override
  String get difficulty_intermediate => 'Intermediário';

  @override
  String get difficulty_advanced => 'Avançado';

  @override
  String get nav_home => 'Início';

  @override
  String get nav_train => 'Treinar';

  @override
  String get nav_history => 'Histórico';

  @override
  String get nav_rest => 'Descanso';

  @override
  String get nav_exercises => 'Exercícios';

  @override
  String get login_tagline => 'Seu app de fitness pessoal';

  @override
  String get login_continueGoogle => 'Continuar com Google';

  @override
  String get login_continueApple => 'Continuar com Apple';

  @override
  String get login_continueEmail => 'Continuar com e-mail';

  @override
  String get login_legal =>
      'Ao continuar, você aceita nossos termos de serviço\ne política de privacidade.';

  @override
  String get login_googleError => 'Não foi possível fazer login com o Google.';

  @override
  String get login_appleError => 'Não foi possível fazer login com a Apple.';

  @override
  String get emailAuth_titleLogin => 'Entrar';

  @override
  String get emailAuth_titleRegister => 'Criar conta';

  @override
  String get emailAuth_greetingLogin => 'Que bom te ver de volta';

  @override
  String get emailAuth_greetingRegister => 'Bem-vindo!';

  @override
  String get emailAuth_subtitleLogin => 'Entre com seu e-mail e senha';

  @override
  String get emailAuth_subtitleRegister => 'Crie sua conta para começar';

  @override
  String get emailAuth_nameLabel => 'Nome';

  @override
  String get emailAuth_nameHint => 'Seu nome';

  @override
  String get emailAuth_nameError => 'Digite seu nome';

  @override
  String get emailAuth_emailLabel => 'E-mail';

  @override
  String get emailAuth_emailHint => 'email@exemplo.com';

  @override
  String get emailAuth_emailErrorEmpty => 'Digite seu e-mail';

  @override
  String get emailAuth_emailErrorInvalid => 'E-mail inválido';

  @override
  String get emailAuth_passwordLabel => 'Senha';

  @override
  String get emailAuth_passwordHintLogin => 'Sua senha';

  @override
  String get emailAuth_passwordHintRegister => 'Mínimo 6 caracteres';

  @override
  String get emailAuth_passwordErrorEmpty => 'Digite sua senha';

  @override
  String get emailAuth_passwordErrorShort => 'Mínimo 6 caracteres';

  @override
  String get emailAuth_forgotPassword => 'Esqueceu sua senha?';

  @override
  String get emailAuth_hasAccount => 'Já tem conta? ';

  @override
  String get emailAuth_noAccount => 'Não tem conta? ';

  @override
  String get emailAuth_loginLink => 'Entrar';

  @override
  String get emailAuth_registerLink => 'Cadastre-se';

  @override
  String get emailAuth_unexpectedError => 'Erro inesperado. Tente novamente.';

  @override
  String get emailAuth_emailFirst => 'Digite seu e-mail primeiro.';

  @override
  String emailAuth_resetSent(String email) {
    return 'E-mail de recuperação enviado para $email';
  }

  @override
  String get emailAuth_resetError =>
      'Não foi possível enviar o e-mail de recuperação.';

  @override
  String get authError_userNotFound => 'Não existe uma conta com esse e-mail.';

  @override
  String get authError_wrongPassword => 'Senha incorreta.';

  @override
  String get authError_emailAlreadyInUse => 'Este e-mail já está cadastrado.';

  @override
  String get authError_weakPassword =>
      'A senha é muito fraca (mínimo 6 caracteres).';

  @override
  String get authError_invalidEmail => 'O e-mail não é válido.';

  @override
  String get authError_tooManyRequests =>
      'Muitas tentativas. Aguarde alguns minutos.';

  @override
  String get authError_networkFailed => 'Sem conexão com a internet.';

  @override
  String get authError_default => 'Erro ao fazer login. Tente novamente.';

  @override
  String home_greetingMorning(String name) {
    return 'Bom dia, $name!';
  }

  @override
  String get home_greetingMorningNoName => 'Bom dia!';

  @override
  String home_greetingAfternoon(String name) {
    return 'Boa tarde, $name!';
  }

  @override
  String get home_greetingAfternoonNoName => 'Boa tarde!';

  @override
  String home_greetingEvening(String name) {
    return 'Boa noite, $name!';
  }

  @override
  String get home_greetingEveningNoName => 'Boa noite!';

  @override
  String get home_weekMotivationZero =>
      'Você ainda não treinou esta semana. Comece hoje!';

  @override
  String get home_weekMotivationOne =>
      'Você fez 1 treino esta semana. Continue assim!';

  @override
  String home_weekMotivationMany(int count) {
    return 'Você fez $count treinos esta semana. Continue assim!';
  }

  @override
  String get home_startWorkout => 'Iniciar treino';

  @override
  String get home_thisWeek => 'Esta semana';

  @override
  String get home_weekTime => 'Tempo da semana';

  @override
  String get home_weekVolume => 'Volume da semana';

  @override
  String get home_quickAccess => 'Acesso rápido';

  @override
  String get home_lastWorkout => 'Último treino';

  @override
  String get home_viewAll => 'Ver tudo';

  @override
  String get home_noWorkoutsYet => 'Nenhum treino ainda';

  @override
  String get home_noWorkoutsSubtitle =>
      'Complete seu primeiro treino e ele aparecerá aqui.';

  @override
  String get home_goToTrain => 'Ir para Treinar →';

  @override
  String get home_progress => 'Progresso';

  @override
  String get home_noRecordsYet => 'Sem registros ainda';

  @override
  String get home_recordWeightMeasures => 'Registre seu peso e medidas';

  @override
  String get home_achievements => 'Conquistas';

  @override
  String get home_noAchievements =>
      'Complete treinos para desbloquear conquistas';

  @override
  String get home_recentExercises => 'Exercícios recentes';

  @override
  String get home_noRecentExercises =>
      'Seus exercícios frequentes aparecerão aqui';

  @override
  String home_frequentExercise(int count) {
    return '$count sessões';
  }

  @override
  String get home_latestRecord => 'Último registro';

  @override
  String get home_waist => 'Cintura';

  @override
  String get home_hips => 'Quadril';

  @override
  String get home_exerciseLibrary => 'Biblioteca de exercícios';

  @override
  String get home_viewAllExercises => 'Ver todos';

  @override
  String home_exercisesAvailable(int count) {
    return '$count exercícios disponíveis';
  }

  @override
  String get profile_proActive => 'Assinatura ativa';

  @override
  String get profile_freePlan => 'Plano gratuito';

  @override
  String get profile_upgradePro => 'Assinar o PRO';

  @override
  String get profile_redeemCode => 'Resgatar código';

  @override
  String get profile_restorePurchases => 'Restaurar compras';

  @override
  String get profile_signOut => 'Sair';

  @override
  String get profile_deleteAccount => 'Excluir conta';

  @override
  String get profile_redeemTitle => 'Resgatar código';

  @override
  String get profile_redeemSubtitle =>
      'Digite seu código promocional para desbloquear o LiftWave PRO.';

  @override
  String get profile_codeHint => 'CÓDIGO';

  @override
  String get profile_redeem => 'Resgatar';

  @override
  String get profile_proActivated => 'LiftWave PRO ativado';

  @override
  String get profile_invalidCode => 'Código inválido';

  @override
  String get profile_purchasesRestored => 'Compras restauradas com sucesso';

  @override
  String get profile_noPurchasesFound => 'Nenhuma compra anterior encontrada';

  @override
  String get profile_deleteTitle => 'Excluir conta';

  @override
  String get profile_deleteConfirm =>
      'Tem certeza? Esta ação é irreversível e todos os seus dados serão excluídos.';

  @override
  String get profile_deleteReauthError =>
      'Para excluir sua conta, saia, faça login novamente e tente outra vez.';

  @override
  String get train_title => 'Treinar';

  @override
  String get train_readyTitle => 'Pronto para treinar?';

  @override
  String get train_readySubtitle =>
      'Inicie uma sessão livre ou escolha uma rotina pré-configurada.';

  @override
  String get train_freeSession => 'Sessão livre';

  @override
  String get train_freeWorkout => 'Treino livre';

  @override
  String get train_myRoutines => 'Minhas rotinas';

  @override
  String get train_predefinedRoutines => 'Rotinas predefinidas';

  @override
  String get train_inProgress => 'Em andamento';

  @override
  String get train_cancelWorkout => 'Cancelar treino';

  @override
  String get train_cancelConfirm =>
      'Tem certeza que quer cancelar? O progresso será perdido.';

  @override
  String get train_continue => 'Continuar';

  @override
  String get train_addExerciseFirst =>
      'Adicione pelo menos um exercício antes de finalizar.';

  @override
  String get train_workoutCompleted => 'Treino concluído!';

  @override
  String get train_completedSets => 'Séries concluídas';

  @override
  String get train_totalVolume => 'Volume total';

  @override
  String get train_saveAsRoutine => 'Salvar como rotina';

  @override
  String get train_finish => 'Finalizar';

  @override
  String get train_newAchievement => 'Nova conquista!';

  @override
  String get train_great => 'Muito bem!';

  @override
  String get train_routineNameHint => 'Nome da rotina';

  @override
  String train_routineSaved(String name) {
    return 'Rotina \"$name\" salva';
  }

  @override
  String get train_deleteRoutine => 'Excluir rotina';

  @override
  String train_deleteRoutineConfirm(String name) {
    return 'Excluir \"$name\"?';
  }

  @override
  String get train_noExercisesYet => 'Sem exercícios ainda';

  @override
  String get train_addExerciseHint =>
      'Toque no botão abaixo para adicionar o primeiro exercício.';

  @override
  String get train_addExercise => 'Adicionar exercício';

  @override
  String get train_exercise => 'Exercício';

  @override
  String train_exerciseCount(int count) {
    return '$count exercícios';
  }

  @override
  String train_startTemplate(String name) {
    return 'Começar $name';
  }

  @override
  String train_setsProgress(int done, int total) {
    return '$done/$total séries ✓';
  }

  @override
  String get train_viewProgress => 'Ver progresso';

  @override
  String get train_deleteExercise => 'Excluir exercício';

  @override
  String get train_notesHint => 'Notas (opcional)';

  @override
  String get train_setHeader => 'SÉRIE';

  @override
  String get train_repsHeader => 'REPS';

  @override
  String get train_weightHeader => 'PESO (kg)';

  @override
  String get train_addSet => 'Adicionar série';

  @override
  String train_lastWeight(String weight) {
    return 'Último: $weight kg';
  }

  @override
  String get train_abbreviationExercises => 'ex.';

  @override
  String get train_orChooseRoutine => 'Ou escolha uma rotina';

  @override
  String get train_defaultRoutineName => 'Minha rotina';

  @override
  String get train_bodyweightLabel => 'Peso corporal';

  @override
  String get picker_title => 'Selecionar exercício';

  @override
  String get picker_searchHint => 'Buscar exercício...';

  @override
  String get picker_createManual => 'Criar exercício manual';

  @override
  String get picker_createManualSubtitle =>
      'Nome, grupo muscular e equipamento';

  @override
  String get picker_createTitle => 'Criar exercício';

  @override
  String get picker_nameLabel => 'Nome';

  @override
  String get picker_nameHint => 'Ex: Rosca martelo';

  @override
  String get picker_muscleGroupLabel => 'Grupo muscular';

  @override
  String get picker_equipmentLabel => 'Equipamento';

  @override
  String get picker_addExercise => 'Adicionar exercício';

  @override
  String get exercises_title => 'Exercícios';

  @override
  String get exercises_searchHint => 'Buscar exercícios...';

  @override
  String get exercises_muscleFilter => 'Músculo';

  @override
  String get exercises_equipmentFilter => 'Equipamento';

  @override
  String exercises_exerciseCount(int count, String suffix) {
    return '$count exercício$suffix';
  }

  @override
  String get exercises_clearFilters => 'Limpar filtros';

  @override
  String get exercises_noResults => 'Sem resultados';

  @override
  String get exercises_noResultsHint =>
      'Tente com outros filtros ou termos de busca';

  @override
  String get exercises_deleteTitle => 'Excluir exercício';

  @override
  String exercises_deleteConfirm(String name) {
    return 'Excluir \"$name\" da sua lista de exercícios?';
  }

  @override
  String get exercises_muscleGroupLabel => 'Grupo muscular';

  @override
  String get exercises_materialLabel => 'Equipamento';

  @override
  String get exercises_executionTitle => 'Execução';

  @override
  String get exercises_secondaryMuscles => 'Músculos secundários';

  @override
  String get exercises_benefits => 'Benefícios';

  @override
  String get exercises_viewProgress => 'Ver progresso';

  @override
  String get exercises_addToWorkout => 'Adicionar ao treino';

  @override
  String get progress_maxWeight => 'Peso máx.';

  @override
  String get progress_volumeLabel => 'Volume';

  @override
  String get progress_noData => 'Sem dados para este exercício';

  @override
  String get progress_needMoreSessions =>
      'São necessárias pelo menos 2 sessões para ver o progresso';

  @override
  String get progress_lastVolume => 'Último volume';

  @override
  String get progress_lastWeight => 'Último peso';

  @override
  String get progress_best => 'Melhor';

  @override
  String get progress_progressLabel => 'Progresso';

  @override
  String get progress_historyTitle => 'Histórico';

  @override
  String get history_title => 'Histórico';

  @override
  String get history_exportCsv => 'Exportar CSV';

  @override
  String get history_allWorkouts => 'Todos os treinos';

  @override
  String get history_noWorkoutsYet => 'Sem treinos ainda';

  @override
  String get history_noWorkoutsSubtitle =>
      'Complete seu primeiro treino na aba Treinar e ele aparecerá aqui.';

  @override
  String get history_limitedHistory => 'Histórico limitado';

  @override
  String history_unlockWorkouts(int count) {
    return 'Desbloqueie seus $count treinos com o PRO';
  }

  @override
  String get history_weeklySummary => 'Resumo semanal';

  @override
  String get history_workouts => 'Treinos';

  @override
  String get history_total => 'Total';

  @override
  String get history_volumeKg => 'Volume kg';

  @override
  String get history_dayMon => 'S';

  @override
  String get history_dayTue => 'T';

  @override
  String get history_dayWed => 'Q';

  @override
  String get history_dayThu => 'Q';

  @override
  String get history_dayFri => 'S';

  @override
  String get history_daySat => 'S';

  @override
  String get history_daySun => 'D';

  @override
  String get history_exercisesPerformed => 'Exercícios realizados';

  @override
  String history_setsCount(int count) {
    return '$count séries';
  }

  @override
  String get history_setHeader => 'Série';

  @override
  String get detail_monthJan => 'janeiro';

  @override
  String get detail_monthFeb => 'fevereiro';

  @override
  String get detail_monthMar => 'março';

  @override
  String get detail_monthApr => 'abril';

  @override
  String get detail_monthMay => 'maio';

  @override
  String get detail_monthJun => 'junho';

  @override
  String get detail_monthJul => 'julho';

  @override
  String get detail_monthAug => 'agosto';

  @override
  String get detail_monthSep => 'setembro';

  @override
  String get detail_monthOct => 'outubro';

  @override
  String get detail_monthNov => 'novembro';

  @override
  String get detail_monthDec => 'dezembro';

  @override
  String detail_dateFormat(int day, String month, int year) {
    return '$day de $month de $year';
  }

  @override
  String get paywall_subtitle => 'Desbloqueie todo o seu potencial';

  @override
  String get paywall_featureTemplates => 'Modelos de treino';

  @override
  String get paywall_featureHistory => 'Histórico ilimitado';

  @override
  String get paywall_featureTimer => 'Timer personalizado';

  @override
  String get paywall_featureDetails => 'Detalhes dos exercícios';

  @override
  String get paywall_featureMeasures => 'Medidas corporais + fotos';

  @override
  String get paywall_featureStats => 'Estatísticas semanais';

  @override
  String get paywall_allIncluded => 'Tudo incluído';

  @override
  String get paywall_weekly => 'Semanal';

  @override
  String get paywall_monthly => 'Mensal';

  @override
  String get paywall_yearly => 'Anual';

  @override
  String get paywall_bestValue => 'Melhor valor';

  @override
  String get paywall_perWeek => '/semana';

  @override
  String get paywall_perMonth => '/mês';

  @override
  String get paywall_perYear => '/ano';

  @override
  String get paywall_freeTrial => '7 dias de teste grátis';

  @override
  String get paywall_startTrial => 'Começar teste grátis';

  @override
  String get paywall_restorePurchases => 'Restaurar compras';

  @override
  String get paywall_legalText =>
      'A assinatura é renovada automaticamente. Você pode cancelar\na qualquer momento pela App Store.';

  @override
  String get paywall_purchaseError => 'Não foi possível concluir a compra.';

  @override
  String get paywall_noPurchasesFound => 'Nenhuma compra anterior encontrada.';

  @override
  String get rest_title => 'Descanso';

  @override
  String get rest_ready => 'Pronto! Hora da próxima série';

  @override
  String get rest_almostReady => 'Quase pronto!';

  @override
  String get rest_resting => 'Descansando...';

  @override
  String rest_customTime(String time) {
    return 'Tempo personalizado · $time';
  }

  @override
  String get rest_choosePreset => 'Escolha um preset ou personalize';

  @override
  String rest_of(String time) {
    return 'de $time';
  }

  @override
  String get rest_presets => 'Presets';

  @override
  String get rest_customize => 'Personalizar';

  @override
  String get rest_customTimeTitle => 'Tempo personalizado';

  @override
  String get rest_customTimeSubtitle =>
      'Digite os minutos e segundos de descanso.';

  @override
  String get rest_minutes => 'Minutos';

  @override
  String get rest_seconds => 'Segundos';

  @override
  String get rest_setTime => 'Definir tempo';

  @override
  String get progressScreen_title => 'Progresso corporal';

  @override
  String get progressScreen_measurements => 'Medidas';

  @override
  String get progressScreen_photos => 'Fotos';

  @override
  String get progressScreen_addMeasurement => 'Adicionar medida';

  @override
  String get progressScreen_weight => 'Peso';

  @override
  String get progressScreen_bodyFat => 'Gordura corp.';

  @override
  String get progressScreen_muscle => 'Músculo';

  @override
  String get progressScreen_noEntries => 'Sem registros ainda';

  @override
  String get progressScreen_noEntriesHint =>
      'Toque no botão + para adicionar sua primeira medida';

  @override
  String get progressScreen_noPhotos => 'Sem fotos ainda';

  @override
  String get progressScreen_noPhotosHint =>
      'Toque no botão + para adicionar sua primeira foto de progresso';

  @override
  String get progressScreen_current => 'Atual';

  @override
  String get progressScreen_change => 'Variação';

  @override
  String get progressScreen_trend => 'Tendência';

  @override
  String get progressScreen_addMeasurementTitle => 'Nova medida';

  @override
  String get progressScreen_weightKg => 'Peso (kg)';

  @override
  String get progressScreen_bodyFatPercent => 'Gordura corporal (%)';

  @override
  String get progressScreen_muscleMassKg => 'Massa muscular (kg)';

  @override
  String get progressScreen_optional => 'Opcional';

  @override
  String get progressScreen_saveEntry => 'Salvar registro';

  @override
  String get progressScreen_deleteMeasurement => 'Excluir este registro?';

  @override
  String get progressScreen_deletePhoto => 'Excluir esta foto?';

  @override
  String get progressScreen_camera => 'Câmera';

  @override
  String get progressScreen_gallery => 'Galeria';

  @override
  String get progressScreen_selectSource => 'Selecionar origem';

  @override
  String get progressScreen_waist => 'Cintura';

  @override
  String get progressScreen_chest => 'Peito';

  @override
  String get progressScreen_hips => 'Quadril';

  @override
  String get progressScreen_record => 'registro';

  @override
  String get progressScreen_noDataMetric => 'Sem dados para esta métrica';

  @override
  String get progressScreen_addMoreRecords =>
      'Adicione mais registros para ver o gráfico';

  @override
  String get progressScreen_historyTitle => 'Histórico';

  @override
  String get progressScreen_noEntriesSubtitle =>
      'Registre seu primeiro peso e medidas\npara ver sua evolução.';

  @override
  String get progressScreen_addFirstRecord => 'Adicionar primeiro registro';

  @override
  String get progressScreen_progressPhotos => 'Fotos de progresso';

  @override
  String get progressScreen_progressPhotosHint =>
      'Acompanhe seu progresso visual com fotos.\nDisponível com LiftWave PRO.';

  @override
  String get progressScreen_unlockWithPro => 'Desbloquear com PRO';

  @override
  String get progressScreen_noPhotosSubtitle =>
      'Adicione uma foto ao registrar suas medidas\npara ver seu progresso visual.';

  @override
  String get progressScreen_addPhoto => 'Adicionar foto';

  @override
  String get progressScreen_newRecord => 'Novo registro';

  @override
  String get progressScreen_photoAdded => 'Foto adicionada';

  @override
  String get progressScreen_addPhotoOptional => 'Adicionar foto (opcional)';

  @override
  String get progressScreen_saveRecord => 'Salvar registro';

  @override
  String get progressScreen_enterAtLeastOneValue =>
      'Insira pelo menos um valor';

  @override
  String get progressScreen_monthShortJan => 'jan';

  @override
  String get progressScreen_monthShortFeb => 'fev';

  @override
  String get progressScreen_monthShortMar => 'mar';

  @override
  String get progressScreen_monthShortApr => 'abr';

  @override
  String get progressScreen_monthShortMay => 'mai';

  @override
  String get progressScreen_monthShortJun => 'jun';

  @override
  String get progressScreen_monthShortJul => 'jul';

  @override
  String get progressScreen_monthShortAug => 'ago';

  @override
  String get progressScreen_monthShortSep => 'set';

  @override
  String get progressScreen_monthShortOct => 'out';

  @override
  String get progressScreen_monthShortNov => 'nov';

  @override
  String get progressScreen_monthShortDec => 'dez';

  @override
  String get achievement_firstWorkout_title => 'Primeiro treino';

  @override
  String get achievement_firstWorkout_description =>
      'Complete seu primeiro treino';

  @override
  String get achievement_streak7_title => 'Sequência de 7 dias';

  @override
  String get achievement_streak7_description =>
      'Treine pelo menos 1 vez em 7 dias consecutivos';

  @override
  String get achievement_streak30_title => 'Sequência de 30 dias';

  @override
  String get achievement_streak30_description =>
      'Treine pelo menos 1 vez por semana durante 30 dias';

  @override
  String get achievement_volume1000_title => '1.000 kg levantados';

  @override
  String get achievement_volume1000_description =>
      'Acumule 1.000 kg de volume total';

  @override
  String get achievement_volume5000_title => '5.000 kg levantados';

  @override
  String get achievement_volume5000_description =>
      'Acumule 5.000 kg de volume total';

  @override
  String get achievement_volume10000_title => '10.000 kg levantados';

  @override
  String get achievement_volume10000_description =>
      'Acumule 10.000 kg de volume total';

  @override
  String get achievement_personalRecord_title => 'Novo recorde pessoal';

  @override
  String get achievement_personalRecord_description =>
      'Supere seu peso máximo em um exercício';

  @override
  String get csv_header =>
      'Data,Treino,Exercício,Grupo Muscular,Série,Reps,Peso (kg),Volume (kg)';

  @override
  String get csv_subject => 'LiftWave - Histórico de treinos';

  @override
  String get template_fullBody_subtitle =>
      'Todos os grupos musculares em uma sessão';

  @override
  String get template_push_subtitle => 'Peito · Ombros · Tríceps';

  @override
  String get template_pull_subtitle => 'Costas · Bíceps';

  @override
  String get template_torso_subtitle => 'Peito · Costas · Ombros';

  @override
  String get template_legs_subtitle =>
      'Quadríceps · Posteriores · Glúteos · Core';

  @override
  String get template_legs_name => 'Pernas';

  @override
  String get ex_pecho_1_name => 'Supino reto';

  @override
  String get ex_pecho_2_name => 'Supino inclinado com halteres';

  @override
  String get ex_pecho_3_name => 'Crucifixo com halteres';

  @override
  String get ex_pecho_4_name => 'Mergulho nas paralelas';

  @override
  String get ex_pecho_5_name => 'Crossover na polia';

  @override
  String get ex_esp_1_name => 'Levantamento terra';

  @override
  String get ex_esp_2_name => 'Barra fixa';

  @override
  String get ex_esp_3_name => 'Remada curvada com barra';

  @override
  String get ex_esp_4_name => 'Remada unilateral com halter';

  @override
  String get ex_esp_5_name => 'Puxada na polia alta';

  @override
  String get ex_pier_1_name => 'Agachamento com barra';

  @override
  String get ex_pier_2_name => 'Leg press';

  @override
  String get ex_pier_3_name => 'Elevação de quadril (hip thrust)';

  @override
  String get ex_pier_4_name => 'Avanço (passada)';

  @override
  String get ex_pier_5_name => 'Mesa flexora';

  @override
  String get ex_hom_1_name => 'Desenvolvimento militar';

  @override
  String get ex_hom_2_name => 'Elevação lateral';

  @override
  String get ex_hom_3_name => 'Face pull';

  @override
  String get ex_hom_4_name => 'Press Arnold';

  @override
  String get ex_bra_1_name => 'Rosca direta com halteres';

  @override
  String get ex_bra_2_name => 'Rosca na barra W';

  @override
  String get ex_bra_3_name => 'Rosca martelo';

  @override
  String get ex_bra_4_name => 'Tríceps na polia';

  @override
  String get ex_bra_5_name => 'Tríceps testa';

  @override
  String get ex_core_1_name => 'Prancha';

  @override
  String get ex_core_2_name => 'Abdominal (crunch)';

  @override
  String get ex_core_3_name => 'Elevação de pernas na barra';

  @override
  String get ex_core_4_name => 'Roda abdominal';

  @override
  String get ex_pecho_1_desc =>
      'Deite-se em um banco reto com os pés apoiados no chão. Segure a barra com pegada mais larga que os ombros. Desça a barra de forma controlada até quase tocar o peito e empurre até a extensão completa. Mantenha as escápulas retraídas durante todo o movimento.';

  @override
  String get ex_pecho_2_desc =>
      'Ajuste o banco a 30-45°. Sente-se com um halter em cada mão apoiados sobre as coxas. Ao se reclinar, leve os halteres à altura do peito com os cotovelos a 45° do corpo. Empurre para cima e para dentro até quase juntar os halteres no topo.';

  @override
  String get ex_pecho_3_desc =>
      'Deite-se no banco reto com um halter em cada mão, braços estendidos sobre o peito e cotovelos levemente flexionados. Desça os braços em arco amplo até sentir o alongamento do peito, depois volte à posição inicial apertando o peito no topo.';

  @override
  String get ex_pecho_4_desc =>
      'Segure-se nas barras paralelas com os braços estendidos. Incline o tronco levemente para frente para ativar mais o peito. Desça o corpo flexionando os cotovelos até que os braços fiquem paralelos ao chão. Empurre para voltar ao início sem travar os cotovelos.';

  @override
  String get ex_pecho_5_desc =>
      'Posicione as polias na altura mais alta. Segure os puxadores e dê um passo à frente. Com os cotovelos levemente flexionados, cruze os braços para frente e para baixo até que as mãos se encontrem na sua frente. Contraia o peito na posição final e retorne lentamente.';

  @override
  String get ex_esp_1_desc =>
      'Posicione-se de frente para a barra com os pés na largura dos quadris. Segure-a com pegada pronada ou mista logo por fora dos joelhos. Mantenha as costas retas e o peito erguido. Empurre o chão com os pés enquanto estende quadris e joelhos até ficar completamente ereto. Desça de forma controlada.';

  @override
  String get ex_esp_2_desc =>
      'Pendure-se na barra com pegada pronada (palmas para fora) mais larga que os ombros. Ative as escápulas e puxe o corpo para cima até o queixo ultrapassar a barra. Desça lentamente com controle. Evite balanço e mantenha o core contraído durante todo o movimento.';

  @override
  String get ex_esp_3_desc =>
      'Com os pés na largura dos ombros, incline-se para frente cerca de 45° mantendo as costas neutras. Segure a barra com pegada pronada um pouco mais larga que os ombros. Puxe a barra em direção ao abdômen retraindo as escápulas. Desça de forma controlada sem deixar o tronco cair.';

  @override
  String get ex_esp_4_desc =>
      'Apoie o joelho e a mão do mesmo lado em um banco. Com as costas paralelas ao chão e neutras, segure o halter com a mão livre. Puxe o halter em direção ao quadril retraindo a escápula. O cotovelo deve passar rente ao tronco. Desça com controle total.';

  @override
  String get ex_esp_5_desc =>
      'Sente-se na máquina de puxada e segure a barra larga com pegada pronada. Com o tronco levemente inclinado para trás, puxe a barra em direção ao peito retraindo as escápulas e abaixando os cotovelos. Não balance o corpo. Retorne lentamente à posição inicial com controle.';

  @override
  String get ex_pier_1_desc =>
      'Posicione a barra sobre os trapézios. Pés na largura dos ombros ou um pouco mais afastados. Desça flexionando joelhos e quadris mantendo o peito erguido e as costas neutras até que as coxas fiquem paralelas ao chão. Empurre pelos calcanhares para voltar à posição de pé.';

  @override
  String get ex_pier_2_desc =>
      'Sente-se na máquina com as costas totalmente apoiadas. Posicione os pés na largura dos ombros na plataforma. Libere as travas e desça a plataforma até que os joelhos formem aproximadamente 90°, depois empurre até quase a extensão completa sem travar os joelhos.';

  @override
  String get ex_pier_3_desc =>
      'Apoie as escápulas em um banco firme com a barra sobre os quadris (use uma almofada). Pés apoiados no chão na largura dos ombros. Desça os quadris até o chão e depois empurre para cima contraindo os glúteos até que os quadris fiquem alinhados com o tronco.';

  @override
  String get ex_pier_4_desc =>
      'Em pé com um halter em cada mão. Dê um passo largo para frente e desça o joelho de trás até quase tocar o chão. O joelho da frente não deve ultrapassar a ponta do pé. Empurre com o calcanhar da frente para voltar à posição inicial. Alterne as pernas.';

  @override
  String get ex_pier_5_desc =>
      'Deite-se de bruços na máquina com os calcanhares sob o rolo. Flexione os joelhos levando os calcanhares em direção aos glúteos em um movimento controlado. Na posição final, aperte os posteriores da coxa. Desça lentamente sem deixar os pesos descansarem.';

  @override
  String get ex_hom_1_desc =>
      'Em pé ou sentado, com a barra na altura dos ombros e pegada pronada um pouco mais larga que eles. Empurre a barra verticalmente acima da cabeça até a extensão completa. Desça de forma controlada até a posição inicial. Mantenha o core ativado para proteger a lombar.';

  @override
  String get ex_hom_2_desc =>
      'Em pé com um halter em cada mão ao lado do corpo, palmas voltadas para dentro. Com os cotovelos levemente flexionados, eleve os braços lateralmente até a altura dos ombros. Desça lentamente. Evite balançar ou usar impulso; o movimento deve ser puro e controlado.';

  @override
  String get ex_hom_3_desc =>
      'Posicione a corda na polia alta. Segure as pontas com as palmas para baixo e dê um passo para trás. Puxe a corda em direção ao rosto separando os cotovelos na altura dos ombros e levando as mãos em direção às orelhas. Aperte os deltoides posteriores no ponto final.';

  @override
  String get ex_hom_4_desc =>
      'Sentado com os halteres à frente na altura dos ombros, palmas viradas para você. Ao empurrar para cima, gire as palmas para fora de modo que no topo fiquem voltadas para frente. Desça invertendo o movimento de rotação até a posição inicial. Movimento fluido e contínuo.';

  @override
  String get ex_bra_1_desc =>
      'Em pé com um halter em cada mão, braços estendidos e palmas para frente. Flexione os cotovelos levando os halteres em direção aos ombros sem mover a parte superior do braço. Aperte o bíceps no topo. Desça de forma controlada até a extensão completa.';

  @override
  String get ex_bra_2_desc =>
      'Em pé com a barra W em pegada supinada na largura dos ombros. Mantenha os cotovelos colados ao corpo e flexione até levar a barra à altura do peito. Desça de forma controlada sentindo o alongamento completo do bíceps. A barra W reduz a tensão nos pulsos.';

  @override
  String get ex_bra_3_desc =>
      'Em pé com um halter em cada mão em pegada neutra (palmas uma de frente para a outra, como se segurasse um martelo). Flexione os cotovelos alternando ou simultaneamente, levando os halteres em direção aos ombros. Mantenha os cotovelos colados ao corpo o tempo todo. Desça com controle.';

  @override
  String get ex_bra_4_desc =>
      'Posicione a corda ou barra na polia alta. Segure o acessório com os cotovelos flexionados e colados ao tronco. Empurre para baixo estendendo os cotovelos completamente sem movê-los. Separe levemente as mãos no final se usar corda. Retorne lentamente resistindo ao peso.';

  @override
  String get ex_bra_5_desc =>
      'Deite-se no banco com a barra W com os braços estendidos sobre o peito. Com os cotovelos apontando para o teto, desça a barra em direção à testa flexionando apenas os cotovelos. Estenda novamente até a posição inicial. Os cotovelos devem permanecer fixos; apenas o antebraço se move.';

  @override
  String get ex_core_1_desc =>
      'Apoie os antebraços e as pontas dos pés no chão. Mantenha o corpo reto como uma tábua: quadril sem subir nem afundar, glúteos contraídos e abdômen ativado. Respire de forma constante. Mantenha a posição pelo tempo desejado sem comprometer a forma.';

  @override
  String get ex_core_2_desc =>
      'Deite-se de barriga para cima com os joelhos flexionados e os pés apoiados. Coloque as mãos atrás da cabeça sem puxar o pescoço. Contraia o abdômen elevando os ombros do chão cerca de 30° e apertando o reto abdominal no topo. Desça de forma controlada sem relaxar completamente o abdômen.';

  @override
  String get ex_core_3_desc =>
      'Pendure-se na barra com pegada pronada na largura dos ombros. Com as pernas levemente flexionadas, eleve os joelhos ou pernas até a horizontal (ou mais acima) contraindo o abdômen. Desça lentamente sem balançar. O movimento deve vir da flexão do quadril, não do impulso.';

  @override
  String get ex_core_4_desc =>
      'Ajoelhe-se com a roda à sua frente. Segure as alças e role para frente estendendo o corpo lentamente até quase tocar o chão. Contraia o core para voltar à posição inicial sem afundar o quadril. Mantenha as costas neutras e o abdômen contraído durante todo o movimento.';

  @override
  String get secondary_triceps => 'Tríceps';

  @override
  String get secondary_anteriorDeltoid => 'Deltoide anterior';

  @override
  String get secondary_biceps => 'Bíceps';

  @override
  String get secondary_glutes => 'Glúteos';

  @override
  String get secondary_hamstrings => 'Posteriores da coxa';

  @override
  String get secondary_trapezius => 'Trapézio';

  @override
  String get secondary_rhomboids => 'Romboides';

  @override
  String get secondary_lowerBack => 'Lombar';

  @override
  String get secondary_quads => 'Quadríceps';

  @override
  String get secondary_calves => 'Panturrilhas';

  @override
  String get secondary_rotatorCuff => 'Manguito rotador';

  @override
  String get secondary_brachialis => 'Braquial';

  @override
  String get secondary_brachioradialis => 'Braquiorradial';

  @override
  String get secondary_anconeus => 'Ancôneo';

  @override
  String get secondary_obliques => 'Oblíquos';

  @override
  String get secondary_hipFlexors => 'Flexores do quadril';

  @override
  String get secondary_deltoids => 'Deltoides';

  @override
  String get secondary_lats => 'Dorsal';

  @override
  String get ex_pecho_1_b1 => 'Desenvolve massa e força no peito';

  @override
  String get ex_pecho_1_b2 => 'Fortalece os tríceps e ombros anteriores';

  @override
  String get ex_pecho_1_b3 =>
      'Exercício composto com alta transferência para a força funcional';

  @override
  String get ex_pecho_2_b1 =>
      'Enfatiza a porção clavicular (superior) do peito';

  @override
  String get ex_pecho_2_b2 => 'Maior amplitude de movimento que a barra';

  @override
  String get ex_pecho_2_b3 =>
      'Permite trabalhar cada lado de forma independente';

  @override
  String get ex_pecho_3_b1 => 'Isolamento profundo do peitoral maior';

  @override
  String get ex_pecho_3_b2 => 'Melhora a elasticidade e o alongamento do peito';

  @override
  String get ex_pecho_3_b3 => 'Ideal para adicionar volume e definição';

  @override
  String get ex_pecho_4_b1 =>
      'Exercício composto que trabalha peito, tríceps e ombros';

  @override
  String get ex_pecho_4_b2 => 'Não requer equipamento adicional';

  @override
  String get ex_pecho_4_b3 => 'Pode progredir adicionando peso com cinto';

  @override
  String get ex_pecho_5_b1 =>
      'Tensão constante ao longo de toda a amplitude de movimento';

  @override
  String get ex_pecho_5_b2 => 'Excelente para definição e isolamento do peito';

  @override
  String get ex_pecho_5_b3 => 'Múltiplas variações conforme a altura da polia';

  @override
  String get ex_esp_1_b1 => 'Exercício completo que maximiza a força global';

  @override
  String get ex_esp_1_b2 =>
      'Desenvolve a cadeia posterior (costas, glúteos, posteriores)';

  @override
  String get ex_esp_1_b3 => 'Alta liberação hormonal e efeito anabólico';

  @override
  String get ex_esp_2_b1 =>
      'Desenvolve a largura das costas (latissimus dorsi)';

  @override
  String get ex_esp_2_b2 => 'Melhora a força relativa ao peso corporal';

  @override
  String get ex_esp_2_b3 => 'Excelente indicador de rendimento funcional';

  @override
  String get ex_esp_3_b1 => 'Desenvolve a espessura e densidade das costas';

  @override
  String get ex_esp_3_b2 => 'Fortalece os músculos posturais';

  @override
  String get ex_esp_3_b3 => 'Complemento ideal do supino';

  @override
  String get ex_esp_4_b1 => 'Correção de desequilíbrios entre os dois lados';

  @override
  String get ex_esp_4_b2 =>
      'Maior amplitude de movimento que a remada com barra';

  @override
  String get ex_esp_4_b3 =>
      'Excelente para iniciantes por ser fácil de aprender';

  @override
  String get ex_esp_5_b1 => 'Alternativa à barra fixa para iniciantes';

  @override
  String get ex_esp_5_b2 => 'Desenvolve a largura das costas';

  @override
  String get ex_esp_5_b3 => 'Controle de peso fácil e progressão gradual';

  @override
  String get ex_pier_1_b1 =>
      'O exercício mais completo para membros inferiores';

  @override
  String get ex_pier_1_b2 =>
      'Libera mais hormônios anabólicos que qualquer outro exercício';

  @override
  String get ex_pier_1_b3 => 'Melhora a potência atlética e a funcionalidade';

  @override
  String get ex_pier_2_b1 =>
      'Permite trabalhar com cargas altas de forma segura';

  @override
  String get ex_pier_2_b2 => 'Ideal para iniciantes ou reabilitação';

  @override
  String get ex_pier_2_b3 =>
      'Pode variar a posição dos pés para focar diferentes regiões';

  @override
  String get ex_pier_3_b1 =>
      'O exercício mais eficaz para ativar e desenvolver os glúteos';

  @override
  String get ex_pier_3_b2 => 'Melhora a extensão do quadril e a postura';

  @override
  String get ex_pier_3_b3 => 'Reduz o risco de lesões no joelho e quadril';

  @override
  String get ex_pier_4_b1 =>
      'Trabalha cada perna de forma unilateral, corrigindo desequilíbrios';

  @override
  String get ex_pier_4_b2 => 'Melhora o equilíbrio e a estabilidade';

  @override
  String get ex_pier_4_b3 =>
      'Excelente para o desenvolvimento de glúteos e quadríceps';

  @override
  String get ex_pier_5_b1 => 'Isolamento direto dos posteriores da coxa';

  @override
  String get ex_pier_5_b2 => 'Previne lesões nos tendões da coxa';

  @override
  String get ex_pier_5_b3 => 'Equilibra o desenvolvimento muscular da coxa';

  @override
  String get ex_hom_1_b1 => 'Desenvolve os três feixes do deltoide';

  @override
  String get ex_hom_1_b2 => 'Melhora a força funcional acima da cabeça';

  @override
  String get ex_hom_1_b3 =>
      'Fortalece o manguito rotador e a estabilidade do ombro';

  @override
  String get ex_hom_2_b1 =>
      'Isolamento do deltoide lateral para ombros mais largos';

  @override
  String get ex_hom_2_b2 => 'Melhora a aparência de largura do tronco';

  @override
  String get ex_hom_2_b3 => 'Baixo risco de lesão quando se usa peso adequado';

  @override
  String get ex_hom_3_b1 =>
      'Fortalece os deltoides posteriores e melhora a postura';

  @override
  String get ex_hom_3_b2 => 'Previne lesões do manguito rotador';

  @override
  String get ex_hom_3_b3 => 'Compensa os efeitos do trabalho de empurrar';

  @override
  String get ex_hom_4_b1 =>
      'Ativa os três feixes do deltoide em um só movimento';

  @override
  String get ex_hom_4_b2 => 'A rotação melhora a mobilidade do ombro';

  @override
  String get ex_hom_4_b3 =>
      'Variante mais completa que o desenvolvimento de ombros convencional';

  @override
  String get ex_bra_1_b1 => 'Isolamento direto do bíceps braquial';

  @override
  String get ex_bra_1_b2 => 'Trabalha cada braço de forma independente';

  @override
  String get ex_bra_1_b3 => 'Fácil progressão de peso e técnica acessível';

  @override
  String get ex_bra_2_b1 => 'Permite usar mais carga do que com halteres';

  @override
  String get ex_bra_2_b2 => 'A barra W reduz a tensão nos pulsos e cotovelos';

  @override
  String get ex_bra_2_b3 => 'Ideal para desenvolver massa global do bíceps';

  @override
  String get ex_bra_3_b1 => 'Ênfase no braquial e braquiorradial';

  @override
  String get ex_bra_3_b2 => 'Dá espessura e volume ao braço visto de frente';

  @override
  String get ex_bra_3_b3 => 'Menor estresse nos pulsos que a rosca supinada';

  @override
  String get ex_bra_4_b1 => 'Isolamento eficaz dos três feixes do tríceps';

  @override
  String get ex_bra_4_b2 => 'Tensão constante graças à polia';

  @override
  String get ex_bra_4_b3 => 'Excelente para definição e acabamento do tríceps';

  @override
  String get ex_bra_5_b1 => 'Máximo alongamento da cabeça longa do tríceps';

  @override
  String get ex_bra_5_b2 => 'Desenvolve a espessura do tríceps';

  @override
  String get ex_bra_5_b3 => 'Pode ser feito com halteres ou barra reta';

  @override
  String get ex_core_1_b1 => 'Fortalece o core profundo sem carga na coluna';

  @override
  String get ex_core_1_b2 => 'Melhora a postura e a estabilidade lombar';

  @override
  String get ex_core_1_b3 => 'Reduz o risco de lesões nas costas';

  @override
  String get ex_core_2_b1 => 'Exercício básico de isolamento do reto abdominal';

  @override
  String get ex_core_2_b2 => 'Fácil de aprender e executar';

  @override
  String get ex_core_2_b3 => 'Base para progressões abdominais mais exigentes';

  @override
  String get ex_core_3_b1 => 'Trabalha o core inferior com alta intensidade';

  @override
  String get ex_core_3_b2 => 'Melhora a força de pegada e da região lombar';

  @override
  String get ex_core_3_b3 =>
      'Versão progressiva: joelhos dobrados → pernas retas → L-sit';

  @override
  String get ex_core_4_b1 =>
      'Um dos exercícios de core mais completos e exigentes';

  @override
  String get ex_core_4_b2 =>
      'Trabalha o core em extensão, diferente dos abdominais tradicionais';

  @override
  String get ex_core_4_b3 =>
      'Desenvolve força funcional em toda a cadeia anterior';
}
