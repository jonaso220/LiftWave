import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';
import '../../theme/app_theme.dart';
import '../../data/achievement_store.dart';
import '../../data/mock_data.dart';
import '../../data/workout_store.dart';
import '../../data/progress_store.dart';
import '../../models/models.dart';
import '../../services/auth_service.dart';
import '../../services/subscription_service.dart';
import '../paywall/paywall_screen.dart';
import '../progress/progress_screen.dart';

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
    ProgressStore.instance.addListener(_onStoreChanged);
    AchievementStore.instance.addListener(_onStoreChanged);
  }

  @override
  void dispose() {
    WorkoutStore.instance.removeListener(_onStoreChanged);
    ProgressStore.instance.removeListener(_onStoreChanged);
    AchievementStore.instance.removeListener(_onStoreChanged);
    super.dispose();
  }

  void _onStoreChanged() => setState(() {});

  // ── Computed properties ──────────────────────────────────────────────────

  List<Workout> get _weekWorkouts {
    final now = DateTime.now();
    final weekStart = now.subtract(Duration(days: now.weekday - 1));
    final start = DateTime(weekStart.year, weekStart.month, weekStart.day);
    return WorkoutStore.instance.workouts
        .where((w) => !w.date.isBefore(start))
        .toList();
  }

  Workout? get _lastWorkout => WorkoutStore.instance.workouts.isEmpty
      ? null
      : WorkoutStore.instance.workouts.first;

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

  Widget _buildProfileAvatar() {
    final user = FirebaseAuth.instance.currentUser;
    final photoUrl = user?.photoURL;
    final initial = (user?.displayName?.isNotEmpty == true)
        ? user!.displayName![0].toUpperCase()
        : '?';

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        width: 36,
        height: 36,
        child: photoUrl != null
            ? Image.network(
                photoUrl,
                width: 36,
                height: 36,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => _fallbackAvatar(initial),
              )
            : _fallbackAvatar(initial),
      ),
    );
  }

  Widget _fallbackAvatar(String initial) {
    return Container(
      width: 36,
      height: 36,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.accentOrange, AppColors.accentYellow],
        ),
      ),
      child: Center(
        child: Text(initial,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16)),
      ),
    );
  }

  void _showProfileMenu(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final l10n = S.of(context);
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.bgCard,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (ctx) => SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.textMuted.withAlpha(80),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              // User info
              if (user != null) ...[
                _buildProfileAvatar(),
                const SizedBox(height: 12),
                Text(
                  user.displayName ?? '',
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  user.email ?? '',
                  style: const TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 24),
              ],
              // Subscription status
              ListTile(
                leading: Icon(
                  SubscriptionService.instance.isPro
                      ? Icons.workspace_premium_rounded
                      : Icons.star_outline_rounded,
                  color: AppColors.accentYellow,
                ),
                title: Text(
                  SubscriptionService.instance.isPro
                      ? 'LiftWave PRO'
                      : l10n.profile_freePlan,
                  style: const TextStyle(color: AppColors.textPrimary),
                ),
                subtitle: Text(
                  SubscriptionService.instance.isPro
                      ? l10n.profile_proActive
                      : l10n.profile_upgradePro,
                  style: const TextStyle(
                      color: AppColors.textMuted, fontSize: 12),
                ),
                onTap: SubscriptionService.instance.isPro
                    ? null
                    : () {
                        Navigator.pop(ctx);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const PaywallScreen()),
                        );
                      },
              ),
              // Restore purchases
              ListTile(
                leading: const Icon(Icons.restore_rounded,
                    color: AppColors.textSecondary),
                title: Text(l10n.profile_restorePurchases,
                    style: const TextStyle(color: AppColors.textPrimary)),
                onTap: () async {
                  Navigator.pop(ctx);
                  final restored =
                      await SubscriptionService.instance.restorePurchases();
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(restored
                          ? l10n.profile_purchasesRestored
                          : l10n.profile_noPurchasesFound),
                      backgroundColor:
                          restored ? AppColors.accent : AppColors.textMuted,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ));
                  }
                },
              ),
              const Divider(indent: 16, endIndent: 16),
              // Sign out
              ListTile(
                leading: const Icon(Icons.logout_rounded,
                    color: AppColors.textSecondary),
                title: Text(l10n.profile_signOut,
                    style: const TextStyle(color: AppColors.textPrimary)),
                onTap: () async {
                  Navigator.pop(ctx);
                  await AuthService.instance.signOut();
                },
              ),
              // Delete account
              ListTile(
                leading: const Icon(Icons.delete_forever_rounded,
                    color: AppColors.error),
                title: Text(l10n.profile_deleteAccount,
                    style: const TextStyle(color: AppColors.error)),
                onTap: () {
                  Navigator.pop(ctx);
                  _confirmDeleteAccount(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _confirmDeleteAccount(BuildContext context) {
    final l10n = S.of(context);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.bgCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(l10n.profile_deleteTitle,
            style: const TextStyle(color: AppColors.textPrimary)),
        content: Text(
          l10n.profile_deleteConfirm,
          style: const TextStyle(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.common_cancel),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(ctx);
              try {
                await AuthService.instance.deleteAccount();
              } on FirebaseAuthException catch (e) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(AuthService.errorMessage(e.code, S.of(context))),
                      backgroundColor: AppColors.error,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  );
                }
              } catch (_) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(l10n.profile_deleteReauthError),
                      backgroundColor: AppColors.error,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  );
                }
              }
            },
            child: Text(l10n.common_delete,
                style: const TextStyle(color: AppColors.error)),
          ),
        ],
      ),
    );
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

  @override
  Widget build(BuildContext context) {
    final weekWorkouts = _weekWorkouts;
    final lastWorkout = _lastWorkout;
    final totalWeekVolume =
        weekWorkouts.fold(0, (s, w) => s + w.totalVolume);
    final totalWeekDuration =
        weekWorkouts.fold(Duration.zero, (s, w) => s + w.duration);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  _buildGreetingCard(context, weekWorkouts.length)
                      .animate()
                      .fadeIn(duration: 400.ms)
                      .slideY(begin: 0.1, end: 0),
                  const SizedBox(height: 20),
                  _buildStatsRow(
                    context,
                    weekCount: weekWorkouts.length,
                    lastDuration: lastWorkout?.duration,
                    weekVolume: totalWeekVolume,
                    weekDuration: totalWeekDuration,
                  )
                      .animate()
                      .fadeIn(delay: 100.ms, duration: 400.ms)
                      .slideY(begin: 0.1, end: 0),
                  const SizedBox(height: 24),
                  _buildQuickActions(context)
                      .animate()
                      .fadeIn(delay: 200.ms, duration: 400.ms),
                  const SizedBox(height: 24),
                  _buildLastWorkoutCard(context, lastWorkout)
                      .animate()
                      .fadeIn(delay: 300.ms, duration: 400.ms),
                  const SizedBox(height: 24),
                  _buildProgressCard(context)
                      .animate()
                      .fadeIn(delay: 380.ms, duration: 400.ms),
                  const SizedBox(height: 24),
                  _buildAchievements(context)
                      .animate()
                      .fadeIn(delay: 420.ms, duration: 400.ms),
                  const SizedBox(height: 24),
                  _buildRecentExercises(context)
                      .animate()
                      .fadeIn(delay: 460.ms, duration: 400.ms),
                  const SizedBox(height: 32),
                ],
              ),
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
        IconButton(
          icon: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.bgCard,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.notifications_none_rounded,
                color: AppColors.textSecondary, size: 20),
          ),
          onPressed: () {},
        ),
        const SizedBox(width: 8),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: () => _showProfileMenu(context),
            child: _buildProfileAvatar(),
          ),
        ),
      ],
    );
  }

  Widget _buildGreetingCard(BuildContext context, int weekCount) {
    final l10n = S.of(context);
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            _greeting(l10n),
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 6),
          Text(
            weekCount == 0
                ? l10n.home_weekMotivationZero
                : weekCount == 1
                    ? l10n.home_weekMotivationOne
                    : l10n.home_weekMotivationMany(weekCount),
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () => widget.onNavigate(1),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.play_arrow_rounded,
                      color: AppColors.primary, size: 18),
                  const SizedBox(width: 6),
                  Text(
                    l10n.home_startWorkout,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow(
    BuildContext context, {
    required int weekCount,
    required Duration? lastDuration,
    required int weekVolume,
    required Duration weekDuration,
  }) {
    final l10n = S.of(context);
    return Row(
      children: [
        Expanded(
          child: _StatCard(
            icon: Icons.fitness_center_rounded,
            value: '$weekCount',
            label: l10n.home_thisWeek,
            color: AppColors.primary,
            onTap: () => widget.onNavigate(2),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _StatCard(
            icon: Icons.timer_rounded,
            value: weekCount == 0
                ? '—'
                : _formatDuration(weekDuration),
            label: l10n.home_weekTime,
            color: AppColors.accent,
            onTap: () => widget.onNavigate(2),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _StatCard(
            icon: Icons.bar_chart_rounded,
            value: weekCount == 0 ? '—' : '${_formatVolume(weekVolume)} kg',
            label: l10n.home_weekVolume,
            color: AppColors.accentOrange,
            onTap: () => widget.onNavigate(2),
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    final l10n = S.of(context);
    final actions = [
      _QuickAction(
          icon: Icons.fitness_center_rounded,
          label: l10n.nav_train,
          color: AppColors.primary,
          onTap: () => widget.onNavigate(1)),
      _QuickAction(
          icon: Icons.history_rounded,
          label: l10n.nav_history,
          color: AppColors.accent,
          onTap: () => widget.onNavigate(2)),
      _QuickAction(
          icon: Icons.timer_rounded,
          label: l10n.nav_rest,
          color: AppColors.accentOrange,
          onTap: () => widget.onNavigate(3)),
      _QuickAction(
          icon: Icons.menu_book_rounded,
          label: l10n.nav_exercises,
          color: AppColors.accentYellow,
          onTap: () => widget.onNavigate(4)),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.home_quickAccess,
            style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 12),
        Row(
          children: actions
              .map((a) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: GestureDetector(
                        onTap: a.onTap,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          decoration: BoxDecoration(
                            color: a.color.withAlpha(30),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                                color: a.color.withAlpha(64), width: 1),
                          ),
                          child: Column(
                            children: [
                              Icon(a.icon, color: a.color, size: 24),
                              const SizedBox(height: 6),
                              Text(
                                a.label,
                                style: TextStyle(
                                  color: a.color,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildLastWorkoutCard(BuildContext context, Workout? workout) {
    final l10n = S.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(l10n.home_lastWorkout,
                style: Theme.of(context).textTheme.headlineSmall),
            GestureDetector(
              onTap: () => widget.onNavigate(2),
              child: Text(l10n.home_viewAll,
                  style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 13,
                      fontWeight: FontWeight.w600)),
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (workout == null)
          GestureDetector(
            onTap: () => widget.onNavigate(1),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.bgCard,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.bgCardLight, width: 1),
              ),
              child: Column(
                children: [
                  const Icon(Icons.fitness_center_rounded,
                      color: AppColors.textMuted, size: 32),
                  const SizedBox(height: 10),
                  Text(
                    l10n.home_noWorkoutsYet,
                    style: const TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    l10n.home_noWorkoutsSubtitle,
                    style: const TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 12,
                        height: 1.4),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withAlpha(25),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      l10n.home_goToTrain,
                      style: const TextStyle(
                          color: AppColors.primary,
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          )
        else
          GestureDetector(
            onTap: () => widget.onNavigate(2),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.bgCard,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.bgCardLight, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withAlpha(38),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.fitness_center_rounded,
                            color: AppColors.primary, size: 18),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(workout.name,
                                style:
                                    Theme.of(context).textTheme.titleLarge),
                            const SizedBox(height: 2),
                            Text(
                              '${_formatDate(workout.date, l10n)} · ${_formatDuration(workout.duration)}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.chevron_right_rounded,
                          color: AppColors.textMuted),
                    ],
                  ),
                  const SizedBox(height: 14),
                  const Divider(height: 1),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      _WorkoutStat(
                          label: l10n.common_exercises,
                          value: '${workout.exercises.length}'),
                      _WorkoutStat(
                          label: l10n.common_sets,
                          value: '${workout.totalSets}'),
                      _WorkoutStat(
                          label: l10n.common_volume,
                          value: '${_formatVolume(workout.totalVolume)} kg'),
                    ],
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildProgressCard(BuildContext context) {
    final l10n = S.of(context);
    final latest = ProgressStore.instance.latest;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(l10n.home_progress,
                style: Theme.of(context).textTheme.headlineSmall),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const ProgressScreen()),
              ),
              child: Text(l10n.home_viewAll,
                  style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 13,
                      fontWeight: FontWeight.w600)),
            ),
          ],
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ProgressScreen()),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.bgCard,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.bgCardLight, width: 1),
            ),
            child: latest == null
                ? Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.accent.withAlpha(25),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.monitor_weight_outlined,
                            color: AppColors.accent, size: 22),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(l10n.home_noRecordsYet,
                                style: const TextStyle(
                                    color: AppColors.textPrimary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600)),
                            const SizedBox(height: 3),
                            Text(l10n.home_recordWeightMeasures,
                                style: const TextStyle(
                                    color: AppColors.textMuted,
                                    fontSize: 12)),
                          ],
                        ),
                      ),
                      const Icon(Icons.chevron_right_rounded,
                          color: AppColors.textMuted),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.accent.withAlpha(25),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.monitor_weight_outlined,
                                color: AppColors.accent, size: 18),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(l10n.home_latestRecord,
                                    style: const TextStyle(
                                        color: AppColors.textPrimary,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                                const SizedBox(height: 2),
                                Text(
                                  '${latest.date.day}/${latest.date.month}/${latest.date.year}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall,
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.chevron_right_rounded,
                              color: AppColors.textMuted),
                        ],
                      ),
                      const SizedBox(height: 14),
                      const Divider(height: 1),
                      const SizedBox(height: 14),
                      Row(
                        children: [
                          if (latest.weight != null)
                            _ProgressStat(
                                label: l10n.common_weight,
                                value:
                                    '${latest.weight!.toStringAsFixed(1)} kg',
                                color: AppColors.accent),
                          if (latest.waist != null)
                            _ProgressStat(
                                label: l10n.home_waist,
                                value:
                                    '${latest.waist!.toStringAsFixed(1)} cm',
                                color: AppColors.primary),
                          if (latest.chest != null)
                            _ProgressStat(
                                label: l10n.muscle_chest,
                                value:
                                    '${latest.chest!.toStringAsFixed(1)} cm',
                                color: AppColors.accentOrange),
                          if (latest.hips != null)
                            _ProgressStat(
                                label: l10n.home_hips,
                                value:
                                    '${latest.hips!.toStringAsFixed(1)} cm',
                                color: AppColors.accentYellow),
                        ],
                      ),
                    ],
                  ),
          ),
        ),
      ],
    );
  }

  Widget _buildAchievements(BuildContext context) {
    final l10n = S.of(context);
    final achievements = AchievementStore.instance.getAll(l10n);
    final unlockedCount = AchievementStore.instance.unlockedCount;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(l10n.home_achievements,
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(width: 8),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: AppColors.accentYellow.withAlpha(25),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '$unlockedCount/${achievements.length}',
                style: const TextStyle(
                    color: AppColors.accentYellow,
                    fontSize: 12,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: achievements.length,
            separatorBuilder: (_, _) => const SizedBox(width: 10),
            itemBuilder: (_, i) {
              final a = achievements[i];
              return Container(
                width: 85,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: a.isUnlocked
                      ? a.color.withAlpha(20)
                      : AppColors.bgCard,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: a.isUnlocked
                        ? a.color.withAlpha(60)
                        : AppColors.bgCardLight,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(a.icon,
                        color: a.isUnlocked
                            ? a.color
                            : AppColors.textMuted.withAlpha(80),
                        size: 26),
                    const SizedBox(height: 8),
                    Text(
                      a.title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: a.isUnlocked
                            ? AppColors.textPrimary
                            : AppColors.textMuted,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildRecentExercises(BuildContext context) {
    final l10n = S.of(context);
    final recent = mockExercises.take(3).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(l10n.home_exerciseLibrary,
                style: Theme.of(context).textTheme.headlineSmall),
            GestureDetector(
              onTap: () => widget.onNavigate(4),
              child: Text(l10n.home_viewAllExercises,
                  style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 13,
                      fontWeight: FontWeight.w600)),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          l10n.home_exercisesAvailable(mockExercises.length),
          style: const TextStyle(color: AppColors.textMuted, fontSize: 12),
        ),
        const SizedBox(height: 12),
        ...recent.map((ex) => _RecentExerciseItem(
              exercise: ex,
              onTap: () => widget.onNavigate(4),
            )),
      ],
    );
  }
}

// ── Supporting widgets ────────────────────────────────────────────────────────

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.bgCard,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.bgCardLight, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: const TextStyle(
                color: AppColors.textMuted,
                fontSize: 10,
              ),
            ),
          ],
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
          Text(value,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              )),
          const SizedBox(height: 2),
          Text(label,
              style:
                  const TextStyle(color: AppColors.textMuted, fontSize: 11)),
        ],
      ),
    );
  }
}

