import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';
import '../../theme/app_theme.dart';
import '../../data/workout_store.dart';
import '../../models/models.dart';
import '../../services/subscription_service.dart';
import '../../utils/csv_exporter.dart';
import '../../utils/pro_gate.dart';
import 'workout_detail_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
    WorkoutStore.instance.addListener(_onStoreChanged);
  }

  @override
  void dispose() {
    WorkoutStore.instance.removeListener(_onStoreChanged);
    super.dispose();
  }

  void _onStoreChanged() => setState(() {});

  // ── Week stats ─────────────────────────────────────────────────────────────

  List<Workout> get _weekWorkouts {
    final now = DateTime.now();
    final weekStart = now.subtract(Duration(days: now.weekday - 1));
    final start = DateTime(weekStart.year, weekStart.month, weekStart.day);
    return WorkoutStore.instance.workouts
        .where((w) => !w.date.isBefore(start))
        .toList();
  }

  String _formatWeekDuration(List<Workout> workouts) {
    final total = workouts.fold(0, (s, w) => s + w.duration.inSeconds);
    final h = total ~/ 3600;
    final m = (total % 3600) ~/ 60;
    if (h > 0) return '${h}h ${m}m';
    return '${m}m';
  }

  String _formatVolume(int kg) {
    if (kg >= 1000) return '${(kg / 1000).toStringAsFixed(1)}k';
    return '$kg';
  }

  // Returns the weekday index (0=Mon … 6=Sun) for each workout this week.
  Set<int> get _trainedDaysThisWeek {
    final now = DateTime.now();
    final weekStart = now.subtract(Duration(days: now.weekday - 1));
    final start = DateTime(weekStart.year, weekStart.month, weekStart.day);
    return WorkoutStore.instance.workouts
        .where((w) => !w.date.isBefore(start))
        .map((w) => w.date.weekday - 1) // 0=Mon
        .toSet();
  }

  @override
  Widget build(BuildContext context) {
    final allWorkouts = WorkoutStore.instance.workouts;
    final weekWorkouts = _weekWorkouts;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(S.of(context).history_title),
            floating: true,
            actions: [
              if (WorkoutStore.instance.workouts.isNotEmpty)
                IconButton(
                  onPressed: () => CsvExporter.exportAndShare(S.of(context)),
                  icon: const Icon(Icons.ios_share_rounded, size: 20),
                  tooltip: S.of(context).history_exportCsv,
                ),
            ],
          ),

          // ── Week summary card ──────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
              child: _WeekSummaryCard(
                workoutCount: weekWorkouts.length,
                totalDuration: _formatWeekDuration(weekWorkouts),
                totalVolume:
                    _formatVolume(weekWorkouts.fold(0, (s, w) => s + w.totalVolume)),
                trainedDays: _trainedDaysThisWeek,
                todayIndex: DateTime.now().weekday - 1,
              ),
            ),
          ),

          // ── Section title ──────────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
              child: Text(
                allWorkouts.isEmpty ? '' : S.of(context).history_allWorkouts,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
          ),

          // ── Empty state ────────────────────────────────────────────────────
          if (allWorkouts.isEmpty)
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.history_rounded,
                          color: AppColors.textMuted, size: 56),
                      const SizedBox(height: 16),
                      Text(
                        S.of(context).history_noWorkoutsYet,
                        style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        S.of(context).history_noWorkoutsSubtitle,
                        style: const TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 13,
                            height: 1.5),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),

          // ── Workout list ───────────────────────────────────────────────────
          if (allWorkouts.isNotEmpty) ...[
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final isPro = SubscriptionService.instance.isPro;
                    final displayWorkouts =
                        isPro ? allWorkouts : allWorkouts.take(5).toList();
                    if (index >= displayWorkouts.length) return null;
                    final workout = displayWorkouts[index];
                    return _WorkoutHistoryCard(workout: workout)
                        .animate()
                        .fadeIn(
                            delay: Duration(milliseconds: 60 * index),
                            duration: 300.ms)
                        .slideX(begin: 0.05, end: 0);
                  },
                  childCount: SubscriptionService.instance.isPro
                      ? allWorkouts.length
                      : allWorkouts.length.clamp(0, 5),
                ),
              ),
            ),

            // ── Upgrade banner ──────────────────────────────────────────────
            if (!SubscriptionService.instance.isPro && allWorkouts.length > 5)
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: GestureDetector(
                    onTap: () => requirePro(context),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withAlpha(20),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                            color: AppColors.primary.withAlpha(60)),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.lock_rounded,
                              color: AppColors.primary, size: 20),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  S.of(context).history_limitedHistory,
                                  style: const TextStyle(
                                    color: AppColors.textPrimary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  S.of(context).history_unlockWorkouts(allWorkouts.length),
                                  style: const TextStyle(
                                    color: AppColors.textMuted,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const ProBadge(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],

          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
    );
  }
}

// ── Week summary card ─────────────────────────────────────────────────────────

class _WeekSummaryCard extends StatelessWidget {
  final int workoutCount;
  final String totalDuration;
  final String totalVolume;
  final Set<int> trainedDays;
  final int todayIndex;

