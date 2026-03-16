import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:liftwave/l10n/generated/app_localizations.dart';

import '../../services/auth_service.dart';
import '../../theme/app_theme.dart';
import 'email_auth_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _loadingGoogle = false;
  bool _loadingApple = false;

  // ── Google ────────────────────────────────────────────────────────────────

  Future<void> _handleGoogle() async {
    setState(() => _loadingGoogle = true);
    try {
      await AuthService.instance.signInWithGoogle();
      // Auth state stream in main.dart will navigate automatically
    } on FirebaseAuthException catch (e) {
      if (mounted) _showError(AuthService.errorMessage(e.code, S.of(context)));
    } catch (_) {
      if (mounted) _showError(S.of(context).login_googleError);
    } finally {
      if (mounted) setState(() => _loadingGoogle = false);
    }
  }

  // ── Apple ─────────────────────────────────────────────────────────────────

  Future<void> _handleApple() async {
    setState(() => _loadingApple = true);
    try {
      await AuthService.instance.signInWithApple();
    } on FirebaseAuthException catch (e) {
      if (mounted) _showError(AuthService.errorMessage(e.code, S.of(context)));
    } catch (_) {
      if (mounted) _showError(S.of(context).login_appleError);
    } finally {
      if (mounted) setState(() => _loadingApple = false);
    }
  }

  // ── Email ─────────────────────────────────────────────────────────────────

  void _handleEmail() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const EmailAuthScreen()),
    );
  }

  void _showError(String msg) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: AppColors.error,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  // ── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              const SizedBox(height: 60),

              // ── Hero ────────────────────────────────────────────────────
              _buildHero()
                  .animate()
                  .fadeIn(duration: 600.ms)
                  .slideY(begin: -0.2, end: 0, duration: 600.ms),

              const SizedBox(height: 64),

              // ── Social buttons ──────────────────────────────────────────
              _SocialButton(
                label: S.of(context).login_continueGoogle,
                icon: _googleIcon(),
                loading: _loadingGoogle,
                backgroundColor: Colors.white,
                textColor: const Color(0xFF1F1F1F),
                onTap: _handleGoogle,
              )
                  .animate()
                  .fadeIn(delay: 200.ms, duration: 400.ms)
                  .slideY(begin: 0.3, end: 0, delay: 200.ms, duration: 400.ms),

              const SizedBox(height: 12),

              if (Platform.isIOS) ...[
                _SocialButton(
                  label: S.of(context).login_continueApple,
                  icon: const Icon(Icons.apple,
                      color: Colors.white, size: 22),
                  loading: _loadingApple,
                  backgroundColor: const Color(0xFF1C1C1E),
                  textColor: Colors.white,
                  borderColor: AppColors.bgCardLight,
                  onTap: _handleApple,
                )
                    .animate()
                    .fadeIn(delay: 300.ms, duration: 400.ms)
                    .slideY(begin: 0.3, end: 0, delay: 300.ms, duration: 400.ms),
                const SizedBox(height: 12),
              ],

              // ── Divider ─────────────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    const Expanded(
                        child: Divider(color: AppColors.bgCardLight)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(S.of(context).common_or,
                          style: TextStyle(
                              color: AppColors.textMuted, fontSize: 14)),
                    ),
                    const Expanded(
                        child: Divider(color: AppColors.bgCardLight)),
                  ],
                ),
              ).animate().fadeIn(delay: 350.ms, duration: 400.ms),

              const SizedBox(height: 8),

              // ── Email button ─────────────────────────────────────────────
              _SocialButton(
                label: S.of(context).login_continueEmail,
                icon: const Icon(Icons.mail_outline_rounded,
                    color: AppColors.primary, size: 22),
                backgroundColor: AppColors.bgCard,
                textColor: AppColors.textPrimary,
                borderColor: AppColors.bgCardLight,
                onTap: _handleEmail,
              )
                  .animate()
                  .fadeIn(delay: 400.ms, duration: 400.ms)
                  .slideY(begin: 0.3, end: 0, delay: 400.ms, duration: 400.ms),

              const SizedBox(height: 48),

              // ── Legal ────────────────────────────────────────────────────
              Text(
                S.of(context).login_legal,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 11,
                  height: 1.5,
                ),
              ).animate().fadeIn(delay: 500.ms, duration: 400.ms),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // ── Hero section ──────────────────────────────────────────────────────────

  Widget _buildHero() {
    return Column(
      children: [
        // App icon
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withAlpha(80),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(26),
            child: Image.asset(
              'assets/icon/icon_1024_transparent.png',
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'LiftWave',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 34,
            fontWeight: FontWeight.w800,
            letterSpacing: -1,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          S.of(context).login_tagline,
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _googleIcon() {
    return Image.network(
      'https://www.gstatic.com/firebasejs/ui/2.0.0/images/auth/google.svg',
      width: 22,
      height: 22,
      errorBuilder: (_, _, _) => const Icon(
        Icons.g_mobiledata_rounded,
        size: 26,
        color: Color(0xFF4285F4),
      ),
    );
  }
}

// ── Social button ─────────────────────────────────────────────────────────────

class _SocialButton extends StatelessWidget {
  final String label;
  final Widget icon;
  final bool loading;
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;
  final VoidCallback onTap;

  const _SocialButton({
    required this.label,
    required this.icon,
    required this.backgroundColor,
    required this.textColor,
    required this.onTap,
    this.loading = false,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: Material(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          onTap: loading ? null : onTap,
          borderRadius: BorderRadius.circular(14),
          child: Container(
            decoration: borderColor != null
                ? BoxDecoration(
                    border: Border.all(color: borderColor!, width: 1),
                    borderRadius: BorderRadius.circular(14),
                  )
                : null,
            child: loading
                ? Center(
                    child: SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: textColor,
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      icon,
                      const SizedBox(width: 12),
                      Text(
                        label,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.2,
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
