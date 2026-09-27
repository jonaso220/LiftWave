import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';
import '../../theme/app_theme.dart';
import '../../utils/exercise_localization.dart';
import '../../utils/routine_days.dart';
import '../../data/custom_template_store.dart';
import '../../data/mock_data.dart';
import '../../data/workout_store.dart';
import '../../data/training_preferences_store.dart';
import '../../models/models.dart';
import '../../services/today_suggestion.dart';
import '../../services/weekly_plan_service.dart';
import '../../services/workout_launcher.dart';
import '../profile/profile_screen.dart';

/// Tab indexes in [MainNavigation].
abstract final class AppTab {
  static const int home = 0;
  static const int train = 1;
  static const int progress = 2;
  static const int profile = 3;
}

/// Home answers one question: what do I train today? It offers a single
/// start button, a one-glance summary of the week and the last workout.
class HomeScreen extends StatefulWidget {
  final void Function(int) onNavigate;

  const HomeScreen({super.key, required this.onNavigate});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WorkoutStore.instance.addListener(_onStoreChanged);
    TrainingPreferencesStore.instance.addListener(_onStoreChanged);
    CustomTemplateStore.instance.addListener(_onStoreChanged);
    WorkoutLauncher.instance.sessionActive.addListener(_onStoreChanged);
  }

  @override
  void dispose() {
    WorkoutStore.instance.removeListener(_onStoreChanged);
    TrainingPreferencesStore.instance.removeListener(_onStoreChanged);
    CustomTemplateStore.instance.removeListener(_onStoreChanged);
    WorkoutLauncher.instance.sessionActive.removeListener(_onStoreChanged);
    super.dispose();
  }

  void _onStoreChanged() {
    if (mounted) setState(() {});
  }

  // ── Computed properties ──────────────────────────────────────────────────

  List<Workout> _weekWorkouts(List<Workout> workouts) {
    final now = DateTime.now();
    final weekStart = now.subtract(Duration(days: now.weekday - 1));
    final start = DateTime(weekStart.year, weekStart.month, weekStart.day);
    return workouts.where((w) => !w.date.isBefore(start)).toList();
  }

  String _greeting(S l10n) {
    final h = DateTime.now().hour;
    final user = FirebaseAuth.instance.currentUser;
    final name = user?.displayName?.split(' ').first ?? '';
    if (h < 12) {
      return name.isNotEmpty
          ? l10n.home_greetingMorning(name)
          : l10n.home_greetingMorningNoName;
    }
    if (h < 19) {
      return name.isNotEmpty
          ? l10n.home_greetingAfternoon(name)
          : l10n.home_greetingAfternoonNoName;
    }
    return name.isNotEmpty
        ? l10n.home_greetingEvening(name)
        : l10n.home_greetingEveningNoName;
  }

  String _formatDuration(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes % 60;
    if (h > 0) return '${h}h ${m}m';
    return '${m}m';
  }

  String _formatVolume(int kg) {
    if (kg >= 1000) return '${(kg / 1000).toStringAsFixed(1)}k';
    return '$kg';
  }

  String _formatDate(DateTime date, S l10n) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final d = DateTime(date.year, date.month, date.day);
    final diff = today.difference(d).inDays;
    if (diff == 0) return l10n.common_today;
    if (diff == 1) return l10n.common_yesterday;
    if (diff < 7) return l10n.common_daysAgo(diff);
    return '${date.day}/${date.month}/${date.year}';
  }

  void _startSuggestion(TodaySuggestion suggestion) {
    switch (suggestion.kind) {
      case TodaySuggestionKind.routineDay:
        WorkoutLauncher.instance.queueRoutineDay(suggestion.day!);
      case TodaySuggestionKind.planSession:
        WorkoutLauncher.instance.queue(suggestion.template!);
      case TodaySuggestionKind.resume:
      case TodaySuggestionKind.planCompleted:
      case TodaySuggestionKind.choose:
        break;
    }
    widget.onNavigate(AppTab.train);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final workouts = WorkoutStore.instance.workouts;
    final weekWorkouts = _weekWorkouts(workouts);
    final lastWorkout = workouts.isEmpty ? null : workouts.first;
    final sessionActive = WorkoutLauncher.instance.sessionActive.value;
    final preferences = TrainingPreferencesStore.instance.preferences;
    final now = DateTime.now();
    final plan = preferences == null
        ? null
        : WeeklyPlanService.build(
            preferences: preferences,
            workouts: workouts,
            exerciseLibrary: mockExercises,
            now: now,
            planName: l10n.weeklyPlan_adaptiveName,
          );
    final suggestion = TodaySuggestion.resolve(
      sessionActive: sessionActive,
      now: now,
      routines: CustomTemplateStore.instance.templates,
      workouts: workouts,
      plan: plan,
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _greeting(l10n),
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _TodayCard(
                    suggestion: suggestion,
                    onStart: () => _startSuggestion(suggestion),
                    onChooseAnother: () => widget.onNavigate(AppTab.train),
                  ),
                  const SizedBox(height: 20),
                  _WeekCard(
                    plan: plan,
                    workoutCount: weekWorkouts.length,
                    duration: _formatDuration(
                      weekWorkouts.fold(
                        Duration.zero,
                        (s, w) => s + w.duration,
                      ),
                    ),
                    volume: _formatVolume(
                      weekWorkouts.fold(0, (s, w) => s + w.totalVolume),
                    ),
                    onTap: () => widget.onNavigate(AppTab.progress),
                    onConfigure: () => openTrainingPreferences(context),
                  ),
                  if (lastWorkout != null) ...[
                    const SizedBox(height: 24),
                    _buildLastWorkout(
                      context,
                      lastWorkout,
                      canRepeat: !sessionActive,
                    ),
                  ],
                ],
              ).animate().fadeIn(duration: 250.ms),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 0,
      floating: true,
      pinned: false,
      toolbarHeight: 64,
      backgroundColor: AppColors.bgDark,
      title: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/icon/icon_1024_transparent.png',
              width: 36,
              height: 36,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            'LiftWave',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Semantics(
            button: true,
            label: S.of(context).nav_profile,
            child: GestureDetector(
              onTap: () => widget.onNavigate(AppTab.profile),
              child: const ProfileAvatar(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLastWorkout(
    BuildContext context,
    Workout workout, {
    required bool canRepeat,
  }) {
    final l10n = S.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              l10n.home_lastWorkout,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            TextButton(
              onPressed: () => widget.onNavigate(AppTab.progress),
              child: Text(l10n.home_viewAll),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.bgCard,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.bgCardLight, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ExerciseLocalization.workoutName(l10n, workout.name),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 2),
              Text(
                '${_formatDate(workout.date, l10n)} · ${_formatDuration(workout.duration)}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  _WorkoutStat(
                    label: l10n.common_exercises,
                    value: '${workout.completedExerciseCount}',
                  ),
                  _WorkoutStat(
                    label: l10n.common_sets,
                    value: '${workout.totalSets}',
                  ),
                  _WorkoutStat(
                    label: l10n.common_volume,
                    value: '${_formatVolume(workout.totalVolume)} kg',
                  ),
                ],
              ),
              if (canRepeat) ...[
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      WorkoutLauncher.instance.queueWorkout(workout);
                      widget.onNavigate(AppTab.train);
                    },
                    icon: const Icon(Icons.replay_rounded, size: 18),
                    label: Text(l10n.home_repeatWorkout),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      side: BorderSide(color: AppColors.primary.withAlpha(76)),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

// ── Supporting widgets ────────────────────────────────────────────────────────

class _TodayCard extends StatelessWidget {
  final TodaySuggestion suggestion;
  final VoidCallback onStart;
  final VoidCallback onChooseAnother;

  const _TodayCard({
    required this.suggestion,
    required this.onStart,
    required this.onChooseAnother,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final (
      String? label,
      String title,
      String? subtitle,
      IconData icon,
      String button,
      bool offerAnother,
    ) = switch (suggestion.kind) {
      TodaySuggestionKind.resume => (
        l10n.home_inProgressTitle,
        l10n.train_inProgress,
        null,
        Icons.play_arrow_rounded,
        l10n.home_continueWorkout,
        false,
      ),
      TodaySuggestionKind.routineDay => (
        l10n.home_todayTitle,
        l10n.train_routineForDay(routineDayLabel(context, suggestion.day!)),
        l10n.weeklyPlan_exerciseCount(suggestion.exerciseCount),
        Icons.play_arrow_rounded,
        l10n.weeklyPlan_start,
        true,
      ),
      TodaySuggestionKind.planSession => (
        l10n.weeklyPlan_nextSession,
        ExerciseLocalization.workoutName(l10n, suggestion.template!.name),
        l10n.weeklyPlan_exerciseCount(suggestion.exerciseCount),
        Icons.play_arrow_rounded,
        l10n.weeklyPlan_start,
        true,
      ),
      TodaySuggestionKind.planCompleted => (
        null,
        l10n.weeklyPlan_completed,
        null,
        Icons.fitness_center_rounded,
        l10n.home_goToTrain,
        false,
      ),
      TodaySuggestionKind.choose => (
        null,
        l10n.train_readyTitle,
        l10n.train_readySubtitle,
        Icons.fitness_center_rounded,
        l10n.home_goToTrain,
        false,
      ),
    };

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null) ...[
            Text(
              label,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.8,
              ),
            ),
            const SizedBox(height: 6),
          ],
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ],
          const SizedBox(height: 18),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: onStart,
              icon: Icon(icon),
              label: Text(button),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          if (offerAnother)
            Center(
              child: TextButton(
                onPressed: onChooseAnother,
                style: TextButton.styleFrom(foregroundColor: Colors.white),
                child: Text(l10n.home_chooseAnother),
              ),
            ),
        ],
      ),
    );
  }
}

