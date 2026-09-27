import 'package:flutter/material.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';

import '../../services/auth_service.dart';
import '../../theme/app_theme.dart';
import 'login_screen.dart';

/// Opens the sign-up flow for a guest. Linking keeps their uid, so every
/// workout they logged stays in the new account.
Future<void> openCreateAccount(BuildContext context) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => const LoginScreen(upgradingGuest: true)),
  );
}

/// Asks a guest to create an account so their progress is not lost. Shown
/// at most once per app session.
Future<void> maybeShowSaveProgressPrompt(BuildContext context) async {
  if (!AuthService.instance.isGuest || _promptedThisSession) return;
  _promptedThisSession = true;
  final l10n = S.of(context);
  final create = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      backgroundColor: AppColors.bgCard,
      icon: const Icon(
        Icons.cloud_upload_outlined,
        color: AppColors.primaryLight,
        size: 32,
      ),
      title: Text(
        l10n.guest_saveProgressTitle,
        style: const TextStyle(color: AppColors.textPrimary),
      ),
      content: Text(
        l10n.guest_saveProgressBody,
        style: const TextStyle(color: AppColors.textSecondary),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx, false),
          child: Text(
            l10n.guest_notNow,
            style: const TextStyle(color: AppColors.textMuted),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop(ctx, true),
          child: Text(
            l10n.guest_createAccount,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
      ],
    ),
  );
  if (create == true && context.mounted) await openCreateAccount(context);
}

bool _promptedThisSession = false;

/// Warns a guest that signing in to an existing account leaves their guest
/// workouts behind. Returns true when they still want to continue.
Future<bool> confirmSwitchFromGuest(BuildContext context) async {
  final l10n = S.of(context);
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      backgroundColor: AppColors.bgCard,
      title: Text(
        l10n.guest_existingAccountTitle,
        style: const TextStyle(color: AppColors.textPrimary),
      ),
      content: Text(
        l10n.guest_existingAccountBody,
        style: const TextStyle(color: AppColors.textSecondary),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx, false),
          child: Text(l10n.common_cancel),
        ),
        TextButton(
          onPressed: () => Navigator.pop(ctx, true),
          child: Text(
            l10n.guest_signInAnyway,
            style: const TextStyle(color: AppColors.error),
          ),
        ),
      ],
    ),
  );
  return confirmed == true;
}
