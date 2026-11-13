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
  String get common_discardChangesTitle => '変更を破棄しますか？';

  @override
  String get common_discardChangesBody => '行った変更は保存されません。';

  @override
  String get common_keepEditing => '編集を続ける';

  @override
  String get common_discard => '破棄';

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
  String get muscle_crossfit => 'クロスフィット';

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
  String get equipment_rings => 'リング';

  @override
  String get equipment_box => 'ボックス';

  @override
  String get equipment_rope => 'ロープ';

  @override
  String get equipment_ball => 'ボール';

  @override
  String get equipment_kettlebell => 'ケトルベル';

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
  String get nav_progress => '進捗';

  @override
  String get nav_profile => 'プロフィール';

  @override
  String get home_todayTitle => '今日のトレーニング';

  @override
  String get home_inProgressTitle => 'トレーニング中';

  @override
  String get home_continueWorkout => 'トレーニングを再開';

  @override
  String get home_chooseAnother => '別のメニューを選ぶ';

  @override
  String get login_tagline => 'あなたのフィットネスアプリ';

  @override
  String get login_continueGoogle => 'Googleで続ける';

  @override
  String get login_continueApple => 'Appleで続ける';

  @override
  String get login_continueEmail => 'メールで続ける';

  @override
  String get login_continueGuest => 'アカウントなしで続ける';

  @override
  String get guest_name => 'ゲスト';

  @override
  String get guest_saveProgressTitle => '進捗を保存しましょう';

  @override
  String get guest_saveProgressBody =>
      'ゲストとしてLiftWaveを利用中です。機種変更や再インストールでトレーニング記録を失わないよう、無料アカウントを作成しましょう。';

  @override
  String get guest_createAccount => 'アカウントを作成';

  @override
  String get guest_notNow => '後で';

  @override
  String get guest_createAccountSubtitle => '進捗を失わないようにアカウントを作成しましょう';

  @override
  String get guest_accountCreated => 'アカウントを作成しました。トレーニング記録は保護されています。';

  @override
  String get guest_existingAccountTitle => 'このアカウントは既に存在します';

  @override
  String get guest_existingAccountBody =>
      'このアカウントでログインすると、ゲストとして記録したトレーニングは引き継がれません。';

  @override
  String get guest_signInAnyway => 'それでもログイン';

  @override
  String get guest_leave => 'ゲストモードを終了';

  @override
  String get guest_leaveBody => 'アカウントがないため、トレーニング記録とデータは削除されます。この操作は元に戻せません。';

  @override
  String train_reasonIncreaseLoad(int reps, String weight, int min, int max) {
    return '$weightで$reps回、目標範囲（$min〜$max回）の上限に達しました。重量を上げましょう。';
  }

  @override
  String train_reasonAddRep(int reps, String weight) {
    return '$weightで$reps回できました。重量を上げる前にもう1回増やしましょう。';
  }

  @override
  String train_reasonConsolidate(int reps, String weight, int min, int max) {
    return '$reps回で、目標範囲（$min〜$max回）を下回りました。$min回に届くまで$weightを続けましょう。';
  }

  @override
  String train_reasonBodyweight(int reps) {
    return '$reps回できました。あと1回増やしてみましょう。';
  }

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
  String get home_thisWeek => '今週';

  @override
  String get home_weekTime => '週間タイム';

  @override
  String get home_weekVolume => '週間ボリューム';

  @override
  String get restTimer_title => '休憩';

  @override
  String get restTimer_openControls => '休憩タイマーの操作を開く';

  @override
  String restTimer_addSeconds(int seconds) {
    return '$seconds秒追加';
  }

  @override
  String restTimer_subtractSeconds(int seconds) {
    return '$seconds秒減らす';
  }

  @override
  String get restTimer_pause => 'タイマーを一時停止';

  @override
  String get restTimer_resume => 'タイマーを再開';

  @override
  String get restTimer_dismiss => 'タイマーを閉じる';

  @override
  String get restTimer_reset => 'タイマーをリセット';

  @override
  String restTimer_preset(String time) {
    return '休憩を$timeに設定';
  }

  @override
  String get restTimer_resting => '休憩中';

  @override
  String get restTimer_done => '完了！';

  @override
  String get home_lastWorkout => '最後のトレーニング';

  @override
  String get home_repeatWorkout => 'トレーニングを繰り返す';

  @override
  String get editWorkout_title => 'トレーニングを編集';

  @override
  String get editWorkout_saved => 'トレーニングを更新しました';

  @override
  String get detail_deleteWorkout => 'トレーニングを削除';

  @override
  String get detail_deleteWorkoutConfirm => '履歴から削除されます。この操作は元に戻せません。';

  @override
  String get detail_workoutDeleted => 'トレーニングを削除しました';

  @override
  String get home_viewAll => 'すべて見る';

  @override
  String get home_goToTrain => 'トレーニングへ →';

  @override
  String get home_achievements => '実績';

  @override
  String get home_noAchievements => 'トレーニングを完了して実績を解除しましょう';

  @override
  String get home_exerciseLibrary => 'エクササイズライブラリ';

  @override
  String get profile_proActive => 'サブスクリプション有効';

  @override
  String get profile_freePlan => '無料プラン';

  @override
  String get profile_upgradePro => 'PROにアップグレード';

  @override
  String get profile_restorePurchases => '購入を復元';

  @override
  String get profile_signOut => 'ログアウト';

  @override
  String get profile_deleteAccount => 'アカウントを削除';

  @override
  String get progressScreen_deleteMeasurementTitle => '記録を削除しますか？';

  @override
  String get progressScreen_deleteMeasurementBody =>
      '記録と写真が削除されます。この操作は元に戻せません。';

  @override
  String get profile_signOutConfirm => 'ログアウトしますか？データはアカウントに保存されたままです。';

  @override
  String get profile_deleteSubscriptionNote =>
      'アカウントを削除してもサブスクリプションは解約されません。先にストアで解約してください。';

  @override
  String get profile_manageSubscription => 'サブスクリプションを管理';

  @override
  String get profile_help => 'ヘルプとサポート';

  @override
  String get rest_alertTitle => '休憩終了';

  @override
  String get rest_alertBody => '次のセットの時間です。';

  @override
  String get rest_alertChannel => '休憩タイマー';

  @override
  String get profile_restAlert => '休憩終了時に通知';

  @override
  String get profile_restAlertSubtitle => 'アプリを表示していないときに音で通知します';

  @override
  String get profile_restAlertExact => '正確なアラームを許可';

  @override
  String get profile_restAlertExactSubtitle =>
      'この権限がないと、Androidが通知を遅らせる場合があります';

  @override
  String get editWorkout_date => '日時';

  @override
  String get editWorkout_duration => '時間（分）';

  @override
  String get history_searchHint => 'トレーニングまたは種目を検索';

  @override
  String get history_noResults => '結果なし';

  @override
  String get history_calendar => 'カレンダー';

  @override
  String get progress_oneRm => '推定1RM';

  @override
  String get progress_recordsTitle => '記録';

  @override
  String get progress_bestLift => '最高重量';

  @override
  String get progress_bestOneRm => '推定1RMベスト';

  @override
  String get setType_title => 'セットの種類';

  @override
  String get setType_normal => '通常';

  @override
  String get setType_warmup => 'ウォームアップ';

  @override
  String get setType_drop => 'ドロップセット';

  @override
  String get setType_failure => '限界まで';

  @override
  String get setType_warmupHint => 'ボリュームや記録には含まれません';

  @override
  String get setType_warmupShort => 'W';

  @override
  String get setType_dropShort => 'D';

  @override
  String get setType_failureShort => 'F';

  @override
  String get plates_title => 'プレート計算機';

  @override
  String get plates_target => '合計重量';

  @override
  String get plates_bar => 'バー';

  @override
  String get plates_perSide => '片側';

  @override
  String get plates_onlyBar => 'バーのみ';

  @override
  String get plates_belowBar => '重量がバーより軽いです';

  @override
  String plates_missing(String amount) {
    return 'このプレートでは$amountを載せられません';
  }

  @override
  String get train_secondsHeader => '秒';

  @override
  String get train_secondsShort => '秒';

  @override
  String get train_startHold => '開始';

  @override
  String get train_measureByTime => '時間で記録';

  @override
  String get train_measureByReps => '回数で記録';

  @override
  String get hold_running => '実施中';

  @override
  String get hold_alertTitle => '時間です';

  @override
  String get hold_alertBody => 'セット完了です。';

  @override
  String train_reasonHold(int seconds) {
    return '$seconds秒キープしました。5秒延ばしてみましょう。';
  }

  @override
  String get superset_label => 'スーパーセット';

  @override
  String get superset_linkNext => '次の種目とスーパーセット';

  @override
  String get superset_unlink => 'スーパーセットを解除';

  @override
  String get superset_hint => 'セットを交互に行います。休憩は1巡終わってから始まります。';

  @override
  String get reminders_title => 'トレーニングのリマインダー';

  @override
  String get reminders_off => 'オフ';

  @override
  String get reminders_enable => 'トレーニングを通知する';

  @override
  String get reminders_enableSubtitle => '選んだ曜日に通知します';

  @override
  String get reminders_days => '曜日';

  @override
  String get reminders_time => '時刻';

  @override
  String get reminders_notificationTitle => 'トレーニングの時間です';

  @override
  String get reminders_notificationBody => '今日のトレーニングが待っています。';

  @override
  String reminders_notificationRoutine(String routine) {
    return '今日のメニュー：$routine';
  }

  @override
  String get reminders_permissionDenied =>
      'リマインダーを受け取るには、システム設定でLiftWaveの通知をオンにしてください。';

  @override
  String health_sync(String store) {
    return '$storeと同期';
  }

  @override
  String health_syncSubtitle(String store) {
    return '記録したワークアウトと体重を$storeに保存します';
  }

  @override
  String health_enabled(String store) {
    return '完了しました。今後のワークアウトは$storeに保存されます。';
  }

  @override
  String health_denied(String store) {
    return '有効にできませんでした。$storeでLiftWaveの権限を確認してください。';
  }

  @override
  String get health_needsInstall =>
      '同期を有効にするには、Health Connectをインストールまたは更新してください。';

  @override
  String get health_install => 'インストール';

  @override
  String health_unsupported(String store) {
    return 'このデバイスでは$storeを利用できません。';
  }

  @override
  String get profile_purchasesRestored => '購入が正常に復元されました';

  @override
  String get profile_noPurchasesFound => '過去の購入が見つかりません';

  @override
  String get restore_connectionError => '接続できません。インターネットを確認して再試行してください。';

  @override
  String get restore_unknownError => '復元できませんでした。再試行してください。';

  @override
  String get profile_deleteTitle => 'アカウントを削除';

  @override
  String get profile_deleteConfirm => '本当によろしいですか？この操作は取り消せず、すべてのデータが削除されます。';

  @override
  String get profile_deleteReauthError =>
      'アカウントを削除するには、ログアウトして再度ログインしてからお試しください。';

  @override
  String get profile_trainingPreferences => 'トレーニング設定';

  @override
  String get profile_trainingPreferencesSubtitle => '目標、経験、日数、器具';

  @override
  String get profile_appearance => '外観';

  @override
  String get appearance_system => '自動（端末の設定）';

  @override
  String get appearance_light => 'ライト';

  @override
  String get appearance_dark => 'ダーク';

  @override
  String get onboarding_title => 'トレーニングをカスタマイズ';

  @override
  String get onboarding_goalTitle => '主な目標は何ですか？';

  @override
  String get onboarding_goalSubtitle => '次回のおすすめを調整するために使用します。';

  @override
  String get onboarding_goalMuscle => '筋肉を増やす';

  @override
  String get onboarding_goalStrength => '筋力を高める';

  @override
  String get onboarding_goalFatLoss => '脂肪を減らす';

  @override
  String get onboarding_goalFitness => '体力を向上する';

  @override
  String get onboarding_experienceTitle => 'トレーニング経験は？';

  @override
  String get onboarding_experienceSubtitle => 'レベルに合わせて量と進行を調整します。';

  @override
  String get onboarding_experienceBeginner => '初心者';

  @override
  String get onboarding_experienceBeginnerHint => '1年未満';

  @override
  String get onboarding_experienceIntermediate => '中級者';

  @override
  String get onboarding_experienceIntermediateHint => '1〜3年';

  @override
  String get onboarding_experienceAdvanced => '上級者';

  @override
  String get onboarding_experienceAdvancedHint => '3年以上';

  @override
  String get onboarding_daysTitle => '週に何日トレーニングできますか？';

  @override
  String get onboarding_daysSubtitle => '継続できる頻度を選びましょう。';

  @override
  String onboarding_daysSelected(int count) {
    return '週$count日';
  }

  @override
  String get onboarding_equipmentTitle => '使用できる器具は？';

  @override
  String get onboarding_equipmentSubtitle => '普段使えるものをすべて選択してください。';

  @override
  String get onboarding_continue => '続ける';

  @override
  String get onboarding_back => '戻る';

  @override
  String get onboarding_finish => '保存して開始';

  @override
  String get onboarding_skip => '後で';

  @override
  String get onboarding_saved => '設定を保存しました';

  @override
  String get weeklyPlan_title => '週間プラン';

  @override
  String weeklyPlan_sessions(int done, int total) {
    return '$done/$total セッション';
  }

  @override
  String get weeklyPlan_adherence => '達成率';

  @override
  String get weeklyPlan_remaining => '残り';

  @override
  String get weeklyPlan_completedSets => 'セット';

  @override
  String get weeklyPlan_muscleBalance => '部位別セット数';

  @override
  String get weeklyPlan_completed => '週間目標を達成しました。お疲れさまでした。';

  @override
  String get weeklyPlan_nextSession => '次のセッション';

  @override
  String weeklyPlan_exerciseCount(int count) {
    return '$count種目';
  }

  @override
  String get weeklyPlan_start => '開始';

  @override
  String get weeklyPlan_noCompatible => '使用できる器具に対応する種目が不足しています。';

  @override
  String get weeklyPlan_adjustEquipment => '調整';

  @override
  String get weeklyPlan_setupTitle => 'プランを設定';

  @override
  String get weeklyPlan_setupSubtitle => '設定を完了すると、毎週あなたに合ったセッションを提案します。';

  @override
  String get weeklyPlan_configure => '設定';

  @override
  String get weeklyPlan_adaptiveName => '適応セッション';

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
  String get train_readyToStart => '開始準備完了';

  @override
  String get train_startSession => '開始';

  @override
  String get train_resumeTitle => 'トレーニングを再開しますか？';

  @override
  String train_resumeBody(String name) {
    return '未完了の\"$name\"トレーニングがあります。続けますか？';
  }

  @override
  String get train_resumeContinue => '続ける';

  @override
  String get train_resumeDiscard => '破棄';

  @override
  String get train_cancelWorkout => 'トレーニングを破棄しますか？';

  @override
  String get train_cancelConfirm => 'このセッションで記録したセットは失われます。';

  @override
  String get train_continue => 'トレーニングを続ける';

  @override
  String get train_addExerciseFirst => '終了する前に少なくとも1つのエクササイズを追加してください。';

  @override
  String get train_completeSetFirst => '終了する前に少なくとも1セット完了してください。';

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
  String train_deleteExerciseConfirm(String name) {
    return '\"$name\"を削除しますか？完了したセットは失われます。';
  }

  @override
  String get train_notesHint => 'メモ（任意）';

  @override
  String get train_setHeader => 'セット';

  @override
  String get train_repsHeader => 'レップ';

  @override
  String get train_weightHeader => '重量';

  @override
  String get train_addSet => 'セットを追加';

  @override
  String get train_nextSuggestion => '次回の推奨負荷';

  @override
  String get train_applySuggestion => '適用';

  @override
  String get train_abbreviationExercises => '種目';

  @override
  String get train_defaultRoutineName => 'マイルーティン';

  @override
  String get train_createRoutine => 'ルーティンを作成';

  @override
  String get train_editRoutine => 'ルーティンを編集';

  @override
  String train_routineUpdated(String name) {
    return 'ルーティン「$name」を更新しました';
  }

  @override
  String get train_addFirstExercise => '最初の種目を追加';

  @override
  String get train_addFirstExerciseHint => 'ここ、または「種目を追加」をタップしてください。';

  @override
  String get train_removeSet => 'セットを削除';

  @override
  String get train_routinesHint => '1日に1つ以上のルーティンを登録できます。その日を始めると、すべて順番に行います。';

  @override
  String get train_firstRoutineTitle => '最初のルーティンを作成';

  @override
  String get train_firstRoutineBody => '種目を選んで曜日を設定すると、その日にホームに表示され、すぐに始められます。';

  @override
  String get train_freeSessionHint =>
      '予定がなくても大丈夫。フリーセッションを始めて、種目を追加しながら進めましょう。';

  @override
  String get profile_keepScreenOn => 'トレーニング中は画面をオンのまま';

  @override
  String get profile_keepScreenOnSubtitle => 'セット間に端末がロックされるのを防ぎます';

  @override
  String get profile_weightUnit => '重量の単位';

  @override
  String get weightUnit_kg => 'キログラム (kg)';

  @override
  String get weightUnit_lb => 'ポンド (lb)';

  @override
  String get train_repShort => '回';

  @override
  String get rest_label => '休憩';

  @override
  String get rest_forExercise => 'この種目の休憩';

  @override
  String get rest_default => 'デフォルト';

  @override
  String get rest_defaultHint => '休憩タイマーで選んだ時間を使用';

  @override
  String get train_newRecords => '新記録';

  @override
  String train_recordLine(String weight, String previous) {
    return '$weight（以前の最高 $previous）';
  }

  @override
  String train_volumeUp(String kg) {
    return '前回より総重量 +$kg';
  }

  @override
  String train_volumeDown(String kg) {
    return '前回より総重量 −$kg';
  }

  @override
  String get train_volumeSame => '前回と同じ総重量';

  @override
  String get train_discardWorkout => '破棄する';

  @override
  String get train_previousHeader => '前回';

  @override
  String get train_usePrevious => '前回の値をコピー';

  @override
  String get train_removeCompletedSetTitle => '完了したセットを削除しますか？';

  @override
  String train_removeCompletedSetBody(int setNumber) {
    return 'セット$setNumberは完了済みのため、削除するとトレーニングに集計されません。';
  }

  @override
  String get train_createRoutineHint => 'エクササイズを選び、次のトレーニングに備えて準備できます。';

  @override
  String get train_routineNameRequired => 'ルーティン名を入力してください。';

  @override
  String train_addRoutineForDay(String day) {
    return '$dayに別のルーティンを追加';
  }

  @override
  String get train_trainingDay => 'トレーニング日';

  @override
  String get train_noAssignedDay => '曜日未設定';

  @override
  String get train_trainingDayHint => '曜日ごとにまとめて、ルーティン全体を一緒に表示します。';

  @override
  String get train_organizeRoutine => 'ルーティンを整理';

  @override
  String train_blockCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countブロック',
    );
    return '$_temp0';
  }

  @override
  String get train_noRoutinesForDay => 'この曜日にはまだブロックがありません。';

  @override
  String get train_reorderBlocksHint => '長押ししてドラッグすると順番を変更できます。';

  @override
  String get train_startCompleteRoutine => 'ルーティン全体を開始';

  @override
  String train_routineForDay(String day) {
    return '$dayのルーティン';
  }

  @override
  String get train_bodyweightLabel => '自重';

  @override
  String get train_chooseWeight => '重量を選択';

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
  String exercises_countLabel(num count) {
    return '$count種目';
  }

  @override
  String get exercises_descriptionUnavailable => '詳しい手順はこの言語ではまだ利用できません。';

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
  String get history_weeklySummary => '週間サマリー';

  @override
  String get history_workouts => 'トレーニング';

  @override
  String get history_total => '合計';

  @override
  String get history_volumeKg => 'ボリューム';

  @override
  String get history_routinesByDay => '曜日別ルーティン';

  @override
  String history_sessionCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countセッション',
    );
    return '$_temp0';
  }

  @override
  String history_dayRoutineTitle(String day) {
    return '$dayのトレーニング';
  }

  @override
  String get history_dayRoutineHint => '同じ曜日のブロックが順番にまとめて表示されます。';

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
  String get paywall_featureTemplates => 'すべてのプリセットメニュー';

  @override
  String get paywall_featureMeasures => 'ウエスト・胸囲・ヒップと進捗写真';

  @override
  String get paywall_featureExerciseProgress => '種目ごとの進捗グラフ';

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
  String get paywall_startTrial => '無料トライアルを開始';

  @override
  String get paywall_subscribe => '登録する';

  @override
  String get paywall_restorePurchases => '購入を復元';

  @override
  String get paywall_legalText =>
      'サブスクリプションは自動的に更新されます。\nApp Storeからいつでもキャンセルできます。';

  @override
  String get paywall_legalTextPlay =>
      'サブスクリプションは自動的に更新されます。\nGoogle Playからいつでもキャンセルできます。';

  @override
  String get paywall_legalTextTrial =>
      '無料トライアル終了後、有料サブスクリプションに自動移行します。トライアル期間中いつでもキャンセル可能。サブスクリプションは自動更新されます。';

  @override
  String get paywall_termsLink => '利用規約';

  @override
  String get paywall_privacyLink => 'プライバシーポリシー';

  @override
  String get paywall_purchaseError => '購入を完了できませんでした。';

  @override
  String get paywall_noPurchasesFound => '過去の購入が見つかりません。';

  @override
  String paywall_trialDays(int count) {
    return '$count日間無料';
  }

  @override
  String paywall_trialMonths(int count) {
    return '$countヶ月無料';
  }

  @override
  String paywall_trialThenPrice(String price) {
    return 'その後 $price';
  }

  @override
  String get paywall_offersUnavailable => 'オファーを読み込めませんでした';

  @override
  String get paywall_retry => '再試行';

  @override
  String rest_of(String time) {
    return '$time中';
  }

  @override
  String get progressScreen_measurements => '測定値';

  @override
  String get progressScreen_photos => '写真';

  @override
  String get progressScreen_addMeasurement => '測定値を追加';

  @override
  String get progressScreen_weight => '体重';

  @override
  String get progressScreen_noEntries => 'まだ記録がありません';

  @override
  String get progressScreen_noPhotos => 'まだ写真がありません';

  @override
  String get progressScreen_camera => 'カメラ';

  @override
  String get progressScreen_gallery => 'ギャラリー';

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
  String get achievement_streak14_title => '14日連続';

  @override
  String get achievement_streak14_description => '14日連続で少なくとも1回トレーニング';

  @override
  String get achievement_streak100_title => '100日連続';

  @override
  String get achievement_streak100_description => '週1回以上のトレーニングを100日間継続';

  @override
  String get achievement_streak365_title => '1年間達成';

  @override
  String get achievement_streak365_description => '連続記録を丸1年間維持する';

  @override
  String get achievement_bench50_title => 'ベンチプレス50kg';

  @override
  String get achievement_bench50_description => '50kg以上のベンチプレスを達成';

  @override
  String get achievement_bench100_title => 'ベンチプレス100kg';

  @override
  String get achievement_bench100_description => '100kg以上のベンチプレスを達成';

  @override
  String get achievement_squat100_title => 'スクワット100kg';

  @override
  String get achievement_squat100_description => '100kg以上のスクワットを達成';

  @override
  String get achievement_squat150_title => 'スクワット150kg';

  @override
  String get achievement_squat150_description => '150kg以上のスクワットを達成';

  @override
  String get achievement_deadlift100_title => 'デッドリフト100kg';

  @override
  String get achievement_deadlift100_description => '100kg以上のデッドリフトを達成';

  @override
  String get achievement_deadlift150_title => 'デッドリフト150kg';

  @override
  String get achievement_deadlift150_description => '150kg以上のデッドリフトを達成';

  @override
  String get achievement_deadlift200_title => 'デッドリフト200kg';

  @override
  String get achievement_deadlift200_description => '200kg以上のデッドリフトを達成';

  @override
  String get achievement_explorer10_title => 'エクスプローラー';

  @override
  String get achievement_explorer10_description => '10種類の異なるエクササイズを使う';

  @override
  String get achievement_master25_title => 'マスター';

  @override
  String get achievement_master25_description => '25種類の異なるエクササイズを使う';

  @override
  String get achievement_fullBodyGroups_title => '全身制覇';

  @override
  String get achievement_fullBodyGroups_description =>
      'すべての筋肉グループを少なくとも1回トレーニング';

  @override
  String get achievement_crossfitFan_title => 'クロスフィットファン';

  @override
  String get achievement_crossfitFan_description =>
      'クロスフィットカテゴリーから10種類のエクササイズを完了';

  @override
  String get achievement_time1h_title => '合計1時間';

  @override
  String get achievement_time1h_description => '合計1時間のトレーニング時間を達成';

  @override
  String get achievement_time10h_title => '10時間';

  @override
  String get achievement_time10h_description => '合計10時間のトレーニング時間を達成';

  @override
  String get achievement_time50h_title => '50時間';

  @override
  String get achievement_time50h_description => '合計50時間のトレーニング時間を達成';

  @override
  String get achievement_time100h_title => '100時間';

  @override
  String get achievement_time100h_description => '合計100時間のトレーニング時間を達成';

  @override
  String get achievement_earlyBird_title => '早起き';

  @override
  String get achievement_earlyBird_description => '朝7時前にトレーニングを開始';

  @override
  String get achievement_nightOwl_title => '夜更かし';

  @override
  String get achievement_nightOwl_description => '22時以降にトレーニングを終了';

  @override
  String get achievement_comeback_title => 'カムバック';

  @override
  String get achievement_comeback_description => '30日以上の休止後にトレーニング再開';

  @override
  String get achievement_marathoner_title => 'マラソナー';

  @override
  String get achievement_marathoner_description => '90分以上のトレーニングを完了';

  @override
  String get achievement_efficient_title => '効率的';

  @override
  String get achievement_efficient_description => '3種目以上のトレーニングを30分以内に完了';

  @override
  String get achievement_weekendWarrior_title => '週末戦士';

  @override
  String get achievement_weekendWarrior_description => '3週連続で土日にトレーニング';

  @override
  String get achievement_weeklyVariety_title => '週間バラエティ';

  @override
  String get achievement_weeklyVariety_description => '1週間で5つの異なる筋肉グループをトレーニング';

  @override
  String get csv_header => '日付,トレーニング,エクササイズ,筋肉群,セット,レップ,重量 (kg),ボリューム (kg)';

  @override
  String get csv_subject => 'LiftWave - トレーニング履歴';

  @override
  String get template_fullBody_subtitle => '全身を1セッションでトレーニング';

  @override
  String get template_fullBody_name => '全身';

  @override
  String get template_push_name => 'プッシュ';

  @override
  String get template_pull_name => 'プル';

  @override
  String get template_torso_name => '上半身';

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
  String get ex_pecho_6_name => 'インクラインベンチプレス';

  @override
  String get ex_pecho_6_desc =>
      'ベンチを30〜45度に調整します。肩幅よりやや広めのグリップでバーを握ります。バーをコントロールしながら胸の上部まで下ろし、腕が完全に伸びるまで押し上げます。腰をベンチにつけ、肩甲骨を寄せたままにしてください。';

  @override
  String get ex_pecho_6_b1 => '胸の上部（鎖骨部）を重点的に鍛える';

  @override
  String get ex_pecho_6_b2 => 'ダンベルよりも高重量を扱える';

  @override
  String get ex_pecho_6_b3 => '高い角度からのプッシュ力を向上させる';

  @override
  String get ex_pecho_7_name => 'デクラインダンベルプレス';

  @override
  String get ex_pecho_7_desc =>
      'ベンチを15〜30度のデクラインに調整します。両手にダンベルを持って胸の高さに構え、トップでダンベルを近づけるように押し上げます。胸の下部のストレッチを感じながらコントロールして下ろします。';

  @override
  String get ex_pecho_7_b1 => '大胸筋の下部を鍛える';

  @override
  String get ex_pecho_7_b2 => '肩の関与を減らす';

  @override
  String get ex_pecho_7_b3 => 'バーベルのデクラインプレスより可動域が広い';

  @override
  String get ex_pecho_8_name => '腕立て伏せ（プッシュアップ）';

  @override
  String get ex_pecho_8_desc =>
      '両手を肩幅に開いて床につき、両足を揃えます。頭からかかとまで体をまっすぐに保ちます。肘を曲げて胸が床に触れる直前まで体を下ろし、押し上げて戻ります。動作中は体幹を引き締めたままにしてください。';

  @override
  String get ex_pecho_8_b1 => '器具が不要';

  @override
  String get ex_pecho_8_b2 => '段階的に進歩できる多彩なバリエーション（ダイヤモンド、デクライン、クラップ）';

  @override
  String get ex_pecho_8_b3 => '体幹も強化する複合エクササイズ';

  @override
  String get ex_pecho_9_name => 'ダンベルプルオーバー';

  @override
  String get ex_pecho_9_desc =>
      'フラットベンチに仰向けになり、1つのダンベルを両手で持って胸の上に構え、腕を伸ばします。胸と広背筋のストレッチを感じるまで、弧を描くようにダンベルを頭の後方へ下ろします。胸を収縮させながら元の位置に戻します。';

  @override
  String get ex_pecho_9_b1 => '胸と広背筋を同時に鍛える';

  @override
  String get ex_pecho_9_b2 => '肩と胸郭の可動性を向上させる';

  @override
  String get ex_pecho_9_b3 => 'プレスやロウのセット間の補助種目として優れている';

  @override
  String get ex_esp_6_name => 'Tバーロウ';

  @override
  String get ex_esp_6_desc =>
      '足を肩幅に開いてTバーをまたいで立ちます。背中をニュートラルに保ちながら上体を前傾させ、肘を後ろに引きながらハンドルを胸に向かって引きます。最終位置で肩甲骨を寄せ、コントロールしながら下ろします。';

  @override
  String get ex_esp_6_b1 => '背中中部の厚みを発達させる';

  @override
  String get ex_esp_6_b2 => 'フリーのロウより腰への負担が少なく、非常に高重量を扱える';

  @override
  String get ex_esp_6_b3 => '姿勢と肩甲骨の安定性を鍛える';

  @override
  String get ex_esp_7_name => 'シーテッドケーブルロウ';

  @override
  String get ex_esp_7_desc =>
      'ロープーリーの前に座り、足をしっかり置きます。腕を伸ばし、背中をニュートラルにしてアタッチメントを握ります。肩甲骨を寄せ、上体を起こしたまま、手を腹部に向かって引きます。背中を丸めずにコントロールしながら戻します。';

  @override
  String get ex_esp_7_b1 => '動作全体を通して一定の張力がかかる';

  @override
  String get ex_esp_7_b2 => '重量を上げやすく、テクニックが習得しやすい';

  @override
  String get ex_esp_7_b3 => '背中中部の厚みを発達させるのに優れている';

  @override
  String get ex_esp_8_name => 'ダンベルシュラッグ';

  @override
  String get ex_esp_8_desc =>
      '両手にダンベルを持って体の横に構え、腕をリラックスさせて立ちます。肘を曲げずに肩を耳に向かって引き上げます。トップで1秒間収縮を保ち、ゆっくり下ろします。肩を回さないでください。動きは純粋に垂直方向です。';

  @override
  String get ex_esp_8_b1 => '僧帽筋上部を直接アイソレーションする';

  @override
  String get ex_esp_8_b2 => '姿勢と首まわりの見た目を改善する';

  @override
  String get ex_esp_8_b3 => '他のリフトのための肩甲骨の安定性を強化する';

  @override
  String get ex_esp_9_name => 'グッドモーニング';

  @override
  String get ex_esp_9_desc =>
      'スクワットと同じようにバーを僧帽筋の上に乗せます。足を腰幅に開き、膝を軽く曲げた状態で、背中をニュートラルに保ちながら股関節から上体を前傾させます。上体が床とほぼ平行になるまで下ろし、臀筋を絞りながら戻ります。';

  @override
  String get ex_esp_9_b1 => 'ポステリアチェーンと腰部を強化する';

  @override
  String get ex_esp_9_b2 => 'デッドリフトやスクワットのためのヒップヒンジを向上させる';

  @override
  String get ex_esp_9_b3 => 'パワーリフティングの重要な補助種目';

  @override
  String get ex_pier_6_name => 'フロントスクワット';

  @override
  String get ex_pier_6_desc =>
      'バーを三角筋前部の上に乗せ、肘を高く上げ、クロスグリップまたはクリーングリップで握ります。足を肩幅に開きます。上体を垂直に保ち、肘を前に向けたまま、太ももが床と平行より下になるまで下ろします。かかとで押して元の位置に戻ります。';

  @override
  String get ex_pier_6_b1 => 'バックスクワットより大腿四頭筋を重点的に鍛える';

  @override
  String get ex_pier_6_b2 => '非常に強い体幹とまっすぐな姿勢が求められる';

  @override
  String get ex_pier_6_b3 => 'クロスフィットのクリーンやスラスターの技術的な基礎';

  @override
  String get ex_pier_7_name => 'ブルガリアンスクワット';

  @override
  String get ex_pier_7_desc =>
      '両手にダンベルを持ち、後ろ足の甲をベンチに乗せます。前足を前方に出した状態で、太ももが床と平行になるまで前の膝を曲げて下ろします。前足のかかとで押して立ち上がります。';

  @override
  String get ex_pier_7_b1 => '片脚ずつ鍛え、左右の脚の不均衡を改善する';

  @override
  String get ex_pier_7_b2 => '臀筋と大腿四頭筋を強く活性化する';

  @override
  String get ex_pier_7_b3 => 'バランスと股関節の安定性を向上させる';

  @override
  String get ex_pier_8_name => 'ルーマニアンデッドリフト';

  @override
  String get ex_pier_8_desc =>
      '肩幅のオーバーハンドグリップでバーを握り、腰の高さに構えて立ちます。膝を軽く曲げて固定したまま、ハムストリングスに張りを感じるまで、股関節から上体を前傾させながらバーを脚に沿って滑らせます。臀筋を絞りながら戻ります。';

  @override
  String get ex_pier_8_b1 => 'ハムストリングスと臀筋を強くアイソレーションする';

  @override
  String get ex_pier_8_b2 => 'ポステリアチェーンを強化し、ヒップヒンジを向上させる';

  @override
  String get ex_pier_8_b3 => '走る・跳ぶ動作でのハムストリングスの怪我のリスクを軽減する';

  @override
  String get ex_pier_9_name => 'レッグエクステンション';

  @override
  String get ex_pier_9_desc =>
      'マシンに座り、背中をシートにつけ、ローラーを足の甲に当てます。膝をロックせずに、脚がほぼまっすぐになるまで膝を伸ばしてウェイトを持ち上げます。トップで大腿四頭筋を収縮させ、コントロールしながら下ろします。';

  @override
  String get ex_pier_9_b1 => '大腿四頭筋を直接アイソレーションする';

  @override
  String get ex_pier_9_b2 => 'リハビリや部位を絞った筋肥大トレーニングに役立つ';

  @override
  String get ex_pier_9_b3 => '負荷を細かく調整でき、リスクが低い';

  @override
  String get ex_pier_10_name => 'カーフレイズ';

  @override
  String get ex_pier_10_desc =>
      'カーフマシンのパッドの下に肩を入れます（または立った状態でダンベルを使います）。つま先をプラットフォームに乗せ、かかとを台の外に出します。つま先で押して体を持ち上げ、トップでふくらはぎを収縮させます。ストレッチを感じながらゆっくり下ろします。';

  @override
  String get ex_pier_10_b1 => 'ヒラメ筋と腓腹筋をアイソレーションする';

  @override
  String get ex_pier_10_b2 => 'ジャンプやスプリントのパワーを向上させる';

  @override
  String get ex_pier_10_b3 => '足首とアキレス腱の怪我のリスクを軽減する';

  @override
  String get ex_hom_5_name => 'ダンベルショルダープレス';

  @override
  String get ex_hom_5_desc =>
      '背もたれをまっすぐに立てて座り、手のひらを前に向けてダンベルを肩の両側に構えます。肘をロックせずに、頭上でダンベルがほぼ触れ合うまで押し上げます。コントロールしながら元の位置に下ろします。';

  @override
  String get ex_hom_5_b1 => 'バーベルプレスより可動域が広い';

  @override
  String get ex_hom_5_b2 => '左右それぞれを独立して鍛えられる';

  @override
  String get ex_hom_5_b3 => 'バーベルに比べて肩への負担を軽減する';

  @override
  String get ex_hom_6_name => 'フロントレイズ';

  @override
  String get ex_hom_6_desc =>
      '両手にダンベルを持って太ももの前に構え、手のひらを体に向けて立ちます。肘をほぼ伸ばしたまま、腕を交互にまたは同時に前方へ肩の高さまで持ち上げます。体を揺らさずにゆっくり下ろします。';

  @override
  String get ex_hom_6_b1 => '三角筋前部をアイソレーションする';

  @override
  String get ex_hom_6_b2 => '肩の正面からの見た目を改善する';

  @override
  String get ex_hom_6_b3 => 'ベンチプレスとミリタリープレスの補助種目';

  @override
  String get ex_hom_7_name => 'ダンベルリアレイズ';

  @override
  String get ex_hom_7_desc =>
      '股関節から上体を前傾させて床とほぼ平行にし、両手にダンベルを持って腕を下に垂らします。肘を軽く曲げた状態で、腕を横に肩の高さまで持ち上げます。トップでリアデルトを収縮させ、コントロールしながら下ろします。';

  @override
  String get ex_hom_7_b1 => '姿勢の要となるリアデルトをアイソレーションする';

  @override
  String get ex_hom_7_b2 => 'プッシュ系トレーニングの影響を相殺する';

  @override
  String get ex_hom_7_b3 => '回旋筋腱板の怪我のリスクを軽減する';

  @override
  String get ex_bra_6_name => 'プリーチャーカール';

  @override
  String get ex_bra_6_desc =>
      'プリーチャーベンチに座り、腕をパッドの上に乗せます。バー（ストレートまたはEZ）をアンダーハンドグリップで握ります。動きをコントロールしながら肘を曲げ、バーを肩に向かって持ち上げます。最後に肘をロックせずにゆっくり下ろします。';

  @override
  String get ex_bra_6_b1 => '肩を固定することで二頭筋をアイソレーションする';

  @override
  String get ex_bra_6_b2 => '反動が使えず、ストリクトなフォームになる';

  @override
  String get ex_bra_6_b3 => '二頭筋の最大収縮に優れている';

  @override
  String get ex_bra_7_name => 'コンセントレーションカール';

  @override
  String get ex_bra_7_desc =>
      '脚を開いてベンチに座ります。動かす側の腕の肘を太ももの内側に当て、ダンベルを下に垂らします。二頭筋をアイソレーションしながら肘を曲げ、ダンベルを肩に向かって持ち上げます。トップで収縮させ、コントロールしながら下ろします。';

  @override
  String get ex_bra_7_b1 => '最大収縮で二頭筋を純粋にアイソレーションする';

  @override
  String get ex_bra_7_b2 => 'マインドマッスルコネクションに集中できる';

  @override
  String get ex_bra_7_b3 => '腕のトレーニングの仕上げ種目として最適';

  @override
  String get ex_bra_8_name => 'ナローグリップベンチプレス';

  @override
  String get ex_bra_8_desc =>
      'フラットベンチに仰向けになり、肩幅のナローグリップでバーを握ります。肘を体の側面につけたまま、バーをコントロールしながら胸骨に軽く触れるまで下ろします。三頭筋の伸展を意識しながら押し上げます。';

  @override
  String get ex_bra_8_b1 => '三頭筋を重点的に鍛える複合エクササイズ';

  @override
  String get ex_bra_8_b2 => '三頭筋のアイソレーション種目よりも高重量を扱える';

  @override
  String get ex_bra_8_b3 => 'ベンチプレスとミリタリープレスの筋力向上につながる';

  @override
  String get ex_bra_9_name => 'ベンチディップス';

  @override
  String get ex_bra_9_desc =>
      '背後のベンチに、指を前に向けて両手をつきます。脚を前に伸ばしてかかとを床につけます（膝を曲げると楽になります）。肘を後ろに曲げながら90度になるまで体を下ろし、押し上げて戻ります。';

  @override
  String get ex_bra_9_b1 => '器具なしで三頭筋をアイソレーションできる';

  @override
  String get ex_bra_9_b2 => '太ももの上に重りを乗せて簡単に負荷を上げられる';

  @override
  String get ex_bra_9_b3 => '体の後方の位置からのプッシュ力を向上させる';

  @override
  String get ex_core_5_name => 'ロシアンツイスト';

  @override
  String get ex_core_5_desc =>
      '膝を曲げて床に座り、足は浮かせるか床につけ、上体を後方に45度傾けます。両手を合わせ（またはウェイトを持ち）、上体を左右にひねって床にタッチするか、ウェイトを左右に運びます。体幹を引き締めたままにしてください。';

  @override
  String get ex_core_5_b1 => '腹斜筋を直接アイソレーションする';

  @override
  String get ex_core_5_b2 => 'スポーツで重要な体幹の回旋を向上させる';

  @override
  String get ex_core_5_b3 => '重り（ダンベル、プレート、ボール）を加えて負荷を上げられる';

  @override
  String get ex_core_6_name => 'マウンテンクライマー';

  @override
  String get ex_core_6_desc =>
      '両手を肩の真下に置いてハイプランクの姿勢をとります。その場で走るように、片膝ずつ交互に素早く胸に引き寄せます。動作中は腰を低く保ち、体幹を引き締めたままにしてください。';

  @override
  String get ex_core_6_b1 => '体幹トレーニングと有酸素運動を組み合わせる';

  @override
  String get ex_core_6_b2 => '器具が不要でHIITに最適';

  @override
  String get ex_core_6_b3 => 'コーディネーションと持久力を向上させる';

  @override
  String get ex_core_7_name => 'ホロウホールド';

  @override
  String get ex_core_7_desc =>
      '仰向けになり、腕を頭上に伸ばし、脚をまっすぐ伸ばします。腰を床に押しつけながら、腕と脚を床から少し浮かせます。体幹を完全に収縮させたまま「舟」の姿勢をキープします。';

  @override
  String get ex_core_7_b1 => 'クロスフィットの多くの動作の体操的な基礎';

  @override
  String get ex_core_7_b2 => '体幹全体をアイソメトリックに強化する';

  @override
  String get ex_core_7_b3 => '姿勢とストリクト懸垂のための筋力を向上させる';

  @override
  String get ex_core_8_name => 'サイドプランク';

  @override
  String get ex_core_8_desc =>
      '横向きに寝て前腕を床につき、肘を肩の真下に置きます。腰を床から持ち上げ、足から頭まで一直線にします。腰が落ちないように姿勢をキープします。反対側も同様に行います。';

  @override
  String get ex_core_8_b1 => '腹斜筋と体幹側部を強くアイソレーションする';

  @override
  String get ex_core_8_b2 => '股関節と脊柱の安定性を向上させる';

  @override
  String get ex_core_8_b3 => '器具不要で低衝撃';

  @override
  String get ex_core_9_name => 'デッドバグ';

  @override
  String get ex_core_9_desc =>
      '仰向けになり、腕を天井に向かって伸ばし、膝を90度に曲げて股関節の真上に置きます。右腕を頭の後方へ、伸ばした左脚を床に向かって同時に下ろします。腰を床につけたまま元に戻し、左右を入れ替えて行います。';

  @override
  String get ex_core_9_b1 => '体幹の抗伸展の安定性を向上させる';

  @override
  String get ex_core_9_b2 => '初心者や腰のリハビリに最適';

  @override
  String get ex_core_9_b3 => '対側のコーディネーションを鍛える';

  @override
  String get ex_cf_1_name => 'クリーン';

  @override
  String get ex_cf_1_desc =>
      '床から、膝のすぐ外側でオーバーハンドグリップでバーを握ります。股関節と膝を伸ばしながら爆発的に引き上げ、肩をすくめ、バーの下に体を滑り込ませて、肘を高く上げたフロントスクワットの姿勢で受け止めます。立ち上がってリフトを完了します。';

  @override
  String get ex_cf_1_b1 => '爆発的なパワーを養う完全なオリンピックリフト';

  @override
  String get ex_cf_1_b2 => 'コーディネーション・スピード・筋力を同時に発達させる';

  @override
  String get ex_cf_1_b3 => 'クロスフィットの多くのWODの基礎';

  @override
  String get ex_cf_2_name => 'パワークリーン';

  @override
  String get ex_cf_2_desc =>
      'クリーンと同じですが、フルスクワットでは受け止めません。肘を高く上げ、バーを肩の前側に乗せてクォータースクワットで受け止めます。クリーンよりも速く、可動性の要求も少なくなります。';

  @override
  String get ex_cf_2_b1 => 'ポステリアチェーンの爆発的なパワーを発達させる';

  @override
  String get ex_cf_2_b2 => 'フルクリーンより技術的に取り組みやすい';

  @override
  String get ex_cf_2_b3 => 'オリンピックリフトの初心者に最適';

  @override
  String get ex_cf_3_name => 'スナッチ';

  @override
  String get ex_cf_3_desc =>
      '床から、非常に広いグリップでバーを握ります。爆発的に引き上げ、腕を伸ばしてバーを頭上で受け止めながら深いスクワット（オーバーヘッドスクワット）の姿勢になります。バーを頭上に保ったまま立ち上がります。';

  @override
  String get ex_cf_3_b1 => '最も総合的で技術的に難しいオリンピックリフト';

  @override
  String get ex_cf_3_b2 => 'パワー・可動性・安定性を同時に発達させる';

  @override
  String get ex_cf_3_b3 => 'ほぼどのエクササイズよりも多くのカロリーを消費する';

  @override
  String get ex_cf_4_name => 'パワースナッチ';

  @override
  String get ex_cf_4_desc =>
      'スナッチと同じですが、腕を頭上に伸ばした状態でクォータースクワットでバーを受け止めます。より速く、足首と股関節の可動性の要求も少なくなります。';

  @override
  String get ex_cf_4_b1 => 'フルスナッチより取り組みやすい';

  @override
  String get ex_cf_4_b2 => 'ポステリアチェーンの爆発的なパワーを発達させる';

  @override
  String get ex_cf_4_b3 => '可動性とコーディネーションに優れている';

  @override
  String get ex_cf_5_name => 'スラスター';

  @override
  String get ex_cf_5_desc =>
      'バーをフロントポジション（三角筋前部の上）に構えます。フルのフロントスクワットを行い、立ち上がる際に脚の勢いを使ってバーを頭上に押し上げ、腕を伸ばします。バーをフロントポジションに下ろし、繰り返します。';

  @override
  String get ex_cf_5_b1 => '1つの動きで全身を鍛える';

  @override
  String get ex_cf_5_b2 => '「Fran」などのWODの看板種目';

  @override
  String get ex_cf_5_b3 => '筋力と代謝的な持久力を組み合わせる';

  @override
  String get ex_cf_6_name => 'プッシュプレス';

  @override
  String get ex_cf_6_desc =>
      'バーを肩の上のフロントポジションに構え、膝を軽く曲げて素早くディップします。脚を爆発的に伸ばしてバーを頭上に押し上げ、腕を伸ばしきります。コントロールしながら元の位置に下ろします。';

  @override
  String get ex_cf_6_b1 => 'ストリクトなミリタリープレスよりも高重量を扱える';

  @override
  String get ex_cf_6_b2 => '垂直方向のプッシュパワーを発達させる';

  @override
  String get ex_cf_6_b3 => 'ジャークなどのオリンピックリフトに活きる';

  @override
  String get ex_cf_7_name => 'プッシュジャーク';

  @override
  String get ex_cf_7_desc =>
      'プッシュプレスと同じですが、バーを押し上げる際に脚を緩めて体を沈め、腕を伸ばしきった状態でクォータースクワットでバーを受け止めます。その後、立ち上がってリフトを完了します。プッシュプレスよりも高重量を扱えます。';

  @override
  String get ex_cf_7_b1 => 'どのプレスよりも重い重量を頭上に挙げられる';

  @override
  String get ex_cf_7_b2 => '技術的で高いパワーを要するオリンピックリフト';

  @override
  String get ex_cf_7_b3 => 'クリーン＆ジャークの構成要素';

  @override
  String get ex_cf_8_name => 'ウォールボール';

  @override
  String get ex_cf_8_desc =>
      'メディシンボールを胸の前に持ち、壁に向かって立ちます。深くスクワットし、立ち上がりながら壁の高い位置にあるターゲット（約3m）に向かってボールを投げます。胸の高さでボールをキャッチし、すぐに次のスクワットに入ります。';

  @override
  String get ex_cf_8_b1 => '有酸素運動とパワーを同時に鍛えるエクササイズ';

  @override
  String get ex_cf_8_b2 => 'クロスフィットの多くのベンチマークで定番の動作';

  @override
  String get ex_cf_8_b3 => 'コーディネーションとリズムを鍛える';

  @override
  String get ex_cf_9_name => 'アメリカンケトルベルスイング';

  @override
  String get ex_cf_9_desc =>
      '両手でケトルベルを持ち、脚の間にぶら下げて立ちます。ヒップヒンジでケトルベルを後方に引き、股関節を爆発的に伸ばして、腕を伸ばしたまま頭上まで振り上げます。力は腕ではなく股関節から生み出します。';

  @override
  String get ex_cf_9_b1 => '股関節の爆発的なパワーを発達させる';

  @override
  String get ex_cf_9_b2 => '1つの動きで有酸素運動と筋力を鍛える';

  @override
  String get ex_cf_9_b3 => 'クロスフィットの標準（ロシアンは胸の高さまで）';

  @override
  String get ex_cf_10_name => 'ロシアンケトルベルスイング';

  @override
  String get ex_cf_10_desc =>
      'アメリカンスイングと同じですが、ケトルベルは頭上ではなく胸・目の高さまでしか上げません。技術的に簡単で、肩への負担も少なくなります。';

  @override
  String get ex_cf_10_b1 => 'ケトルベルトレーニングの入門種目';

  @override
  String get ex_cf_10_b2 => 'アメリカンスイングより肩への負担が少ない';

  @override
  String get ex_cf_10_b3 => '初心者や高回数に最適';

  @override
  String get ex_cf_11_name => 'ボックスジャンプ';

  @override
  String get ex_cf_11_desc =>
      '安定したボックスまたは台の前に立ち、膝を曲げてボックスに跳び乗り、両足全体を面に乗せて着地します。トップで股関節と膝を伸ばします。跳び下りるか、衝撃を減らすために一歩ずつ下ります。';

  @override
  String get ex_cf_11_b1 => 'パワーを養う純粋なプライオメトリクス';

  @override
  String get ex_cf_11_b2 => '垂直跳びと爆発力を向上させる';

  @override
  String get ex_cf_11_b3 => '多くのWODの定番種目';

  @override
  String get ex_cf_12_name => 'バーピー';

  @override
  String get ex_cf_12_desc =>
      '立った状態からしゃがみ、両手を床につきます。両足を後ろに跳ばしてプランクの姿勢になります。胸を床につけて腕立て伏せを1回行います。両足を手の方へ跳んで戻し、腕を上に伸ばしながら真上にジャンプします。';

  @override
  String get ex_cf_12_b1 => '器具不要の全身エクササイズ';

  @override
  String get ex_cf_12_b2 => '高強度の有酸素運動と筋力トレーニングを同時に行える';

  @override
  String get ex_cf_12_b3 => '「Murph」などのベンチマークや多くのWODの定番';

  @override
  String get ex_cf_13_name => 'トゥーズトゥバー';

  @override
  String get ex_cf_13_desc =>
      'オーバーハンドグリップでバーにぶら下がります。広背筋を活性化させ、伸ばした（または軽く曲げた）脚を、足がバーに触れるまで持ち上げます。過度に揺れないようにコントロールしながら下ろします。リズムを保つために「キップ」を使います。';

  @override
  String get ex_cf_13_b1 => '高強度のダイナミックな体幹トレーニング';

  @override
  String get ex_cf_13_b2 => '握力と広背筋を向上させる';

  @override
  String get ex_cf_13_b3 => 'クロスフィットの多くのWODの構成種目';

  @override
  String get ex_cf_14_name => 'ニーズトゥエルボー';

  @override
  String get ex_cf_14_desc =>
      'オーバーハンドグリップでバーにぶら下がります。股関節と膝を曲げ、コントロールされたダイナミックな動きで膝を肘に向かって引き上げます。コントロールしながら下ろします。トゥーズトゥバーへのステップアップとして役立ちます。';

  @override
  String get ex_cf_14_b1 => 'トゥーズトゥバーへの段階的なステップ';

  @override
  String get ex_cf_14_b2 => '技術的な難度がそれほど高くないダイナミックな体幹トレーニング';

  @override
  String get ex_cf_14_b3 => '握力を向上させる';

  @override
  String get ex_cf_15_name => 'マッスルアップ';

  @override
  String get ex_cf_15_desc =>
      'フォールスグリップでリング（またはバー）にぶら下がります。体を爆発的に引き上げてリングの上へ切り返し、トップで腕を伸ばして押し上げ、上で体を支えるサポート姿勢になります。逆の切り返しをコントロールしながら下ります。';

  @override
  String get ex_cf_15_b1 => 'プル＋プッシュを組み合わせた上級の体操系動作';

  @override
  String get ex_cf_15_b2 => 'クロスフィットの重要な到達目標（多くのWODでRX）';

  @override
  String get ex_cf_15_b3 => '体重に対する相対的な筋力を極限まで発達させる';

  @override
  String get ex_cf_16_name => 'ピストルスクワット';

  @override
  String get ex_cf_16_desc =>
      '片脚で立ち、もう一方の脚を床と平行に前へ伸ばします。バランスを保ち、軸足の足裏全体を床につけたまま深くスクワットします。浮かせた脚が床に触れないように、かかとで押して立ち上がります。反対側も同様に行います。';

  @override
  String get ex_cf_16_b1 => '最高難度の片脚スクワット';

  @override
  String get ex_cf_16_b2 => '足首と股関節の可動性を発達させる';

  @override
  String get ex_cf_16_b3 => '左右差を改善する片側トレーニング';

  @override
  String get ex_cf_17_name => 'ハンドスタンドプッシュアップ（HSPU）';

  @override
  String get ex_cf_17_desc =>
      '壁から約30cm離れた床に両手をつき、足を蹴り上げて壁に寄りかかった倒立の姿勢になります。頭が床（またはアブマット）に触れるまで肘を曲げて体を下ろします。押し上げて元に戻ります。補助が必要な場合は「キップ」を使います。';

  @override
  String get ex_cf_17_b1 => '全体重を使った垂直方向のプレス';

  @override
  String get ex_cf_17_b2 => '肩と体幹の安定性を向上させる';

  @override
  String get ex_cf_17_b3 => 'クロスフィットの重要な体操系の到達目標';

  @override
  String get ex_cf_18_name => 'ターキッシュゲットアップ';

  @override
  String get ex_cf_18_desc =>
      '仰向けになり、片腕を天井に向かって伸ばしてケトルベルを持ちます。ケトルベルを常に上に保ったまま、段階的に立ち上がります（肘 → 手 → ヒップヒンジ → 脚のスイープ → 膝立ち → 立位）。動作を逆にたどって戻ります。';

  @override
  String get ex_cf_18_b1 => '他にない全身のファンクショナルな動作';

  @override
  String get ex_cf_18_b2 => '可動性・安定性・コーディネーションを向上させる';

  @override
  String get ex_cf_18_b3 => '肩と体幹のトレーニングに優れている';

  @override
  String get ex_cf_19_name => 'ダブルアンダー';

  @override
  String get ex_cf_19_desc =>
      '1回のジャンプで縄を足の下に2回通して縄跳びをします。ジャンプは低く、手首の回転は速く保ちます。腕は体につけ、肘は腰の近くに置きます。コーディネーションとスピードロープが必要です。';

  @override
  String get ex_cf_19_b1 => '高強度の爆発的な有酸素運動';

  @override
  String get ex_cf_19_b2 => 'コーディネーションとタイミングを向上させる';

  @override
  String get ex_cf_19_b3 => 'クロスフィットの数百ものWODで定番';

  @override
  String get ex_cf_20_name => 'ファーマーズキャリー';

  @override
  String get ex_cf_20_desc =>
      '重いダンベルまたはケトルベルを両手に持ち、体の横に構えます。姿勢をまっすぐに保ち、肩を後ろに引き、体幹を引き締めたまま小さな歩幅で歩きます。決めた距離を歩くか、時間を決めて行います。';

  @override
  String get ex_cf_20_b1 => '握力と前腕を強化する';

  @override
  String get ex_cf_20_b2 => '全身のファンクショナルトレーニング';

  @override
  String get ex_cf_20_b3 => '姿勢と体幹の安定性を向上させる';

  @override
  String get ex_cf_21_name => 'ゴブレットスクワット';

  @override
  String get ex_cf_21_desc =>
      'ケトルベル（またはダンベル）を胸の前、胸骨の高さで、「ベル」の部分をつかんで持ちます。上体を垂直に保ち、肘を前に向けたまま深くスクワットします。かかとで押して立ち上がります。';

  @override
  String get ex_cf_21_b1 => '加重スクワットへの最適な入門種目';

  @override
  String get ex_cf_21_b2 => 'まっすぐな姿勢と正しい深さを身につけられる';

  @override
  String get ex_cf_21_b3 => '体幹の活性化に優れている';

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