class _WeekCard extends StatelessWidget {
  final WeeklyTrainingPlan? plan;
  final int workoutCount;
  final String duration;
  final String volume;
  final VoidCallback onTap;
  final VoidCallback onConfigure;

  const _WeekCard({
    required this.plan,
    required this.workoutCount,
    required this.duration,
    required this.volume,
    required this.onTap,
    required this.onConfigure,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final value = plan;
    final sessions = value == null
        ? (workoutCount == 0
              ? l10n.home_weekMotivationZero
              : workoutCount == 1
              ? l10n.home_weekMotivationOne
              : l10n.home_weekMotivationMany(workoutCount))
        : l10n.weeklyPlan_sessions(
            value.completedWorkouts,
            value.targetWorkouts,
          );

    return Material(
      color: AppColors.bgCard,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.bgCardLight, width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    l10n.home_thisWeek,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.chevron_right_rounded,
                    color: AppColors.textMuted,
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                sessions,
                style: TextStyle(
                  color: value == null
                      ? AppColors.textSecondary
                      : AppColors.primaryLight,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (value != null) ...[
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    minHeight: 6,
                    value: value.adherence,
                    backgroundColor: AppColors.bgCardLight,
                    valueColor: const AlwaysStoppedAnimation(AppColors.accent),
                  ),
                ),
              ],
              if (workoutCount > 0) ...[
                const SizedBox(height: 10),
                Text(
                  '${l10n.home_weekTime}: $duration  ·  ${l10n.home_weekVolume}: $volume kg',
                  style: const TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 12,
                  ),
                ),
              ],
              if (value == null) ...[
                const SizedBox(height: 4),
                TextButton.icon(
                  onPressed: onConfigure,
                  icon: const Icon(Icons.auto_awesome_rounded, size: 16),
                  label: Text(l10n.weeklyPlan_setupTitle),
                  style: TextButton.styleFrom(padding: EdgeInsets.zero),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _WorkoutStat extends StatelessWidget {
  final String label;
  final String value;

  const _WorkoutStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(color: AppColors.textMuted, fontSize: 11),
          ),
        ],
      ),
    );
  }
}
