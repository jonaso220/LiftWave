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
import 'services/screen_awake_service.dart';
import 'services/theme_controller.dart';
import 'services/watch_service.dart';
import 'theme/app_theme.dart';
import 'utils/ui_scale.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa Firebase
  await FirebaseService.instance.init();
  WatchService.instance.init();

  GoogleFonts.config.allowRuntimeFetching = true;

  // Resolve the palette before the first frame so the app never flashes the
  // wrong theme.
  await ThemeController.instance.load();
  AppColors.usePalette(
    ThemeController.paletteFor(
      ThemeController.instance.mode,
      WidgetsBinding.instance.platformDispatcher.platformBrightness,
    ),
  );
  _applySystemBars();
  runApp(const LiftWaveApp());

  // Network-backed services must never hold the first Flutter frame hostage.
  // Their listeners notify the UI as soon as cached/cloud state is ready.
  unawaited(_initializeBackgroundServices());
}

void _applySystemBars() {
  final isDark = AppColors.brightness == Brightness.dark;
  final icons = isDark ? Brightness.light : Brightness.dark;
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: icons,
      statusBarBrightness: AppColors.brightness,
      systemNavigationBarColor: AppColors.bgCard,
      systemNavigationBarIconBrightness: icons,
    ),
  );
}

Future<void> _initializeBackgroundServices() async {
  try {
    await Future.wait([
      ScreenAwakeService.instance.init(),
      SubscriptionService.instance.init(),
      CustomExerciseStore.instance.load(),
      CustomTemplateStore.instance.load(),
      AchievementStore.instance.load(),
    ]);
  } catch (error) {
    debugPrint('Background service initialization failed: $error');
  }
}

class LiftWaveApp extends StatefulWidget {
  const LiftWaveApp({super.key});

  @override
  State<LiftWaveApp> createState() => _LiftWaveAppState();
}

class _LiftWaveAppState extends State<LiftWaveApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    ThemeController.instance.addListener(_applyTheme);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    ThemeController.instance.removeListener(_applyTheme);
    super.dispose();
  }

  /// "Automático" follows the phone's light/dark setting while the app runs.
  @override
  void didChangePlatformBrightness() => _applyTheme();

  void _applyTheme() {
    final palette = ThemeController.paletteFor(
      ThemeController.instance.mode,
      WidgetsBinding.instance.platformDispatcher.platformBrightness,
    );
    if (identical(palette, AppColors.palette)) return;
    AppColors.usePalette(palette);
    _applySystemBars();
    // Screens read AppColors while building, not from Theme, so rebuild every
    // element (open routes included). State is kept: an active workout, the
    // selected tab and the navigation stack all survive the switch.
    void rebuild(Element element) {
      element.markNeedsBuild();
      element.visitChildren(rebuild);
    }

    (context as Element).visitChildren(rebuild);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LiftWave',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.current,
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
    return Scaffold(
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