class _QuickAction {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  _QuickAction({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });
}

class _ProgressStat extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _ProgressStat(
      {required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(value,
              style: TextStyle(
                  color: color,
                  fontSize: 14,
                  fontWeight: FontWeight.w700)),
          const SizedBox(height: 2),
          Text(label,
              style: const TextStyle(
                  color: AppColors.textMuted, fontSize: 10)),
        ],
      ),
    );
  }
}

class _RecentExerciseItem extends StatelessWidget {
  final Exercise exercise;
  final VoidCallback onTap;

  const _RecentExerciseItem({required this.exercise, required this.onTap});

  Color _colorForMuscle(String muscle) {
    switch (muscle) {
      case 'Pecho':
        return AppColors.chest;
      case 'Espalda':
        return AppColors.back;
      case 'Piernas':
        return AppColors.legs;
      case 'Hombros':
        return AppColors.shoulders;
      case 'Brazos':
        return AppColors.arms;
      case 'Core':
        return AppColors.core;
      default:
        return AppColors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _colorForMuscle(exercise.muscleGroup);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.bgCard,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.bgCardLight, width: 1),
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: color.withAlpha(38),
                borderRadius: BorderRadius.circular(10),
              ),
              child:
                  Icon(Icons.fitness_center_rounded, color: color, size: 16),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(exercise.name,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 2),
                  Text(
                      '${exercise.muscleGroup} · ${exercise.equipment} · ${exercise.difficulty}',
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded,
                color: AppColors.textMuted, size: 18),
          ],
        ),
      ),
    );
  }
}
