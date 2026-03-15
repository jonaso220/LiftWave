import 'package:flutter/material.dart';

import '../screens/paywall/paywall_screen.dart';
import '../services/subscription_service.dart';
import '../theme/app_theme.dart';

/// Returns true if the user has PRO access.
/// If not, shows the paywall. Returns true if the user purchases during that flow.
Future<bool> requirePro(BuildContext context) async {
  if (SubscriptionService.instance.isPro) return true;
  await Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => const PaywallScreen()),
  );
  return SubscriptionService.instance.isPro;
}

/// Small badge to indicate a PRO-only feature.
class ProBadge extends StatelessWidget {
  const ProBadge({super.key});

  @override
  Widget build(BuildContext context) {
    if (SubscriptionService.instance.isPro) return const SizedBox.shrink();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: AppColors.accentYellow.withAlpha(30),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.accentYellow.withAlpha(80)),
      ),
      child: const Text(
        'PRO',
        style: TextStyle(
          color: AppColors.accentYellow,
          fontSize: 9,
          fontWeight: FontWeight.w800,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
