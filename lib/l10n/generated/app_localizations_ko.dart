// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class SKo extends S {
  SKo([String locale = 'ko']) : super(locale);

  @override
  String get common_cancel => '취소';

  @override
  String get common_delete => '삭제';

  @override
  String get common_save => '저장';

  @override
  String get common_or => '또는';

  @override
  String get common_today => '오늘';

  @override
  String get common_yesterday => '어제';

  @override
  String common_daysAgo(int count) {
    return '$count일 전';
  }

  @override
  String get common_exercises => '운동';

  @override
  String get common_sets => '세트';

  @override
  String get common_volume => '볼륨';

  @override
  String get common_reps => '횟수';

  @override
  String get common_weight => '무게';

  @override
  String get common_duration => '시간';

  @override
  String get common_bodyweight => '맨몸';

  @override
  String get common_custom => 'CUSTOM';

  @override
  String get common_discardChangesTitle => '변경 사항을 취소할까요?';

  @override
  String get common_discardChangesBody => '변경한 내용이 저장되지 않습니다.';

  @override
  String get common_keepEditing => '계속 편집';

  @override
  String get common_discard => '취소';

  @override
  String get muscle_all => '전체';

  @override
  String get muscle_chest => '가슴';

  @override
  String get muscle_back => '등';

  @override
  String get muscle_legs => '하체';

  @override
  String get muscle_shoulders => '어깨';

  @override
  String get muscle_arms => '팔';

  @override
  String get muscle_core => '코어';

  @override
  String get muscle_crossfit => '크로스핏';

  @override
  String get equipment_all => '전체';

  @override
  String get equipment_barbell => '바벨';

  @override
  String get equipment_dumbbells => '덤벨';

  @override
  String get equipment_machine => '머신';

  @override
  String get equipment_cable => '케이블';

  @override
  String get equipment_bodyweight => '맨몸';

  @override
  String get equipment_pullupBar => '턱걸이 바';

  @override
  String get equipment_noEquipment => '기구 없음';

  @override
  String get equipment_parallelBars => '평행봉';

  @override
  String get equipment_rings => '링';

  @override
  String get equipment_box => '박스';

  @override
  String get equipment_rope => '로프';

  @override
  String get equipment_ball => '공';

  @override
  String get equipment_kettlebell => '케틀벨';

  @override
  String get difficulty_beginner => '초급';

  @override
  String get difficulty_intermediate => '중급';

  @override
  String get difficulty_advanced => '고급';

  @override
  String get nav_home => '홈';

  @override
  String get nav_train => '운동';

  @override
  String get nav_progress => '진행';

  @override
  String get nav_profile => '프로필';

  @override
  String get home_todayTitle => '오늘의 운동';

  @override
  String get home_inProgressTitle => '운동 진행 중';

  @override
  String get home_continueWorkout => '운동 계속하기';

  @override
  String get home_chooseAnother => '다른 운동 선택';

  @override
  String get login_tagline => '나만의 피트니스 앱';

  @override
  String get login_continueGoogle => 'Google로 계속하기';

  @override
  String get login_continueApple => 'Apple로 계속하기';

  @override
  String get login_continueEmail => '이메일로 계속하기';

  @override
  String get login_continueGuest => '계정 없이 계속하기';

  @override
  String get guest_name => '게스트';

  @override
  String get guest_saveProgressTitle => '진행 상황을 저장하세요';

  @override
  String get guest_saveProgressBody =>
      '게스트로 LiftWave를 사용 중입니다. 휴대폰을 바꾸거나 앱을 다시 설치해도 운동 기록을 잃지 않도록 무료 계정을 만드세요.';

  @override
  String get guest_createAccount => '계정 만들기';

  @override
  String get guest_notNow => '나중에';

  @override
  String get guest_createAccountSubtitle => '진행 상황을 잃지 않도록 계정을 만드세요';

  @override
  String get guest_accountCreated => '계정이 생성되었습니다. 운동 기록이 안전하게 보관됩니다.';

  @override
  String get guest_existingAccountTitle => '이미 존재하는 계정입니다';

  @override
  String get guest_existingAccountBody =>
      '이 계정으로 로그인하면 게스트로 기록한 운동은 옮겨지지 않습니다.';

  @override
  String get guest_signInAnyway => '그래도 로그인';

  @override
  String get guest_leave => '게스트 모드 종료';

  @override
  String get guest_leaveBody => '계정이 없으므로 운동 기록과 데이터가 삭제됩니다. 이 작업은 되돌릴 수 없습니다.';

  @override
  String train_reasonIncreaseLoad(int reps, String weight, int min, int max) {
    return '$weight로 $reps회, 목표 범위($min–$max회)의 상한에 도달했어요. 무게를 올릴 때예요.';
  }

  @override
  String train_reasonAddRep(int reps, String weight) {
    return '$weight로 $reps회 했어요. 무게를 올리기 전에 1회 더 해보세요.';
  }

  @override
  String train_reasonConsolidate(int reps, String weight, int min, int max) {
    return '$reps회로 목표 범위($min–$max회)보다 적었어요. $min회에 도달할 때까지 $weight를 유지하세요.';
  }

  @override
  String train_reasonBodyweight(int reps) {
    return '$reps회 했어요. 1회 더 도전해보세요.';
  }

  @override
  String get login_legalPrefix => '계속하면 ';

  @override
  String get login_termsLink => '이용약관';

  @override
  String get login_legalAnd => '및';

  @override
  String get login_privacyLink => '개인정보 처리방침';

  @override
  String get login_googleError => 'Google 로그인에 실패했습니다.';

  @override
  String get login_appleError => 'Apple 로그인에 실패했습니다.';

  @override
  String get emailAuth_titleLogin => '로그인';

  @override
  String get emailAuth_titleRegister => '회원가입';

  @override
  String get emailAuth_greetingLogin => '다시 만나서 반갑습니다';

  @override
  String get emailAuth_greetingRegister => '환영합니다!';

  @override
  String get emailAuth_subtitleLogin => '이메일과 비밀번호를 입력하세요';

  @override
  String get emailAuth_subtitleRegister => '계정을 만들고 시작하세요';

  @override
  String get emailAuth_nameLabel => '이름';

  @override
  String get emailAuth_nameHint => '이름을 입력하세요';

  @override
  String get emailAuth_nameError => '이름을 입력해 주세요';

  @override
  String get emailAuth_emailLabel => '이메일';

  @override
  String get emailAuth_emailHint => 'email@example.com';

  @override
  String get emailAuth_emailErrorEmpty => '이메일을 입력해 주세요';

  @override
  String get emailAuth_emailErrorInvalid => '유효하지 않은 이메일입니다';

  @override
  String get emailAuth_passwordLabel => '비밀번호';

  @override
  String get emailAuth_passwordHintLogin => '비밀번호를 입력하세요';

  @override
  String get emailAuth_passwordHintRegister => '최소 6자 이상';

  @override
  String get emailAuth_passwordErrorEmpty => '비밀번호를 입력해 주세요';

  @override
  String get emailAuth_passwordErrorShort => '최소 6자 이상이어야 합니다';

  @override
  String get emailAuth_forgotPassword => '비밀번호를 잊으셨나요?';

  @override
  String get emailAuth_hasAccount => '이미 계정이 있으신가요? ';

  @override
  String get emailAuth_noAccount => '계정이 없으신가요? ';

  @override
  String get emailAuth_loginLink => '로그인';

  @override
  String get emailAuth_registerLink => '회원가입';

  @override
  String get emailAuth_unexpectedError => '예기치 않은 오류가 발생했습니다. 다시 시도해 주세요.';

  @override
  String get emailAuth_emailFirst => '먼저 이메일을 입력해 주세요.';

  @override
  String emailAuth_resetSent(String email) {
    return '$email(으)로 비밀번호 재설정 메일을 보냈습니다';
  }

  @override
  String get emailAuth_resetError => '비밀번호 재설정 메일을 보내지 못했습니다.';

  @override
  String get authError_userNotFound => '해당 이메일로 등록된 계정이 없습니다.';

  @override
  String get authError_wrongPassword => '비밀번호가 올바르지 않습니다.';

  @override
  String get authError_emailAlreadyInUse => '이미 사용 중인 이메일입니다.';

  @override
  String get authError_weakPassword => '비밀번호가 너무 약합니다 (최소 6자).';

  @override
  String get authError_invalidEmail => '유효하지 않은 이메일입니다.';

  @override
  String get authError_tooManyRequests => '요청이 너무 많습니다. 잠시 후 다시 시도해 주세요.';

  @override
  String get authError_networkFailed => '인터넷에 연결되어 있지 않습니다.';

  @override
  String get authError_default => '로그인 중 오류가 발생했습니다. 다시 시도해 주세요.';

  @override
  String home_greetingMorning(String name) {
    return '좋은 아침이에요, $name님!';
  }

  @override
  String get home_greetingMorningNoName => '좋은 아침이에요!';

  @override
  String home_greetingAfternoon(String name) {
    return '좋은 오후예요, $name님!';
  }

  @override
  String get home_greetingAfternoonNoName => '좋은 오후예요!';

  @override
  String home_greetingEvening(String name) {
    return '좋은 저녁이에요, $name님!';
  }

  @override
  String get home_greetingEveningNoName => '좋은 저녁이에요!';

  @override
  String get home_weekMotivationZero => '이번 주 아직 운동을 안 했어요. 오늘 시작해 보세요!';

  @override
  String get home_weekMotivationOne => '이번 주 1회 운동했어요. 계속 힘내세요!';

  @override
  String home_weekMotivationMany(int count) {
    return '이번 주 $count회 운동했어요. 잘하고 있어요!';
  }

  @override
  String get home_thisWeek => '이번 주';

  @override
  String get home_weekTime => '주간 시간';

  @override
  String get home_weekVolume => '주간 볼륨';

  @override
  String get restTimer_title => '휴식';

  @override
  String get restTimer_openControls => '휴식 타이머 제어 열기';

  @override
  String restTimer_addSeconds(int seconds) {
    return '$seconds초 추가';
  }

  @override
  String restTimer_subtractSeconds(int seconds) {
    return '$seconds초 빼기';
  }

  @override
  String get restTimer_pause => '타이머 일시 정지';

  @override
  String get restTimer_resume => '타이머 다시 시작';

  @override
  String get restTimer_dismiss => '타이머 닫기';

  @override
  String get restTimer_reset => '타이머 초기화';

  @override
  String restTimer_preset(String time) {
    return '$time 휴식 사용';
  }

  @override
  String get restTimer_resting => '휴식 중';

  @override
  String get restTimer_done => '완료!';

  @override
  String get home_lastWorkout => '최근 운동';

  @override
  String get home_repeatWorkout => '운동 반복';

  @override
  String get editWorkout_title => '운동 편집';

  @override
  String get editWorkout_saved => '운동이 업데이트되었습니다';

  @override
  String get detail_deleteWorkout => '운동 삭제';

  @override
  String get detail_deleteWorkoutConfirm => '기록에서 삭제됩니다. 이 작업은 되돌릴 수 없습니다.';

  @override
  String get detail_workoutDeleted => '운동이 삭제되었습니다';

  @override
  String get home_viewAll => '전체 보기';

  @override
  String get home_goToTrain => '운동하러 가기 →';

  @override
  String get home_achievements => '업적';

  @override
  String get home_noAchievements => '운동을 완료하면 업적이 잠금 해제됩니다';

  @override
  String get home_exerciseLibrary => '운동 라이브러리';

  @override
  String get profile_proActive => '구독 활성화됨';

  @override
  String get profile_freePlan => '무료 플랜';

  @override
  String get profile_upgradePro => 'PRO로 업그레이드';

  @override
  String get profile_restorePurchases => '구매 복원';

  @override
  String get profile_signOut => '로그아웃';

  @override
  String get profile_deleteAccount => '계정 삭제';

  @override
  String get progressScreen_deleteMeasurementTitle => '기록을 삭제할까요?';

  @override
  String get progressScreen_deleteMeasurementBody =>
      '기록과 사진이 삭제됩니다. 이 작업은 되돌릴 수 없습니다.';

  @override
  String get profile_signOutConfirm => '로그아웃할까요? 데이터는 계정에 저장된 상태로 유지됩니다.';

  @override
  String get profile_deleteSubscriptionNote =>
      '계정을 삭제해도 구독은 해지되지 않습니다. 먼저 스토어에서 해지하세요.';

  @override
  String get profile_manageSubscription => '구독 관리';

  @override
  String get profile_help => '도움말 및 지원';

  @override
  String get rest_alertTitle => '휴식 종료';

  @override
  String get rest_alertBody => '다음 세트를 시작할 시간입니다.';

  @override
  String get rest_alertChannel => '휴식 타이머';

  @override
  String get profile_restAlert => '휴식 종료 시 알림';

  @override
  String get profile_restAlertSubtitle => '앱이 화면에 없을 때 소리로 알려줍니다';

  @override
  String get profile_restAlertExact => '정확한 알람 허용';

  @override
  String get profile_restAlertExactSubtitle =>
      '이 권한이 없으면 Android가 알림을 지연시킬 수 있습니다';

  @override
  String get editWorkout_date => '날짜 및 시간';

  @override
  String get editWorkout_duration => '시간(분)';

  @override
  String get history_searchHint => '운동 또는 종목 검색';

  @override
  String get history_noResults => '결과 없음';

  @override
  String get history_calendar => '캘린더';

  @override
  String get progress_oneRm => '추정 1RM';

  @override
  String get progress_recordsTitle => '기록';

  @override
  String get progress_bestLift => '최고 중량';

  @override
  String get progress_bestOneRm => '최고 추정 1RM';

  @override
  String get setType_title => '세트 유형';

  @override
  String get setType_normal => '일반';

  @override
  String get setType_warmup => '워밍업';

  @override
  String get setType_drop => '드롭 세트';

  @override
  String get setType_failure => '실패 지점까지';

  @override
  String get setType_warmupHint => '볼륨과 기록에 포함되지 않습니다';

  @override
  String get setType_warmupShort => 'W';

  @override
  String get setType_dropShort => 'D';

  @override
  String get setType_failureShort => 'F';

  @override
  String get plates_title => '원판 계산기';

  @override
  String get plates_target => '총 중량';

  @override
  String get plates_bar => '바';

  @override
  String get plates_perSide => '한쪽당';

  @override
  String get plates_onlyBar => '바만';

  @override
  String get plates_belowBar => '중량이 바보다 가볍습니다';

  @override
  String plates_missing(String amount) {
    return '이 원판으로는 $amount을(를) 올릴 수 없습니다';
  }

  @override
  String get train_secondsHeader => '초';

  @override
  String get train_secondsShort => '초';

  @override
  String get train_startHold => '시작';

  @override
  String get train_measureByTime => '시간으로 기록';

  @override
  String get train_measureByReps => '횟수로 기록';

  @override
  String get hold_running => '진행 중';

  @override
  String get hold_alertTitle => '시간 종료';

  @override
  String get hold_alertBody => '세트를 완료했습니다.';

  @override
  String train_reasonHold(int seconds) {
    return '$seconds초 버텼습니다. 5초 더 늘려 보세요.';
  }

  @override
  String get superset_label => '슈퍼세트';

  @override
  String get superset_linkNext => '다음 종목과 슈퍼세트';

  @override
  String get superset_unlink => '슈퍼세트에서 제외';

  @override
  String get superset_hint => '세트를 번갈아 수행하세요. 한 라운드가 끝나면 휴식이 시작됩니다.';

  @override
  String get widget_today => '오늘';

  @override
  String widget_weekOfTarget(String done, String target) {
    return '이번 주 $done/$target';
  }

  @override
  String get widget_weekOne => '이번 주 1회';

  @override
  String widget_weekOther(String count) {
    return '이번 주 $count회';
  }

  @override
  String get reminders_title => '운동 알림';

  @override
  String get reminders_off => '꺼짐';

  @override
  String get reminders_enable => '운동 시간 알려주기';

  @override
  String get reminders_enableSubtitle => '선택한 요일에 알림을 보냅니다';

  @override
  String get reminders_days => '요일';

  @override
  String get reminders_time => '시간';

  @override
  String get reminders_notificationTitle => '운동할 시간이에요';

  @override
  String get reminders_notificationBody => '오늘의 운동이 기다리고 있어요.';

  @override
  String reminders_notificationRoutine(String routine) {
    return '오늘의 루틴: $routine';
  }

  @override
  String get reminders_permissionDenied =>
      '알림을 받으려면 시스템 설정에서 LiftWave 알림을 켜세요.';

  @override
  String health_sync(String store) {
    return '$store와 동기화';
  }

  @override
  String health_syncSubtitle(String store) {
    return '기록한 운동과 체중을 $store에 저장합니다';
  }

  @override
  String health_enabled(String store) {
    return '완료되었습니다. 앞으로의 운동이 $store에 저장됩니다.';
  }

  @override
  String health_denied(String store) {
    return '켤 수 없습니다. $store에서 LiftWave 권한을 확인하세요.';
  }

  @override
  String get health_needsInstall => '동기화를 켜려면 Health Connect를 설치하거나 업데이트하세요.';

  @override
  String get health_install => '설치';

  @override
  String health_unsupported(String store) {
    return '이 기기에서는 $store를 사용할 수 없습니다.';
  }

  @override
  String get profile_purchasesRestored => '구매가 복원되었습니다';

  @override
  String get profile_noPurchasesFound => '이전 구매 내역이 없습니다';

  @override
  String get restore_connectionError => '연결이 없습니다. 인터넷을 확인하고 다시 시도하세요.';

  @override
  String get restore_unknownError => '복원할 수 없습니다. 다시 시도하세요.';

  @override
  String get profile_deleteTitle => '계정 삭제';

  @override
  String get profile_deleteConfirm =>
      '정말로 삭제하시겠습니까? 이 작업은 되돌릴 수 없으며 모든 데이터가 삭제됩니다.';

  @override
  String get profile_deleteReauthError => '계정을 삭제하려면 로그아웃 후 다시 로그인하여 시도해 주세요.';

  @override
  String get profile_trainingPreferences => '운동 설정';

  @override
  String get profile_trainingPreferencesSubtitle => '목표, 경험, 운동 일수 및 기구';

  @override
  String get profile_appearance => '화면 모드';

  @override
  String get appearance_system => '자동(휴대폰 설정)';

  @override
  String get appearance_light => '라이트';

  @override
  String get appearance_dark => '다크';

  @override
  String get onboarding_title => '운동 맞춤 설정';

  @override
  String get onboarding_goalTitle => '주요 목표가 무엇인가요?';

  @override
  String get onboarding_goalSubtitle => '다음 추천을 맞춤화하는 데 사용됩니다.';

  @override
  String get onboarding_goalMuscle => '근육량 늘리기';

  @override
  String get onboarding_goalStrength => '근력 향상';

  @override
  String get onboarding_goalFatLoss => '체지방 감량';

  @override
  String get onboarding_goalFitness => '체력 향상';

  @override
  String get onboarding_experienceTitle => '운동 경험은 어느 정도인가요?';

  @override
  String get onboarding_experienceSubtitle => '수준에 맞게 운동량과 진행을 조정합니다.';

  @override
  String get onboarding_experienceBeginner => '초급';

  @override
  String get onboarding_experienceBeginnerHint => '1년 미만';

  @override
  String get onboarding_experienceIntermediate => '중급';

  @override
  String get onboarding_experienceIntermediateHint => '1~3년';

  @override
  String get onboarding_experienceAdvanced => '고급';

  @override
  String get onboarding_experienceAdvancedHint => '3년 이상';

  @override
  String get onboarding_daysTitle => '일주일에 며칠 운동할 수 있나요?';

  @override
  String get onboarding_daysSubtitle => '꾸준히 유지할 수 있는 빈도를 선택하세요.';

  @override
  String onboarding_daysSelected(int count) {
    return '주 $count일';
  }

  @override
  String get onboarding_equipmentTitle => '사용할 수 있는 기구는 무엇인가요?';

  @override
  String get onboarding_equipmentSubtitle => '평소 사용할 수 있는 기구를 모두 선택하세요.';

  @override
  String get onboarding_continue => '계속';

  @override
  String get onboarding_back => '뒤로';

  @override
  String get onboarding_finish => '저장하고 시작';

  @override
  String get onboarding_skip => '나중에';

  @override
  String get onboarding_saved => '설정을 저장했습니다';

  @override
  String get weeklyPlan_title => '주간 계획';

  @override
  String weeklyPlan_sessions(int done, int total) {
    return '$done/$total 세션';
  }

  @override
  String get weeklyPlan_adherence => '달성률';

  @override
  String get weeklyPlan_remaining => '남은 횟수';

  @override
  String get weeklyPlan_completedSets => '세트';

  @override
  String get weeklyPlan_muscleBalance => '부위별 세트';

  @override
  String get weeklyPlan_completed => '주간 목표를 달성했습니다. 잘했어요.';

  @override
  String get weeklyPlan_nextSession => '다음 세션';

  @override
  String weeklyPlan_exerciseCount(int count) {
    return '운동 $count개';
  }

  @override
  String get weeklyPlan_start => '시작';

  @override
  String get weeklyPlan_noCompatible => '사용 가능한 기구와 호환되는 운동이 충분하지 않습니다.';

  @override
  String get weeklyPlan_adjustEquipment => '조정';

  @override
  String get weeklyPlan_setupTitle => '계획 설정';

  @override
  String get weeklyPlan_setupSubtitle => '설정을 완료하면 매주 맞춤 세션을 추천합니다.';

  @override
  String get weeklyPlan_configure => '설정';

  @override
  String get weeklyPlan_adaptiveName => '맞춤 세션';

  @override
  String get train_title => '운동';

  @override
  String get train_readyTitle => '운동할 준비 되셨나요?';

  @override
  String get train_readySubtitle => '자유 세션을 시작하거나 미리 설정된 루틴을 선택하세요.';

  @override
  String get train_freeSession => '자유 세션';

  @override
  String get train_freeWorkout => '자유 운동';

  @override
  String get train_myRoutines => '내 루틴';

  @override
  String get train_predefinedRoutines => '기본 루틴';

  @override
  String get train_inProgress => '진행 중';

  @override
  String get train_readyToStart => '시작 준비 완료';

  @override
  String get train_startSession => '시작';

  @override
  String get train_resumeTitle => '운동을 계속하시겠습니까?';

  @override
  String train_resumeBody(String name) {
    return '\"$name\" 운동이 진행 중입니다. 이어서 하시겠습니까?';
  }

  @override
  String get train_resumeContinue => '계속';

  @override
  String get train_resumeDiscard => '취소';

  @override
  String get train_cancelWorkout => '운동을 삭제할까요?';

  @override
  String get train_cancelConfirm => '이번 세션에 기록한 세트가 사라집니다.';

  @override
  String get train_continue => '계속 운동하기';

  @override
  String get train_addExerciseFirst => '종료하기 전에 운동을 하나 이상 추가하세요.';

  @override
  String get train_completeSetFirst => '완료하기 전에 최소 한 세트를 완료하세요.';

  @override
  String get train_workoutCompleted => '운동 완료!';

  @override
  String get train_completedSets => '완료한 세트';

  @override
  String get train_totalVolume => '총 볼륨';

  @override
  String get train_saveAsRoutine => '루틴으로 저장';

  @override
  String get train_finish => '완료';

  @override
  String get train_newAchievement => '새 업적 달성!';

  @override
  String get train_great => '잘했어요!';

  @override
  String get train_routineNameHint => '루틴 이름';

  @override
  String train_routineSaved(String name) {
    return '루틴 \"$name\" 저장됨';
  }

  @override
  String get train_deleteRoutine => '루틴 삭제';

  @override
  String train_deleteRoutineConfirm(String name) {
    return '\"$name\"을(를) 삭제하시겠습니까?';
  }

  @override
  String get train_noExercisesYet => '아직 운동이 없습니다';

  @override
  String get train_addExerciseHint => '아래 버튼을 눌러 첫 번째 운동을 추가하세요.';

  @override
  String get train_addExercise => '운동 추가';

  @override
  String get train_exercise => '운동';

  @override
  String train_exerciseCount(int count) {
    return '$count개 운동';
  }

  @override
  String train_startTemplate(String name) {
    return '$name 시작';
  }

  @override
  String train_setsProgress(int done, int total) {
    return '$done/$total 세트 ✓';
  }

  @override
  String get train_viewProgress => '진행 상황 보기';

  @override
  String get train_deleteExercise => '운동 삭제';

  @override
  String train_deleteExerciseConfirm(String name) {
    return '\"$name\"을(를) 삭제하시겠습니까? 완료된 세트가 사라집니다.';
  }

  @override
  String get train_notesHint => '메모 (선택사항)';

  @override
  String get train_setHeader => '세트';

  @override
  String get train_repsHeader => '횟수';

  @override
  String get train_weightHeader => '무게';

  @override
  String get train_addSet => '세트 추가';

  @override
  String get train_nextSuggestion => '다음 추천 중량';

  @override
  String get train_applySuggestion => '적용';

  @override
  String get train_abbreviationExercises => '종목';

  @override
  String get train_defaultRoutineName => '내 루틴';

  @override
  String get train_createRoutine => '루틴 만들기';

  @override
  String get train_editRoutine => '루틴 편집';

  @override
  String train_routineUpdated(String name) {
    return '루틴 \"$name\" 업데이트됨';
  }

  @override
  String get train_addFirstExercise => '첫 운동 추가';

  @override
  String get train_addFirstExerciseHint => '여기 또는 ‘운동 추가’를 눌러 첫 운동을 추가하세요.';

  @override
  String get train_removeSet => '세트 삭제';

  @override
  String get train_routinesHint =>
      '하루에 하나 이상의 루틴을 둘 수 있어요. 그날을 시작하면 모든 루틴을 순서대로 진행해요.';

  @override
  String get train_firstRoutineTitle => '첫 루틴 만들기';

  @override
  String get train_firstRoutineBody =>
      '운동을 고르고 요일을 지정하면 그날 홈에 바로 시작할 수 있게 표시돼요.';

  @override
  String get train_freeSessionHint => '계획이 없나요? 자유 세션을 시작하고 운동을 추가하며 진행하세요.';

  @override
  String get profile_keepScreenOn => '운동 중 화면 켜두기';

  @override
  String get profile_keepScreenOnSubtitle => '세트 사이에 휴대폰이 잠기지 않게 합니다';

  @override
  String get profile_weightUnit => '무게 단위';

  @override
  String get weightUnit_kg => '킬로그램 (kg)';

  @override
  String get weightUnit_lb => '파운드 (lb)';

  @override
  String get train_repShort => '회';

  @override
  String get rest_label => '휴식';

  @override
  String get rest_forExercise => '이 운동의 휴식';

  @override
  String get rest_default => '기본값';

  @override
  String get rest_defaultHint => '휴식 타이머에서 선택한 시간 사용';

  @override
  String get train_newRecords => '새 기록';

  @override
  String train_recordLine(String weight, String previous) {
    return '$weight (이전 $previous)';
  }

  @override
  String train_volumeUp(String kg) {
    return '지난번보다 볼륨 +$kg';
  }

  @override
  String train_volumeDown(String kg) {
    return '지난번보다 볼륨 −$kg';
  }

  @override
  String get train_volumeSame => '지난번과 같은 볼륨';

  @override
  String get train_discardWorkout => '삭제';

  @override
  String get train_previousHeader => '이전';

  @override
  String get train_usePrevious => '이전 값 복사';

  @override
  String get train_removeCompletedSetTitle => '완료한 세트를 삭제할까요?';

  @override
  String train_removeCompletedSetBody(int setNumber) {
    return '$setNumber번 세트는 완료되었으며 삭제하면 운동 기록에 포함되지 않습니다.';
  }

  @override
  String get train_createRoutineHint => '운동을 선택하고 다음 훈련을 위해 미리 준비하세요.';

  @override
  String get train_routineNameRequired => '루틴 이름을 입력하세요.';

  @override
  String train_addRoutineForDay(String day) {
    return '$day에 다른 루틴 추가';
  }

  @override
  String get train_trainingDay => '운동 요일';

  @override
  String get train_noAssignedDay => '요일 미지정';

  @override
  String get train_trainingDayHint => '요일별로 묶어 전체 루틴을 한곳에서 확인하세요.';

  @override
  String get train_organizeRoutine => '루틴 정리';

  @override
  String train_blockCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개 블록',
    );
    return '$_temp0';
  }

  @override
  String get train_noRoutinesForDay => '이 요일에는 아직 블록이 없습니다.';

  @override
  String get train_reorderBlocksHint => '길게 누르고 드래그하여 순서를 변경하세요.';

  @override
  String get train_startCompleteRoutine => '전체 루틴 시작';

  @override
  String train_routineForDay(String day) {
    return '$day 루틴';
  }

  @override
  String get train_bodyweightLabel => '체중';

  @override
  String get train_chooseWeight => '중량 선택';

  @override
  String get picker_title => '운동 선택';

  @override
  String get picker_searchHint => '운동 검색...';

  @override
  String get picker_createManual => '직접 운동 만들기';

  @override
  String get picker_createManualSubtitle => '이름, 근육 부위, 기구';

  @override
  String get picker_createTitle => '운동 만들기';

  @override
  String get picker_nameLabel => '이름';

  @override
  String get picker_nameHint => '예: 해머 컬';

  @override
  String get picker_muscleGroupLabel => '근육 부위';

  @override
  String get picker_equipmentLabel => '기구';

  @override
  String get picker_addExercise => '운동 추가';

  @override
  String get exercises_title => '운동 목록';

  @override
  String get exercises_searchHint => '운동 검색...';

  @override
  String get exercises_muscleFilter => '근육';

  @override
  String get exercises_equipmentFilter => '기구';

  @override
  String exercises_countLabel(num count) {
    return '$count개 운동';
  }

  @override
  String get exercises_descriptionUnavailable => '이 언어의 자세한 설명은 아직 제공되지 않습니다.';

  @override
  String get exercises_clearFilters => '필터 초기화';

  @override
  String get exercises_noResults => '결과 없음';

  @override
  String get exercises_noResultsHint => '다른 필터나 검색어로 시도해 보세요';

  @override
  String get exercises_deleteTitle => '운동 삭제';

  @override
  String exercises_deleteConfirm(String name) {
    return '\"$name\"을(를) 운동 목록에서 삭제하시겠습니까?';
  }

  @override
  String get exercises_muscleGroupLabel => '근육 부위';

  @override
  String get exercises_materialLabel => '기구';

  @override
  String get exercises_executionTitle => '수행 방법';

  @override
  String get exercises_secondaryMuscles => '보조 근육';

  @override
  String get exercises_benefits => '효과';

  @override
  String get exercises_viewProgress => '진행 상황 보기';

  @override
  String get exercises_addToWorkout => '운동에 추가';

  @override
  String get progress_maxWeight => '최대 무게';

  @override
  String get progress_volumeLabel => '볼륨';

  @override
  String get progress_noData => '이 운동에 대한 데이터가 없습니다';

  @override
  String get progress_needMoreSessions => '진행 상황을 보려면 최소 2회 이상의 기록이 필요합니다';

  @override
  String get progress_lastVolume => '최근 볼륨';

  @override
  String get progress_lastWeight => '최근 무게';

  @override
  String get progress_best => '최고';

  @override
  String get progress_progressLabel => '진행 상황';

  @override
  String get progress_historyTitle => '기록';

  @override
  String get history_title => '기록';

  @override
  String get history_exportCsv => 'CSV 내보내기';

  @override
  String get history_allWorkouts => '모든 운동';

  @override
  String get history_noWorkoutsYet => '아직 운동 기록이 없습니다';

  @override
  String get history_noWorkoutsSubtitle => '운동 탭에서 첫 번째 운동을 완료하면 여기에 표시됩니다.';

  @override
  String get history_weeklySummary => '주간 요약';

  @override
  String get history_workouts => '운동';

  @override
  String get history_total => '합계';

  @override
  String get history_volumeKg => '볼륨';

  @override
  String get history_routinesByDay => '요일별 루틴';

  @override
  String history_sessionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count회 세션',
    );
    return '$_temp0';
  }

  @override
  String history_dayRoutineTitle(String day) {
    return '$day 운동';
  }

  @override
  String get history_dayRoutineHint => '같은 요일의 블록이 순서대로 함께 표시됩니다.';

  @override
  String get history_dayMon => '월';

  @override
  String get history_dayTue => '화';

  @override
  String get history_dayWed => '수';

  @override
  String get history_dayThu => '목';

  @override
  String get history_dayFri => '금';

  @override
  String get history_daySat => '토';

  @override
  String get history_daySun => '일';

  @override
  String get history_exercisesPerformed => '수행한 운동';

  @override
  String history_setsCount(int count) {
    return '$count세트';
  }

  @override
  String get history_setHeader => '세트';

  @override
  String get detail_monthJan => '1월';

  @override
  String get detail_monthFeb => '2월';

  @override
  String get detail_monthMar => '3월';

  @override
  String get detail_monthApr => '4월';

  @override
  String get detail_monthMay => '5월';

  @override
  String get detail_monthJun => '6월';

  @override
  String get detail_monthJul => '7월';

  @override
  String get detail_monthAug => '8월';

  @override
  String get detail_monthSep => '9월';

  @override
  String get detail_monthOct => '10월';

  @override
  String get detail_monthNov => '11월';

  @override
  String get detail_monthDec => '12월';

  @override
  String detail_dateFormat(int day, String month, int year) {
    return '$year년 $month $day일';
  }

  @override
  String get paywall_subtitle => '잠재력을 최대한 발휘하세요';

  @override
  String get paywall_featureTemplates => '모든 기본 루틴';

  @override
  String get paywall_featureMeasures => '허리·가슴·엉덩이 둘레와 진행 사진';

  @override
  String get paywall_featureExerciseProgress => '운동별 진행 그래프';

  @override
  String get paywall_allIncluded => '모두 포함';

  @override
  String get paywall_weekly => '주간';

  @override
  String get paywall_monthly => '월간';

  @override
  String get paywall_yearly => '연간';

  @override
  String get paywall_bestValue => '최고 가치';

  @override
  String get paywall_perWeek => '/주';

  @override
  String get paywall_perMonth => '/월';

  @override
  String get paywall_perYear => '/년';

  @override
  String get paywall_startTrial => '무료 체험 시작';

  @override
  String get paywall_subscribe => '구독하기';

  @override
  String get paywall_restorePurchases => '구매 복원';

  @override
  String get paywall_legalText =>
      '구독은 자동으로 갱신됩니다.\nApp Store에서 언제든지 해지할 수 있습니다.';

  @override
  String get paywall_legalTextPlay =>
      '구독은 자동으로 갱신됩니다.\nGoogle Play에서 언제든지 해지할 수 있습니다.';

  @override
  String get paywall_legalTextTrial =>
      '무료 체험 기간이 끝나면 유료 구독으로 전환됩니다. 체험 기간 중 언제든지 취소 가능합니다. 구독은 자동으로 갱신됩니다.';

  @override
  String get paywall_termsLink => '이용약관';

  @override
  String get paywall_privacyLink => '개인정보 처리방침';

  @override
  String get paywall_purchaseError => '구매를 완료할 수 없습니다.';

  @override
  String get paywall_noPurchasesFound => '이전 구매 내역이 없습니다.';

  @override
  String paywall_trialDays(int count) {
    return '$count일 무료';
  }

  @override
  String paywall_trialMonths(int count) {
    return '$count개월 무료';
  }

  @override
  String paywall_trialThenPrice(String price) {
    return '이후 $price';
  }

  @override
  String get paywall_offersUnavailable => '제안을 불러올 수 없습니다';

  @override
  String get paywall_retry => '다시 시도';

  @override
  String rest_of(String time) {
    return '$time 중';
  }

  @override
  String get progressScreen_measurements => '측정';

  @override
  String get progressScreen_photos => '사진';

  @override
  String get progressScreen_addMeasurement => '측정 추가';

  @override
  String get progressScreen_weight => '체중';

  @override
  String get progressScreen_noEntries => '아직 기록이 없습니다';

  @override
  String get progressScreen_noPhotos => '아직 사진이 없습니다';

  @override
  String get progressScreen_camera => '카메라';

  @override
  String get progressScreen_gallery => '갤러리';

  @override
  String get progressScreen_waist => '허리';

  @override
  String get progressScreen_chest => '가슴';

  @override
  String get progressScreen_hips => '엉덩이';

  @override
  String get progressScreen_record => '기록';

  @override
  String get progressScreen_noDataMetric => '이 지표에 대한 데이터가 없습니다';

  @override
  String get progressScreen_addMoreRecords => '차트를 보려면 더 많은 기록을 추가하세요';

  @override
  String get progressScreen_historyTitle => '기록';

  @override
  String get progressScreen_noEntriesSubtitle =>
      '첫 번째 체중과 측정값을 기록하여\n진행 상황을 확인하세요.';

  @override
  String get progressScreen_addFirstRecord => '첫 번째 기록 추가';

  @override
  String get progressScreen_progressPhotos => '진행 사진';

  @override
  String get progressScreen_progressPhotosHint =>
      '사진으로 시각적 진행 상황을 기록하세요.\nLiftWave PRO에서 이용 가능합니다.';

  @override
  String get progressScreen_unlockWithPro => 'PRO로 잠금 해제';

  @override
  String get progressScreen_noPhotosSubtitle =>
      '측정값을 기록할 때 사진을 추가하여\n시각적 진행 상황을 확인하세요.';

  @override
  String get progressScreen_addPhoto => '사진 추가';

  @override
  String get progressScreen_newRecord => '새 기록';

  @override
  String get progressScreen_photoAdded => '사진이 추가되었습니다';

  @override
  String get progressScreen_addPhotoOptional => '사진 추가 (선택사항)';

  @override
  String get progressScreen_saveRecord => '기록 저장';

  @override
  String get progressScreen_enterAtLeastOneValue => '최소 하나의 값을 입력하세요';

  @override
  String get progressScreen_monthShortJan => '1월';

  @override
  String get progressScreen_monthShortFeb => '2월';

  @override
  String get progressScreen_monthShortMar => '3월';

  @override
  String get progressScreen_monthShortApr => '4월';

  @override
  String get progressScreen_monthShortMay => '5월';

  @override
  String get progressScreen_monthShortJun => '6월';

  @override
  String get progressScreen_monthShortJul => '7월';

  @override
  String get progressScreen_monthShortAug => '8월';

  @override
  String get progressScreen_monthShortSep => '9월';

  @override
  String get progressScreen_monthShortOct => '10월';

  @override
  String get progressScreen_monthShortNov => '11월';

  @override
  String get progressScreen_monthShortDec => '12월';

  @override
  String get achievement_firstWorkout_title => '첫 운동';

  @override
  String get achievement_firstWorkout_description => '첫 번째 운동을 완료하세요';

  @override
  String get achievement_streak7_title => '7일 연속';

  @override
  String get achievement_streak7_description => '7일 연속으로 최소 1회 운동하세요';

  @override
  String get achievement_streak30_title => '30일 연속';

  @override
  String get achievement_streak30_description => '30일 동안 매주 최소 1회 운동하세요';

  @override
  String get achievement_volume1000_title => '1,000 kg 달성';

  @override
  String get achievement_volume1000_description => '총 볼륨 1,000 kg를 달성하세요';

  @override
  String get achievement_volume5000_title => '5,000 kg 달성';

  @override
  String get achievement_volume5000_description => '총 볼륨 5,000 kg를 달성하세요';

  @override
  String get achievement_volume10000_title => '10,000 kg 달성';

  @override
  String get achievement_volume10000_description => '총 볼륨 10,000 kg를 달성하세요';

  @override
  String get achievement_personalRecord_title => '새 개인 기록';

  @override
  String get achievement_personalRecord_description => '한 운동에서 최대 무게를 갱신하세요';

  @override
  String get achievement_streak14_title => '14일 연속';

  @override
  String get achievement_streak14_description => '14일 연속으로 최소 1번 운동';

  @override
  String get achievement_streak100_title => '100일 연속';

  @override
  String get achievement_streak100_description => '주 1회 이상 운동을 100일간 유지';

  @override
  String get achievement_streak365_title => '1년 달성';

  @override
  String get achievement_streak365_description => '연속 기록을 1년 동안 유지';

  @override
  String get achievement_bench50_title => '벤치프레스 50 kg';

  @override
  String get achievement_bench50_description => '50 kg 이상의 벤치프레스를 완수';

  @override
  String get achievement_bench100_title => '벤치프레스 100 kg';

  @override
  String get achievement_bench100_description => '100 kg 이상의 벤치프레스를 완수';

  @override
  String get achievement_squat100_title => '스쿼트 100 kg';

  @override
  String get achievement_squat100_description => '100 kg 이상의 스쿼트를 완수';

  @override
  String get achievement_squat150_title => '스쿼트 150 kg';

  @override
  String get achievement_squat150_description => '150 kg 이상의 스쿼트를 완수';

  @override
  String get achievement_deadlift100_title => '데드리프트 100 kg';

  @override
  String get achievement_deadlift100_description => '100 kg 이상의 데드리프트를 완수';

  @override
  String get achievement_deadlift150_title => '데드리프트 150 kg';

  @override
  String get achievement_deadlift150_description => '150 kg 이상의 데드리프트를 완수';

  @override
  String get achievement_deadlift200_title => '데드리프트 200 kg';

  @override
  String get achievement_deadlift200_description => '200 kg 이상의 데드리프트를 완수';

  @override
  String get achievement_explorer10_title => '탐험가';

  @override
  String get achievement_explorer10_description => '운동에서 10개의 다른 운동을 사용';

  @override
  String get achievement_master25_title => '마스터';

  @override
  String get achievement_master25_description => '운동에서 25개의 다른 운동을 사용';

  @override
  String get achievement_fullBodyGroups_title => '전신 운동';

  @override
  String get achievement_fullBodyGroups_description => '모든 근육 그룹을 최소 한 번씩 운동';

  @override
  String get achievement_crossfitFan_title => '크로스핏 팬';

  @override
  String get achievement_crossfitFan_description =>
      '크로스핏 카테고리에서 10가지 다른 운동을 완수';

  @override
  String get achievement_time1h_title => '총 1시간';

  @override
  String get achievement_time1h_description => '총 1시간의 운동 시간을 달성';

  @override
  String get achievement_time10h_title => '10시간';

  @override
  String get achievement_time10h_description => '총 10시간의 운동 시간을 달성';

  @override
  String get achievement_time50h_title => '50시간';

  @override
  String get achievement_time50h_description => '총 50시간의 운동 시간을 달성';

  @override
  String get achievement_time100h_title => '100시간';

  @override
  String get achievement_time100h_description => '총 100시간의 운동 시간을 달성';

  @override
  String get achievement_earlyBird_title => '얼리버드';

  @override
  String get achievement_earlyBird_description => '오전 7시 이전에 운동 시작';

  @override
  String get achievement_nightOwl_title => '야행성';

  @override
  String get achievement_nightOwl_description => '22시 이후에 운동 종료';

  @override
  String get achievement_comeback_title => '컴백';

  @override
  String get achievement_comeback_description => '30일 이상 쉰 후 다시 운동 시작';

  @override
  String get achievement_marathoner_title => '마라토너';

  @override
  String get achievement_marathoner_description => '90분 이상의 운동을 완료';

  @override
  String get achievement_efficient_title => '효율적';

  @override
  String get achievement_efficient_description => '3개 이상의 운동을 30분 미만에 완료';

  @override
  String get achievement_weekendWarrior_title => '주말 전사';

  @override
  String get achievement_weekendWarrior_description => '3주 연속 토요일과 일요일에 운동';

  @override
  String get achievement_weeklyVariety_title => '주간 다양성';

  @override
  String get achievement_weeklyVariety_description => '한 주에 5개의 다른 근육 그룹을 운동';

  @override
  String get csv_header => '날짜,운동명,운동종목,근육부위,세트,횟수,무게(kg),볼륨(kg)';

  @override
  String get csv_subject => 'LiftWave - 운동 기록';

  @override
  String get template_fullBody_subtitle => '모든 근육 부위를 한 번에';

  @override
  String get template_fullBody_name => '전신';

  @override
  String get template_push_name => '밀기';

  @override
  String get template_pull_name => '당기기';

  @override
  String get template_torso_name => '상체';

  @override
  String get template_push_subtitle => '가슴 · 어깨 · 삼두';

  @override
  String get template_pull_subtitle => '등 · 이두';

  @override
  String get template_torso_subtitle => '가슴 · 등 · 어깨';

  @override
  String get template_legs_subtitle => '대퇴사두 · 햄스트링 · 둔근 · 코어';

  @override
  String get template_legs_name => '하체';

  @override
  String get ex_pecho_6_name => '인클라인 바벨 프레스';

  @override
  String get ex_pecho_6_desc =>
      '벤치를 30-45° 각도로 조절합니다. 어깨보다 약간 넓은 간격으로 바를 잡습니다. 바를 가슴 상부까지 천천히 내린 후 팔을 완전히 펼 때까지 밀어 올립니다. 허리를 벤치에 붙이고 견갑골을 모은 상태를 유지합니다.';

  @override
  String get ex_pecho_6_b1 => '가슴 상부(쇄골부)를 집중적으로 자극합니다';

  @override
  String get ex_pecho_6_b2 => '덤벨보다 더 많은 중량을 사용할 수 있습니다';

  @override
  String get ex_pecho_6_b3 => '높은 각도에서의 미는 힘을 향상시킵니다';

  @override
  String get ex_pecho_7_name => '디클라인 덤벨 프레스';

  @override
  String get ex_pecho_7_desc =>
      '벤치를 15-30° 디클라인 각도로 조절합니다. 양손에 덤벨을 들고 가슴 높이에서 시작하여 상단에서 덤벨을 모으며 위로 밀어 올립니다. 가슴 하부가 늘어나는 것을 느끼며 천천히 내립니다.';

  @override
  String get ex_pecho_7_b1 => '가슴 하부를 자극합니다';

  @override
  String get ex_pecho_7_b2 => '어깨의 개입을 줄여줍니다';

  @override
  String get ex_pecho_7_b3 => '디클라인 바벨 프레스보다 더 넓은 가동 범위를 제공합니다';

  @override
  String get ex_pecho_8_name => '푸시업';

  @override
  String get ex_pecho_8_desc =>
      '손을 어깨 너비로 바닥에 짚고 두 발을 모읍니다. 머리부터 발뒤꿈치까지 몸을 일직선으로 유지합니다. 팔꿈치를 구부려 가슴이 바닥에 거의 닿을 때까지 내려간 후 다시 밀어 올립니다. 동작 내내 코어에 힘을 유지합니다.';

  @override
  String get ex_pecho_8_b1 => '장비가 필요 없습니다';

  @override
  String get ex_pecho_8_b2 => '다양한 변형(다이아몬드, 디클라인, 클랩)으로 단계적으로 발전할 수 있습니다';

  @override
  String get ex_pecho_8_b3 => '코어도 함께 강화하는 복합 운동입니다';

  @override
  String get ex_pecho_9_name => '덤벨 풀오버';

  @override
  String get ex_pecho_9_desc =>
      '평평한 벤치에 누워 양손으로 덤벨 하나를 잡고 가슴 위로 팔을 뻗습니다. 가슴과 광배근이 늘어나는 것을 느낄 때까지 덤벨을 머리 위쪽으로 호를 그리며 내립니다. 가슴을 수축하며 시작 자세로 돌아옵니다.';

  @override
  String get ex_pecho_9_b1 => '가슴과 광배근을 동시에 자극합니다';

  @override
  String get ex_pecho_9_b2 => '어깨와 흉곽의 가동성을 향상시킵니다';

  @override
  String get ex_pecho_9_b3 => '프레스와 로우 세트 사이에 넣기 좋은 훌륭한 보완 운동입니다';

  @override
  String get ex_esp_6_name => '티바 로우';

  @override
  String get ex_esp_6_desc =>
      '발을 어깨 너비로 벌리고 티바 위에 자리를 잡습니다. 등을 중립으로 유지한 채 상체를 앞으로 숙이고 팔꿈치를 뒤로 보내며 핸들을 가슴 쪽으로 당깁니다. 마지막 위치에서 견갑골을 조이고 천천히 내립니다.';

  @override
  String get ex_esp_6_b1 => '등 중부의 두께를 발달시킵니다';

  @override
  String get ex_esp_6_b2 => '프리웨이트 로우보다 허리 부담이 적으면서 매우 높은 중량을 다룰 수 있습니다';

  @override
  String get ex_esp_6_b3 => '자세와 견갑골 안정성을 훈련합니다';

  @override
  String get ex_esp_7_name => '시티드 케이블 로우';

  @override
  String get ex_esp_7_desc =>
      '낮은 풀리 앞에 앉아 발을 받쳐 고정합니다. 팔을 펴고 등을 중립으로 유지한 채 액세서리를 잡습니다. 견갑골을 모으고 상체를 곧게 세운 채 손을 복부 쪽으로 당깁니다. 등을 둥글게 말지 않고 천천히 돌아옵니다.';

  @override
  String get ex_esp_7_b1 => '동작 전체에 걸쳐 일정한 긴장을 유지합니다';

  @override
  String get ex_esp_7_b2 => '무게를 늘리기 쉽고 기술이 접근하기 쉽습니다';

  @override
  String get ex_esp_7_b3 => '등 중부의 두께 발달에 탁월합니다';

  @override
  String get ex_esp_8_name => '덤벨 슈러그';

  @override
  String get ex_esp_8_desc =>
      '양손에 덤벨을 들고 몸 옆에 둔 채 팔에 힘을 빼고 섭니다. 팔꿈치를 구부리지 않고 어깨를 귀 쪽으로 들어올립니다. 정점에서 1초간 수축을 유지한 후 천천히 내립니다. 어깨를 돌리지 마세요. 동작은 순수하게 수직으로만 이루어집니다.';

  @override
  String get ex_esp_8_b1 => '상부 승모근을 직접적으로 고립시킵니다';

  @override
  String get ex_esp_8_b2 => '자세와 목 라인을 개선합니다';

  @override
  String get ex_esp_8_b3 => '다른 리프트를 위한 견갑골 안정성을 강화합니다';

  @override
  String get ex_esp_9_name => '굿모닝';

  @override
  String get ex_esp_9_desc =>
      '스쿼트를 할 때처럼 바를 승모근 위에 올립니다. 발을 골반 너비로 벌리고 무릎을 살짝 구부린 채 등을 중립으로 유지하며 고관절을 접어 상체를 앞으로 숙입니다. 상체가 바닥과 거의 평행이 될 때까지 내려간 후 둔근을 조이며 돌아옵니다.';

  @override
  String get ex_esp_9_b1 => '후면 사슬과 허리를 강화합니다';

  @override
  String get ex_esp_9_b2 => '데드리프트와 스쿼트를 위한 힙 힌지를 향상시킵니다';

  @override
  String get ex_esp_9_b3 => '파워리프팅의 핵심 보조 운동입니다';

  @override
  String get ex_pier_6_name => '프론트 스쿼트';

  @override
  String get ex_pier_6_desc =>
      '바를 전면 삼각근 위에 올리고 팔꿈치를 높이 든 채 크로스 그립 또는 클린 그립으로 잡습니다. 발을 어깨 너비로 벌립니다. 상체를 수직으로 세우고 팔꿈치를 앞으로 향하게 유지하며 허벅지가 평행 지점을 지날 때까지 내려갑니다. 발뒤꿈치로 밀어 시작 자세로 돌아옵니다.';

  @override
  String get ex_pier_6_b1 => '백 스쿼트보다 대퇴사두근을 더 집중적으로 자극합니다';

  @override
  String get ex_pier_6_b2 => '매우 강한 코어와 곧게 세운 자세를 요구합니다';

  @override
  String get ex_pier_6_b3 => '크로스핏의 클린과 스러스터를 위한 기술적 기초입니다';

  @override
  String get ex_pier_7_name => '불가리안 스플릿 스쿼트';

  @override
  String get ex_pier_7_desc =>
      '양손에 덤벨을 들고 뒷발의 발등을 벤치 위에 올립니다. 앞발을 앞쪽에 둔 채 앞쪽 무릎을 구부려 허벅지가 바닥과 평행이 될 때까지 내려갑니다. 앞발 뒤꿈치로 밀어 다시 올라옵니다.';

  @override
  String get ex_pier_7_b1 => '다리 간의 불균형을 교정하는 편측 운동입니다';

  @override
  String get ex_pier_7_b2 => '둔근과 대퇴사두근을 강하게 활성화합니다';

  @override
  String get ex_pier_7_b3 => '균형감과 고관절 안정성을 향상시킵니다';

  @override
  String get ex_pier_8_name => '루마니안 데드리프트';

  @override
  String get ex_pier_8_desc =>
      '어깨 너비의 오버핸드 그립으로 바를 골반 높이에 들고 섭니다. 무릎을 살짝 구부려 고정한 채 고관절을 접어 상체를 숙이며 햄스트링에 긴장이 느껴질 때까지 바를 다리를 따라 내립니다. 둔근을 조이며 돌아옵니다.';

  @override
  String get ex_pier_8_b1 => '햄스트링과 둔근을 강하게 고립시킵니다';

  @override
  String get ex_pier_8_b2 => '후면 사슬을 강화하고 힙 힌지를 향상시킵니다';

  @override
  String get ex_pier_8_b3 => '달리기나 점프 시 햄스트링 부상 위험을 줄여줍니다';

  @override
  String get ex_pier_9_name => '레그 익스텐션';

  @override
  String get ex_pier_9_desc =>
      '머신에 앉아 등을 기대고 롤러를 발등 위에 놓습니다. 무릎을 잠그지 않고 다리가 거의 곧게 펴질 때까지 무릎을 펴며 무게를 들어올립니다. 정점에서 대퇴사두근을 조이고 천천히 내립니다.';

  @override
  String get ex_pier_9_b1 => '대퇴사두근을 직접적으로 고립시킵니다';

  @override
  String get ex_pier_9_b2 => '재활과 집중적인 근비대 훈련에 유용합니다';

  @override
  String get ex_pier_9_b3 => '부하를 정밀하게 조절할 수 있고 위험이 낮습니다';

  @override
  String get ex_pier_10_name => '카프 레이즈';

  @override
  String get ex_pier_10_desc =>
      '카프 레이즈 머신의 패드 아래에 어깨를 댑니다 (또는 서서 덤벨을 사용합니다). 발 앞꿈치를 발판에 올리고 발뒤꿈치는 허공에 둡니다. 발 앞꿈치로 밀어 올라가 정점에서 종아리를 조입니다. 늘어나는 것을 느끼며 천천히 내려옵니다.';

  @override
  String get ex_pier_10_b1 => '가자미근과 비복근을 고립시킵니다';

  @override
  String get ex_pier_10_b2 => '점프와 스프린트의 파워를 향상시킵니다';

  @override
  String get ex_pier_10_b3 => '발목과 아킬레스건 부상 위험을 줄여줍니다';

  @override
  String get ex_hom_5_name => '덤벨 숄더 프레스';

  @override
  String get ex_hom_5_desc =>
      '등받이를 곧게 세우고 앉아 손바닥이 앞을 향하도록 덤벨을 어깨 양옆에 듭니다. 팔꿈치를 잠그지 않고 머리 위에서 덤벨이 거의 닿을 때까지 밀어 올립니다. 천천히 시작 자세로 내립니다.';

  @override
  String get ex_hom_5_b1 => '바벨 프레스보다 더 넓은 가동 범위를 제공합니다';

  @override
  String get ex_hom_5_b2 => '양쪽을 독립적으로 훈련할 수 있습니다';

  @override
  String get ex_hom_5_b3 => '바벨에 비해 어깨 부담을 줄여줍니다';

  @override
  String get ex_hom_6_name => '프론트 레이즈';

  @override
  String get ex_hom_6_desc =>
      '양손에 덤벨을 들고 허벅지 앞에 둔 채 손바닥이 몸을 향하게 하고 섭니다. 팔꿈치를 거의 편 상태로 유지하며 팔을 교대로 또는 동시에 어깨 높이까지 앞으로 들어올립니다. 몸을 흔들지 않고 천천히 내립니다.';

  @override
  String get ex_hom_6_b1 => '전면 삼각근을 고립시킵니다';

  @override
  String get ex_hom_6_b2 => '어깨 앞쪽의 외형을 개선합니다';

  @override
  String get ex_hom_6_b3 => '벤치프레스와 밀리터리 프레스의 보조 운동입니다';

  @override
  String get ex_hom_7_name => '벤트오버 레터럴 레이즈';

  @override
  String get ex_hom_7_desc =>
      '양손에 덤벨을 들고 고관절을 접어 상체가 바닥과 거의 평행이 되도록 앞으로 숙이고 팔을 아래로 늘어뜨립니다. 팔꿈치를 살짝 구부린 채 팔을 어깨 높이까지 옆으로 들어올립니다. 위에서 후면 삼각근을 조이고 천천히 내립니다.';

  @override
  String get ex_hom_7_b1 => '자세의 핵심 부위인 후면 삼각근을 고립시킵니다';

  @override
  String get ex_hom_7_b2 => '밀기 운동의 효과를 상쇄합니다';

  @override
  String get ex_hom_7_b3 => '회전근개 부상 위험을 줄여줍니다';

  @override
  String get ex_bra_6_name => '프리처 컬';

  @override
  String get ex_bra_6_desc =>
      '프리처 벤치에 앉아 팔을 패드 위에 올립니다. 바(스트레이트 바 또는 이지바)를 언더핸드 그립으로 잡습니다. 동작을 통제하며 팔꿈치를 구부려 바를 어깨 쪽으로 올립니다. 마지막에 팔꿈치를 잠그지 않고 천천히 내립니다.';

  @override
  String get ex_bra_6_b1 => '어깨를 고정하여 이두근을 고립시킵니다';

  @override
  String get ex_bra_6_b2 => '반동을 쓸 수 없어 엄격한 자세로 수행하게 됩니다';

  @override
  String get ex_bra_6_b3 => '이두근의 최대 수축에 탁월합니다';

  @override
  String get ex_bra_7_name => '컨센트레이션 컬';

  @override
  String get ex_bra_7_desc =>
      '벤치에 앉아 다리를 벌립니다. 운동하는 팔의 팔꿈치를 허벅지 안쪽에 대고 덤벨을 아래로 늘어뜨립니다. 이두근을 고립시키며 팔꿈치를 구부려 덤벨을 어깨 쪽으로 올립니다. 위에서 조이고 천천히 내립니다.';

  @override
  String get ex_bra_7_b1 => '최대 수축으로 이두근만을 순수하게 고립시킵니다';

  @override
  String get ex_bra_7_b2 => '마인드-머슬 커넥션에 집중할 수 있습니다';

  @override
  String get ex_bra_7_b3 => '팔 운동의 마무리 종목으로 이상적입니다';

  @override
  String get ex_bra_8_name => '클로즈 그립 벤치프레스';

  @override
  String get ex_bra_8_desc =>
      '평평한 벤치에 누워 어깨 너비의 좁은 그립으로 바를 잡습니다. 팔꿈치를 몸에 붙인 채 바가 흉골에 살짝 닿을 때까지 천천히 내립니다. 삼두근의 신전에 집중하며 위로 밀어 올립니다.';

  @override
  String get ex_bra_8_b1 => '삼두근을 집중적으로 자극하는 복합 운동입니다';

  @override
  String get ex_bra_8_b2 => '삼두근 고립 운동보다 더 많은 중량을 사용할 수 있습니다';

  @override
  String get ex_bra_8_b3 => '벤치프레스와 밀리터리 프레스의 근력으로 전이됩니다';

  @override
  String get ex_bra_9_name => '벤치 딥스';

  @override
  String get ex_bra_9_desc =>
      '등 뒤의 벤치에 손가락이 앞을 향하도록 손을 짚습니다. 다리를 앞으로 뻗어 발뒤꿈치로 지지합니다 (더 쉽게 하려면 무릎을 구부립니다). 팔꿈치를 뒤쪽으로 구부려 90°가 될 때까지 내려간 후 밀어 올라옵니다.';

  @override
  String get ex_bra_9_b1 => '장비 없이 삼두근을 고립시킵니다';

  @override
  String get ex_bra_9_b2 => '허벅지 위에 무게를 올려 쉽게 강도를 높일 수 있습니다';

  @override
  String get ex_bra_9_b3 => '몸 뒤쪽 위치에서의 미는 힘을 향상시킵니다';

  @override
  String get ex_core_5_name => '러시안 트위스트';

  @override
  String get ex_core_5_desc =>
      '바닥에 앉아 무릎을 구부리고 발을 들거나 바닥에 댄 채 상체를 뒤로 45° 기울입니다. 양손을 모으고 (또는 중량을 들고) 상체를 좌우로 회전하며 바닥을 터치하거나 중량을 양옆으로 가져갑니다. 코어에 힘을 유지합니다.';

  @override
  String get ex_core_5_b1 => '복사근을 직접적으로 고립시킵니다';

  @override
  String get ex_core_5_b2 => '스포츠에서 핵심인 몸통 회전을 향상시킵니다';

  @override
  String get ex_core_5_b3 => '무게(덤벨, 원판, 볼)를 추가해 강도를 높일 수 있습니다';

  @override
  String get ex_core_6_name => '마운틴 클라이머';

  @override
  String get ex_core_6_desc =>
      '손을 어깨 아래에 두고 하이 플랭크 자세를 취합니다. 제자리에서 달리듯이 무릎을 번갈아 가며 빠르게 가슴 쪽으로 당깁니다. 동작 내내 엉덩이를 낮게 유지하고 코어에 힘을 줍니다.';

  @override
  String get ex_core_6_b1 => '코어 운동과 유산소 운동을 결합합니다';

  @override
  String get ex_core_6_b2 => '장비가 필요 없어 HIIT에 이상적입니다';

  @override
  String get ex_core_6_b3 => '협응력과 지구력을 향상시킵니다';

  @override
  String get ex_core_7_name => '할로우 홀드';

  @override
  String get ex_core_7_desc =>
      '팔을 머리 위로 뻗고 다리를 곧게 편 채 등을 대고 눕습니다. 허리를 바닥에 밀착시키며 팔과 다리를 바닥에서 살짝 들어올립니다. 코어를 완전히 수축한 채 \"보트\" 자세를 유지합니다.';

  @override
  String get ex_core_7_b1 => '크로스핏의 여러 동작을 위한 체조 기초입니다';

  @override
  String get ex_core_7_b2 => '등척성 수축으로 코어 전체를 강화합니다';

  @override
  String get ex_core_7_b3 => '자세와 스트릭트 턱걸이를 위한 근력을 향상시킵니다';

  @override
  String get ex_core_8_name => '사이드 플랭크';

  @override
  String get ex_core_8_desc =>
      '팔꿈치를 어깨 아래에 두고 전완으로 바닥을 짚은 채 옆으로 눕습니다. 엉덩이를 바닥에서 들어올려 발부터 머리까지 일직선을 만듭니다. 엉덩이가 처지지 않도록 자세를 유지합니다. 반대쪽도 반복합니다.';

  @override
  String get ex_core_8_b1 => '복사근과 측면 코어를 강하게 고립시킵니다';

  @override
  String get ex_core_8_b2 => '고관절과 척추의 안정성을 향상시킵니다';

  @override
  String get ex_core_8_b3 => '장비가 필요 없고 충격이 적습니다';

  @override
  String get ex_core_9_name => '데드버그';

  @override
  String get ex_core_9_desc =>
      '등을 대고 누워 팔을 천장 쪽으로 뻗고 무릎을 90°로 구부려 고관절 위에 둡니다. 오른팔은 머리 뒤쪽으로, 왼다리는 편 채 바닥 쪽으로 동시에 내립니다. 허리를 바닥에 붙인 상태를 유지하며 돌아온 후 반대쪽으로 번갈아 수행합니다.';

  @override
  String get ex_core_9_b1 => '코어의 항신전 안정성을 향상시킵니다';

  @override
  String get ex_core_9_b2 => '초보자와 허리 재활에 탁월합니다';

  @override
  String get ex_core_9_b3 => '대측 협응력을 훈련합니다';

  @override
  String get ex_cf_1_name => '클린';

  @override
  String get ex_cf_1_desc =>
      '바닥에서 시작하여 무릎 바로 바깥쪽에서 오버핸드 그립으로 바를 잡습니다. 고관절과 무릎을 펴며 폭발적으로 당기고 어깨를 으쓱한 뒤 바 아래로 몸을 넣어 팔꿈치를 높이 든 프론트 스쿼트 자세로 바를 받습니다. 일어서며 리프트를 완성합니다.';

  @override
  String get ex_cf_1_b1 => '폭발적인 파워를 기르는 완전한 올림픽 리프팅 동작입니다';

  @override
  String get ex_cf_1_b2 => '협응력, 스피드, 근력을 동시에 발달시킵니다';

  @override
  String get ex_cf_1_b3 => '크로스핏의 많은 WOD의 기초입니다';

  @override
  String get ex_cf_2_name => '파워 클린';

  @override
  String get ex_cf_2_desc =>
      '클린과 같지만 풀 스쿼트로 받지 않습니다. 팔꿈치를 높이 들고 바를 어깨 위 프론트 랙 자세에 올린 채 쿼터 스쿼트로 받습니다. 클린보다 빠르고 가동성 요구가 적습니다.';

  @override
  String get ex_cf_2_b1 => '후면 사슬의 폭발적인 파워를 발달시킵니다';

  @override
  String get ex_cf_2_b2 => '풀 클린보다 기술적으로 접근하기 쉽습니다';

  @override
  String get ex_cf_2_b3 => '올림픽 리프팅 초보자에게 탁월합니다';

  @override
  String get ex_cf_3_name => '스내치';

  @override
  String get ex_cf_3_desc =>
      '바닥에서 시작하여 매우 넓은 그립으로 바를 잡습니다. 폭발적으로 당긴 뒤 깊은 스쿼트(오버헤드 스쿼트) 자세에서 팔을 편 채 머리 위로 바를 받습니다. 바를 위에 유지한 채 일어섭니다.';

  @override
  String get ex_cf_3_b1 => '가장 완성도 높고 기술적으로 까다로운 올림픽 리프팅 동작입니다';

  @override
  String get ex_cf_3_b2 => '파워, 가동성, 안정성을 동시에 발달시킵니다';

  @override
  String get ex_cf_3_b3 => '거의 다른 어떤 운동보다 많은 칼로리를 소모합니다';

  @override
  String get ex_cf_4_name => '파워 스내치';

  @override
  String get ex_cf_4_desc =>
      '스내치와 같지만 팔을 머리 위로 편 채 쿼터 스쿼트로 바를 받습니다. 더 빠르고 발목과 고관절의 가동성 요구가 적습니다.';

  @override
  String get ex_cf_4_b1 => '풀 스내치보다 접근하기 쉽습니다';

  @override
  String get ex_cf_4_b2 => '후면 사슬의 폭발적인 파워를 발달시킵니다';

  @override
  String get ex_cf_4_b3 => '가동성과 협응력에 탁월합니다';

  @override
  String get ex_cf_5_name => '스러스터';

  @override
  String get ex_cf_5_desc =>
      '바를 프론트 랙 자세(전면 삼각근 위)로 듭니다. 풀 프론트 스쿼트를 수행하고 올라오면서 다리의 추진력을 이용해 팔을 펴며 바를 머리 위로 밀어 올립니다. 바를 프론트 랙 자세로 내리고 반복합니다.';

  @override
  String get ex_cf_5_b1 => '하나의 동작으로 전신을 훈련합니다';

  @override
  String get ex_cf_5_b2 => '\"Fran\" 같은 WOD의 대표 종목입니다';

  @override
  String get ex_cf_5_b3 => '근력과 대사 지구력을 결합합니다';

  @override
  String get ex_cf_6_name => '푸시 프레스';

  @override
  String get ex_cf_6_desc =>
      '바를 어깨 위 프론트 랙 자세로 든 채 무릎을 살짝 구부려 빠르게 딥을 합니다. 다리를 폭발적으로 펴며 팔이 완전히 펴질 때까지 바를 머리 위로 밀어 올립니다. 천천히 시작 자세로 내립니다.';

  @override
  String get ex_cf_6_b1 => '스트릭트 밀리터리 프레스보다 더 많은 중량을 다룰 수 있습니다';

  @override
  String get ex_cf_6_b2 => '수직으로 미는 파워를 발달시킵니다';

  @override
  String get ex_cf_6_b3 => '저크와 다른 올림픽 리프팅 동작으로 전이됩니다';

  @override
  String get ex_cf_7_name => '푸시 저크';

  @override
  String get ex_cf_7_desc =>
      '푸시 프레스와 같지만 바를 위로 밀어 올릴 때 다리를 다시 굽혀 팔을 이미 편 상태로 쿼터 스쿼트에서 바를 받습니다. 그런 다음 일어서며 리프트를 완성합니다. 푸시 프레스보다 더 많은 중량을 다룰 수 있습니다.';

  @override
  String get ex_cf_7_b1 => '어떤 프레스보다 더 많은 중량을 머리 위로 들어올립니다';

  @override
  String get ex_cf_7_b2 => '기술적이고 파워가 높은 올림픽 리프팅 동작입니다';

  @override
  String get ex_cf_7_b3 => '클린 앤 저크의 구성 동작입니다';

  @override
  String get ex_cf_8_name => '월볼';

  @override
  String get ex_cf_8_desc =>
      '메디신볼을 가슴 앞에 들고 벽을 바라보고 섭니다. 깊은 스쿼트를 수행하고 올라오면서 벽의 높은 목표 지점(약 3 m)을 향해 볼을 던집니다. 가슴 높이에서 볼을 받고 곧바로 다음 스쿼트로 내려갑니다.';

  @override
  String get ex_cf_8_b1 => '심폐 운동과 파워 운동을 동시에 수행합니다';

  @override
  String get ex_cf_8_b2 => '크로스핏의 많은 벤치마크에 쓰이는 표준 동작입니다';

  @override
  String get ex_cf_8_b3 => '협응력과 리듬감을 훈련합니다';

  @override
  String get ex_cf_9_name => '아메리칸 케틀벨 스윙';

  @override
  String get ex_cf_9_desc =>
      '양손으로 케틀벨을 잡고 다리 사이에 늘어뜨린 채 섭니다. 힙 힌지로 케틀벨을 뒤로 보낸 후 고관절을 폭발적으로 펴며 팔을 편 채 머리 위까지 밀어 올립니다. 힘은 팔이 아니라 고관절에서 나옵니다.';

  @override
  String get ex_cf_9_b1 => '고관절의 폭발적인 파워를 발달시킵니다';

  @override
  String get ex_cf_9_b2 => '하나의 동작으로 유산소와 근력을 함께 훈련합니다';

  @override
  String get ex_cf_9_b3 => '크로스핏의 표준 동작입니다 (러시안 스윙은 가슴 높이까지만 올립니다)';

  @override
  String get ex_cf_10_name => '러시안 케틀벨 스윙';

  @override
  String get ex_cf_10_desc =>
      '아메리칸 스윙과 동일하지만 케틀벨을 머리 위가 아니라 가슴/눈 높이까지만 올립니다. 기술적으로 더 쉽고 어깨 부담이 적습니다.';

  @override
  String get ex_cf_10_b1 => '케틀벨 운동의 입문 동작입니다';

  @override
  String get ex_cf_10_b2 => '아메리칸 스윙보다 어깨 부담이 적습니다';

  @override
  String get ex_cf_10_b3 => '초보자와 고반복 훈련에 이상적입니다';

  @override
  String get ex_cf_11_name => '박스 점프';

  @override
  String get ex_cf_11_desc =>
      '안정적인 박스나 플랫폼 앞에 서서 무릎을 구부린 뒤 박스 위로 점프하여 발 전체가 표면 위에 오도록 착지합니다. 정점에서 고관절과 무릎을 폅니다. 점프하여 내려오거나 충격을 줄이려면 한 발씩 내려옵니다.';

  @override
  String get ex_cf_11_b1 => '파워를 기르는 순수 플라이오메트릭 운동입니다';

  @override
  String get ex_cf_11_b2 => '수직 점프력과 순발력을 향상시킵니다';

  @override
  String get ex_cf_11_b3 => '많은 WOD의 클래식한 구성 동작입니다';

  @override
  String get ex_cf_12_name => '버피';

  @override
  String get ex_cf_12_desc =>
      '선 자세에서 몸을 낮춰 손을 바닥에 짚습니다. 두 발을 뒤로 점프해 플랭크 자세를 만듭니다. 가슴이 바닥에 닿도록 푸시업을 합니다. 두 발을 손 쪽으로 다시 점프해 당겨온 뒤 팔을 위로 뻗으며 수직으로 점프합니다.';

  @override
  String get ex_cf_12_b1 => '장비가 필요 없는 전신 운동입니다';

  @override
  String get ex_cf_12_b2 => '강도 높은 유산소와 근력 운동을 동시에 수행합니다';

  @override
  String get ex_cf_12_b3 => '\"Murph\" 같은 벤치마크와 많은 WOD의 표준 동작입니다';

  @override
  String get ex_cf_13_name => '토즈 투 바';

  @override
  String get ex_cf_13_desc =>
      '오버핸드 그립으로 바에 매달립니다. 광배근을 활성화하고 다리를 편 채 (또는 살짝 구부린 채) 발이 바에 닿을 때까지 들어올립니다. 과도한 흔들림 없이 천천히 내립니다. 리듬을 유지하려면 \"키핑\"을 활용합니다.';

  @override
  String get ex_cf_13_b1 => '난도가 높은 동적 코어 운동입니다';

  @override
  String get ex_cf_13_b2 => '악력과 광배근을 향상시킵니다';

  @override
  String get ex_cf_13_b3 => '크로스핏의 많은 WOD의 구성 동작입니다';

  @override
  String get ex_cf_14_name => '니즈 투 엘보';

  @override
  String get ex_cf_14_desc =>
      '오버핸드 그립으로 바에 매달립니다. 고관절과 무릎을 굽혀 통제된 동적 동작으로 무릎을 팔꿈치 쪽으로 가져갑니다. 천천히 내립니다. 토즈 투 바로 나아가기 위한 단계로 유용합니다.';

  @override
  String get ex_cf_14_b1 => '토즈 투 바를 위한 단계별 동작입니다';

  @override
  String get ex_cf_14_b2 => '기술적 요구가 덜한 동적 코어 운동입니다';

  @override
  String get ex_cf_14_b3 => '악력을 향상시킵니다';

  @override
  String get ex_cf_15_name => '머슬업';

  @override
  String get ex_cf_15_desc =>
      '링(또는 바)에 폴스 그립으로 매달립니다. 몸을 폭발적으로 끌어올리며 링 위로 전환하고 정점에서 팔을 펴며 밀어 올려 서포트 자세를 만듭니다. 역방향 전환을 통제하며 내려옵니다.';

  @override
  String get ex_cf_15_b1 => '당기기와 밀기를 결합한 고급 체조 동작입니다';

  @override
  String get ex_cf_15_b2 => '크로스핏의 핵심 관문입니다 (많은 WOD에서 RX)';

  @override
  String get ex_cf_15_b3 => '체중 대비 극한의 상대 근력을 발달시킵니다';

  @override
  String get ex_cf_16_name => '피스톨 스쿼트';

  @override
  String get ex_cf_16_desc =>
      '한 다리로 서서 반대쪽 다리를 바닥과 평행하게 앞으로 뻗습니다. 균형을 유지하고 지지하는 발바닥 전체를 바닥에 붙인 채 깊은 스쿼트로 내려갑니다. 들고 있는 다리가 바닥에 닿지 않게 하며 발뒤꿈치로 밀어 올라옵니다. 반대쪽도 반복합니다.';

  @override
  String get ex_cf_16_b1 => '최고 난도의 한 다리 스쿼트입니다';

  @override
  String get ex_cf_16_b2 => '발목과 고관절의 가동성을 발달시킵니다';

  @override
  String get ex_cf_16_b3 => '좌우 비대칭을 교정하는 편측 운동입니다';

  @override
  String get ex_cf_17_name => '핸드스탠드 푸시업 (HSPU)';

  @override
  String get ex_cf_17_desc =>
      '벽에서 약 30 cm 떨어진 바닥에 손을 짚고 다리를 차올려 벽에 기댄 물구나무 자세를 만듭니다. 팔꿈치를 구부려 머리가 바닥(또는 앱매트)에 닿을 때까지 내려갑니다. 밀어서 다시 올라옵니다. 보조가 필요하면 \"키핑\"을 활용합니다.';

  @override
  String get ex_cf_17_b1 => '체중 전체를 사용하는 수직 프레스입니다';

  @override
  String get ex_cf_17_b2 => '어깨와 코어의 안정성을 향상시킵니다';

  @override
  String get ex_cf_17_b3 => '크로스핏의 핵심 체조 관문입니다';

  @override
  String get ex_cf_18_name => '터키시 겟업';

  @override
  String get ex_cf_18_desc =>
      '한쪽 팔을 천장 쪽으로 뻗어 케틀벨을 든 채 등을 대고 눕습니다. 케틀벨을 항상 위로 유지하며 단계별로 일어납니다 (팔꿈치 → 손 → 힙 힌지 → 레그 스윕 → 무릎 꿇은 자세 → 선 자세). 동작을 역순으로 수행합니다.';

  @override
  String get ex_cf_18_b1 => '독보적인 전신 기능성 동작입니다';

  @override
  String get ex_cf_18_b2 => '가동성, 안정성, 협응력을 향상시킵니다';

  @override
  String get ex_cf_18_b3 => '어깨와 코어 훈련에 탁월합니다';

  @override
  String get ex_cf_19_name => '더블 언더';

  @override
  String get ex_cf_19_desc =>
      '한 번 점프할 때마다 줄이 발 아래를 두 번 지나가도록 줄넘기를 합니다. 점프는 낮게, 손목 리듬은 빠르게 유지합니다. 팔은 몸에 붙이고 팔꿈치는 허리 가까이에 둡니다. 협응력과 스피드 로프가 필요합니다.';

  @override
  String get ex_cf_19_b1 => '고강도의 폭발적인 유산소 운동입니다';

  @override
  String get ex_cf_19_b2 => '협응력과 타이밍을 향상시킵니다';

  @override
  String get ex_cf_19_b3 => '수백 개의 크로스핏 WOD에 쓰이는 표준 동작입니다';

  @override
  String get ex_cf_20_name => '파머스 캐리';

  @override
  String get ex_cf_20_desc =>
      '양손에 무거운 덤벨이나 케틀벨을 들고 몸 옆에 둡니다. 곧은 자세를 유지하고 어깨를 뒤로 당기며 코어에 힘을 준 채 짧은 보폭으로 걷습니다. 정해진 거리를 이동하거나 시간을 정해 수행합니다.';

  @override
  String get ex_cf_20_b1 => '악력과 전완을 강화합니다';

  @override
  String get ex_cf_20_b2 => '전신 기능성 운동입니다';

  @override
  String get ex_cf_20_b3 => '자세와 코어 안정성을 향상시킵니다';

  @override
  String get ex_cf_21_name => '고블릿 스쿼트';

  @override
  String get ex_cf_21_desc =>
      '케틀벨(또는 덤벨)의 \"벨\" 부분을 잡고 가슴 앞 흉골 높이에 듭니다. 상체를 수직으로 세우고 팔꿈치를 앞으로 향하게 유지하며 깊은 스쿼트를 수행합니다. 발뒤꿈치로 밀어 올라옵니다.';

  @override
  String get ex_cf_21_b1 => '중량 스쿼트에 입문하기에 완벽한 동작입니다';

  @override
  String get ex_cf_21_b2 => '곧게 세운 자세와 올바른 깊이를 익히게 해줍니다';

  @override
  String get ex_cf_21_b3 => '코어 활성화에 탁월합니다';

  @override
  String get ex_pecho_1_name => '벤치프레스';

  @override
  String get ex_pecho_2_name => '인클라인 덤벨 프레스';

  @override
  String get ex_pecho_3_name => '덤벨 플라이';

  @override
  String get ex_pecho_4_name => '딥스';

  @override
  String get ex_pecho_5_name => '케이블 크로스오버';

  @override
  String get ex_esp_1_name => '데드리프트';

  @override
  String get ex_esp_2_name => '턱걸이';

  @override
  String get ex_esp_3_name => '바벨 로우';

  @override
  String get ex_esp_4_name => '원암 덤벨 로우';

  @override
  String get ex_esp_5_name => '랫 풀다운';

  @override
  String get ex_pier_1_name => '바벨 스쿼트';

  @override
  String get ex_pier_2_name => '레그 프레스';

  @override
  String get ex_pier_3_name => '힙 스러스트';

  @override
  String get ex_pier_4_name => '런지';

  @override
  String get ex_pier_5_name => '레그 컬';

  @override
  String get ex_hom_1_name => '밀리터리 프레스';

  @override
  String get ex_hom_2_name => '사이드 레터럴 레이즈';

  @override
  String get ex_hom_3_name => '페이스 풀';

  @override
  String get ex_hom_4_name => '아놀드 프레스';

  @override
  String get ex_bra_1_name => '덤벨 바이셉 컬';

  @override
  String get ex_bra_2_name => '이지바 컬';

  @override
  String get ex_bra_3_name => '해머 컬';

  @override
  String get ex_bra_4_name => '케이블 트라이셉 푸시다운';

  @override
  String get ex_bra_5_name => '라잉 트라이셉 익스텐션';

  @override
  String get ex_core_1_name => '플랭크';

  @override
  String get ex_core_2_name => '크런치';

  @override
  String get ex_core_3_name => '행잉 레그 레이즈';

  @override
  String get ex_core_4_name => 'ab 휠 롤아웃';

  @override
  String get ex_pecho_1_desc =>
      '평평한 벤치에 누워 발을 바닥에 단단히 디딥니다. 어깨보다 넓은 간격으로 바를 잡습니다. 바를 가슴까지 천천히 내린 후 팔을 완전히 펴며 밀어 올립니다. 동작 내내 견갑골을 모아주세요.';

  @override
  String get ex_pecho_2_desc =>
      '벤치를 30-45° 각도로 조절합니다. 양손에 덤벨을 들고 허벅지 위에 올린 후 뒤로 눕습니다. 팔꿈치를 몸에서 45° 각도로 유지하며 가슴 높이까지 내립니다. 위로 밀어 올리며 상단에서 덤벨이 거의 닿을 정도로 모읍니다.';

  @override
  String get ex_pecho_3_desc =>
      '평평한 벤치에 누워 양손에 덤벨을 들고 가슴 위로 팔을 뻗습니다. 팔꿈치를 살짝 구부린 상태로 넓은 호를 그리며 가슴이 늘어나는 것을 느낄 때까지 내립니다. 가슴을 수축하며 시작 자세로 돌아옵니다.';

  @override
  String get ex_pecho_4_desc =>
      '평행봉 위에서 팔을 펴고 몸을 지지합니다. 가슴 자극을 높이기 위해 상체를 약간 앞으로 기울입니다. 팔꿈치를 구부려 팔이 바닥과 평행이 될 때까지 내려갑니다. 팔꿈치를 잠그지 않고 밀어 올립니다.';

  @override
  String get ex_pecho_5_desc =>
      '케이블을 높은 위치에 설정합니다. 핸들을 잡고 한 발 앞으로 나갑니다. 팔꿈치를 살짝 구부린 채 양손이 앞에서 만날 때까지 팔을 교차합니다. 마지막 위치에서 가슴을 수축하고 천천히 돌아옵니다.';

  @override
  String get ex_esp_1_desc =>
      '발을 골반 너비로 벌리고 바 앞에 섭니다. 오버핸드 또는 혼합 그립으로 바를 잡습니다. 등을 곧게 펴고 가슴을 높이 유지합니다. 발로 바닥을 밀며 엉덩이와 무릎을 펴 완전히 일어섭니다. 천천히 내려놓습니다.';

  @override
  String get ex_esp_2_desc =>
      '오버핸드 그립으로 어깨보다 넓게 바를 잡고 매달립니다. 견갑골을 활성화하고 턱이 바 위로 올라갈 때까지 몸을 끌어올립니다. 천천히 내려옵니다. 반동을 쓰지 않고 코어에 힘을 유지합니다.';

  @override
  String get ex_esp_3_desc =>
      '발을 어깨 너비로 벌리고 약 45° 앞으로 숙입니다. 등을 중립으로 유지합니다. 어깨보다 약간 넓게 오버핸드 그립으로 바를 잡습니다. 견갑골을 모으며 바를 복부 쪽으로 당깁니다. 천천히 내립니다.';

  @override
  String get ex_esp_4_desc =>
      '같은 쪽 무릎과 손을 벤치에 올립니다. 등을 바닥과 평행하게 유지하고 반대 손으로 덤벨을 잡습니다. 견갑골을 모으며 덤벨을 엉덩이 쪽으로 당깁니다. 팔꿈치가 옆구리를 스치도록 합니다. 천천히 내립니다.';

  @override
  String get ex_esp_5_desc =>
      '랫 풀다운 머신에 앉아 넓은 오버핸드 그립으로 바를 잡습니다. 상체를 약간 뒤로 기울인 채 견갑골을 모으며 바를 가슴 쪽으로 당깁니다. 반동을 쓰지 않습니다. 천천히 시작 자세로 돌아옵니다.';

  @override
  String get ex_pier_1_desc =>
      '바를 승모근 위에 올립니다. 발을 어깨 너비 또는 약간 넓게 벌립니다. 무릎과 엉덩이를 굽혀 허벅지가 바닥과 평행이 될 때까지 내려갑니다. 가슴을 높이 유지하고 등을 곧게 펴세요. 발뒤꿈치로 밀어 올립니다.';

  @override
  String get ex_pier_2_desc =>
      '머신에 앉아 등을 완전히 기댑니다. 발을 어깨 너비로 플랫폼에 올립니다. 안전장치를 풀고 무릎이 약 90° 될 때까지 내린 후, 무릎을 잠그지 않고 거의 완전히 펼 때까지 밀어 올립니다.';

  @override
  String get ex_pier_3_desc =>
      '견갑골을 튼튼한 벤치에 기대고 바벨을 엉덩이 위에 올립니다 (패드 사용). 발을 어깨 너비로 바닥에 딛습니다. 엉덩이를 바닥으로 내린 후 둔근을 조이며 엉덩이가 바닥과 평행이 될 때까지 올립니다.';

  @override
  String get ex_pier_4_desc =>
      '양손에 덤벨을 들고 서서 한 발을 크게 앞으로 내딛습니다. 뒤쪽 무릎이 바닥에 거의 닿을 때까지 내려갑니다. 앞쪽 무릎이 발끝을 넘지 않도록 합니다. 앞발 뒤꿈치로 밀어 올립니다. 양쪽을 번갈아 수행합니다.';

  @override
  String get ex_pier_5_desc =>
      '레그 컬 머신에 엎드려 발목을 패드 아래에 놓습니다. 발뒤꿈치를 둔근 쪽으로 당기며 무릎을 굽힙니다. 마지막 위치에서 햄스트링을 조입니다. 웨이트가 쉬지 않도록 천천히 내립니다.';

  @override
  String get ex_hom_1_desc =>
      '서거나 앉은 상태에서 바를 어깨 높이에 오버핸드 그립으로 잡습니다. 바를 머리 위로 수직으로 밀어 올려 팔을 완전히 폅니다. 천천히 시작 자세로 내립니다. 허리를 보호하기 위해 코어에 힘을 유지합니다.';

  @override
  String get ex_hom_2_desc =>
      '양손에 덤벨을 들고 팔을 몸 옆에 내립니다. 손바닥이 안쪽을 향하게 합니다. 팔꿈치를 살짝 구부린 채 팔을 어깨 높이까지 옆으로 들어올립니다. 천천히 내립니다. 반동을 쓰지 않고 순수한 동작으로 수행합니다.';

  @override
  String get ex_hom_3_desc =>
      '케이블 머신의 높은 위치에 로프를 설정합니다. 양 끝을 잡고 한 발 뒤로 물러납니다. 팔꿈치를 어깨 높이로 벌리며 로프를 얼굴 쪽으로 당기고 손을 귀 옆으로 가져갑니다. 후면 삼각근을 조입니다.';

  @override
  String get ex_hom_4_desc =>
      '앉은 상태에서 덤벨을 어깨 높이에 손바닥이 몸을 향하도록 들어올립니다. 위로 밀며 손바닥이 바깥을 향하도록 회전시킵니다. 상단에서 손바닥이 정면을 향해야 합니다. 회전을 되돌리며 천천히 내립니다. 유연하고 연속적인 동작으로 수행합니다.';

  @override
  String get ex_bra_1_desc =>
      '양손에 덤벨을 들고 팔을 펴며 손바닥을 앞으로 향합니다. 상완을 고정한 채 팔꿈치를 구부려 덤벨을 어깨 쪽으로 올립니다. 정점에서 이두근을 조입니다. 천천히 완전히 펼 때까지 내립니다.';

  @override
  String get ex_bra_2_desc =>
      '이지바를 어깨 너비의 언더핸드 그립으로 잡고 섭니다. 팔꿈치를 옆구리에 붙인 채 바를 가슴 높이까지 구부립니다. 이두근이 완전히 늘어나는 것을 느끼며 천천히 내립니다. 이지바는 손목의 부담을 줄여줍니다.';

  @override
  String get ex_bra_3_desc =>
      '양손에 덤벨을 중립 그립(손바닥이 마주 보는 상태, 망치를 잡은 것처럼)으로 잡습니다. 교대 또는 동시에 팔꿈치를 구부려 덤벨을 어깨 쪽으로 올립니다. 팔꿈치를 항상 몸에 붙입니다. 천천히 내립니다.';

  @override
  String get ex_bra_4_desc =>
      '케이블 머신의 높은 위치에 로프 또는 바를 설정합니다. 팔꿈치를 구부리고 몸통에 붙인 채 액세서리를 잡습니다. 팔꿈치를 움직이지 않고 아래로 완전히 펴며 밀어내립니다. 로프 사용 시 끝에서 손을 약간 벌립니다. 천천히 돌아옵니다.';

  @override
  String get ex_bra_5_desc =>
      '벤치에 누워 이지바를 가슴 위로 팔을 뻗어 듭니다. 팔꿈치를 천장을 향하게 유지한 채 팔꿈치만 구부려 바를 이마 쪽으로 내립니다. 다시 시작 자세로 폅니다. 팔꿈치는 고정하고 전완만 움직여야 합니다.';

  @override
  String get ex_core_1_desc =>
      '전완과 발끝으로 몸을 지지합니다. 몸을 판자처럼 일직선으로 유지합니다. 엉덩이가 올라가거나 내려가지 않도록 합니다. 둔근을 조이고 복부에 힘을 줍니다. 일정하게 호흡하며 목표 시간 동안 자세를 유지합니다.';

  @override
  String get ex_core_2_desc =>
      '무릎을 구부리고 발을 바닥에 댄 채 등을 대고 눕습니다. 손을 머리 뒤에 놓되 목을 당기지 않습니다. 복부를 수축하여 어깨를 바닥에서 약 30° 들어올리고 정점에서 복근을 조입니다. 복부의 긴장을 완전히 풀지 않으며 천천히 내립니다.';

  @override
  String get ex_core_3_desc =>
      '어깨 너비의 오버핸드 그립으로 바에 매달립니다. 다리를 살짝 구부린 채 복부를 수축하며 무릎이나 다리를 수평 이상으로 올립니다. 반동 없이 천천히 내립니다. 움직임은 반동이 아니라 고관절 굴곡에서 나와야 합니다.';

  @override
  String get ex_core_4_desc =>
      '무릎을 꿇고 앞에 ab 휠을 놓습니다. 핸들을 잡고 천천히 앞으로 밀어 몸이 바닥에 거의 닿을 때까지 펼칩니다. 코어를 수축하여 시작 자세로 돌아옵니다. 엉덩이가 처지지 않도록 하고 동작 내내 등을 중립으로, 복부에 힘을 유지합니다.';

  @override
  String get secondary_triceps => '삼두근';

  @override
  String get secondary_anteriorDeltoid => '전면 삼각근';

  @override
  String get secondary_biceps => '이두근';

  @override
  String get secondary_glutes => '둔근';

  @override
  String get secondary_hamstrings => '햄스트링';

  @override
  String get secondary_trapezius => '승모근';

  @override
  String get secondary_rhomboids => '능형근';

  @override
  String get secondary_lowerBack => '하부 등';

  @override
  String get secondary_quads => '대퇴사두근';

  @override
  String get secondary_calves => '종아리';

  @override
  String get secondary_rotatorCuff => '회전근개';

  @override
  String get secondary_brachialis => '상완근';

  @override
  String get secondary_brachioradialis => '완요골근';

  @override
  String get secondary_anconeus => '주근';

  @override
  String get secondary_obliques => '복사근';

  @override
  String get secondary_hipFlexors => '고관절 굴근';

  @override
  String get secondary_deltoids => '삼각근';

  @override
  String get secondary_lats => '광배근';

  @override
  String get ex_pecho_1_b1 => '가슴의 근력과 근육량을 키워줍니다';

  @override
  String get ex_pecho_1_b2 => '삼두근과 전면 어깨를 강화합니다';

  @override
  String get ex_pecho_1_b3 => '기능적 힘에 전이가 높은 복합 운동입니다';

  @override
  String get ex_pecho_2_b1 => '가슴 상부(쇄골부)를 집중적으로 자극합니다';

  @override
  String get ex_pecho_2_b2 => '바벨보다 더 넓은 가동 범위를 제공합니다';

  @override
  String get ex_pecho_2_b3 => '각 팔을 독립적으로 훈련할 수 있습니다';

  @override
  String get ex_pecho_3_b1 => '대흉근을 깊이 있게 고립시킵니다';

  @override
  String get ex_pecho_3_b2 => '가슴의 유연성과 스트레칭을 개선합니다';

  @override
  String get ex_pecho_3_b3 => '볼륨과 선명도를 더하기에 이상적입니다';

  @override
  String get ex_pecho_4_b1 => '가슴, 삼두근, 어깨를 동시에 자극하는 복합 운동입니다';

  @override
  String get ex_pecho_4_b2 => '추가 장비가 필요 없습니다';

  @override
  String get ex_pecho_4_b3 => '벨트에 무게를 달아 점진적으로 부하를 늘릴 수 있습니다';

  @override
  String get ex_pecho_5_b1 => '전체 가동 범위에서 일정한 긴장을 유지합니다';

  @override
  String get ex_pecho_5_b2 => '가슴의 선명도와 고립에 탁월합니다';

  @override
  String get ex_pecho_5_b3 => '풀리 높이에 따라 다양한 변형이 가능합니다';

  @override
  String get ex_esp_1_b1 => '전신 힘을 극대화하는 전신 운동입니다';

  @override
  String get ex_esp_1_b2 => '후면 사슬(등, 둔근, 햄스트링)을 발달시킵니다';

  @override
  String get ex_esp_1_b3 => '높은 호르몬 분비와 동화 효과를 제공합니다';

  @override
  String get ex_esp_2_b1 => '등의 너비(광배근)를 발달시킵니다';

  @override
  String get ex_esp_2_b2 => '체중 대비 상대적 근력을 향상시킵니다';

  @override
  String get ex_esp_2_b3 => '기능적 체력의 훌륭한 지표입니다';

  @override
  String get ex_esp_3_b1 => '등의 두께와 밀도를 발달시킵니다';

  @override
  String get ex_esp_3_b2 => '자세 유지 근육을 강화합니다';

  @override
  String get ex_esp_3_b3 => '벤치프레스의 이상적인 보완 운동입니다';

  @override
  String get ex_esp_4_b1 => '양쪽 간의 불균형을 교정합니다';

  @override
  String get ex_esp_4_b2 => '바벨 로우보다 더 넓은 가동 범위를 제공합니다';

  @override
  String get ex_esp_4_b3 => '배우기 쉬워 초보자에게 적합합니다';

  @override
  String get ex_esp_5_b1 => '초보자를 위한 턱걸이 대안 운동입니다';

  @override
  String get ex_esp_5_b2 => '등의 너비를 발달시킵니다';

  @override
  String get ex_esp_5_b3 => '무게 조절이 쉽고 점진적 발전이 가능합니다';

  @override
  String get ex_pier_1_b1 => '하체를 위한 가장 완벽한 운동입니다';

  @override
  String get ex_pier_1_b2 => '다른 어떤 운동보다 많은 동화 호르몬을 분비합니다';

  @override
  String get ex_pier_1_b3 => '운동 능력과 기능적 체력을 향상시킵니다';

  @override
  String get ex_pier_2_b1 => '높은 중량을 안전하게 다룰 수 있습니다';

  @override
  String get ex_pier_2_b2 => '초보자나 재활에 이상적입니다';

  @override
  String get ex_pier_2_b3 => '발 위치를 바꿔 다양한 부위를 자극할 수 있습니다';

  @override
  String get ex_pier_3_b1 => '둔근을 활성화하고 발달시키는 데 가장 효과적인 운동입니다';

  @override
  String get ex_pier_3_b2 => '고관절 신전과 자세를 개선합니다';

  @override
  String get ex_pier_3_b3 => '무릎과 고관절 부상 위험을 줄여줍니다';

  @override
  String get ex_pier_4_b1 => '각 다리를 개별적으로 훈련하여 불균형을 교정합니다';

  @override
  String get ex_pier_4_b2 => '균형감과 안정성을 향상시킵니다';

  @override
  String get ex_pier_4_b3 => '둔근과 대퇴사두근 발달에 탁월합니다';

  @override
  String get ex_pier_5_b1 => '햄스트링을 직접적으로 고립시킵니다';

  @override
  String get ex_pier_5_b2 => '슬건 부상을 예방합니다';

  @override
  String get ex_pier_5_b3 => '허벅지의 균형 잡힌 근육 발달을 돕습니다';

  @override
  String get ex_hom_1_b1 => '삼각근의 세 갈래를 모두 발달시킵니다';

  @override
  String get ex_hom_1_b2 => '머리 위 기능적 근력을 향상시킵니다';

  @override
  String get ex_hom_1_b3 => '회전근개와 어깨 안정성을 강화합니다';

  @override
  String get ex_hom_2_b1 => '측면 삼각근을 고립시켜 더 넓은 어깨를 만듭니다';

  @override
  String get ex_hom_2_b2 => '상체의 너비감을 향상시킵니다';

  @override
  String get ex_hom_2_b3 => '적절한 무게 사용 시 부상 위험이 낮습니다';

  @override
  String get ex_hom_3_b1 => '후면 삼각근을 강화하고 자세를 개선합니다';

  @override
  String get ex_hom_3_b2 => '회전근개 부상을 예방합니다';

  @override
  String get ex_hom_3_b3 => '밀기 운동의 효과를 상쇄합니다';

  @override
  String get ex_hom_4_b1 => '하나의 동작으로 삼각근의 세 갈래를 모두 활성화합니다';

  @override
  String get ex_hom_4_b2 => '회전 동작이 어깨 가동성을 향상시킵니다';

  @override
  String get ex_hom_4_b3 => '일반 숄더 프레스보다 더 완벽한 변형입니다';

  @override
  String get ex_bra_1_b1 => '이두근을 직접적으로 고립시킵니다';

  @override
  String get ex_bra_1_b2 => '각 팔을 독립적으로 훈련합니다';

  @override
  String get ex_bra_1_b3 => '점진적 부하 증가가 쉽고 기술이 접근하기 쉽습니다';

  @override
  String get ex_bra_2_b1 => '덤벨보다 더 많은 중량을 사용할 수 있습니다';

  @override
  String get ex_bra_2_b2 => '이지바가 손목과 팔꿈치의 부담을 줄여줍니다';

  @override
  String get ex_bra_2_b3 => '이두근 전체 근육량 발달에 이상적입니다';

  @override
  String get ex_bra_3_b1 => '상완근과 완요골근에 집중합니다';

  @override
  String get ex_bra_3_b2 => '정면에서 봤을 때 팔의 두께와 볼륨을 더합니다';

  @override
  String get ex_bra_3_b3 => '언더핸드 컬보다 손목 부담이 적습니다';

  @override
  String get ex_bra_4_b1 => '삼두근의 세 갈래를 효과적으로 고립시킵니다';

  @override
  String get ex_bra_4_b2 => '케이블 덕분에 일정한 긴장을 유지합니다';

  @override
  String get ex_bra_4_b3 => '삼두근의 선명도와 마무리에 탁월합니다';

  @override
  String get ex_bra_5_b1 => '삼두근 장두의 최대 스트레칭을 제공합니다';

  @override
  String get ex_bra_5_b2 => '삼두근의 두께를 발달시킵니다';

  @override
  String get ex_bra_5_b3 => '덤벨이나 스트레이트 바로 수행할 수 있습니다';

  @override
  String get ex_core_1_b1 => '척추 부하 없이 심부 코어를 강화합니다';

  @override
  String get ex_core_1_b2 => '자세와 요추 안정성을 개선합니다';

  @override
  String get ex_core_1_b3 => '허리 부상 위험을 줄여줍니다';

  @override
  String get ex_core_2_b1 => '복직근을 고립시키는 기본 운동입니다';

  @override
  String get ex_core_2_b2 => '배우고 수행하기 쉽습니다';

  @override
  String get ex_core_2_b3 => '더 높은 강도의 복근 운동을 위한 기초입니다';

  @override
  String get ex_core_3_b1 => '높은 강도로 하복부를 훈련합니다';

  @override
  String get ex_core_3_b2 => '악력과 요추 근력을 향상시킵니다';

  @override
  String get ex_core_3_b3 => '점진적 발전: 무릎 굽힘 → 다리 펴기 → L-sit';

  @override
  String get ex_core_4_b1 => '가장 완벽하고 도전적인 코어 운동 중 하나입니다';

  @override
  String get ex_core_4_b2 => '전통적인 복근 운동과 달리 신전 상태에서 코어를 훈련합니다';

  @override
  String get ex_core_4_b3 => '전면 사슬 전체에 기능적 근력을 발달시킵니다';
}
