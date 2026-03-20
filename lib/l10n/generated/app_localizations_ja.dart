// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class SJa extends S {
  SJa([String locale = 'ja']) : super(locale);

  @override
  String get common_cancel => 'キャンセル';

  @override
  String get common_delete => '削除';

  @override
  String get common_save => '保存';

  @override
  String get common_ok => 'OK';

  @override
  String get common_or => 'または';

  @override
  String get common_today => '今日';

  @override
  String get common_yesterday => '昨日';

  @override
  String common_daysAgo(int count) {
    return '$count日前';
  }

  @override
  String get common_exercises => 'エクササイズ';

  @override
  String get common_sets => 'セット';

  @override
  String get common_volume => 'ボリューム';

  @override
  String get common_reps => 'レップ';

  @override
  String get common_weight => '重量';

  @override
  String get common_duration => '時間';

  @override
  String get common_bodyweight => '自重';

  @override
  String get common_custom => 'CUSTOM';

  @override
  String get common_pro => 'PRO';

  @override
  String get muscle_all => 'すべて';

  @override
  String get muscle_chest => '胸';

  @override
  String get muscle_back => '背中';

  @override
  String get muscle_legs => '脚';

  @override
  String get muscle_shoulders => '肩';

  @override
  String get muscle_arms => '腕';

  @override
  String get muscle_core => '体幹';

  @override
  String get equipment_all => 'すべて';

  @override
  String get equipment_barbell => 'バーベル';

  @override
  String get equipment_dumbbells => 'ダンベル';

  @override
  String get equipment_machine => 'マシン';

  @override
  String get equipment_cable => 'ケーブル';

  @override
  String get equipment_bodyweight => '自重';

  @override
  String get equipment_pullupBar => '懸垂バー';

  @override
  String get equipment_noEquipment => '器具なし';

  @override
  String get equipment_parallelBars => '平行棒';

  @override
  String get difficulty_beginner => '初級';

  @override
  String get difficulty_intermediate => '中級';

  @override
  String get difficulty_advanced => '上級';

  @override
  String get nav_home => 'ホーム';

  @override
  String get nav_train => 'トレーニング';

  @override
  String get nav_history => '履歴';

  @override
  String get nav_rest => '休憩';

  @override
  String get nav_exercises => 'エクササイズ';

  @override
  String get login_tagline => 'あなたのフィットネスアプリ';

  @override
  String get login_continueGoogle => 'Googleで続ける';

  @override
  String get login_continueApple => 'Appleで続ける';

  @override
  String get login_continueEmail => 'メールで続ける';

  @override
  String get login_legal => '続けることで、利用規約と\nプライバシーポリシーに同意したことになります。';

  @override
  String get login_legalPrefix => '続けることで、';

  @override
  String get login_termsLink => '利用規約';

  @override
  String get login_legalAnd => 'と';

  @override
  String get login_privacyLink => 'プライバシーポリシー';

  @override
  String get login_googleError => 'Googleログインに失敗しました。';

  @override
  String get login_appleError => 'Appleログインに失敗しました。';

  @override
  String get emailAuth_titleLogin => 'ログイン';

  @override
  String get emailAuth_titleRegister => 'アカウント作成';

  @override
  String get emailAuth_greetingLogin => 'おかえりなさい';

  @override
  String get emailAuth_greetingRegister => 'ようこそ！';

  @override
  String get emailAuth_subtitleLogin => 'メールアドレスとパスワードを入力してください';

  @override
  String get emailAuth_subtitleRegister => 'アカウントを作成して始めましょう';

  @override
  String get emailAuth_nameLabel => '名前';

  @override
  String get emailAuth_nameHint => 'お名前';

  @override
  String get emailAuth_nameError => '名前を入力してください';

  @override
  String get emailAuth_emailLabel => 'メールアドレス';

  @override
  String get emailAuth_emailHint => 'mail@example.com';

  @override
  String get emailAuth_emailErrorEmpty => 'メールアドレスを入力してください';

  @override
  String get emailAuth_emailErrorInvalid => '無効なメールアドレスです';

  @override
  String get emailAuth_passwordLabel => 'パスワード';

  @override
  String get emailAuth_passwordHintLogin => 'パスワード';

  @override
  String get emailAuth_passwordHintRegister => '6文字以上';

  @override
  String get emailAuth_passwordErrorEmpty => 'パスワードを入力してください';

  @override
  String get emailAuth_passwordErrorShort => '6文字以上必要です';

  @override
  String get emailAuth_forgotPassword => 'パスワードをお忘れですか？';

  @override
  String get emailAuth_hasAccount => 'すでにアカウントをお持ちですか？ ';

  @override
  String get emailAuth_noAccount => 'アカウントをお持ちでないですか？ ';

  @override
  String get emailAuth_loginLink => 'ログイン';

  @override
  String get emailAuth_registerLink => '登録';

  @override
  String get emailAuth_unexpectedError => '予期しないエラーが発生しました。もう一度お試しください。';

  @override
  String get emailAuth_emailFirst => 'まずメールアドレスを入力してください。';

  @override
  String emailAuth_resetSent(String email) {
    return '$emailにパスワードリセットメールを送信しました';
  }

  @override
  String get emailAuth_resetError => 'パスワードリセットメールの送信に失敗しました。';

  @override
  String get authError_userNotFound => 'このメールアドレスのアカウントは存在しません。';

  @override
  String get authError_wrongPassword => 'パスワードが正しくありません。';

  @override
  String get authError_emailAlreadyInUse => 'このメールアドレスは既に登録されています。';

  @override
  String get authError_weakPassword => 'パスワードが弱すぎます（6文字以上必要です）。';

  @override
  String get authError_invalidEmail => '無効なメールアドレスです。';

  @override
  String get authError_tooManyRequests => '試行回数が多すぎます。しばらくお待ちください。';

  @override
  String get authError_networkFailed => 'インターネットに接続されていません。';

  @override
  String get authError_default => 'ログインに失敗しました。もう一度お試しください。';

  @override
  String home_greetingMorning(String name) {
    return 'おはようございます、$nameさん！';
  }

  @override
  String get home_greetingMorningNoName => 'おはようございます！';

  @override
  String home_greetingAfternoon(String name) {
    return 'こんにちは、$nameさん！';
  }

  @override
  String get home_greetingAfternoonNoName => 'こんにちは！';

  @override
  String home_greetingEvening(String name) {
    return 'こんばんは、$nameさん！';
  }

  @override
  String get home_greetingEveningNoName => 'こんばんは！';

  @override
  String get home_weekMotivationZero => '今週はまだトレーニングしていません。今日から始めましょう！';

  @override
  String get home_weekMotivationOne => '今週1回トレーニングしました。その調子！';

  @override
  String home_weekMotivationMany(int count) {
    return '今週$count回トレーニングしました。その調子！';
  }

  @override
  String get home_startWorkout => 'トレーニングを開始';

  @override
  String get home_thisWeek => '今週';

  @override
  String get home_weekTime => '週間タイム';

  @override
  String get home_weekVolume => '週間ボリューム';

  @override
  String get home_quickAccess => 'クイックアクセス';

  @override
  String get home_lastWorkout => '最後のトレーニング';

  @override
  String get home_viewAll => 'すべて見る';

  @override
  String get home_noWorkoutsYet => 'まだトレーニングがありません';

  @override
  String get home_noWorkoutsSubtitle => '最初のトレーニングを完了するとここに表示されます。';

  @override
  String get home_goToTrain => 'トレーニングへ →';

  @override
  String get home_progress => '進捗';

  @override
  String get home_noRecordsYet => 'まだ記録がありません';

  @override
  String get home_recordWeightMeasures => '体重と測定値を記録しましょう';

  @override
  String get home_achievements => '実績';

  @override
  String get home_noAchievements => 'トレーニングを完了して実績を解除しましょう';

  @override
  String get home_recentExercises => '最近のエクササイズ';

  @override
  String get home_noRecentExercises => 'よく行うエクササイズがここに表示されます';

  @override
  String home_frequentExercise(int count) {
    return '$countセッション';
  }

  @override
  String get home_latestRecord => '最新の記録';

  @override
  String get home_waist => 'ウエスト';

  @override
  String get home_hips => 'ヒップ';

  @override
  String get home_exerciseLibrary => 'エクササイズライブラリ';

  @override
  String get home_viewAllExercises => 'すべて見る';

  @override
  String home_exercisesAvailable(int count) {
    return '$count種目のエクササイズ';
  }

  @override
  String get profile_proActive => 'サブスクリプション有効';

  @override
  String get profile_freePlan => '無料プラン';

  @override
  String get profile_upgradePro => 'PROにアップグレード';

  @override
  String get profile_redeemCode => 'コードを引き換え';

  @override
  String get profile_restorePurchases => '購入を復元';

  @override
  String get profile_signOut => 'ログアウト';

  @override
  String get profile_deleteAccount => 'アカウントを削除';

  @override
  String get profile_redeemTitle => 'コードを引き換え';

  @override
  String get profile_redeemSubtitle =>
      'プロモーションコードを入力してLiftWave PROをアンロックしてください。';

  @override
  String get profile_codeHint => 'コード';

  @override
  String get profile_redeem => '引き換え';

  @override
  String get profile_proActivated => 'LiftWave PROが有効になりました';

  @override
  String get profile_invalidCode => '無効なコードです';

  @override
  String get profile_purchasesRestored => '購入が正常に復元されました';

  @override
  String get profile_noPurchasesFound => '過去の購入が見つかりません';

  @override
  String get profile_deleteTitle => 'アカウントを削除';

  @override
  String get profile_deleteConfirm => '本当によろしいですか？この操作は取り消せず、すべてのデータが削除されます。';

  @override
  String get profile_deleteReauthError =>
      'アカウントを削除するには、ログアウトして再度ログインしてからお試しください。';

  @override
  String get train_title => 'トレーニング';

  @override
  String get train_readyTitle => 'トレーニングの準備はできましたか？';

  @override
  String get train_readySubtitle => 'フリーセッションを開始するか、既存のルーティンを選択してください。';

  @override
  String get train_freeSession => 'フリーセッション';

  @override
  String get train_freeWorkout => 'フリートレーニング';

  @override
  String get train_myRoutines => 'マイルーティン';

  @override
  String get train_predefinedRoutines => 'プリセットルーティン';

  @override
  String get train_inProgress => '進行中';

  @override
  String get train_cancelWorkout => 'トレーニングをキャンセル';

  @override
  String get train_cancelConfirm => '本当にキャンセルしますか？進捗が失われます。';

  @override
  String get train_continue => '続ける';

  @override
  String get train_addExerciseFirst => '終了する前に少なくとも1つのエクササイズを追加してください。';

  @override
  String get train_workoutCompleted => 'トレーニング完了！';

  @override
  String get train_completedSets => '完了セット数';

  @override
  String get train_totalVolume => '合計ボリューム';

  @override
  String get train_saveAsRoutine => 'ルーティンとして保存';

  @override
  String get train_finish => '終了';

  @override
  String get train_newAchievement => '新しい実績！';

  @override
  String get train_great => 'すばらしい！';

  @override
  String get train_routineNameHint => 'ルーティン名';

  @override
  String train_routineSaved(String name) {
    return 'ルーティン「$name」を保存しました';
  }

  @override
  String get train_deleteRoutine => 'ルーティンを削除';

  @override
  String train_deleteRoutineConfirm(String name) {
    return '「$name」を削除しますか？';
  }

  @override
  String get train_noExercisesYet => 'まだエクササイズがありません';

  @override
  String get train_addExerciseHint => '下のボタンをタップして最初のエクササイズを追加してください。';

  @override
  String get train_addExercise => 'エクササイズを追加';

  @override
  String get train_exercise => 'エクササイズ';

  @override
  String train_exerciseCount(int count) {
    return '$count種目';
  }

  @override
  String train_startTemplate(String name) {
    return '$nameを開始';
  }

  @override
  String train_setsProgress(int done, int total) {
    return '$done/$totalセット ✓';
  }

  @override
  String get train_viewProgress => '進捗を見る';

  @override
  String get train_deleteExercise => 'エクササイズを削除';

  @override
  String get train_notesHint => 'メモ（任意）';

  @override
  String get train_setHeader => 'セット';

  @override
  String get train_repsHeader => 'レップ';

  @override
  String get train_weightHeader => '重量 (kg)';

  @override
  String get train_addSet => 'セットを追加';

  @override
  String train_lastWeight(String weight) {
    return '前回: $weight kg';
  }

  @override
  String get train_abbreviationExercises => '種目';

  @override
  String get train_orChooseRoutine => 'またはルーティンを選択';

  @override
  String get train_defaultRoutineName => 'マイルーティン';

  @override
  String get train_bodyweightLabel => '自重';

  @override
  String get picker_title => 'エクササイズを選択';

  @override
  String get picker_searchHint => 'エクササイズを検索...';

  @override
  String get picker_createManual => 'カスタムエクササイズを作成';

  @override
  String get picker_createManualSubtitle => '名前、筋肉群、器具';

  @override
  String get picker_createTitle => 'エクササイズを作成';

  @override
  String get picker_nameLabel => '名前';

  @override
  String get picker_nameHint => '例: ハンマーカール';

  @override
  String get picker_muscleGroupLabel => '筋肉群';

  @override
  String get picker_equipmentLabel => '器具';

  @override
  String get picker_addExercise => 'エクササイズを追加';

  @override
  String get exercises_title => 'エクササイズ';

  @override
  String get exercises_searchHint => 'エクササイズを検索...';

  @override
  String get exercises_muscleFilter => '筋肉';

  @override
  String get exercises_equipmentFilter => '器具';

  @override
  String exercises_exerciseCount(int count, String suffix) {
    return '$count種目$suffix';
  }

  @override
  String get exercises_clearFilters => 'フィルターをクリア';

  @override
  String get exercises_noResults => '結果なし';

  @override
  String get exercises_noResultsHint => '他のフィルターや検索語をお試しください';

  @override
  String get exercises_deleteTitle => 'エクササイズを削除';

  @override
  String exercises_deleteConfirm(String name) {
    return '「$name」をエクササイズリストから削除しますか？';
  }

  @override
  String get exercises_muscleGroupLabel => '筋肉群';

  @override
  String get exercises_materialLabel => '器具';

  @override
  String get exercises_executionTitle => 'やり方';

  @override
  String get exercises_secondaryMuscles => '補助筋群';

  @override
  String get exercises_benefits => 'メリット';

  @override
  String get exercises_viewProgress => '進捗を見る';

  @override
  String get exercises_addToWorkout => 'トレーニングに追加';

  @override
  String get progress_maxWeight => '最大重量';

  @override
  String get progress_volumeLabel => 'ボリューム';

  @override
  String get progress_noData => 'このエクササイズのデータがありません';

  @override
  String get progress_needMoreSessions => '進捗を表示するには2回以上のセッションが必要です';

  @override
  String get progress_lastVolume => '前回のボリューム';

  @override
  String get progress_lastWeight => '前回の重量';

  @override
  String get progress_best => 'ベスト';

  @override
  String get progress_progressLabel => '進捗';

  @override
  String get progress_historyTitle => '履歴';

  @override
  String get history_title => '履歴';

  @override
  String get history_exportCsv => 'CSVエクスポート';

  @override
  String get history_allWorkouts => 'すべてのトレーニング';

  @override
  String get history_noWorkoutsYet => 'まだトレーニングがありません';

  @override
  String get history_noWorkoutsSubtitle => 'トレーニングタブで最初のトレーニングを完了するとここに表示されます。';

  @override
  String get history_limitedHistory => '履歴が制限されています';

  @override
  String history_unlockWorkouts(int count) {
    return 'PROで$count件のトレーニングをアンロック';
  }

  @override
  String get history_weeklySummary => '週間サマリー';

  @override
  String get history_workouts => 'トレーニング';

  @override
  String get history_total => '合計';

  @override
  String get history_volumeKg => 'ボリューム kg';

  @override
  String get history_dayMon => '月';

  @override
  String get history_dayTue => '火';

  @override
  String get history_dayWed => '水';

  @override
  String get history_dayThu => '木';

  @override
  String get history_dayFri => '金';

  @override
  String get history_daySat => '土';

  @override
  String get history_daySun => '日';

  @override
  String get history_exercisesPerformed => '実施したエクササイズ';

  @override
  String history_setsCount(int count) {
    return '$countセット';
  }

  @override
  String get history_setHeader => 'セット';

  @override
  String get detail_monthJan => '1月';

  @override
  String get detail_monthFeb => '2月';

  @override
  String get detail_monthMar => '3月';

  @override
  String get detail_monthApr => '4月';

  @override
  String get detail_monthMay => '5月';

  @override
  String get detail_monthJun => '6月';

  @override
  String get detail_monthJul => '7月';

  @override
  String get detail_monthAug => '8月';

  @override
  String get detail_monthSep => '9月';

  @override
  String get detail_monthOct => '10月';

  @override
  String get detail_monthNov => '11月';

  @override
  String get detail_monthDec => '12月';

  @override
  String detail_dateFormat(int day, String month, int year) {
    return '$year年$month$day日';
  }

  @override
  String get paywall_subtitle => 'あなたの潜在能力を最大限に引き出そう';

  @override
  String get paywall_featureTemplates => 'トレーニングテンプレート';

  @override
  String get paywall_featureHistory => '無制限の履歴';

  @override
  String get paywall_featureTimer => 'カスタムタイマー';

  @override
  String get paywall_featureDetails => 'エクササイズの詳細';

  @override
  String get paywall_featureMeasures => '体の測定値＋写真';

  @override
  String get paywall_featureStats => '週間統計';

  @override
  String get paywall_allIncluded => 'すべて含む';

  @override
  String get paywall_weekly => '週間';

  @override
  String get paywall_monthly => '月間';

  @override
  String get paywall_yearly => '年間';

  @override
  String get paywall_bestValue => 'お得';

  @override
  String get paywall_perWeek => '/週';

  @override
  String get paywall_perMonth => '/月';

  @override
  String get paywall_perYear => '/年';

  @override
  String get paywall_freeTrial => '7日間無料トライアル';

  @override
  String get paywall_startTrial => '無料トライアルを開始';

  @override
  String get paywall_restorePurchases => '購入を復元';

  @override
  String get paywall_legalText =>
      'サブスクリプションは自動的に更新されます。\nApp Storeからいつでもキャンセルできます。';

  @override
  String get paywall_termsLink => '利用規約';

  @override
  String get paywall_privacyLink => 'プライバシーポリシー';

  @override
  String get paywall_purchaseError => '購入を完了できませんでした。';

  @override
  String get paywall_noPurchasesFound => '過去の購入が見つかりません。';

  @override
  String get rest_title => '休憩';

  @override
  String get rest_ready => '準備完了！次のセットへ';

  @override
  String get rest_almostReady => 'もうすぐ準備完了！';

  @override
  String get rest_resting => '休憩中...';

  @override
  String rest_customTime(String time) {
    return 'カスタム時間 · $time';
  }

  @override
  String get rest_choosePreset => 'プリセットを選択またはカスタマイズ';

  @override
  String rest_of(String time) {
    return '$time中';
  }

  @override
  String get rest_presets => 'プリセット';

  @override
  String get rest_customize => 'カスタマイズ';

  @override
  String get rest_customTimeTitle => 'カスタム時間';

  @override
  String get rest_customTimeSubtitle => '休憩の分と秒を入力してください。';

  @override
  String get rest_minutes => '分';

  @override
  String get rest_seconds => '秒';

  @override
  String get rest_setTime => '時間を設定';

  @override
  String get progressScreen_title => 'ボディ記録';

  @override
  String get progressScreen_measurements => '測定値';

  @override
  String get progressScreen_photos => '写真';

  @override
  String get progressScreen_addMeasurement => '測定値を追加';

  @override
  String get progressScreen_weight => '体重';

  @override
  String get progressScreen_bodyFat => '体脂肪率';

  @override
  String get progressScreen_muscle => '筋肉量';

  @override
  String get progressScreen_noEntries => 'まだ記録がありません';

  @override
  String get progressScreen_noEntriesHint => '＋ボタンをタップして最初の測定値を追加してください';

  @override
  String get progressScreen_noPhotos => 'まだ写真がありません';

  @override
  String get progressScreen_noPhotosHint => '＋ボタンをタップして最初の進捗写真を追加してください';

  @override
  String get progressScreen_current => '現在';

  @override
  String get progressScreen_change => '変化';

  @override
  String get progressScreen_trend => '傾向';

  @override
  String get progressScreen_addMeasurementTitle => '新しい測定値';

  @override
  String get progressScreen_weightKg => '体重 (kg)';

  @override
  String get progressScreen_bodyFatPercent => '体脂肪率 (%)';

  @override
  String get progressScreen_muscleMassKg => '筋肉量 (kg)';

  @override
  String get progressScreen_optional => '任意';

  @override
  String get progressScreen_saveEntry => '記録を保存';

  @override
  String get progressScreen_deleteMeasurement => 'この記録を削除しますか？';

  @override
  String get progressScreen_deletePhoto => 'この写真を削除しますか？';

  @override
  String get progressScreen_camera => 'カメラ';

  @override
  String get progressScreen_gallery => 'ギャラリー';

  @override
  String get progressScreen_selectSource => 'ソースを選択';

  @override
  String get progressScreen_waist => 'ウエスト';

  @override
  String get progressScreen_chest => '胸囲';

  @override
  String get progressScreen_hips => 'ヒップ';

  @override
  String get progressScreen_record => '記録';

  @override
  String get progressScreen_noDataMetric => 'この指標のデータがありません';

  @override
  String get progressScreen_addMoreRecords => 'グラフを表示するにはもっと記録を追加してください';

  @override
  String get progressScreen_historyTitle => '履歴';

  @override
  String get progressScreen_noEntriesSubtitle => '最初の体重と測定値を記録して\n進捗を確認しましょう。';

  @override
  String get progressScreen_addFirstRecord => '最初の記録を追加';

  @override
  String get progressScreen_progressPhotos => '進捗写真';

  @override
  String get progressScreen_progressPhotosHint =>
      '写真で視覚的な進捗を記録しましょう。\nLiftWave PROでご利用いただけます。';

  @override
  String get progressScreen_unlockWithPro => 'PROで解除';

  @override
  String get progressScreen_noPhotosSubtitle =>
      '測定値を記録する際に写真を追加して\n視覚的な進捗を確認しましょう。';

  @override
  String get progressScreen_addPhoto => '写真を追加';

  @override
  String get progressScreen_newRecord => '新しい記録';

  @override
  String get progressScreen_photoAdded => '写真を追加しました';

  @override
  String get progressScreen_addPhotoOptional => '写真を追加（任意）';

  @override
  String get progressScreen_saveRecord => '記録を保存';

  @override
  String get progressScreen_enterAtLeastOneValue => '少なくとも1つの値を入力してください';

  @override
  String get progressScreen_monthShortJan => '1月';

  @override
  String get progressScreen_monthShortFeb => '2月';

  @override
  String get progressScreen_monthShortMar => '3月';

  @override
  String get progressScreen_monthShortApr => '4月';

  @override
  String get progressScreen_monthShortMay => '5月';

  @override
  String get progressScreen_monthShortJun => '6月';

  @override
  String get progressScreen_monthShortJul => '7月';

  @override
  String get progressScreen_monthShortAug => '8月';

  @override
  String get progressScreen_monthShortSep => '9月';

  @override
  String get progressScreen_monthShortOct => '10月';

  @override
  String get progressScreen_monthShortNov => '11月';

  @override
  String get progressScreen_monthShortDec => '12月';

  @override
  String get achievement_firstWorkout_title => '初めてのセッション';

  @override
  String get achievement_firstWorkout_description => '最初のトレーニングを完了する';

  @override
  String get achievement_streak7_title => '7日連続';

  @override
  String get achievement_streak7_description => '7日連続で少なくとも1回トレーニングする';

  @override
  String get achievement_streak30_title => '30日連続';

  @override
  String get achievement_streak30_description => '30日間、毎週少なくとも1回トレーニングする';

  @override
  String get achievement_volume1000_title => '1,000 kg達成';

  @override
  String get achievement_volume1000_description => '合計1,000 kgのボリュームを積み上げる';

  @override
  String get achievement_volume5000_title => '5,000 kg達成';

  @override
  String get achievement_volume5000_description => '合計5,000 kgのボリュームを積み上げる';

  @override
  String get achievement_volume10000_title => '10,000 kg達成';

  @override
  String get achievement_volume10000_description => '合計10,000 kgのボリュームを積み上げる';

  @override
  String get achievement_personalRecord_title => '自己ベスト更新';

  @override
  String get achievement_personalRecord_description => 'エクササイズの最大重量を更新する';

  @override
  String get csv_header => '日付,トレーニング,エクササイズ,筋肉群,セット,レップ,重量 (kg),ボリューム (kg)';

  @override
  String get csv_subject => 'LiftWave - トレーニング履歴';

  @override
  String get template_fullBody_subtitle => '全身を1セッションでトレーニング';

  @override
  String get template_push_subtitle => '胸・肩・三頭筋';

  @override
  String get template_pull_subtitle => '背中・二頭筋';

  @override
  String get template_torso_subtitle => '胸・背中・肩';

  @override
  String get template_legs_subtitle => '大腿四頭筋・ハムストリングス・臀筋・体幹';

  @override
  String get template_legs_name => '脚';

  @override
  String get ex_pecho_1_name => 'ベンチプレス';

  @override
  String get ex_pecho_2_name => 'インクラインダンベルプレス';

  @override
  String get ex_pecho_3_name => 'ダンベルフライ';

  @override
  String get ex_pecho_4_name => 'ディップス';

  @override
  String get ex_pecho_5_name => 'ケーブルクロスオーバー';

  @override
  String get ex_esp_1_name => 'デッドリフト';

  @override
  String get ex_esp_2_name => '懸垂（チンニング）';

  @override
  String get ex_esp_3_name => 'バーベルロウ';

  @override
  String get ex_esp_4_name => 'ワンハンドダンベルロウ';

  @override
  String get ex_esp_5_name => 'ラットプルダウン';

  @override
  String get ex_pier_1_name => 'バーベルスクワット';

  @override
  String get ex_pier_2_name => 'レッグプレス';

  @override
  String get ex_pier_3_name => 'ヒップスラスト';

  @override
  String get ex_pier_4_name => 'ランジ';

  @override
  String get ex_pier_5_name => 'レッグカール';

  @override
  String get ex_hom_1_name => 'ミリタリープレス';

  @override
  String get ex_hom_2_name => 'サイドレイズ';

  @override
  String get ex_hom_3_name => 'フェイスプル';

  @override
  String get ex_hom_4_name => 'アーノルドプレス';

  @override
  String get ex_bra_1_name => 'ダンベルカール';

  @override
  String get ex_bra_2_name => 'EZバーカール';

  @override
  String get ex_bra_3_name => 'ハンマーカール';

  @override
  String get ex_bra_4_name => 'ケーブルトライセプスプッシュダウン';

  @override
  String get ex_bra_5_name => 'スカルクラッシャー';

  @override
  String get ex_core_1_name => 'プランク';

  @override
  String get ex_core_2_name => 'クランチ';

  @override
  String get ex_core_3_name => 'ハンギングレッグレイズ';

  @override
  String get ex_core_4_name => 'アブローラー';

  @override
  String get ex_pecho_1_desc =>
      'フラットベンチに仰向けになり、足を床につけます。肩幅より広めにバーを握ります。バーをコントロールしながら胸に触れるまで下ろし、腕が完全に伸びるまで押し上げます。動作中は肩甲骨を寄せたままにしてください。';

  @override
  String get ex_pecho_2_desc =>
      'ベンチを30〜45度に調整します。両手にダンベルを持ち太ももに乗せた状態で座ります。リクライニングしながらダンベルを胸の高さに構え、肘を体から45度に開きます。上に向かって押し上げ、トップでダンベルが近づくようにします。';

  @override
  String get ex_pecho_3_desc =>
      'フラットベンチに仰向けになり、両手にダンベルを持ち、腕を胸の上に伸ばして肘を軽く曲げます。大きな弧を描くように腕を下ろし、胸のストレッチを感じたら、胸を絞りながら元の位置に戻します。';

  @override
  String get ex_pecho_4_desc =>
      '平行棒に腕を伸ばした状態で体を支えます。胸に効かせるために上体をやや前傾させます。肘を曲げて腕が床と平行になるまで体を下ろし、肘をロックせずに押し上げて戻ります。';

  @override
  String get ex_pecho_5_desc =>
      'ケーブルを高い位置にセットします。ハンドルを握り一歩前に出ます。肘を軽く曲げた状態で、腕を前方下方にクロスさせ、手が正面で合わさるまで引きます。最終位置で胸を収縮させ、ゆっくり戻します。';

  @override
  String get ex_esp_1_desc =>
      'バーの前に立ち、足を腰幅に開きます。膝のすぐ外側でオーバーハンドまたはオルタネイトグリップでバーを握ります。背中をまっすぐに保ち、胸を張ります。足で床を押しながら股関節と膝を伸ばし、完全に直立するまで立ち上がります。コントロールしながら下ろします。';

  @override
  String get ex_esp_2_desc =>
      'バーに肩幅より広いオーバーハンドグリップでぶら下がります。肩甲骨を活性化させ、あごがバーを超えるまで体を引き上げます。コントロールしながらゆっくり下ろします。体の揺れを避け、動作中は体幹を引き締めてください。';

  @override
  String get ex_esp_3_desc =>
      '足を肩幅に開いて立ち、背中をニュートラルに保ちながら上体を約45度前傾させます。肩幅よりやや広めのオーバーハンドグリップでバーを握ります。肩甲骨を寄せながらバーを腹部に引き上げます。上体を落とさないようにコントロールしながら下ろします。';

  @override
  String get ex_esp_4_desc =>
      '片側の膝と手をベンチに乗せます。背中を床と平行にしてニュートラルに保ち、空いている手でダンベルを握ります。肩甲骨を寄せながらダンベルを腰に向かって引き上げます。肘は体の側面に沿わせます。完全にコントロールしながら下ろします。';

  @override
  String get ex_esp_5_desc =>
      'ラットプルダウンマシンに座り、ワイドバーをオーバーハンドグリップで握ります。上体をやや後方に傾け、肩甲骨を寄せて肘を下げながらバーを胸に引きます。反動を使わないでください。コントロールしながらゆっくり元の位置に戻します。';

  @override
  String get ex_pier_1_desc =>
      'バーを僧帽筋の上に乗せます。足を肩幅かやや広めに開きます。胸を張り背中をニュートラルに保ちながら、太ももが床と平行になるまで膝と股関節を曲げて下ろします。かかとで押して立ち上がります。';

  @override
  String get ex_pier_2_desc =>
      'マシンに座り、背中をシートにしっかりつけます。プラットフォームに足を肩幅に置きます。セーフティを外し、膝が約90度になるまでプラットフォームを下ろし、膝をロックせずにほぼ完全に伸ばすまで押し上げます。';

  @override
  String get ex_pier_3_desc =>
      '肩甲骨を頑丈なベンチに乗せ、バーを腰の上に置きます（パッドを使用）。足を肩幅に開いて床につけます。腰を床に向かって下ろし、臀筋を絞りながら腰が床と平行になるまで押し上げます。';

  @override
  String get ex_pier_4_desc =>
      '両手にダンベルを持って立ちます。大きく一歩前に踏み出し、後ろの膝がほぼ床に触れるまで下ろします。前の膝がつま先を超えないようにします。前足のかかとで押して元の位置に戻ります。脚を交互に行います。';

  @override
  String get ex_pier_5_desc =>
      'マシンにうつ伏せになり、かかとをローラーの下に置きます。コントロールしながら膝を曲げ、かかとを臀部に向かって引き上げます。最終位置でハムストリングスを収縮させます。ウェイトが休まないようにゆっくり下ろします。';

  @override
  String get ex_hom_1_desc =>
      '立った状態または座った状態で、バーを肩の高さに構え、肩幅よりやや広めのオーバーハンドグリップで握ります。バーを頭上に垂直に押し上げ、腕を完全に伸ばします。コントロールしながら元の位置に下ろします。腰を守るために体幹を引き締めてください。';

  @override
  String get ex_hom_2_desc =>
      '両手にダンベルを持ち、体の横に構えます。手のひらは内側に向けます。肘を軽く曲げた状態で、腕を横に肩の高さまで持ち上げます。ゆっくり下ろします。反動を使わず、純粋にコントロールされた動きで行ってください。';

  @override
  String get ex_hom_3_desc =>
      'ケーブルの高い位置にロープをセットします。ロープの端を手のひらを下にして握り、一歩後ろに下がります。肘を肩の高さに開きながら、ロープを顔に向かって引き、手を耳の横まで持っていきます。最終位置でリアデルトを収縮させます。';

  @override
  String get ex_hom_4_desc =>
      '座った状態でダンベルを肩の前に構え、手のひらを自分に向けます。押し上げながら手のひらを外側に回転させ、トップで手のひらが前を向くようにします。回転を逆にしながら元の位置に下ろします。滑らかで連続した動きで行います。';

  @override
  String get ex_bra_1_desc =>
      '両手にダンベルを持ち、腕を伸ばして手のひらを前に向けて立ちます。上腕を動かさずに肘を曲げてダンベルを肩に向かって持ち上げます。トップで二頭筋を収縮させます。腕が完全に伸びるまでコントロールしながら下ろします。';

  @override
  String get ex_bra_2_desc =>
      'EZバーを肩幅のアンダーハンドグリップで持って立ちます。肘を体の側面につけたまま、バーを胸の高さまで曲げます。二頭筋の完全なストレッチを感じながらコントロールして下ろします。EZバーは手首への負担を軽減します。';

  @override
  String get ex_bra_3_desc =>
      '両手にダンベルをニュートラルグリップ（手のひらを向かい合わせ、ハンマーを持つように）で持って立ちます。交互にまたは同時に肘を曲げ、ダンベルを肩に向かって持ち上げます。肘は常に体の側面につけたままにします。コントロールしながら下ろします。';

  @override
  String get ex_bra_4_desc =>
      'ケーブルの高い位置にロープまたはバーをセットします。肘を曲げて体の側面につけた状態でアタッチメントを握ります。肘を動かさずに下方に向かって腕を完全に伸ばします。ロープの場合は最後に手を少し開きます。ウェイトに抵抗しながらゆっくり戻します。';

  @override
  String get ex_bra_5_desc =>
      'ベンチに仰向けになり、EZバーを腕を伸ばして胸の上に構えます。肘を天井に向けたまま、肘だけを曲げてバーを額に向かって下ろします。再び元の位置まで伸ばします。肘は固定したまま、前腕だけが動くようにしてください。';

  @override
  String get ex_core_1_desc =>
      '前腕とつま先を床につけて体を支えます。体を一枚の板のようにまっすぐに保ちます。腰を上げたり下げたりせず、臀筋を締め、腹筋を収縮させます。一定のリズムで呼吸します。フォームを崩さずに目標時間キープしてください。';

  @override
  String get ex_core_2_desc =>
      '膝を曲げて足を床につけた状態で仰向けになります。首を引っ張らないように手を頭の後ろに添えます。腹筋を収縮させ、肩を床から約30度持ち上げ、トップで腹直筋を絞ります。腹筋を完全にリラックスさせずにコントロールしながら下ろします。';

  @override
  String get ex_core_3_desc =>
      '肩幅のオーバーハンドグリップでバーにぶら下がります。膝または脚を軽く曲げた状態で、腹筋を収縮させながら膝または脚を水平（またはそれ以上）まで持ち上げます。揺れないようにゆっくり下ろします。動きは反動ではなく股関節の屈曲から行ってください。';

  @override
  String get ex_core_4_desc =>
      '膝をつき、前にアブローラーを置きます。ハンドルを握り、体をゆっくり前方に伸ばしながらほぼ床に触れるまでローラーを転がします。腰を落とさないように体幹を収縮させて元の位置に戻ります。動作中は背中をニュートラルに保ち、腹筋を引き締めてください。';

  @override
  String get secondary_triceps => '三頭筋';

  @override
  String get secondary_anteriorDeltoid => '三角筋前部';

  @override
  String get secondary_biceps => '二頭筋';

  @override
  String get secondary_glutes => '臀筋';

  @override
  String get secondary_hamstrings => 'ハムストリングス';

  @override
  String get secondary_trapezius => '僧帽筋';

  @override
  String get secondary_rhomboids => '菱形筋';

  @override
  String get secondary_lowerBack => '腰';

  @override
  String get secondary_quads => '大腿四頭筋';

  @override
  String get secondary_calves => 'ふくらはぎ';

  @override
  String get secondary_rotatorCuff => '回旋筋腱板';

  @override
  String get secondary_brachialis => '上腕筋';

  @override
  String get secondary_brachioradialis => '腕橈骨筋';

  @override
  String get secondary_anconeus => '肘筋';

  @override
  String get secondary_obliques => '腹斜筋';

  @override
  String get secondary_hipFlexors => '腸腰筋';

  @override
  String get secondary_deltoids => '三角筋';

  @override
  String get secondary_lats => '広背筋';

  @override
  String get ex_pecho_1_b1 => '胸の筋肉量と筋力を発達させる';

  @override
  String get ex_pecho_1_b2 => '三頭筋と肩の前部を強化する';

  @override
  String get ex_pecho_1_b3 => '機能的な筋力に高い効果がある複合エクササイズ';

  @override
  String get ex_pecho_2_b1 => '胸の上部（鎖骨部）を重点的に鍛える';

  @override
  String get ex_pecho_2_b2 => 'バーベルより可動域が広い';

  @override
  String get ex_pecho_2_b3 => '左右それぞれを独立して鍛えられる';

  @override
  String get ex_pecho_3_b1 => '大胸筋を深くアイソレーションする';

  @override
  String get ex_pecho_3_b2 => '胸の柔軟性とストレッチを改善する';

  @override
  String get ex_pecho_3_b3 => 'ボリュームと筋肉のカットに最適';

  @override
  String get ex_pecho_4_b1 => '胸・三頭筋・肩を鍛える複合エクササイズ';

  @override
  String get ex_pecho_4_b2 => '追加の器具が不要';

  @override
  String get ex_pecho_4_b3 => 'ディッピングベルトで加重して負荷を上げられる';

  @override
  String get ex_pecho_5_b1 => '可動域全体にわたって一定の張力がかかる';

  @override
  String get ex_pecho_5_b2 => '胸のカットとアイソレーションに優れている';

  @override
  String get ex_pecho_5_b3 => 'ケーブルの高さによって複数のバリエーションが可能';

  @override
  String get ex_esp_1_b1 => '全身の筋力を最大化する総合エクササイズ';

  @override
  String get ex_esp_1_b2 => 'ポステリアチェーン（背中・臀筋・ハムストリングス）を発達させる';

  @override
  String get ex_esp_1_b3 => 'ホルモン分泌とアナボリック効果が高い';

  @override
  String get ex_esp_2_b1 => '背中の幅（広背筋）を発達させる';

  @override
  String get ex_esp_2_b2 => '体重に対する相対的な筋力を向上させる';

  @override
  String get ex_esp_2_b3 => '機能的パフォーマンスの優れた指標';

  @override
  String get ex_esp_3_b1 => '背中の厚みを発達させる';

  @override
  String get ex_esp_3_b2 => '姿勢を支える筋肉を強化する';

  @override
  String get ex_esp_3_b3 => 'ベンチプレスの理想的な補助種目';

  @override
  String get ex_esp_4_b1 => '左右の筋力バランスの不均衡を改善する';

  @override
  String get ex_esp_4_b2 => 'バーベルロウより可動域が広い';

  @override
  String get ex_esp_4_b3 => '習得が簡単で初心者に最適';

  @override
  String get ex_esp_5_b1 => '初心者のための懸垂の代替種目';

  @override
  String get ex_esp_5_b2 => '背中の幅を発達させる';

  @override
  String get ex_esp_5_b3 => '重量のコントロールと段階的な負荷増加が容易';

  @override
  String get ex_pier_1_b1 => '下半身で最も総合的なエクササイズ';

  @override
  String get ex_pier_1_b2 => '他のどのエクササイズよりも多くのアナボリックホルモンを分泌する';

  @override
  String get ex_pier_1_b3 => '運動能力と機能性を向上させる';

  @override
  String get ex_pier_2_b1 => '安全に高重量でトレーニングできる';

  @override
  String get ex_pier_2_b2 => '初心者やリハビリに最適';

  @override
  String get ex_pier_2_b3 => '足の位置を変えて異なる部位にフォーカスできる';

  @override
  String get ex_pier_3_b1 => '臀筋の活性化と発達に最も効果的なエクササイズ';

  @override
  String get ex_pier_3_b2 => '股関節の伸展と姿勢を改善する';

  @override
  String get ex_pier_3_b3 => '膝と股関節の怪我のリスクを軽減する';

  @override
  String get ex_pier_4_b1 => '片脚ずつ鍛え、筋力バランスの不均衡を改善する';

  @override
  String get ex_pier_4_b2 => 'バランスと安定性を向上させる';

  @override
  String get ex_pier_4_b3 => '臀筋と大腿四頭筋の発達に優れている';

  @override
  String get ex_pier_5_b1 => 'ハムストリングスを直接アイソレーションする';

  @override
  String get ex_pier_5_b2 => 'ハムストリングスの怪我を予防する';

  @override
  String get ex_pier_5_b3 => '太もも全体の筋肉バランスを整える';

  @override
  String get ex_hom_1_b1 => '三角筋の3つの部位すべてを発達させる';

  @override
  String get ex_hom_1_b2 => '頭上での機能的な筋力を向上させる';

  @override
  String get ex_hom_1_b3 => '回旋筋腱板と肩の安定性を強化する';

  @override
  String get ex_hom_2_b1 => '三角筋側部をアイソレーションし肩を広く見せる';

  @override
  String get ex_hom_2_b2 => '上半身の幅の見た目を改善する';

  @override
  String get ex_hom_2_b3 => '適切な重量を使えば怪我のリスクが低い';

  @override
  String get ex_hom_3_b1 => 'リアデルトを強化し姿勢を改善する';

  @override
  String get ex_hom_3_b2 => '回旋筋腱板の怪我を予防する';

  @override
  String get ex_hom_3_b3 => 'プッシュ系トレーニングの影響を相殺する';

  @override
  String get ex_hom_4_b1 => '1つの動きで三角筋の3つの部位すべてを活性化する';

  @override
  String get ex_hom_4_b2 => '回転動作が肩の可動性を向上させる';

  @override
  String get ex_hom_4_b3 => '通常のショルダープレスよりも総合的な種目';

  @override
  String get ex_bra_1_b1 => '上腕二頭筋を直接アイソレーションする';

  @override
  String get ex_bra_1_b2 => '左右それぞれの腕を独立して鍛えられる';

  @override
  String get ex_bra_1_b3 => '重量を上げやすく、テクニックが分かりやすい';

  @override
  String get ex_bra_2_b1 => 'ダンベルよりも高重量を扱える';

  @override
  String get ex_bra_2_b2 => 'EZバーが手首と肘への負担を軽減する';

  @override
  String get ex_bra_2_b3 => '二頭筋全体の筋量を発達させるのに最適';

  @override
  String get ex_bra_3_b1 => '上腕筋と腕橈骨筋を重点的に鍛える';

  @override
  String get ex_bra_3_b2 => '正面から見た腕の厚みとボリュームを向上させる';

  @override
  String get ex_bra_3_b3 => 'スピネイトカールより手首への負担が少ない';

  @override
  String get ex_bra_4_b1 => '三頭筋の3つの部位を効果的にアイソレーションする';

  @override
  String get ex_bra_4_b2 => 'ケーブルにより一定の張力がかかる';

  @override
  String get ex_bra_4_b3 => '三頭筋のカットと仕上げに優れている';

  @override
  String get ex_bra_5_b1 => '三頭筋の長頭を最大限にストレッチする';

  @override
  String get ex_bra_5_b2 => '三頭筋の厚みを発達させる';

  @override
  String get ex_bra_5_b3 => 'ダンベルやストレートバーでも行える';

  @override
  String get ex_core_1_b1 => '脊柱への負荷なく深層の体幹を強化する';

  @override
  String get ex_core_1_b2 => '姿勢と腰の安定性を改善する';

  @override
  String get ex_core_1_b3 => '腰痛のリスクを軽減する';

  @override
  String get ex_core_2_b1 => '腹直筋をアイソレーションする基本エクササイズ';

  @override
  String get ex_core_2_b2 => '習得と実行が簡単';

  @override
  String get ex_core_2_b3 => 'より高強度な腹筋種目への基礎になる';

  @override
  String get ex_core_3_b1 => '下腹部を高強度で鍛える';

  @override
  String get ex_core_3_b2 => '握力と腰部の筋力を向上させる';

  @override
  String get ex_core_3_b3 => '段階的に進歩：膝曲げ → 脚伸ばし → Lシット';

  @override
  String get ex_core_4_b1 => '最も総合的で高強度な体幹エクササイズの一つ';

  @override
  String get ex_core_4_b2 => '従来の腹筋運動とは異なり、伸展で体幹を鍛える';

  @override
  String get ex_core_4_b3 => '前面の筋肉連鎖全体の機能的な筋力を発達させる';
}
