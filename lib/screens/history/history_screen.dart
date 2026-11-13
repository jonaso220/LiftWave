import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';
import '../../theme/app_theme.dart';
import '../../utils/muscle_colors.dart';
import '../../utils/calendar_days.dart';
import '../../utils/exercise_localization.dart';
import '../../data/mock_data.dart';
import '../../data/training_preferences_store.dart';
import '../../data/workout_store.dart';
import '../../models/models.dart';
import '../../services/weekly_plan_service.dart';
import '../../utils/routine_days.dart';
import '../../utils/weight_units.dart';
import '../home/weekly_plan_card.dart';
import '../profile/profile_screen.dart';
import 'workout_detail_screen.dart';
import '../../utils/date_format.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final TextEditingController _searchCtrl = TextEditingController();
  String _query = '';

  /// Month shown in the calendar, and the day picked in it (which narrows
  /// the list below to that day's workouts).
  DateTime _calendarMonth = startOfMonth(DateTime.now());
  DateTime? _selectedDay;

  void _showMonth(DateTime month) => setState(() {
    _calendarMonth = startOfMonth(month);
    _selectedDay = null;
  });

  void _toggleDay(DateTime day) => setState(() {
    final current = _selectedDay;
    _selectedDay = current != null && isSameCalendarDay(current, day)
        ? null
        : day;
  });

  /// Workouts whose name, or any of their exercises, contain the search
  /// text. Matches what the user sees (translated names) and the stored
  /// names, ignoring case and accents.
  List<Workout> _matching(List<Workout> workouts) {
    final day = _selectedDay;
    if (day != null) {
      workouts = workouts
          .where((workout) => isSameCalendarDay(workout.date, day))
          .toList();
    }
    final query = _foldForSearch(_query.trim());
    if (query.isEmpty) return workouts;
    final l10n = S.of(context);
    bool hit(String text) => _foldForSearch(text).contains(query);
    return workouts
        .where(
          (workout) =>
              hit(workout.name) ||
              hit(ExerciseLocalization.workoutName(l10n, workout.name)) ||
              workout.exercises.any(
                (exercise) =>
                    hit(exercise.name) ||
                    hit(ExerciseLocalization.name(l10n, exercise.name)),
              ),
        )
        .toList();
  }

  @override
  void initState() {
    super.initState();
    WorkoutStore.instance.addListener(_onStoreChanged);
    TrainingPreferencesStore.instance.addListener(_onStoreChanged);
  }

  @override
  void dispose() {
    WorkoutStore.instance.removeListener(_onStoreChanged);
    TrainingPreferencesStore.instance.removeListener(_onStoreChanged);
    _searchCtrl.dispose();
    super.dispose();
  }

  void _onStoreChanged() {
    if (mounted) setState(() {});
  }

  // ── Week stats ─────────────────────────────────────────────────────────────

  List<Workout> get _weekWorkouts {
    final start = startOfWeek(DateTime.now());
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

  // Returns the weekday index (0=Mon … 6=Sun) for each workout this week.
  Set<int> get _trainedDaysThisWeek {
    final start = startOfWeek(DateTime.now());
    return WorkoutStore.instance.workouts
        .where((w) => !w.date.isBefore(start))
        .map((w) => w.date.weekday - 1) // 0=Mon
        .toSet();
  }

  @override
  Widget build(BuildContext context) {
    final allWorkouts = WorkoutStore.instance.workouts;
    final weekWorkouts = _weekWorkouts;
    final populatedDays = RoutineDay.values
        .where(
          (day) => allWorkouts.any((workout) => _dayForWorkout(workout) == day),
        )
        .toList();
    final listedWorkouts = _matching(allWorkouts);
    final preferences = TrainingPreferencesStore.instance.preferences;
    final weeklyPlan = preferences == null
        ? null
        : WeeklyPlanService.build(
            preferences: preferences,
            workouts: allWorkouts,
            exerciseLibrary: mockExercises,
            now: DateTime.now(),
            planName: S.of(context).weeklyPlan_adaptiveName,
          );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ── Week summary card ──────────────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
              child: _WeekSummaryCard(
                workoutCount: weekWorkouts.length,
                totalDuration: _formatWeekDuration(weekWorkouts),
                totalVolume: formatVolume(
                  weekWorkouts.fold(0, (s, w) => s + w.totalVolume),
                  compact: true,
                ),
                trainedDays: _trainedDaysThisWeek,
                todayIndex: DateTime.now().weekday - 1,
              ),
            ),
          ),

          // ── Weekly plan (moved here from Home) ─────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
              child: WeeklyPlanCard(
                plan: weeklyPlan,
                onConfigure: () => openTrainingPreferences(context),
              ),
            ),
          ),

          // ── Section title ──────────────────────────────────────────────────
          if (populatedDays.isNotEmpty)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
                child: Text(
                  S.of(context).history_routinesByDay,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),

          if (populatedDays.isNotEmpty)
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.45,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  final day = populatedDays[index];
                  final workouts = allWorkouts
                      .where((workout) => _dayForWorkout(workout) == day)
                      .toList();
                  return _RoutineDayHistoryCard(
                    day: day,
                    workouts: workouts,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => _RoutineDayHistoryScreen(
                          day: day,
                          visibleWorkoutIds: workouts
                              .map((workout) => workout.id)
                              .toSet(),
                        ),
                      ),
                    ),
                  );
                }, childCount: populatedDays.length),
              ),
            ),

          // ── Calendar ───────────────────────────────────────────────────────
          if (allWorkouts.isNotEmpty) ...[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
                child: Text(
                  S.of(context).history_calendar,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _HistoryCalendar(
                  month: _calendarMonth,
                  workouts: allWorkouts,
                  selectedDay: _selectedDay,
                  onShowMonth: _showMonth,
                  onDayTap: _toggleDay,
                ),
              ),
            ),
          ],

          if (allWorkouts.isNotEmpty)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        S.of(context).history_allWorkouts,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    // The day picked in the calendar; tapping it shows
                    // every workout again.
                    if (_selectedDay != null)
                      InputChip(
                        label: Text(formatShortDate(context, _selectedDay!)),
                        onDeleted: () => setState(() => _selectedDay = null),
                        deleteIconColor: AppColors.textSecondary,
                        backgroundColor: AppColors.primary.withAlpha(40),
                        side: BorderSide(
                          color: AppColors.primary.withAlpha(90),
                        ),
                        labelStyle: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                  ],
                ),
              ),
            ),

          if (allWorkouts.isNotEmpty)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
                child: TextField(
                  controller: _searchCtrl,
                  onChanged: (value) => setState(() => _query = value),
                  onTapOutside: (_) =>
                      FocusManager.instance.primaryFocus?.unfocus(),
                  textInputAction: TextInputAction.search,
                  style: TextStyle(color: AppColors.textPrimary, fontSize: 14),
                  decoration: InputDecoration(
                    hintText: S.of(context).history_searchHint,
                    prefixIcon: Icon(
                      Icons.search_rounded,
                      color: AppColors.textMuted,
                      size: 20,
                    ),
                    suffixIcon: _query.isEmpty
                        ? null
                        : IconButton(
                            tooltip: MaterialLocalizations.of(
                              context,
                            ).deleteButtonTooltip,
                            icon: Icon(
                              Icons.close_rounded,
                              color: AppColors.textMuted,
                              size: 20,
                            ),
                            onPressed: () {
                              _searchCtrl.clear();
                              setState(() => _query = '');
                            },
                          ),
                  ),
                ),
              ),
            ),

          // ── Loading ────────────────────────────────────────────────────────
          // On a new device the history is still coming down from the cloud;
          // "no workouts yet" would read as lost data.
          if (allWorkouts.isEmpty && !WorkoutStore.instance.isLoaded)
            const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.primary,
                  strokeWidth: 2,
                ),
              ),
            ),

          // ── Empty state ────────────────────────────────────────────────────
          if (allWorkouts.isEmpty && WorkoutStore.instance.isLoaded)
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.history_rounded,
                        color: AppColors.textMuted,
                        size: 56,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        S.of(context).history_noWorkoutsYet,
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        S.of(context).history_noWorkoutsSubtitle,
                        style: TextStyle(
                          color: AppColors.textMuted,
                          fontSize: 13,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),

          // ── Workout list ───────────────────────────────────────────────────
          if (allWorkouts.isNotEmpty && listedWorkouts.isEmpty)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Center(
                  child: Text(
                    S.of(context).history_noResults,
                    style: TextStyle(color: AppColors.textMuted, fontSize: 14),
                  ),
                ),
              ),
            ),
          if (listedWorkouts.isNotEmpty) ...[
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  if (index >= listedWorkouts.length) return null;
                  final workout = listedWorkouts[index];
                  // Built lazily while scrolling: a per-index delay made
                  // older workouts show up seconds late.
                  return _WorkoutHistoryCard(workout: workout);
                }, childCount: listedWorkouts.length),
              ),
            ),
          ],

          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
    );
  }

  RoutineDay? _dayForWorkout(Workout workout) => routineDayForHistoryGrouping(
    storedDay: workout.routineDay,
    name: workout.name,
  );
}

