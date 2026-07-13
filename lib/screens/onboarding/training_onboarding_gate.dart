import 'package:flutter/material.dart';

import '../../data/training_preferences_store.dart';
import '../../navigation/main_navigation.dart';
import '../../theme/app_theme.dart';
import 'training_preferences_screen.dart';

class TrainingOnboardingGate extends StatefulWidget {
  const TrainingOnboardingGate({super.key});

  @override
  State<TrainingOnboardingGate> createState() => _TrainingOnboardingGateState();
}

class _TrainingOnboardingGateState extends State<TrainingOnboardingGate> {
  TrainingPreferencesStore get _store => TrainingPreferencesStore.instance;

  @override
  void initState() {
    super.initState();
    _store.addListener(_onStoreChanged);
  }

  @override
  void dispose() {
    _store.removeListener(_onStoreChanged);
    super.dispose();
  }

  void _onStoreChanged() {
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (!_store.isLoaded) {
      return const Scaffold(
        backgroundColor: AppColors.bgDark,
        body: Center(
          child: CircularProgressIndicator(
            color: AppColors.primary,
            strokeWidth: 2,
          ),
        ),
      );
    }
    if (_store.shouldShowOnboarding) {
      return const TrainingPreferencesScreen();
    }
    return const MainNavigation();
  }
}
