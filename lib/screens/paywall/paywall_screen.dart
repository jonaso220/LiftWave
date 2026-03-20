import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../services/subscription_service.dart';
import '../../theme/app_theme.dart';

class PaywallScreen extends StatefulWidget {
  const PaywallScreen({super.key});

  @override
  State<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends State<PaywallScreen> {
  int _selectedIndex = 1; // default: monthly
  bool _loading = false;
  bool _loadingOfferings = true;

  static const _termsUrl =
      'https://jonaso220.github.io/LiftWave/terms-of-use.html';
  static const _privacyUrl =
      'https://jonaso220.github.io/LiftWave/privacy-policy.html';

  @override
  void initState() {
    super.initState();
    _initOfferings();
  }

  Future<void> _initOfferings() async {
    await SubscriptionService.instance.loadOfferings();
    if (mounted) setState(() => _loadingOfferings = false);
  }

  List<Package> get _packages {
    final offering = SubscriptionService.instance.offerings?.current;
    if (offering == null) return [];
    return offering.availablePackages;
  }

  Future<void> _purchase() async {
    if (_packages.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).paywall_purchaseError),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        );
      }
      return;
    }
    final pkg = _packages[_selectedIndex.clamp(0, _packages.length - 1)];
    setState(() => _loading = true);
    try {
      final success = await SubscriptionService.instance.purchasePackage(pkg);
      if (success && mounted) Navigator.pop(context);
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(S.of(context).paywall_purchaseError),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _restore() async {
    setState(() => _loading = true);
    final restored = await SubscriptionService.instance.restorePurchases();
    if (!mounted) return;
    setState(() => _loading = false);
    if (restored) {
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).paywall_noPurchasesFound),
          backgroundColor: AppColors.textMuted,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: SafeArea(
        child: Column(
          children: [
            // ── Close button ──────────────────────────────────────────────
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 8, right: 8),
                child: IconButton(
                  icon: const Icon(Icons.close_rounded,
                      color: AppColors.textMuted, size: 28),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    // ── Header ────────────────────────────────────────────
                    _buildHeader()
                        .animate()
                        .fadeIn(duration: 500.ms)
                        .slideY(begin: -0.15, end: 0, duration: 500.ms),

                    const SizedBox(height: 32),

                    // ── Features ──────────────────────────────────────────
                    _buildFeatures()
                        .animate()
                        .fadeIn(delay: 200.ms, duration: 400.ms),

                    const SizedBox(height: 32),

                    // ── Pricing cards ─────────────────────────────────────
                    _buildPricingCards()
                        .animate()
                        .fadeIn(delay: 350.ms, duration: 400.ms),

                    const SizedBox(height: 24),

                    // ── Trial banner ──────────────────────────────────────
                    _buildTrialBanner()
                        .animate()
                        .fadeIn(delay: 450.ms, duration: 400.ms),

                    const SizedBox(height: 16),

                    // ── CTA ───────────────────────────────────────────────
                    _buildCTA()
                        .animate()
                        .fadeIn(delay: 500.ms, duration: 400.ms)
                        .slideY(begin: 0.2, end: 0, delay: 500.ms, duration: 400.ms),

                    const SizedBox(height: 16),

                    // ── Restore + Legal ───────────────────────────────────
                    _buildFooter()
                        .animate()
                        .fadeIn(delay: 550.ms, duration: 400.ms),

                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Header ──────────────────────────────────────────────────────────────────

  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.primary, AppColors.primaryDark],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withAlpha(80),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: const Icon(Icons.workspace_premium_rounded,
              color: Colors.white, size: 40),
        ),
        const SizedBox(height: 20),
        const Text(
          'LiftWave PRO',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 28,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          S.of(context).paywall_subtitle,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  // ── Features ────────────────────────────────────────────────────────────────

  Widget _buildFeatures() {
    final features = [
      (S.of(context).paywall_featureTemplates, Icons.fitness_center_rounded),
      (S.of(context).paywall_featureHistory, Icons.history_rounded),
      (S.of(context).paywall_featureTimer, Icons.timer_rounded),
      (S.of(context).paywall_featureDetails, Icons.menu_book_rounded),
      (S.of(context).paywall_featureMeasures, Icons.straighten_rounded),
      (S.of(context).paywall_featureStats, Icons.bar_chart_rounded),
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.bgCardLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).paywall_allIncluded,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          ...features.map((f) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: AppColors.accent.withAlpha(25),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(f.$2, color: AppColors.accent, size: 18),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      f.$1,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.check_circle_rounded,
                        color: AppColors.accent, size: 20),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  // ── Pricing cards ───────────────────────────────────────────────────────────

  Widget _buildPricingCards() {
    final plans = <_PlanInfo>[
      _PlanInfo(S.of(context).paywall_weekly, '\$1.99', S.of(context).paywall_perWeek, null),
      _PlanInfo(S.of(context).paywall_monthly, '\$4.99', S.of(context).paywall_perMonth, null),
      _PlanInfo(S.of(context).paywall_yearly, '\$29.99', S.of(context).paywall_perYear, S.of(context).paywall_bestValue),
    ];

    // If real offerings are available, use those prices
    if (_packages.isNotEmpty) {
      for (int i = 0; i < _packages.length && i < plans.length; i++) {
        plans[i] = _PlanInfo(
          plans[i].title,
          _packages[i].storeProduct.priceString,
          plans[i].suffix,
          plans[i].badge,
        );
      }
    }

    return Row(
      children: List.generate(plans.length, (i) {
        final plan = plans[i];
        final isSelected = i == _selectedIndex;
        return Expanded(
          child: GestureDetector(
            onTap: () => setState(() => _selectedIndex = i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: EdgeInsets.only(
                left: i == 0 ? 0 : 4,
                right: i == plans.length - 1 ? 0 : 4,
              ),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary.withAlpha(20)
                    : AppColors.bgCard,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color:
                      isSelected ? AppColors.primary : AppColors.bgCardLight,
                  width: isSelected ? 2 : 1,
                ),
              ),
              child: Column(
                children: [
                  if (plan.badge != null) ...[
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.accentYellow,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        plan.badge!,
                        style: const TextStyle(
                          color: AppColors.bgDark,
                          fontSize: 9,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                  ] else
                    const SizedBox(height: 19),
                  Text(
                    plan.title,
                    style: TextStyle(
                      color: isSelected
                          ? AppColors.textPrimary
                          : AppColors.textSecondary,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    plan.price,
                    style: TextStyle(
                      color: isSelected
                          ? AppColors.textPrimary
                          : AppColors.textSecondary,
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.5,
                    ),
                  ),
                  Text(
                    plan.suffix,
                    style: TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  // ── Trial banner ────────────────────────────────────────────────────────────

  Widget _buildTrialBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.accent.withAlpha(15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.accent.withAlpha(40)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.card_giftcard_rounded,
              color: AppColors.accent, size: 18),
          const SizedBox(width: 8),
          Text(
            S.of(context).paywall_freeTrial,
            style: const TextStyle(
              color: AppColors.accent,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  // ── CTA ─────────────────────────────────────────────────────────────────────

  Widget _buildCTA() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.primary, AppColors.primaryDark],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withAlpha(60),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: (_loading || _loadingOfferings) ? null : _purchase,
            borderRadius: BorderRadius.circular(16),
            child: Center(
              child: (_loading || _loadingOfferings)
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      S.of(context).paywall_startTrial,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.2,
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }

  // ── Footer ──────────────────────────────────────────────────────────────────

  Widget _buildFooter() {
    final l10n = S.of(context);
    return Column(
      children: [
        GestureDetector(
          onTap: _loading ? null : _restore,
          child: Text(
            l10n.paywall_restorePurchases,
            style: const TextStyle(
              color: AppColors.textMuted,
              fontSize: 13,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.textMuted,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          l10n.paywall_legalText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.textMuted,
            fontSize: 10,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => launchUrl(Uri.parse(_termsUrl),
                  mode: LaunchMode.externalApplication),
              child: Text(
                l10n.paywall_termsLink,
                style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: 10,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primary,
                ),
              ),
            ),
            const Text(
              '  ·  ',
              style: TextStyle(color: AppColors.textMuted, fontSize: 10),
            ),
            GestureDetector(
              onTap: () => launchUrl(Uri.parse(_privacyUrl),
                  mode: LaunchMode.externalApplication),
              child: Text(
                l10n.paywall_privacyLink,
                style: const TextStyle(
                  color: AppColors.primary,
                  fontSize: 10,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _PlanInfo {
  final String title;
  final String price;
  final String suffix;
  final String? badge;
  _PlanInfo(this.title, this.price, this.suffix, this.badge);
}
