import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';

import '../../services/auth_service.dart';
import '../../services/subscription_service.dart';
import '../../theme/app_theme.dart';
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

class _ProfileScreenState extends State<ProfileScreen> {
  // Linking a guest account keeps the same user, so authStateChanges() stays
  // silent; userChanges() reports the new name, email and providers.
  StreamSubscription<User?>? _userSub;

  @override
  void initState() {
    super.initState();
    SubscriptionService.instance.addListener(_onChanged);
    _userSub = FirebaseAuth.instance.userChanges().listen((_) => _onChanged());
  }

  @override
  void dispose() {
    SubscriptionService.instance.removeListener(_onChanged);
    _userSub?.cancel();
    super.dispose();
  }

  void _onChanged() {
    if (mounted) setState(() {});
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
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    const SizedBox(height: 4),
                    Text(
                      user.email ?? '',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
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
                          style: const TextStyle(color: AppColors.textPrimary),
                        ),
                        subtitle: Text(
                          isPro
                              ? l10n.profile_proActive
                              : l10n.profile_upgradePro,
                          style: const TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 12,
                          ),
                        ),
                        trailing: isPro
                            ? null
                            : const Icon(
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
                      ListTile(
                        leading: const Icon(
                          Icons.restore_rounded,
                          color: AppColors.textSecondary,
                        ),
                        title: Text(
                          l10n.profile_restorePurchases,
                          style: const TextStyle(color: AppColors.textPrimary),
                        ),
                        onTap: _restorePurchases,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _Section(
                    children: [
                      ListTile(
                        leading: const Icon(
                          Icons.tune_rounded,
                          color: AppColors.primaryLight,
                        ),
                        title: Text(
                          l10n.profile_trainingPreferences,
                          style: const TextStyle(color: AppColors.textPrimary),
                        ),
                        subtitle: Text(
                          l10n.profile_trainingPreferencesSubtitle,
                          style: const TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 12,
                          ),
                        ),
                        trailing: const Icon(
                          Icons.chevron_right_rounded,
                          color: AppColors.textMuted,
                        ),
                        onTap: () => openTrainingPreferences(context),
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
                          leading: const Icon(
                            Icons.logout_rounded,
                            color: AppColors.textSecondary,
                          ),
                          title: Text(
                            l10n.profile_signOut,
                            style: const TextStyle(
                              color: AppColors.textPrimary,
                            ),
                          ),
                          onTap: () => AuthService.instance.signOut(),
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
        content: Text(message),
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
          style: const TextStyle(color: AppColors.textPrimary),
        ),
        content: Text(
          l10n.guest_leaveBody,
          style: const TextStyle(color: AppColors.textSecondary),
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
                await AuthService.instance.deleteAccount();
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
          style: const TextStyle(color: AppColors.textPrimary),
        ),
        content: Text(
          l10n.profile_deleteConfirm,
          style: const TextStyle(color: AppColors.textSecondary),
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
                await AuthService.instance.deleteAccount(password: password);
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
          style: const TextStyle(color: AppColors.textPrimary),
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
      content: Text(S.of(context).onboarding_saved),
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
      decoration: const BoxDecoration(
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
                style: const TextStyle(
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
            style: const TextStyle(
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
