import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';

import '../../services/auth_service.dart';
import '../../theme/app_theme.dart';

/// Screen with two modes: login and register.
/// Tapping "¿No tienes cuenta?" toggles between them.
class EmailAuthScreen extends StatefulWidget {
  const EmailAuthScreen({super.key});

  @override
  State<EmailAuthScreen> createState() => _EmailAuthScreenState();
}

class _EmailAuthScreenState extends State<EmailAuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  bool _isRegister = false;
  bool _obscurePass = true;
  bool _loading = false;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  // ── Submit ────────────────────────────────────────────────────────────────

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    FocusScope.of(context).unfocus();
    setState(() => _loading = true);

    try {
      if (_isRegister) {
        await AuthService.instance.registerWithEmail(
          _emailCtrl.text,
          _passCtrl.text,
          _nameCtrl.text,
        );
      } else {
        await AuthService.instance.signInWithEmail(
          _emailCtrl.text,
          _passCtrl.text,
        );
      }
      // Auth stream in main.dart auto-navigates after success
      if (mounted) Navigator.of(context).popUntil((r) => r.isFirst);
    } on FirebaseAuthException catch (e) {
      if (mounted) _showError(AuthService.errorMessage(e.code, S.of(context)));
    } catch (_) {
      if (mounted) _showError(S.of(context).emailAuth_unexpectedError);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _forgotPassword() async {
    final email = _emailCtrl.text.trim();
    if (email.isEmpty) {
      _showError(S.of(context).emailAuth_emailFirst);
      return;
    }
    try {
      await AuthService.instance.sendPasswordReset(email);
      _showSuccess(S.of(context).emailAuth_resetSent(email));
    } catch (_) {
      _showError(S.of(context).emailAuth_resetError);
    }
  }

  void _showError(String msg) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: AppColors.error,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ));
  }

  void _showSuccess(String msg) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: AppColors.success,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ));
  }

  // ── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      appBar: AppBar(
        backgroundColor: AppColors.bgDark,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: AppColors.textPrimary, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          _isRegister ? S.of(context).emailAuth_titleRegister : S.of(context).emailAuth_titleLogin,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32),

                // ── Title ───────────────────────────────────────────────
                Text(
                  _isRegister ? S.of(context).emailAuth_greetingRegister : S.of(context).emailAuth_greetingLogin,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.5,
                  ),
                ).animate().fadeIn(duration: 400.ms),

                const SizedBox(height: 6),

                Text(
                  _isRegister
                      ? S.of(context).emailAuth_subtitleRegister
                      : S.of(context).emailAuth_subtitleLogin,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                  ),
                ).animate().fadeIn(delay: 100.ms, duration: 400.ms),

                const SizedBox(height: 36),

                // ── Name field (register only) ───────────────────────────
                if (_isRegister) ...[
                  _buildLabel(S.of(context).emailAuth_nameLabel),
                  const SizedBox(height: 8),
                  _buildField(
                    controller: _nameCtrl,
                    hint: S.of(context).emailAuth_nameHint,
                    icon: Icons.person_outline_rounded,
                    validator: (v) =>
                        (v == null || v.trim().isEmpty) ? S.of(context).emailAuth_nameError : null,
                  ),
                  const SizedBox(height: 20),
                ],

                // ── Email field ──────────────────────────────────────────
                _buildLabel(S.of(context).emailAuth_emailLabel),
                const SizedBox(height: 8),
                _buildField(
                  controller: _emailCtrl,
                  hint: S.of(context).emailAuth_emailHint,
                  icon: Icons.mail_outline_rounded,
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return S.of(context).emailAuth_emailErrorEmpty;
                    if (!v.contains('@')) return S.of(context).emailAuth_emailErrorInvalid;
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // ── Password field ───────────────────────────────────────
                _buildLabel(S.of(context).emailAuth_passwordLabel),
                const SizedBox(height: 8),
                _buildField(
                  controller: _passCtrl,
                  hint: _isRegister ? S.of(context).emailAuth_passwordHintRegister : S.of(context).emailAuth_passwordHintLogin,
                  icon: Icons.lock_outline_rounded,
                  obscureText: _obscurePass,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePass
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.textMuted,
                      size: 20,
                    ),
                    onPressed: () =>
                        setState(() => _obscurePass = !_obscurePass),
                  ),
                  validator: (v) {
                    if (v == null || v.isEmpty) return S.of(context).emailAuth_passwordErrorEmpty;
                    if (_isRegister && v.length < 6) {
                      return S.of(context).emailAuth_passwordErrorShort;
                    }
                    return null;
                  },
                ),

                // ── Forgot password ──────────────────────────────────────
                if (!_isRegister) ...[
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: _forgotPassword,
                      child: Text(
                        S.of(context).emailAuth_forgotPassword,
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],

                const SizedBox(height: 36),

                // ── Submit button ────────────────────────────────────────
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: FilledButton(
                    onPressed: _loading ? null : _submit,
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      disabledBackgroundColor:
                          AppColors.primary.withAlpha(100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: _loading
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            _isRegister ? S.of(context).emailAuth_titleRegister : S.of(context).emailAuth_titleLogin,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.2,
                            ),
                          ),
                  ),
                ),

                const SizedBox(height: 24),

                // ── Toggle register / login ───────────────────────────────
                Center(
                  child: GestureDetector(
                    onTap: () => setState(() {
                      _isRegister = !_isRegister;
                      _formKey.currentState?.reset();
                    }),
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(fontSize: 14),
                        children: [
                          TextSpan(
                            text: _isRegister
                                ? S.of(context).emailAuth_hasAccount
                                : S.of(context).emailAuth_noAccount,
                            style: const TextStyle(
                                color: AppColors.textSecondary),
                          ),
                          TextSpan(
                            text: _isRegister ? S.of(context).emailAuth_loginLink : S.of(context).emailAuth_registerLink,
                            style: const TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ── Helpers ───────────────────────────────────────────────────────────────

  Widget _buildLabel(String text) => Text(
        text,
        style: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      );

  Widget _buildField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: const TextStyle(color: AppColors.textPrimary, fontSize: 15),
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: AppColors.textMuted, size: 20),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: AppColors.bgCard,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide:
              const BorderSide(color: AppColors.bgCardLight, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide:
              const BorderSide(color: AppColors.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide:
              const BorderSide(color: AppColors.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide:
              const BorderSide(color: AppColors.error, width: 1.5),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
    );
  }
}
