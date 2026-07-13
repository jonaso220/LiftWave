import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data/achievement_store.dart';
import 'data/custom_exercise_store.dart';
import 'data/custom_template_store.dart';
import 'screens/auth/login_screen.dart';
import 'screens/onboarding/training_onboarding_gate.dart';
import 'services/firebase_service.dart';
import 'services/subscription_service.dart';
import 'services/watch_service.dart';
import 'theme/app_theme.dart';
import 'utils/ui_scale.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa Firebase
  await FirebaseService.instance.init();
  WatchService.instance.init();

  GoogleFonts.config.allowRuntimeFetching = true;

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.bgCard,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const LiftWaveApp());

  // Network-backed services must never hold the first Flutter frame hostage.
  // Their listeners notify the UI as soon as cached/cloud state is ready.
  unawaited(_initializeBackgroundServices());
}

Future<void> _initializeBackgroundServices() async {
  try {
    await Future.wait([
      SubscriptionService.instance.init(),
      CustomExerciseStore.instance.load(),
      CustomTemplateStore.instance.load(),
      AchievementStore.instance.load(),
    ]);
  } catch (error) {
    debugPrint('Background service initialization failed: $error');
  }
}

class LiftWaveApp extends StatelessWidget {
  const LiftWaveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LiftWave',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      localizationsDelegates: S.localizationsDelegates,
      supportedLocales: S.supportedLocales,
      // The UI is sized for phone widths, so it reads tiny on a large
      // desktop/tablet window. Scale text up on wide layouts, composing with
      // (not overriding) the OS accessibility text-size setting. Phones
      // (< 850 logical px) are unaffected.
      builder: (context, child) {
        final mq = MediaQuery.of(context);
        final composed =
            mq.textScaler.scale(1.0) * uiScaleForWidth(mq.size.width);
        return MediaQuery(
          data: mq.copyWith(textScaler: TextScaler.linear(composed)),
          child: child!,
        );
      },
      // Auth state drives which screen is shown
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // Waiting for Firebase to resolve auth state
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const _SplashScreen();
          }
          // Logged in → main app
          if (snapshot.hasData) {
            return const TrainingOnboardingGate();
          }
          // Not logged in → login
          return const LoginScreen();
        },
      ),
    );
  }
}

// ── Splash (while Firebase resolves) ─────────────────────────────────────────

class _SplashScreen extends StatelessWidget {
  const _SplashScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.bgDark,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.waves_rounded, color: AppColors.primary, size: 56),
            SizedBox(height: 20),
            CircularProgressIndicator(color: AppColors.primary, strokeWidth: 2),
          ],
        ),
      ),
    );
  }
}
