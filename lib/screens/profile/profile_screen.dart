import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../services/auth_service.dart';
import '../../services/health_sync_service.dart';
import '../../services/rest_alert_service.dart';
import '../../services/subscription_service.dart';
import '../../services/screen_awake_service.dart';
import '../../services/theme_controller.dart';
import '../../services/workout_reminder_service.dart';
import 'workout_reminder_sheet.dart';
import '../../theme/app_theme.dart';
import '../../utils/weight_units.dart';
import '../auth/guest_prompts.dart';
import '../onboarding/training_preferences_screen.dart';
import '../paywall/paywall_screen.dart';

/// Account, subscription and settings, previously hidden behind the avatar
/// menu on Home.
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with WidgetsBindingObserver {
  // Linking a guest account keeps the same user, so authStateChanges() stays
  // silent; userChanges() reports the new name, email and providers.
  StreamSubscription<User?>? _userSub;

  /// False when Android may delay the rest alert (exact alarms not allowed).
  bool _restAlertOnTime = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    SubscriptionService.instance.addListener(_onChanged);
    ScreenAwakeService.instance.addListener(_onChanged);
    RestAlertService.instance.addListener(_onRestAlertChanged);
    HealthSyncService.instance.addListener(_onChanged);
    WorkoutReminderService.instance.addListener(_onChanged);
    HealthSyncService.instance.refreshAccess();
    _userSub = FirebaseAuth.instance.userChanges().listen((_) => _onChanged());
    _refreshRestAlertStatus();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    SubscriptionService.instance.removeListener(_onChanged);
    ScreenAwakeService.instance.removeListener(_onChanged);
    RestAlertService.instance.removeListener(_onRestAlertChanged);
    HealthSyncService.instance.removeListener(_onChanged);
    WorkoutReminderService.instance.removeListener(_onChanged);
    _userSub?.cancel();
    super.dispose();
  }

  /// The permission is granted in the system settings, so re-check when the
  /// user comes back from them.
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _refreshRestAlertStatus();
      HealthSyncService.instance.refreshAccess();
    }
  }

  void _onRestAlertChanged() {
    _onChanged();
    _refreshRestAlertStatus();
  }

  Future<void> _refreshRestAlertStatus() async {
    // At launch this screen can be built before the notifications are set
    // up, and asking then would always answer "on time".
    await RestAlertService.instance.whenReady;
    final onTime = await RestAlertService.instance.canAlertOnTime();
    if (mounted && onTime != _restAlertOnTime) {
      setState(() => _restAlertOnTime = onTime);
    }
  }

  void _onChanged() {
    if (mounted) setState(() {});
  }

  bool _healthBusy = false;

  Future<void> _setHealthSync(bool value) async {
    final health = HealthSyncService.instance;
    if (!value) {
      await health.disable();
      return;
    }
    if (_healthBusy) return;
    setState(() => _healthBusy = true);
    final result = await health.enable();
    if (!mounted) return;
    setState(() => _healthBusy = false);

    final l10n = S.of(context);
    final store = health.storeName;
    final messenger = ScaffoldMessenger.of(context)..hideCurrentSnackBar();
    switch (result) {
      case HealthEnableResult.enabled:
        messenger.showSnackBar(
          SnackBar(content: Text(l10n.health_enabled(store))),
        );
      case HealthEnableResult.denied:
        messenger.showSnackBar(
          SnackBar(content: Text(l10n.health_denied(store))),
        );
      case HealthEnableResult.needsInstall:
        messenger.showSnackBar(
          SnackBar(
            content: Text(l10n.health_needsInstall),
            action: SnackBarAction(
              label: l10n.health_install,
              onPressed: health.openInstallPage,
            ),
          ),
        );
      case HealthEnableResult.unsupported:
        messenger.showSnackBar(
          SnackBar(content: Text(l10n.health_unsupported(store))),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final user = FirebaseAuth.instance.currentUser;
    final isPro = SubscriptionService.instance.isPro;
    final isGuest = user?.isAnonymous ?? false;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(title: Text(l10n.nav_profile), floating: true),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
              child: Column(
                children: [
                  if (isGuest) ...[
                    const _GuestCard(),
                    const SizedBox(height: 24),
                  ] else if (user != null) ...[
                    ProfileAvatar(size: 72),
                    const SizedBox(height: 12),
                    if (user.displayName?.isNotEmpty == true)
                      Text(
                        user.displayName!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    const SizedBox(height: 4),
                    Text(
                      user.email ?? '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                  _Section(
                    children: [
                      ListTile(
                        leading: Icon(
                          isPro
                              ? Icons.workspace_premium_rounded
                              : Icons.star_outline_rounded,
                          color: AppColors.accentYellow,
                        ),
                        title: Text(
                          isPro ? 'LiftWave PRO' : l10n.profile_freePlan,
                          style: TextStyle(color: AppColors.textPrimary),
                        ),
                        subtitle: Text(
                          isPro
                              ? l10n.profile_proActive
                              : l10n.profile_upgradePro,
                          style: TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 12,
                          ),
                        ),
                        trailing: isPro
                            ? null
                            : Icon(
                                Icons.chevron_right_rounded,
                                color: AppColors.textMuted,
                              ),
                        onTap: isPro
                            ? null
                            : () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const PaywallScreen(),
                                ),
                              ),
                      ),
                      if (isPro)
                        ListTile(
                          leading: Icon(
                            Icons.manage_accounts_rounded,
                            color: AppColors.textSecondary,
                          ),
                          title: Text(
                            l10n.profile_manageSubscription,
                            style: TextStyle(color: AppColors.textPrimary),
                          ),
                          trailing: Icon(
                            Icons.open_in_new_rounded,
                            color: AppColors.textMuted,
                            size: 18,
                          ),
                          onTap: _manageSubscription,
                        ),
                      ListTile(
                        leading: Icon(
                          Icons.restore_rounded,
                          color: AppColors.textSecondary,
                        ),
                        title: Text(
                          l10n.profile_restorePurchases,
                          style: TextStyle(color: AppColors.textPrimary),
                        ),
                        onTap: _restorePurchases,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _Section(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.tune_rounded,
                          color: AppColors.primaryLight,
                        ),
                        title: Text(
                          l10n.profile_trainingPreferences,
                          style: TextStyle(color: AppColors.textPrimary),
                        ),
                        subtitle: Text(
                          l10n.profile_trainingPreferencesSubtitle,
                          style: TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 12,
                          ),
                        ),
                        trailing: Icon(
                          Icons.chevron_right_rounded,
                          color: AppColors.textMuted,
                        ),
                        onTap: () => openTrainingPreferences(context),
                      ),
                      ListTile(
                        leading: Icon(
                          AppColors.brightness == Brightness.dark
                              ? Icons.dark_mode_rounded
                              : Icons.light_mode_rounded,
                          color: AppColors.primaryLight,
                        ),
                        title: Text(
                          l10n.profile_appearance,
                          style: TextStyle(color: AppColors.textPrimary),
                        ),
                        subtitle: Text(
                          _appearanceLabel(l10n, ThemeController.instance.mode),
                          style: TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 12,
                          ),
                        ),
                        trailing: Icon(
                          Icons.chevron_right_rounded,
                          color: AppColors.textMuted,
                        ),
                        onTap: _chooseAppearance,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.fitness_center_rounded,
                          color: AppColors.primaryLight,
                        ),
                        title: Text(
                          l10n.profile_weightUnit,
                          style: TextStyle(color: AppColors.textPrimary),
                        ),
                        subtitle: Text(
                          _unitLabel(l10n, WeightUnits.instance.unit),
                          style: TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 12,
                          ),
                        ),
                        trailing: Icon(
                          Icons.chevron_right_rounded,
                          color: AppColors.textMuted,
                        ),
                        onTap: _chooseWeightUnit,
                      ),
                      SwitchListTile(
                        secondary: Icon(
                          Icons.stay_current_portrait_rounded,
                          color: AppColors.primaryLight,
                        ),
                        title: Text(
                          l10n.profile_keepScreenOn,
                          style: TextStyle(color: AppColors.textPrimary),
                        ),
                        subtitle: Text(
                          l10n.profile_keepScreenOnSubtitle,
                          style: TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 12,
                          ),
                        ),
                        value: ScreenAwakeService.instance.enabled,
                        activeThumbColor: AppColors.primary,
                        onChanged: ScreenAwakeService.instance.setEnabled,
                      ),
                      SwitchListTile(
                        secondary: Icon(
                          Icons.notifications_active_outlined,
                          color: AppColors.primaryLight,
                        ),
                        title: Text(
                          l10n.profile_restAlert,
                          style: TextStyle(color: AppColors.textPrimary),
                        ),
                        subtitle: Text(
                          l10n.profile_restAlertSubtitle,
                          style: TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 12,
                          ),
                        ),
                        value: RestAlertService.instance.enabled,
                        activeThumbColor: AppColors.primary,
                        onChanged: RestAlertService.instance.setEnabled,
                      ),
                      if (RestAlertService.instance.enabled &&
                          !_restAlertOnTime)
                        ListTile(
                          leading: Icon(
                            Icons.alarm_rounded,
                            color: AppColors.accentYellow,
                          ),
                          title: Text(
                            l10n.profile_restAlertExact,
                            style: TextStyle(color: AppColors.textPrimary),
                          ),
                          subtitle: Text(
                            l10n.profile_restAlertExactSubtitle,
                            style: TextStyle(
                              color: AppColors.textMuted,
                              fontSize: 12,
                            ),
                          ),
                          trailing: Icon(
                            Icons.chevron_right_rounded,
                            color: AppColors.textMuted,
                          ),
                          onTap:
                              RestAlertService.instance.openExactAlarmSettings,
                        ),
                      ListTile(
                        leading: Icon(
                          Icons.event_available_outlined,
                          color: AppColors.primaryLight,
                        ),
                        title: Text(
                          l10n.reminders_title,
                          style: TextStyle(color: AppColors.textPrimary),
                        ),
                        subtitle: Text(
                          workoutReminderSummary(context),
                          style: TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 12,
                          ),
                        ),
                        trailing: Icon(
                          Icons.chevron_right_rounded,
                          color: AppColors.textMuted,
                        ),
                        onTap: () => showWorkoutReminderSheet(context),
                      ),
                      if (HealthSyncService.instance.supported)
                        SwitchListTile(
                          secondary: Icon(
                            Icons.favorite_outline_rounded,
                            color: AppColors.primaryLight,
                          ),
                          title: Text(
                            l10n.health_sync(
                              HealthSyncService.instance.storeName,
                            ),
                            style: TextStyle(color: AppColors.textPrimary),
                          ),
                          subtitle: Text(
                            l10n.health_syncSubtitle(
                              HealthSyncService.instance.storeName,
                            ),
                            style: TextStyle(
                              color: AppColors.textMuted,
                              fontSize: 12,
                            ),
                          ),
                          value: HealthSyncService.instance.enabled,
                          activeThumbColor: AppColors.primary,
                          onChanged: _healthBusy ? null : _setHealthSync,
                        ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _Section(
                    children: [
                      _LinkTile(
                        icon: Icons.help_outline_rounded,
                        label: l10n.profile_help,
                        url: _supportUrl,
                      ),
                      _LinkTile(
                        icon: Icons.shield_outlined,
                        label: l10n.paywall_privacyLink,
                        url: _privacyUrl,
                      ),
                      _LinkTile(
                        icon: Icons.description_outlined,
                        label: l10n.paywall_termsLink,
                        url: _termsUrl,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  if (isGuest)
                    _Section(
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.logout_rounded,
                            color: AppColors.error,
                          ),
                          title: Text(
                            l10n.guest_leave,
                            style: const TextStyle(color: AppColors.error),
                          ),
                          onTap: _confirmLeaveGuest,
                        ),
                      ],
                    )
                  else
                    _Section(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.logout_rounded,
                            color: AppColors.textSecondary,
                          ),
                          title: Text(
                            l10n.profile_signOut,
                            style: TextStyle(color: AppColors.textPrimary),
                          ),
                          onTap: _confirmSignOut,
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.delete_forever_rounded,
                            color: AppColors.error,
                          ),
                          title: Text(
                            l10n.profile_deleteAccount,
                            style: const TextStyle(color: AppColors.error),
                          ),
                          onTap: _confirmDeleteAccount,
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static const _supportUrl =
      'https://jonaso220.github.io/LiftWave/support.html';
  static const _privacyUrl =
      'https://jonaso220.github.io/LiftWave/privacy-policy.html';
  static const _termsUrl =
      'https://jonaso220.github.io/LiftWave/terms-of-use.html';

  Future<void> _manageSubscription() async {
    final uri = await SubscriptionService.instance.managementUri();
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  void _confirmSignOut() {
    final l10n = S.of(context);
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.bgCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        content: Text(
          l10n.profile_signOutConfirm,
          style: TextStyle(color: AppColors.textPrimary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.common_cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              AuthService.instance.signOut();
            },
            child: Text(l10n.profile_signOut),
          ),
        ],
      ),
    );
  }

  /// Runs [action] behind a blocking spinner. Deleting an account takes
  /// several seconds of network calls, and without feedback the app looked
  /// frozen after the confirmation.
  Future<void> _withProgress(Future<void> Function() action) async {
    // The root navigator outlives this screen, which is torn down as soon as
    // the account is gone.
    final navigator = Navigator.of(context, rootNavigator: true);
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      useRootNavigator: true,
      builder: (_) => const PopScope(
        canPop: false,
        child: Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
      ),
    );
    try {
      await action();
    } finally {
      navigator.pop();
    }
  }

  static String _appearanceLabel(S l10n, ThemeMode mode) => switch (mode) {
    ThemeMode.system => l10n.appearance_system,
    ThemeMode.light => l10n.appearance_light,
    ThemeMode.dark => l10n.appearance_dark,
  };

  Future<void> _chooseAppearance() async {
    final l10n = S.of(context);
    final current = ThemeController.instance.mode;
    final choice = await showModalBottomSheet<ThemeMode>(
      context: context,
      backgroundColor: AppColors.bgCard,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: RadioGroup<ThemeMode>(
            groupValue: current,
            onChanged: (mode) => Navigator.pop(ctx, mode),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 4, 20, 8),
                  child: Text(
                    l10n.profile_appearance,
                    style: Theme.of(ctx).textTheme.headlineSmall,
                  ),
                ),
                for (final mode in const [
                  ThemeMode.system,
                  ThemeMode.light,
                  ThemeMode.dark,
                ])
                  RadioListTile<ThemeMode>(
                    value: mode,
                    activeColor: AppColors.primary,
                    title: Text(
                      _appearanceLabel(l10n, mode),
                      style: TextStyle(color: AppColors.textPrimary),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
    if (choice != null) await ThemeController.instance.setMode(choice);
  }

  static String _unitLabel(S l10n, WeightUnit unit) => switch (unit) {
    WeightUnit.kg => l10n.weightUnit_kg,
    WeightUnit.lb => l10n.weightUnit_lb,
  };

  Future<void> _chooseWeightUnit() async {
    final l10n = S.of(context);
    final current = WeightUnits.instance.unit;
    final choice = await showModalBottomSheet<WeightUnit>(
      context: context,
      backgroundColor: AppColors.bgCard,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: RadioGroup<WeightUnit>(
            groupValue: current,
            onChanged: (unit) => Navigator.pop(ctx, unit),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 4, 20, 8),
                  child: Text(
                    l10n.profile_weightUnit,
                    style: Theme.of(ctx).textTheme.headlineSmall,
                  ),
                ),
                for (final unit in WeightUnit.values)
                  RadioListTile<WeightUnit>(
                    value: unit,
                    activeColor: AppColors.primary,
                    title: Text(
                      _unitLabel(l10n, unit),
                      style: TextStyle(color: AppColors.textPrimary),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
    if (choice != null) await WeightUnits.instance.setUnit(choice);
  }

  Future<void> _restorePurchases() async {
    final l10n = S.of(context);
    final outcome = await SubscriptionService.instance.restorePurchases();
    if (!mounted) return;
    final String message;
    final Color bg;
    switch (outcome) {
      case RestoreOutcome.restored:
        message = l10n.profile_purchasesRestored;
        bg = AppColors.accent;
        break;
      case RestoreOutcome.nothingToRestore:
        message = l10n.profile_noPurchasesFound;
        bg = AppColors.textMuted;
        break;
      case RestoreOutcome.networkError:
        message = l10n.restore_connectionError;
        bg = AppColors.error;
        break;
      case RestoreOutcome.storeError:
      case RestoreOutcome.unknownError:
        message = l10n.restore_unknownError;
        bg = AppColors.error;
        break;
    }
    _showSnack(message, bg);
  }

  void _showSnack(String message, Color background) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: AppColors.readableOn(background)),
        ),
        backgroundColor: background,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  /// A guest cannot sign back in, so leaving deletes their data instead of
  /// orphaning it.
  void _confirmLeaveGuest() {
    final l10n = S.of(context);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.bgCard,
        title: Text(
          l10n.guest_leave,
          style: TextStyle(color: AppColors.textPrimary),
        ),
        content: Text(
          l10n.guest_leaveBody,
          style: TextStyle(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.common_cancel),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(ctx);
              try {
                await _withProgress(AuthService.instance.deleteAccount);
              } on FirebaseAuthException catch (e) {
                if (mounted) {
                  _showSnack(
                    AuthService.errorMessage(e.code, S.of(context)),
                    AppColors.error,
                  );
                }
              } catch (_) {
                if (mounted) {
                  _showSnack(l10n.authError_default, AppColors.error);
                }
              }
            },
            child: Text(
              l10n.guest_leave,
              style: const TextStyle(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
  }

  void _confirmDeleteAccount() {
    final l10n = S.of(context);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.bgCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          l10n.profile_deleteTitle,
          style: TextStyle(color: AppColors.textPrimary),
        ),
        content: Text(
          SubscriptionService.instance.isPro
              ? '${l10n.profile_deleteConfirm}\n\n'
                    '${l10n.profile_deleteSubscriptionNote}'
              : l10n.profile_deleteConfirm,
          style: TextStyle(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.common_cancel),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(ctx);
              String? password;
              if (AuthService.instance.currentUserUsesPassword) {
                password = await _requestDeletePassword();
                if (password == null || !mounted) return;
              }
              try {
                await _withProgress(
                  () => AuthService.instance.deleteAccount(password: password),
                );
              } on AuthCancelledException {
                // Closing the Google / Apple reauthentication sheet is not an
                // error and must leave the account untouched.
              } on FirebaseAuthException catch (e) {
                if (mounted) {
                  _showSnack(
                    AuthService.errorMessage(e.code, S.of(context)),
                    AppColors.error,
                  );
                }
              } catch (_) {
                if (mounted) {
                  _showSnack(l10n.profile_deleteReauthError, AppColors.error);
                }
              }
            },
            child: Text(
              l10n.common_delete,
              style: const TextStyle(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
  }

  Future<String?> _requestDeletePassword() async {
    final controller = TextEditingController();
    final result = await showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.bgCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          S.of(context).profile_deleteTitle,
          style: TextStyle(color: AppColors.textPrimary),
        ),
        content: TextField(
          controller: controller,
          autofocus: true,
          obscureText: true,
          textInputAction: TextInputAction.done,
          onSubmitted: (value) {
            if (value.isNotEmpty) Navigator.pop(dialogContext, value);
          },
          decoration: InputDecoration(
            labelText: S.of(context).emailAuth_passwordLabel,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(S.of(context).common_cancel),
          ),
          TextButton(
            onPressed: () {
              final value = controller.text;
              if (value.isNotEmpty) Navigator.pop(dialogContext, value);
            },
            child: Text(
              S.of(context).common_delete,
              style: const TextStyle(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
    controller.dispose();
    return result;
  }
}

/// Opens the training preferences editor and confirms when they were saved.
Future<void> openTrainingPreferences(BuildContext context) async {
  final saved = await Navigator.push<bool>(
    context,
    MaterialPageRoute(
      builder: (_) => const TrainingPreferencesScreen(isEditing: true),
    ),
  );
  if (saved != true || !context.mounted) return;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        S.of(context).onboarding_saved,
        style: TextStyle(color: AppColors.readableOn(AppColors.accent)),
      ),
      backgroundColor: AppColors.accent,
      behavior: SnackBarBehavior.floating,
    ),
  );
}

/// The signed-in user's photo, or their initial on a gradient.
class ProfileAvatar extends StatelessWidget {
  final double size;

  const ProfileAvatar({super.key, this.size = 36});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final photoUrl = user?.photoURL;
    final initial = (user?.displayName?.isNotEmpty == true)
        ? user!.displayName![0].toUpperCase()
        : (user?.email?.isNotEmpty == true
              ? user!.email![0].toUpperCase()
              : '?');
    final radius = size / 3.6; // 36 → 10, 64 → ~18

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: SizedBox(
        width: size,
        height: size,
        child: photoUrl != null && photoUrl.isNotEmpty
            ? Image.network(
                photoUrl,
                width: size,
                height: size,
                fit: BoxFit.cover,
                cacheWidth: (size * 2).round(),
                gaplessPlayback: true,
                loadingBuilder: (ctx, child, progress) =>
                    progress == null ? child : _fallback(initial),
                errorBuilder: (context, error, stack) => _fallback(initial),
              )
            : _fallback(initial),
      ),
    );
  }

  Widget _fallback(String initial) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.accentOrange, AppColors.accentYellow],
        ),
      ),
      child: Center(
        child: Text(
          initial,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: size * 0.44,
          ),
        ),
      ),
    );
  }
}

/// Invites a guest to create an account so their workouts are kept.
class _GuestCard extends StatelessWidget {
  const _GuestCard();

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.primary.withAlpha(20),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.primary.withAlpha(70)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const ProfileAvatar(size: 44),
              const SizedBox(width: 12),
              Text(
                l10n.guest_name,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            l10n.guest_saveProgressBody,
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => openCreateAccount(context),
              icon: const Icon(Icons.person_add_alt_1_rounded),
              label: Text(l10n.guest_createAccount),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                textStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final List<Widget> children;

  const _Section({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.bgCardLight),
      ),
      clipBehavior: Clip.antiAlias,
      child: Material(
        type: MaterialType.transparency,
        child: Column(children: children),
      ),
    );
  }
}

/// A profile row that opens a web page in the browser.
class _LinkTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String url;

  const _LinkTile({required this.icon, required this.label, required this.url});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: AppColors.textSecondary),
      title: Text(label, style: TextStyle(color: AppColors.textPrimary)),
      trailing: Icon(
        Icons.open_in_new_rounded,
        color: AppColors.textMuted,
        size: 18,
      ),
      onTap: () =>
          launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
    );
  }
}
