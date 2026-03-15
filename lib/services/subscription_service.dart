import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Singleton that manages RevenueCat subscriptions.
/// Follows the same pattern as AuthService / FirebaseService.
class SubscriptionService extends ChangeNotifier {
  SubscriptionService._();
  static final SubscriptionService instance = SubscriptionService._();

  // ── Configuration ──────────────────────────────────────────────────────────

  /// RevenueCat public API key.
  static const _apiKey = 'test_pioVEzTqvvocqhKMLsEdFCpKpcD';

  /// Entitlement identifier configured in the RevenueCat dashboard.
  static const _entitlementId = 'LiftWave Pro';

  /// Set to true during development to bypass the paywall.
  static const _debugForceProStatus = false;

  /// Developer promo codes that grant PRO access (case-insensitive).
  static const _promoCodes = {
    'LIFTWAVE2026',
    'AMIGOS-PRO',
    'FAMILIA-LW',
  };

  static const _promoKey = 'promo_code_redeemed';

  // ── State ──────────────────────────────────────────────────────────────────

  bool _isPro = false;
  bool _promoRedeemed = false;
  bool get isPro => _debugForceProStatus || _isPro || _promoRedeemed;

  Offerings? _offerings;
  Offerings? get offerings => _offerings;

  bool _initialized = false;

  StreamSubscription<User?>? _authSub;

  // ── Initialisation ─────────────────────────────────────────────────────────

  Future<void> init() async {
    if (_initialized) return;
    _initialized = true;

    try {
      // Load promo code status.
      final prefs = await SharedPreferences.getInstance();
      _promoRedeemed = prefs.getBool(_promoKey) ?? false;

      await Purchases.configure(PurchasesConfiguration(_apiKey));

      // Listen for entitlement changes from RevenueCat.
      Purchases.addCustomerInfoUpdateListener(_updateStatus);

      // Sync RevenueCat user with Firebase auth state.
      _authSub = FirebaseAuth.instance.authStateChanges().listen((user) {
        if (user != null) {
          _loginUser(user);
        } else {
          _logoutUser();
        }
      });

      // If user is already logged in, sync now.
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        await _loginUser(currentUser);
      }
    } catch (e) {
      debugPrint('SubscriptionService.init error: $e');
    }
  }

  // ── Auth sync ──────────────────────────────────────────────────────────────

  Future<void> _loginUser(User user) async {
    try {
      final result = await Purchases.logIn(user.uid);
      _updateStatus(result.customerInfo);
    } catch (e) {
      debugPrint('SubscriptionService._loginUser error: $e');
    }
  }

  Future<void> _logoutUser() async {
    try {
      await Purchases.logOut();
      _isPro = false;
      notifyListeners();
    } catch (e) {
      debugPrint('SubscriptionService._logoutUser error: $e');
    }
  }

  // ── Status ─────────────────────────────────────────────────────────────────

  void _updateStatus(CustomerInfo info) {
    final wasProBefore = _isPro;
    _isPro = info.entitlements.all[_entitlementId]?.isActive == true;
    if (_isPro != wasProBefore) notifyListeners();
  }

  // ── Offerings ──────────────────────────────────────────────────────────────

  Future<void> loadOfferings() async {
    try {
      _offerings = await Purchases.getOfferings();
      notifyListeners();
    } catch (e) {
      debugPrint('SubscriptionService.loadOfferings error: $e');
    }
  }

  // ── Purchase ───────────────────────────────────────────────────────────────

  Future<bool> purchasePackage(Package package) async {
    try {
      final customerInfo = await Purchases.purchasePackage(package);
      _updateStatus(customerInfo);
      return isPro;
    } on PlatformException catch (e) {
      final errorCode = PurchasesErrorHelper.getErrorCode(e);
      if (errorCode == PurchasesErrorCode.purchaseCancelledError) {
        // User cancelled — not an error.
        return false;
      }
      debugPrint('SubscriptionService.purchasePackage error: $e');
      rethrow;
    }
  }

  // ── Restore ────────────────────────────────────────────────────────────────

  Future<bool> restorePurchases() async {
    try {
      final info = await Purchases.restorePurchases();
      _updateStatus(info);
      return isPro;
    } catch (e) {
      debugPrint('SubscriptionService.restorePurchases error: $e');
      return false;
    }
  }

  // ── Promo codes ───────────────────────────────────────────────────────────

  /// Returns true if the code is valid and was redeemed successfully.
  Future<bool> redeemCode(String code) async {
    if (_promoCodes.contains(code.trim().toUpperCase())) {
      _promoRedeemed = true;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_promoKey, true);
      notifyListeners();
      return true;
    }
    return false;
  }

  // ── Cleanup ────────────────────────────────────────────────────────────────

  @override
  void dispose() {
    _authSub?.cancel();
    super.dispose();
  }
}