  const _WeekSummaryCard({
    required this.workoutCount,
    required this.totalDuration,
    required this.totalVolume,
    required this.trainedDays,
    required this.todayIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.bgCardLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).history_weeklySummary,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(height: 16),
          Row(
            children: [
              _SummaryItem(
                  value: '$workoutCount',
                  label: S.of(context).history_workouts,
                  icon: Icons.fitness_center_rounded,
                  color: AppColors.primary),
              _divider(),
              _SummaryItem(
                  value: workoutCount == 0 ? '0m' : totalDuration,
                  label: S.of(context).history_total,
                  icon: Icons.timer_rounded,
                  color: AppColors.accent),
              _divider(),
              _SummaryItem(
                  value: workoutCount == 0 ? '0' : totalVolume,
                  label: S.of(context).history_volumeKg,
                  icon: Icons.bar_chart_rounded,
                  color: AppColors.accentOrange),
            ],
          ),
          const SizedBox(height: 16),
          _DayStreak(trainedDays: trainedDays, todayIndex: todayIndex),
        ],
      ),
    );
  }

  Widget _divider() => Container(
        width: 1,
        height: 40,
        color: AppColors.bgCardLight,
        margin: const EdgeInsets.symmetric(horizontal: 12),
      );
}

class _SummaryItem extends StatelessWidget {
  final String value;
  final String label;
  final IconData icon;
  final Color color;

  const _SummaryItem(
      {required this.value,
      required this.label,
      required this.icon,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(height: 6),
          Text(value,
              style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w700)),
          const SizedBox(height: 2),
          Text(label,
              style:
                  const TextStyle(color: AppColors.textMuted, fontSize: 11)),
        ],
      ),
    );
  }
}

class _DayStreak extends StatelessWidget {
  final Set<int> trainedDays;
  final int todayIndex;

  const _DayStreak({required this.trainedDays, required this.todayIndex});

  @override
  Widget build(BuildContext context) {
    final days = [S.of(context).history_dayMon, S.of(context).history_dayTue, S.of(context).history_dayWed, S.of(context).history_dayThu, S.of(context).history_dayFri, S.of(context).history_daySat, S.of(context).history_daySun];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(7, (i) {
        final isDone = trainedDays.contains(i);
        final isToday = i == todayIndex;
        return Column(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: isDone
                    ? AppColors.primary
                    : isToday
                        ? AppColors.bgCardLight
                        : AppColors.bgDark,
                borderRadius: BorderRadius.circular(8),
                border: isToday && !isDone
                    ? Border.all(color: AppColors.primary, width: 1.5)
                    : null,
              ),
              child: isDone
                  ? const Icon(Icons.check_rounded,
                      color: Colors.white, size: 14)
                  : Center(
                      child: Text(
                        days[i],
                        style: TextStyle(
                          color: isToday
                              ? AppColors.primary
                              : AppColors.textMuted,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
            ),
            const SizedBox(height: 4),
            Text(days[i],
                style: TextStyle(
                  color: isDone ? AppColors.primary : AppColors.textMuted,
                  fontSize: 10,
                )),
          ],
        );
      }),
    );
  }
}

// ── Workout history card ──────────────────────────────────────────────────────

class _WorkoutHistoryCard extends StatelessWidget {
  final Workout workout;

  const _WorkoutHistoryCard({required this.workout});

  String _formatDate(DateTime date, BuildContext context) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final d = DateTime(date.year, date.month, date.day);
    final diff = today.difference(d).inDays;
    if (diff == 0) return S.of(context).common_today;
    if (diff == 1) return S.of(context).common_yesterday;
    if (diff < 7) return S.of(context).common_daysAgo(diff);
    return '${date.day}/${date.month}/${date.year}';
  }

  String _formatDuration(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes % 60;
    if (h > 0) return '${h}h ${m}m';
    return '${m}m';
  }

  @override
  Widget build(BuildContext context) {
    final muscleTags = workout.exercises
        .map((e) => e.muscleGroup)
        .toSet()
        .toList();

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => WorkoutDetailScreen(workout: workout),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
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
                    color: AppColors.primary.withAlpha(30),
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
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 2),
                      Text(
                        '${_formatDate(workout.date, context)} · ${_formatDuration(workout.duration)}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right_rounded,
                    color: AppColors.textMuted),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _HistStat(
                    label: S.of(context).common_exercises,
                    value: '${workout.exercises.length}'),
                const SizedBox(width: 12),
                _HistStat(
                    label: S.of(context).common_sets, value: '${workout.totalSets}'),
                const SizedBox(width: 12),
                _HistStat(
                    label: S.of(context).common_volume, value: '${workout.totalVolume} kg'),
              ],
            ),
            if (muscleTags.isNotEmpty) ...[
              const SizedBox(height: 10),
              Wrap(
                spacing: 6,
                children: muscleTags
                    .map((m) => _SmallMuscleTag(muscle: m))
                    .toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

// ── Small helpers ─────────────────────────────────────────────────────────────

class _HistStat extends StatelessWidget {
  final String label;
  final String value;

  const _HistStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.bgCardLight,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(value,
              style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 13,
                  fontWeight: FontWeight.w700)),
          const SizedBox(height: 1),
          Text(label,
              style:
                  const TextStyle(color: AppColors.textMuted, fontSize: 10)),
        ],
      ),
    );
  }
}

class _SmallMuscleTag extends StatelessWidget {
  final String muscle;

  const _SmallMuscleTag({required this.muscle});

  Color _color() {
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
    final c = _color();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: c.withAlpha(25),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(muscle,
          style:
              TextStyle(color: c, fontSize: 10, fontWeight: FontWeight.w600)),
    );
  }
}
