import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

import 'data/achievement_store.dart';
import 'data/custom_exercise_store.dart';
import 'data/custom_template_store.dart';
import 'navigation/main_navigation.dart';
import 'screens/auth/login_screen.dart';
import 'services/firebase_service.dart';
import 'services/subscription_service.dart';
import 'services/watch_service.dart';
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa Firebase
  await FirebaseService.instance.init();
  await SubscriptionService.instance.init();
  WatchService.instance.init();
  await CustomExerciseStore.instance.load();
  await CustomTemplateStore.instance.load();
  await AchievementStore.instance.load();

  GoogleFonts.config.allowRuntimeFetching = true;

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: AppColors.bgCard,
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  runApp(const LiftWaveApp());
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
            return const MainNavigation();
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
            CircularProgressIndicator(
              color: AppColors.primary,
              strokeWidth: 2,
            ),
          ],
        ),
      ),
    );
  }
}
