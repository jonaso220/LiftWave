import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'user_data_deletion_service.dart';

/// Thrown when the user cancels the sign-in flow (not an error).
class AuthCancelledException implements Exception {}

class AuthService {
  AuthService._();
  static final AuthService instance = AuthService._();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;
  bool get isLoggedIn => currentUser != null;
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // ── Google ────────────────────────────────────────────────────────────────

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null; // user cancelled

      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      debugPrint('AuthService.signInWithGoogle error: $e');
      rethrow;
    }
  }

  // ── Apple ─────────────────────────────────────────────────────────────────

  Future<UserCredential?> signInWithApple() async {
    try {
      final rawNonce = _generateNonce();
      final nonce = _sha256of(rawNonce);

      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );

      final idToken = appleCredential.identityToken;
      if (idToken == null) {
        debugPrint('AuthService.signInWithApple: identityToken was null');
        throw Exception('Apple Sign-In failed: no identity token received');
      }

      final oauthCredential = OAuthProvider('apple.com').credential(
        idToken: idToken,
        accessToken: appleCredential.authorizationCode,
        rawNonce: rawNonce,
      );

      return await _auth.signInWithCredential(oauthCredential);
    } on SignInWithAppleAuthorizationException catch (e) {
      if (e.code == AuthorizationErrorCode.canceled) {
        throw AuthCancelledException();
      }
      debugPrint('AuthService.signInWithApple error: $e');
      rethrow;
    } on AuthCancelledException {
      rethrow;
    } catch (e) {
      debugPrint('AuthService.signInWithApple error: $e');
      rethrow;
    }
  }

  // ── Email / Password ──────────────────────────────────────────────────────

  Future<UserCredential> signInWithEmail(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
    } on FirebaseAuthException {
      rethrow;
    }
  }

  Future<UserCredential> registerWithEmail(
    String email,
    String password,
    String name,
  ) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      await cred.user?.updateDisplayName(name.trim());
      return cred;
    } on FirebaseAuthException {
      rethrow;
    }
  }

  Future<void> sendPasswordReset(String email) async {
    await _auth.sendPasswordResetEmail(email: email.trim());
  }

  // ── Sign out ──────────────────────────────────────────────────────────────

  Future<void> signOut() async {
    await Future.wait([GoogleSignIn().signOut(), _auth.signOut()]);
  }

  bool get currentUserUsesPassword =>
      currentUser?.providerData.any(
        (provider) => provider.providerId == EmailAuthProvider.PROVIDER_ID,
      ) ==
      true;

  Future<void> deleteAccount({String? password}) async {
    final user = _auth.currentUser;
    if (user == null) return;

    // Reauthenticate before deleting any data, so a stale Firebase session
    // cannot leave the account half-deleted.
    await _reauthenticate(user, password: password);
    await UserDataDeletionService.deleteCloudData(user.uid);
    await UserDataDeletionService.deleteLocalData(user.uid);
    await user.delete();
  }

  // ── Error message helper ──────────────────────────────────────────────────

  /// Returns a user-friendly localized message for FirebaseAuthException codes.
  static String errorMessage(String code, S l10n) {
    switch (code) {
      case 'user-not-found':
        return l10n.authError_userNotFound;
      case 'wrong-password':
      // Modern Firebase collapses wrong-password / user-not-found into one
      // generic code (email-enumeration protection); show the same message.
      case 'invalid-credential':
        return l10n.authError_wrongPassword;
      case 'email-already-in-use':
        return l10n.authError_emailAlreadyInUse;
      case 'weak-password':
        return l10n.authError_weakPassword;
      case 'invalid-email':
        return l10n.authError_invalidEmail;
      case 'too-many-requests':
        return l10n.authError_tooManyRequests;
      case 'network-request-failed':
        return l10n.authError_networkFailed;
      case 'requires-recent-login':
        return l10n.profile_deleteReauthError;
      default:
        return l10n.authError_default;
    }
  }

  // ── Private helpers ───────────────────────────────────────────────────────

  String _generateNonce([int length = 32]) {
    const chars =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final rnd = Random.secure();
    return List.generate(
      length,
      (_) => chars[rnd.nextInt(chars.length)],
    ).join();
  }

  String _sha256of(String input) {
    final bytes = utf8.encode(input);
    return sha256.convert(bytes).toString();
  }

  Future<void> _reauthenticate(User user, {String? password}) async {
    final providerIds = user.providerData
        .map((provider) => provider.providerId)
        .toSet();

    if (providerIds.contains(EmailAuthProvider.PROVIDER_ID)) {
      final email = user.email;
      if (email == null || password == null || password.isEmpty) {
        throw FirebaseAuthException(
          code: 'wrong-password',
          message: 'A password is required to delete this account.',
        );
      }
      await user.reauthenticateWithCredential(
        EmailAuthProvider.credential(email: email, password: password),
      );
      return;
    }

    if (providerIds.contains(GoogleAuthProvider.PROVIDER_ID)) {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) throw AuthCancelledException();
      final googleAuth = await googleUser.authentication;
      await user.reauthenticateWithCredential(
        GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        ),
      );
      return;
    }

    if (providerIds.contains('apple.com')) {
      try {
        final rawNonce = _generateNonce();
        final nonce = _sha256of(rawNonce);
        final appleCredential = await SignInWithApple.getAppleIDCredential(
          scopes: [AppleIDAuthorizationScopes.email],
          nonce: nonce,
        );
        final idToken = appleCredential.identityToken;
        if (idToken == null) {
          throw FirebaseAuthException(
            code: 'invalid-credential',
            message: 'Apple did not return an identity token.',
          );
        }
        await user.reauthenticateWithCredential(
          OAuthProvider('apple.com').credential(
            idToken: idToken,
            accessToken: appleCredential.authorizationCode,
            rawNonce: rawNonce,
          ),
        );
      } on SignInWithAppleAuthorizationException catch (error) {
        if (error.code == AuthorizationErrorCode.canceled) {
          throw AuthCancelledException();
        }
        rethrow;
      }
      return;
    }

    // Unknown providers can still delete successfully when the session is
    // recent; Firebase will return requires-recent-login otherwise.
    await user.reload();
  }
}