// ── Calendar ──────────────────────────────────────────────────────────────────

/// A month at a glance: the days trained are marked, and tapping one shows
/// only that day's workouts in the list.
class _HistoryCalendar extends StatelessWidget {
  final DateTime month;
  final List<Workout> workouts;
  final DateTime? selectedDay;
  final ValueChanged<DateTime> onShowMonth;
  final ValueChanged<DateTime> onDayTap;

  const _HistoryCalendar({
    required this.month,
    required this.workouts,
    required this.selectedDay,
    required this.onShowMonth,
    required this.onDayTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final today = startOfDay(DateTime.now());
    final trained = {
      for (final workout in workouts)
        if (workout.hasCompletedWork) startOfDay(workout.date),
    };
    final oldest = workouts.isEmpty
        ? today
        : workouts
              .map((workout) => workout.date)
              .reduce((a, b) => a.isBefore(b) ? a : b);
    final canGoBack = month.isAfter(startOfMonth(oldest));
    final canGoForward = month.isBefore(startOfMonth(today));

    final title = DateFormat.yMMMM(
      Localizations.localeOf(context).toString(),
    ).format(month);
    final weekdays = [
      l10n.history_dayMon,
      l10n.history_dayTue,
      l10n.history_dayWed,
      l10n.history_dayThu,
      l10n.history_dayFri,
      l10n.history_daySat,
      l10n.history_daySun,
    ];
    final cells = monthGrid(month);
    final material = MaterialLocalizations.of(context);

    return Container(
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 12),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.bgCardLight),
      ),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                tooltip: material.previousMonthTooltip,
                onPressed: canGoBack
                    ? () => onShowMonth(addMonths(month, -1))
                    : null,
                icon: const Icon(Icons.chevron_left_rounded),
                color: AppColors.textSecondary,
                disabledColor: AppColors.bgCardLight,
              ),
              Expanded(
                child: Text(
                  title.isEmpty
                      ? title
                      : '${title[0].toUpperCase()}${title.substring(1)}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              IconButton(
                tooltip: material.nextMonthTooltip,
                onPressed: canGoForward
                    ? () => onShowMonth(addMonths(month, 1))
                    : null,
                icon: const Icon(Icons.chevron_right_rounded),
                color: AppColors.textSecondary,
                disabledColor: AppColors.bgCardLight,
              ),
            ],
          ),
          Row(
            children: [
              for (final label in weekdays)
                Expanded(
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          for (var row = 0; row < cells.length; row += 7)
            Row(
              children: [
                for (final day in cells.sublist(row, row + 7))
                  Expanded(
                    child: day == null
                        ? const SizedBox(height: 42)
                        : _CalendarDay(
                            day: day,
                            trained: trained.contains(day),
                            selected:
                                selectedDay != null &&
                                isSameCalendarDay(selectedDay!, day),
                            isToday: day == today,
                            isFuture: day.isAfter(today),
                            onTap: trained.contains(day)
                                ? () => onDayTap(day)
                                : null,
                          ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}

class _CalendarDay extends StatelessWidget {
  final DateTime day;
  final bool trained;
  final bool selected;
  final bool isToday;
  final bool isFuture;
  final VoidCallback? onTap;

  const _CalendarDay({
    required this.day,
    required this.trained,
    required this.selected,
    required this.isToday,
    required this.isFuture,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color background;
    final Color foreground;
    if (selected) {
      background = AppColors.primary;
      foreground = Colors.white;
    } else if (trained) {
      background = AppColors.accent.withAlpha(46);
      foreground = AppColors.asText(AppColors.accent);
    } else {
      background = Colors.transparent;
      foreground = isFuture ? AppColors.textMuted : AppColors.textSecondary;
    }
    return Semantics(
      button: onTap != null,
      selected: selected,
      label: formatShortDate(context, day),
      child: ExcludeSemantics(
        child: InkResponse(
          onTap: onTap,
          radius: 22,
          child: SizedBox(
            height: 42,
            child: Center(
              child: Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: background,
                  shape: BoxShape.circle,
                  border: isToday && !selected
                      ? Border.all(color: AppColors.primaryLight, width: 1.5)
                      : null,
                ),
                child: Center(
                  child: Text(
                    '${day.day}',
                    style: TextStyle(
                      color: foreground,
                      fontSize: 13,
                      fontWeight: trained || selected
                          ? FontWeight.w700
                          : FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
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
          Text(
            S.of(context).history_weeklySummary,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _SummaryItem(
                value: '$workoutCount',
                label: S.of(context).history_workouts,
                icon: Icons.fitness_center_rounded,
                color: AppColors.primary,
              ),
              _divider(),
              _SummaryItem(
                value: workoutCount == 0 ? '0m' : totalDuration,
                label: S.of(context).history_total,
                icon: Icons.timer_rounded,
                color: AppColors.accent,
              ),
              _divider(),
              _SummaryItem(
                value: workoutCount == 0 ? '0' : totalVolume,
                label: S.of(context).history_volumeKg,
                icon: Icons.bar_chart_rounded,
                color: AppColors.accentOrange,
              ),
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

  const _SummaryItem({
    required this.value,
    required this.label,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(color: AppColors.textMuted, fontSize: 11),
          ),
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
    final days = [
      S.of(context).history_dayMon,
      S.of(context).history_dayTue,
      S.of(context).history_dayWed,
      S.of(context).history_dayThu,
      S.of(context).history_dayFri,
      S.of(context).history_daySat,
      S.of(context).history_daySun,
    ];
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
                  ? const Icon(
                      Icons.check_rounded,
                      color: Colors.white,
                      size: 14,
                    )
                  : Icon(
                      Icons.remove_rounded,
                      color: isToday ? AppColors.primary : AppColors.textMuted,
                      size: 14,
                    ),
            ),
            const SizedBox(height: 4),
            Text(
              days[i],
              style: TextStyle(
                color: isDone ? AppColors.primary : AppColors.textMuted,
                fontSize: 10,
              ),
            ),
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
    final diff = calendarDaysBetween(date, DateTime.now());
    if (diff == 0) return S.of(context).common_today;
    if (diff == 1) return S.of(context).common_yesterday;
    if (diff < 7) return S.of(context).common_daysAgo(diff);
    return formatShortDate(context, date);
  }

  String _formatDuration(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes % 60;
    if (h > 0) return '${h}h ${m}m';
    return '${m}m';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final completedExercises = workout.completedExerciseCount;
    final muscleTags = workout.exercises
        .where((exercise) => exercise.completedSetCount > 0)
        .map((e) => e.muscleGroup)
        .toSet()
        .toList();
    final displayName = ExerciseLocalization.workoutName(l10n, workout.name);
    final dateLabel =
        '${_formatDate(workout.date, context)} · '
        '${_formatDuration(workout.duration)}';

    void openWorkout() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => WorkoutDetailScreen(workout: workout),
        ),
      );
    }

    return Semantics(
      label:
          '$displayName. $dateLabel. '
          '${l10n.train_exerciseCount(completedExercises)}. '
          '${l10n.common_sets}: ${workout.totalSets}. '
          '${l10n.common_volume}: ${formatVolume(workout.totalVolume)}',
      button: true,
      onTap: openWorkout,
      child: ExcludeSemantics(
        child: GestureDetector(
          onTap: openWorkout,
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
                      child: const Icon(
                        Icons.fitness_center_rounded,
                        color: AppColors.primary,
                        size: 18,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            displayName,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            dateLabel,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: AppColors.textMuted,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _HistStat(
                      label: l10n.common_exercises,
                      value: '$completedExercises',
                    ),
                    const SizedBox(width: 12),
                    _HistStat(
                      label: l10n.common_sets,
                      value: '${workout.totalSets}',
                    ),
                    const SizedBox(width: 12),
                    _HistStat(
                      label: l10n.common_volume,
                      value: formatVolume(workout.totalVolume),
                    ),
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
        ),
      ),
    );
  }
}

class _RoutineDayHistoryCard extends StatelessWidget {
  final RoutineDay day;
  final List<Workout> workouts;
  final VoidCallback onTap;

  const _RoutineDayHistoryCard({
    required this.day,
    required this.workouts,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final label = routineDayLabel(context, day);
    final totalExercises = workouts.fold(
      0,
      (sum, workout) => sum + workout.completedExerciseCount,
    );
    return Semantics(
      label:
          '$label. ${l10n.history_sessionCount(workouts.length)}. '
          '${l10n.train_exerciseCount(totalExercises)}',
      button: true,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.bgCard,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.primary.withAlpha(55)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withAlpha(28),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.calendar_view_day_rounded,
                      color: AppColors.primary,
                      size: 18,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.chevron_right_rounded,
                    color: AppColors.textMuted,
                    size: 20,
                  ),
                ],
              ),
              const Spacer(),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                l10n.history_sessionCount(workouts.length),
                style: TextStyle(color: AppColors.textMuted, fontSize: 11),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoutineDayHistoryScreen extends StatefulWidget {
  final RoutineDay day;
  final Set<String> visibleWorkoutIds;

  const _RoutineDayHistoryScreen({
    required this.day,
    required this.visibleWorkoutIds,
  });

  @override
  State<_RoutineDayHistoryScreen> createState() =>
      _RoutineDayHistoryScreenState();
}

class _RoutineDayHistoryScreenState extends State<_RoutineDayHistoryScreen> {
  @override
  void initState() {
    super.initState();
    WorkoutStore.instance.addListener(_onChanged);
  }

  @override
  void dispose() {
    WorkoutStore.instance.removeListener(_onChanged);
    super.dispose();
  }

  void _onChanged() {
    if (mounted) setState(() {});
  }

  List<Workout> get _workouts {
    final workouts = WorkoutStore.instance.workouts
        .where((workout) => widget.visibleWorkoutIds.contains(workout.id))
        .where(
          (workout) =>
              routineDayForHistoryGrouping(
                storedDay: workout.routineDay,
                name: workout.name,
              ) ==
              widget.day,
        )
        .toList();
    workouts.sort(_compareRoutineWorkouts);
    return workouts;
  }

  @override
  Widget build(BuildContext context) {
    final workouts = _workouts;
    final label = routineDayLabel(context, widget.day);
    return Scaffold(
      appBar: AppBar(title: Text(label)),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
        children: [
          Text(
            S.of(context).history_dayRoutineTitle(label),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 4),
          Text(
            S.of(context).history_dayRoutineHint,
            style: TextStyle(
              color: AppColors.textMuted,
              fontSize: 12,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          ...workouts.map((workout) => _WorkoutHistoryCard(workout: workout)),
        ],
      ),
    );
  }
}

int _compareRoutineWorkouts(Workout a, Workout b) {
  final aDay = DateTime(a.date.year, a.date.month, a.date.day);
  final bDay = DateTime(b.date.year, b.date.month, b.date.day);
  final byDate = bDay.compareTo(aDay);
  if (byDate != 0) return byDate;

  final aOrder = a.routineOrder ?? routineOrderFromName(a.name, fallback: 999);
  final bOrder = b.routineOrder ?? routineOrderFromName(b.name, fallback: 999);
  final byOrder = aOrder.compareTo(bOrder);
  return byOrder != 0
      ? byOrder
      : a.name.toLowerCase().compareTo(b.name.toLowerCase());
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
          Text(
            value,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 1),
          Text(
            label,
            style: TextStyle(color: AppColors.textMuted, fontSize: 10),
          ),
        ],
      ),
    );
  }
}

class _SmallMuscleTag extends StatelessWidget {
  final String muscle;

  const _SmallMuscleTag({required this.muscle});

  @override
  Widget build(BuildContext context) {
    final c = colorForMuscle(muscle);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: c.withAlpha(25),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        ExerciseLocalization.muscle(S.of(context), muscle),
        style: TextStyle(
          color: AppColors.asText(c),
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

/// Lower case without Latin accents, so "bulgara" finds "búlgara".
String _foldForSearch(String text) {
  const accented = 'áàäâãéèëêíìïîóòöôõúùüûñç';
  const plain = 'aaaaaeeeeiiiiooooouuuunc';
  final buffer = StringBuffer();
  for (final char in text.toLowerCase().split('')) {
    final index = accented.indexOf(char);
    buffer.write(index == -1 ? char : plain[index]);
  }
  return buffer.toString();
}
