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
  String get common_ok => '확인';

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
  String get common_pro => 'PRO';

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
  String get nav_history => '기록';

  @override
  String get nav_rest => '휴식';

  @override
  String get nav_exercises => '운동 목록';

  @override
  String get login_tagline => '나만의 피트니스 앱';

  @override
  String get login_continueGoogle => 'Google로 계속하기';

  @override
  String get login_continueApple => 'Apple로 계속하기';

  @override
  String get login_continueEmail => '이메일로 계속하기';

  @override
  String get login_legal => '계속하면 이용약관 및\n개인정보 처리방침에 동의하게 됩니다.';

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
  String get home_startWorkout => '운동 시작';

  @override
  String get home_thisWeek => '이번 주';

  @override
  String get home_weekTime => '주간 시간';

  @override
  String get home_weekVolume => '주간 볼륨';

  @override
  String get home_quickAccess => '빠른 접근';

  @override
  String get home_lastWorkout => '최근 운동';

  @override
  String get home_viewAll => '전체 보기';

  @override
  String get home_noWorkoutsYet => '아직 운동 기록이 없습니다';

  @override
  String get home_noWorkoutsSubtitle => '첫 번째 운동을 완료하면 여기에 표시됩니다.';

  @override
  String get home_goToTrain => '운동하러 가기 →';

  @override
  String get home_progress => '진행 상황';

  @override
  String get home_noRecordsYet => '아직 기록이 없습니다';

  @override
  String get home_recordWeightMeasures => '체중과 신체 치수를 기록하세요';

  @override
  String get home_achievements => '업적';

  @override
  String get home_noAchievements => '운동을 완료하면 업적이 잠금 해제됩니다';

  @override
  String get home_recentExercises => '최근 운동 종목';

  @override
  String get home_noRecentExercises => '자주 하는 운동이 여기에 표시됩니다';

  @override
  String home_frequentExercise(int count) {
    return '$count회 수행';
  }

  @override
  String get home_latestRecord => '최근 기록';

  @override
  String get home_waist => '허리';

  @override
  String get home_hips => '엉덩이';

  @override
  String get home_exerciseLibrary => '운동 라이브러리';

  @override
  String get home_viewAllExercises => '모두 보기';

  @override
  String home_exercisesAvailable(int count) {
    return '$count개 운동 가능';
  }

  @override
  String get profile_proActive => '구독 활성화됨';

  @override
  String get profile_freePlan => '무료 플랜';

  @override
  String get profile_upgradePro => 'PRO로 업그레이드';

  @override
  String get profile_redeemCode => '코드 사용';

  @override
  String get profile_restorePurchases => '구매 복원';

  @override
  String get profile_signOut => '로그아웃';

  @override
  String get profile_deleteAccount => '계정 삭제';

  @override
  String get profile_redeemTitle => '코드 사용';

  @override
  String get profile_redeemSubtitle => '프로모션 코드를 입력하여 LiftWave PRO를 잠금 해제하세요.';

  @override
  String get profile_codeHint => '코드';

  @override
  String get profile_redeem => '사용하기';

  @override
  String get profile_proActivated => 'LiftWave PRO가 활성화되었습니다';

  @override
  String get profile_invalidCode => '유효하지 않은 코드입니다';

  @override
  String get profile_purchasesRestored => '구매가 복원되었습니다';

  @override
  String get profile_noPurchasesFound => '이전 구매 내역이 없습니다';

  @override
  String get profile_deleteTitle => '계정 삭제';

  @override
  String get profile_deleteConfirm =>
      '정말로 삭제하시겠습니까? 이 작업은 되돌릴 수 없으며 모든 데이터가 삭제됩니다.';

  @override
  String get profile_deleteReauthError => '계정을 삭제하려면 로그아웃 후 다시 로그인하여 시도해 주세요.';

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
  String get train_cancelWorkout => '운동 취소';

  @override
  String get train_cancelConfirm => '정말 취소하시겠습니까? 진행 상황이 사라집니다.';

  @override
  String get train_continue => '계속하기';

  @override
  String get train_addExerciseFirst => '종료하기 전에 운동을 하나 이상 추가하세요.';

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
  String get train_notesHint => '메모 (선택사항)';

  @override
  String get train_setHeader => '세트';

  @override
  String get train_repsHeader => '횟수';

  @override
  String get train_weightHeader => '무게 (kg)';

  @override
  String get train_addSet => '세트 추가';

  @override
  String train_lastWeight(String weight) {
    return '이전: $weight kg';
  }

  @override
  String get train_abbreviationExercises => '종목';

  @override
  String get train_orChooseRoutine => '또는 루틴을 선택하세요';

  @override
  String get train_defaultRoutineName => '내 루틴';

  @override
  String get train_bodyweightLabel => '체중';

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
  String exercises_exerciseCount(int count, String suffix) {
    return '$count개 운동$suffix';
  }

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
  String get history_limitedHistory => '제한된 기록';

  @override
  String history_unlockWorkouts(int count) {
    return 'PRO로 $count개의 운동 기록을 잠금 해제하세요';
  }

  @override
  String get history_weeklySummary => '주간 요약';

  @override
  String get history_workouts => '운동';

  @override
  String get history_total => '합계';

  @override
  String get history_volumeKg => '볼륨 kg';

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
  String get paywall_featureTemplates => '운동 템플릿';

  @override
  String get paywall_featureHistory => '무제한 기록';

  @override
  String get paywall_featureTimer => '맞춤 타이머';

  @override
  String get paywall_featureDetails => '운동 상세 정보';

  @override
  String get paywall_featureMeasures => '신체 측정 + 사진';

  @override
  String get paywall_featureStats => '주간 통계';

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
  String get paywall_freeTrial => '7일 무료 체험';

  @override
  String get paywall_startTrial => '무료 체험 시작';

  @override
  String get paywall_restorePurchases => '구매 복원';

  @override
  String get paywall_legalText =>
      '구독은 자동으로 갱신됩니다.\nApp Store에서 언제든지 해지할 수 있습니다.';

  @override
  String get paywall_termsLink => '이용약관';

  @override
  String get paywall_privacyLink => '개인정보 처리방침';

  @override
  String get paywall_purchaseError => '구매를 완료할 수 없습니다.';

  @override
  String get paywall_noPurchasesFound => '이전 구매 내역이 없습니다.';

  @override
  String get rest_title => '휴식';

  @override
  String get rest_ready => '준비 완료! 다음 세트를 시작하세요';

  @override
  String get rest_almostReady => '거의 다 됐어요!';

  @override
  String get rest_resting => '휴식 중...';

  @override
  String rest_customTime(String time) {
    return '맞춤 시간 · $time';
  }

  @override
  String get rest_choosePreset => '프리셋을 선택하거나 직접 설정하세요';

  @override
  String rest_of(String time) {
    return '$time 중';
  }

  @override
  String get rest_presets => '프리셋';

  @override
  String get rest_customize => '직접 설정';

  @override
  String get rest_customTimeTitle => '맞춤 시간';

  @override
  String get rest_customTimeSubtitle => '휴식 시간의 분과 초를 입력하세요.';

  @override
  String get rest_minutes => '분';

  @override
  String get rest_seconds => '초';

  @override
  String get rest_setTime => '시간 설정';

  @override
  String get progressScreen_title => '신체 변화';

  @override
  String get progressScreen_measurements => '측정';

  @override
  String get progressScreen_photos => '사진';

  @override
  String get progressScreen_addMeasurement => '측정 추가';

  @override
  String get progressScreen_weight => '체중';

  @override
  String get progressScreen_bodyFat => '체지방';

  @override
  String get progressScreen_muscle => '근육';

  @override
  String get progressScreen_noEntries => '아직 기록이 없습니다';

  @override
  String get progressScreen_noEntriesHint => '+ 버튼을 눌러 첫 번째 측정을 추가하세요';

  @override
  String get progressScreen_noPhotos => '아직 사진이 없습니다';

  @override
  String get progressScreen_noPhotosHint => '+ 버튼을 눌러 첫 번째 진행 사진을 추가하세요';

  @override
  String get progressScreen_current => '현재';

  @override
  String get progressScreen_change => '변화';

  @override
  String get progressScreen_trend => '추세';

  @override
  String get progressScreen_addMeasurementTitle => '새 측정';

  @override
  String get progressScreen_weightKg => '체중 (kg)';

  @override
  String get progressScreen_bodyFatPercent => '체지방률 (%)';

  @override
  String get progressScreen_muscleMassKg => '근육량 (kg)';

  @override
  String get progressScreen_optional => '선택사항';

  @override
  String get progressScreen_saveEntry => '기록 저장';

  @override
  String get progressScreen_deleteMeasurement => '이 기록을 삭제하시겠습니까?';

  @override
  String get progressScreen_deletePhoto => '이 사진을 삭제하시겠습니까?';

  @override
  String get progressScreen_camera => '카메라';

  @override
  String get progressScreen_gallery => '갤러리';

  @override
  String get progressScreen_selectSource => '소스 선택';

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
  String get csv_header => '날짜,운동명,운동종목,근육부위,세트,횟수,무게(kg),볼륨(kg)';

  @override
  String get csv_subject => 'LiftWave - 운동 기록';

  @override
  String get template_fullBody_subtitle => '모든 근육 부위를 한 번에';

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
