import 'dart:io';

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
  int _selectedIndex = 0;
  bool _loading = false;
  bool _loadingOfferings = true;
  bool _offeringsFailed = false;

  /// Per-package trial eligibility, keyed by storeProduct.identifier.
  /// Defaults to true; an explicit `false` from RevenueCat hides the badge.
  final Map<String, bool> _trialEligibility = {};

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
    setState(() {
      _loadingOfferings = true;
      _offeringsFailed = false;
    });
    await SubscriptionService.instance.loadOfferings();
    final packages = _packages;

    if (packages.isEmpty) {
      if (mounted) {
        setState(() {
          _loadingOfferings = false;
          _offeringsFailed = true;
        });
      }
      return;
    }

    // On iOS, ask StoreKit which products the user is still eligible for.
    if (Platform.isIOS) {
      try {
        final ids =
            packages.map((p) => p.storeProduct.identifier).toList();
        final result =
            await Purchases.checkTrialOrIntroductoryPriceEligibility(ids);
        for (final entry in result.entries) {
          _trialEligibility[entry.key] = entry.value.status !=
              IntroEligibilityStatus.introEligibilityStatusIneligible;
        }
      } catch (_) {
        // If the check fails, assume eligible — Apple will gate at purchase.
      }
    }

    // Default to the first package with a visible trial; fall back to last
    // (usually yearly = best value) if none has a trial.
    int defaultIndex = packages.length - 1;
    for (int i = 0; i < packages.length; i++) {
      if (_hasVisibleTrial(packages[i])) {
        defaultIndex = i;
        break;
      }
    }

    if (mounted) {
      setState(() {
        _selectedIndex = defaultIndex;
        _loadingOfferings = false;
      });
    }
  }

  List<Package> get _packages {
    final offering = SubscriptionService.instance.offerings?.current;
    if (offering == null) return [];
    return offering.availablePackages;
  }

  bool _hasVisibleTrial(Package package) {
    final intro = package.storeProduct.introductoryPrice;
    if (intro == null || intro.price != 0) return false;
    final eligible = _trialEligibility[package.storeProduct.identifier] ?? true;
    return eligible;
  }

  Package? get _selectedPackage {
    final packages = _packages;
    if (packages.isEmpty) return null;
    return packages[_selectedIndex.clamp(0, packages.length - 1)];
  }

  bool get _selectedHasTrial {
    final pkg = _selectedPackage;
    return pkg != null && _hasVisibleTrial(pkg);
  }

  Future<void> _purchase() async {
    final pkg = _selectedPackage;
    if (pkg == null) return;
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
    final outcome = await SubscriptionService.instance.restorePurchases();
    if (!mounted) return;
    setState(() => _loading = false);
    if (outcome == RestoreOutcome.restored) {
      Navigator.pop(context);
      return;
    }
    final l10n = S.of(context);
    final String message;
    final Color bg;
    switch (outcome) {
      case RestoreOutcome.nothingToRestore:
        message = l10n.paywall_noPurchasesFound;
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
      case RestoreOutcome.restored:
        return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: bg,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: SafeArea(
        child: Column(
          children: [
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
                    _buildHeader()
                        .animate()
                        .fadeIn(duration: 500.ms)
                        .slideY(begin: -0.15, end: 0, duration: 500.ms),
                    const SizedBox(height: 32),
                    _buildFeatures()
                        .animate()
                        .fadeIn(delay: 200.ms, duration: 400.ms),
                    const SizedBox(height: 32),
                    _buildPricingArea()
                        .animate()
                        .fadeIn(delay: 350.ms, duration: 400.ms),
                    const SizedBox(height: 24),
                    _buildTrialBanner()
                        .animate()
                        .fadeIn(delay: 450.ms, duration: 400.ms),
                    const SizedBox(height: 16),
                    _buildCTA()
                        .animate()
                        .fadeIn(delay: 500.ms, duration: 400.ms)
                        .slideY(
                            begin: 0.2,
                            end: 0,
                            delay: 500.ms,
                            duration: 400.ms),
                    const SizedBox(height: 16),
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

  // ── Pricing area (cards / loading / error) ──────────────────────────────────

  Widget _buildPricingArea() {
    if (_loadingOfferings) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 32),
        child: Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
      );
    }
    if (_offeringsFailed || _packages.isEmpty) {
      return _buildOffersUnavailable();
    }
    return _buildPricingCards();
  }

  Widget _buildOffersUnavailable() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.bgCardLight),
      ),
      child: Column(
        children: [
          const Icon(Icons.error_outline_rounded,
              color: AppColors.textMuted, size: 32),
          const SizedBox(height: 12),
          Text(
            S.of(context).paywall_offersUnavailable,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: _initOfferings,
            style: TextButton.styleFrom(
              foregroundColor: AppColors.primary,
            ),
            child: Text(S.of(context).paywall_retry),
          ),
        ],
      ),
    );
  }

  Widget _buildPricingCards() {
    final packages = _packages;
    final titles = [
      S.of(context).paywall_weekly,
      S.of(context).paywall_monthly,
      S.of(context).paywall_yearly,
    ];
    final suffixes = [
      S.of(context).paywall_perWeek,
      S.of(context).paywall_perMonth,
      S.of(context).paywall_perYear,
    ];

    return Row(
      children: List.generate(packages.length, (i) {
        final pkg = packages[i];
        final isSelected = i == _selectedIndex;
        final isYearly = i == packages.length - 1 && packages.length >= 3;
        final hasTrial = _hasVisibleTrial(pkg);
        final title = i < titles.length ? titles[i] : pkg.storeProduct.title;
        final suffix = i < suffixes.length ? suffixes[i] : '';

        return Expanded(
          child: GestureDetector(
            onTap: () => setState(() => _selectedIndex = i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: EdgeInsets.only(
                left: i == 0 ? 0 : 4,
                right: i == packages.length - 1 ? 0 : 4,
              ),
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 6),
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
                  if (isYearly) ...[
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.accentYellow,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        S.of(context).paywall_bestValue,
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
                    title,
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
                    pkg.storeProduct.priceString,
                    style: TextStyle(
                      color: isSelected
                          ? AppColors.textPrimary
                          : AppColors.textSecondary,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.5,
                    ),
                  ),
                  Text(
                    suffix,
                    style: const TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 11,
                    ),
                  ),
                  if (hasTrial) ...[
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppColors.accent.withAlpha(30),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        _trialBadgeText(
                            pkg.storeProduct.introductoryPrice!),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.accent,
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
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
    final pkg = _selectedPackage;
    if (pkg == null || !_selectedHasTrial) return const SizedBox.shrink();

    final intro = pkg.storeProduct.introductoryPrice!;
    final badge = _trialBadgeText(intro);
    final thenPrice = S
        .of(context)
        .paywall_trialThenPrice(pkg.storeProduct.priceString);

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
          Flexible(
            child: Text(
              '$badge · $thenPrice',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.accent,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _trialBadgeText(IntroductoryPrice intro) {
    final n = intro.periodNumberOfUnits;
    final l10n = S.of(context);
    switch (intro.periodUnit) {
      case PeriodUnit.day:
        return l10n.paywall_trialDays(n);
      case PeriodUnit.week:
        // Apple stores weekly intro as periodUnit=week; expand to days for clarity.
        return l10n.paywall_trialDays(n * 7);
      case PeriodUnit.month:
        return l10n.paywall_trialMonths(n);
      case PeriodUnit.year:
        return l10n.paywall_trialMonths(n * 12);
      default:
        return l10n.paywall_trialDays(n);
    }
  }

  // ── CTA ─────────────────────────────────────────────────────────────────────

  Widget _buildCTA() {
    final canPurchase = !_loading && !_loadingOfferings && _selectedPackage != null;
    final showSpinner = _loading || _loadingOfferings;
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: canPurchase
                ? const [AppColors.primary, AppColors.primaryDark]
                : [
                    AppColors.bgCardLight,
                    AppColors.bgCardLight,
                  ],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: canPurchase
              ? [
                  BoxShadow(
                    color: AppColors.primary.withAlpha(60),
                    blurRadius: 16,
                    offset: const Offset(0, 6),
                  ),
                ]
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: canPurchase ? _purchase : null,
            borderRadius: BorderRadius.circular(16),
            child: Center(
              child: showSpinner
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      _selectedHasTrial
                          ? S.of(context).paywall_startTrial
                          : S.of(context).paywall_subscribe,
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
          _selectedHasTrial ? l10n.paywall_legalTextTrial : l10n.paywall_legalText,
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
