import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

/// Singleton that manages RevenueCat subscriptions.
/// Follows the same pattern as AuthService / FirebaseService.
class SubscriptionService extends ChangeNotifier {
  SubscriptionService._();
  static final SubscriptionService instance = SubscriptionService._();

  // ── Configuration ──────────────────────────────────────────────────────────

  /// RevenueCat public API key.
  static const _apiKey = 'appl_hFAiSbSftEmUrGJKulhWsHCFYqL';

  /// Entitlement identifier configured in the RevenueCat dashboard.
  static const _entitlementId = 'LiftWave Pro';

  /// Set to true during development to bypass the paywall.
  static const _debugForceProStatus = false;

  // ── State ──────────────────────────────────────────────────────────────────

  bool _isPro = false;
  bool get isPro => _debugForceProStatus || _isPro;

  Offerings? _offerings;
  Offerings? get offerings => _offerings;

  Future<void>? _initialization;

  StreamSubscription<User?>? _authSub;
  Future<void> _authSync = Future<void>.value();
  int _authGeneration = 0;

  // ── Initialisation ─────────────────────────────────────────────────────────

  Future<void> init() => _initialization ??= _initialize();

  Future<void> _initialize() async {
    try {
      await Purchases.configure(PurchasesConfiguration(_apiKey));

      // Listen for entitlement changes from RevenueCat.
      Purchases.addCustomerInfoUpdateListener(_updateStatus);

      // Sync RevenueCat user with Firebase auth state.
      _authSub = FirebaseAuth.instance.authStateChanges().listen((user) {
        _scheduleAuthSync(user);
      });
    } catch (e) {
      debugPrint('SubscriptionService.init error: $e');
    }
  }

  // ── Auth sync ──────────────────────────────────────────────────────────────

  void _scheduleAuthSync(User? user) {
    final generation = ++_authGeneration;
    _authSync = _authSync
        .then((_) async {
          if (generation != _authGeneration) return;
          if (user == null) {
            await _logoutUser(generation);
          } else {
            await _loginUser(user, generation);
          }
        })
        .catchError((Object error) {
          debugPrint('SubscriptionService auth sync error: $error');
        });
  }

  Future<void> _loginUser(User user, int generation) async {
    try {
      // RevenueCat persists its identity between launches. Avoid a redundant
      // logIn call when Firebase resolves to that same cached user.
      if (await Purchases.appUserID == user.uid) {
        final info = await Purchases.getCustomerInfo();
        if (generation == _authGeneration &&
            FirebaseAuth.instance.currentUser?.uid == user.uid) {
          _updateStatus(info);
        }
        return;
      }
      final result = await Purchases.logIn(user.uid);
      if (generation != _authGeneration ||
          FirebaseAuth.instance.currentUser?.uid != user.uid) {
        return;
      }
      _updateStatus(result.customerInfo);
    } catch (e) {
      debugPrint('SubscriptionService._loginUser error: $e');
    }
  }

  Future<void> _logoutUser(int generation) async {
    try {
      if (!await Purchases.isAnonymous) {
        await Purchases.logOut();
      }
      if (generation == _authGeneration &&
          FirebaseAuth.instance.currentUser == null) {
        _isPro = false;
        notifyListeners();
      }
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
    await init();
    try {
      _offerings = await Purchases.getOfferings();
      notifyListeners();
    } catch (e) {
      debugPrint('SubscriptionService.loadOfferings error: $e');
      // Retry once after a short delay (sandbox can be slow).
      try {
        await Future.delayed(const Duration(seconds: 2));
        _offerings = await Purchases.getOfferings();
        notifyListeners();
      } catch (e2) {
        debugPrint('SubscriptionService.loadOfferings retry error: $e2');
      }
    }
  }

  // ── Purchase ───────────────────────────────────────────────────────────────

  Future<bool> purchasePackage(Package package) async {
    await init();
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

  /// Outcome of a restore attempt — lets the UI show specific feedback
  /// instead of a single ambiguous "no purchases found" message.
  Future<RestoreOutcome> restorePurchases() async {
    await init();
    try {
      final info = await Purchases.restorePurchases();
      _updateStatus(info);
      return isPro ? RestoreOutcome.restored : RestoreOutcome.nothingToRestore;
    } on PlatformException catch (e) {
      final code = PurchasesErrorHelper.getErrorCode(e);
      debugPrint(
        'SubscriptionService.restorePurchases error: $code ${e.message}',
      );
      switch (code) {
        case PurchasesErrorCode.networkError:
          return RestoreOutcome.networkError;
        case PurchasesErrorCode.storeProblemError:
        case PurchasesErrorCode.unknownBackendError:
        case PurchasesErrorCode.unexpectedBackendResponseError:
          return RestoreOutcome.storeError;
        default:
          return RestoreOutcome.unknownError;
      }
    } catch (e) {
      debugPrint('SubscriptionService.restorePurchases error: $e');
      return RestoreOutcome.unknownError;
    }
  }

  // ── Cleanup ────────────────────────────────────────────────────────────────

  @override
  void dispose() {
    _authSub?.cancel();
    super.dispose();
  }
}

enum RestoreOutcome {
  restored,
  nothingToRestore,
  networkError,
  storeError,
  unknownError,
}
