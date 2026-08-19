import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';
import '../../data/achievement_store.dart';
import '../../data/active_workout_store.dart';
import '../../data/custom_template_store.dart';
import '../../data/mock_data.dart';
import '../../data/training_preferences_store.dart';
import '../../models/achievement_models.dart';
import '../../data/workout_templates.dart';
import '../../models/session_models.dart';
import '../../models/models.dart';
import '../../models/training_preferences.dart';
import '../../data/workout_store.dart';
import '../exercises/exercise_progress_sheet.dart';
import '../../services/rest_timer_controller.dart';
import '../../services/progression_service.dart';
import '../../services/watch_service.dart';
import '../../services/weekly_plan_service.dart';
import '../../services/workout_launcher.dart';
import '../../theme/app_theme.dart';
import '../../utils/exercise_localization.dart';
import '../../utils/muscle_colors.dart';
import '../../utils/pro_gate.dart';
import '../../utils/routine_days.dart';
import '../../widgets/common/muscle_chip.dart';
import '../../widgets/rest_timer_overlay.dart';
import 'exercise_picker_screen.dart';
import 'routine_builder_screen.dart';

part 'train_screen_templates.dart';
part 'train_screen_cards.dart';

int _compareRoutineTemplates(CustomTemplate a, CustomTemplate b) {
  final aOrder = a.routineOrder ?? routineOrderFromName(a.name, fallback: 999);
  final bOrder = b.routineOrder ?? routineOrderFromName(b.name, fallback: 999);
  final byOrder = aOrder.compareTo(bOrder);
  return byOrder != 0
      ? byOrder
      : a.name.toLowerCase().compareTo(b.name.toLowerCase());
}

class TrainScreen extends StatefulWidget {
  final VoidCallback? onSessionRestored;

  const TrainScreen({super.key, this.onSessionRestored});

  @override
  State<TrainScreen> createState() => _TrainScreenState();
}

class _TrainScreenState extends State<TrainScreen> with WidgetsBindingObserver {
  bool _workoutStarted = false;
  bool _timerRunning = false;
  Timer? _timer;
  int _elapsedSeconds = 0;
  final List<SessionExercise> _exercises = [];
  String? _workoutName; // null → 'Entrenamiento libre'
  String? _routineDay;
  int? _routineOrder;
  WorkoutLaunchSource _launchSource = WorkoutLaunchSource.freeSession;
  DateTime? _startedAt;
  bool _restoreChecked = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    CustomTemplateStore.instance.addListener(_onTemplatesChanged);
    WorkoutLauncher.instance.addListener(_onLauncherChanged);
    WatchService.instance.onWatchCommand = _handleWatchCommand;
    // Consume any template queued before this screen mounted (e.g. tapped on
    // Home before navigating).
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkForActiveSessionToRestore().then((_) {
        _consumePendingTemplate();
      });
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    CustomTemplateStore.instance.removeListener(_onTemplatesChanged);
    WorkoutLauncher.instance.removeListener(_onLauncherChanged);
    if (WatchService.instance.onWatchCommand == _handleWatchCommand) {
      WatchService.instance.onWatchCommand = null;
    }
    _timer?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!_workoutStarted) return;
    switch (state) {
      case AppLifecycleState.resumed:
        _catchUpFromClock(syncWatch: true);
        RestTimerController.instance.syncFromClock();
      case AppLifecycleState.inactive:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        _catchUpFromClock(syncWatch: false);
        RestTimerController.instance.syncFromClock();
        _persistActiveWorkout();
      case AppLifecycleState.detached:
        break;
    }
  }

  Future<void> _checkForActiveSessionToRestore() async {
    if (_restoreChecked) return;
    _restoreChecked = true;
    final snapshot = await ActiveWorkoutStore.instance.load();
    if (snapshot == null || !mounted) return;

    final l10n = S.of(context);
    final shouldRestore = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.bgCard,
        title: Text(
          l10n.train_resumeTitle,
          style: const TextStyle(color: AppColors.textPrimary),
        ),
        content: Text(
          l10n.train_resumeBody(snapshot.workoutName ?? l10n.train_freeWorkout),
          style: const TextStyle(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(
              l10n.train_resumeDiscard,
              style: const TextStyle(color: AppColors.error),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              l10n.train_resumeContinue,
              style: const TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );

    if (!mounted) return;
    if (shouldRestore == true) {
      _restoreFromSnapshot(snapshot);
      widget.onSessionRestored?.call();
    } else {
      await ActiveWorkoutStore.instance.clear();
    }
  }

  void _restoreFromSnapshot(ActiveWorkoutSnapshot snap) {
    setState(() {
      _exercises
        ..clear()
        ..addAll(snap.exercises);
      _workoutName = snap.workoutName;
      _routineDay = snap.routineDay;
      _routineOrder = snap.routineOrder;
      _launchSource = snap.launchSource;
      _workoutStarted = true;
      _startedAt = snap.startedAt;
      _elapsedSeconds = snap.elapsedAt(DateTime.now());
      _timerRunning = snap.timerRunning;
    });
    _syncWatch();
    if (_timerRunning) _scheduleWorkoutTimer();
    _persistActiveWorkout();
  }

  void _persistActiveWorkout() {
    ActiveWorkoutStore.instance.save(
      workoutStarted: _workoutStarted,
      timerRunning: _timerRunning,
      startedAt: _startedAt,
      elapsedSeconds: _elapsedSeconds,
      workoutName: _workoutName,
      routineDay: _routineDay,
      routineOrder: _routineOrder,
      launchSource: _launchSource,
      exercises: _exercises,
    );
  }

  void _onTemplatesChanged() => setState(() {});

  RoutineDay? _dayForTemplate(CustomTemplate template) =>
      RoutineDay.fromStorage(template.routineDay) ??
      routineDayFromName(template.name);

  List<CustomTemplate> _templatesForDay(RoutineDay day) {
    final result = CustomTemplateStore.instance.templates
        .where((template) => _dayForTemplate(template) == day)
        .toList();
    result.sort(_compareRoutineTemplates);
    return result;
  }

  int _nextRoutineOrder(RoutineDay day) {
    final orders = _templatesForDay(day).map(
      (template) =>
          template.routineOrder ??
          routineOrderFromName(template.name, fallback: 0),
    );
    return orders.isEmpty ? 1 : orders.reduce((a, b) => a > b ? a : b) + 1;
  }

  Future<void> _createRoutine({RoutineDay? initialDay}) async {
    final l10n = S.of(context);
    final order = initialDay == null ? null : _nextRoutineOrder(initialDay);
    final template = await Navigator.push<CustomTemplate>(
      context,
      MaterialPageRoute(
        builder: (_) => RoutineBuilderScreen(
          initialDay: initialDay,
          routineOrder: order,
          initialName: order == null
              ? l10n.train_defaultRoutineName
              : '${l10n.train_defaultRoutineName} $order',
        ),
      ),
    );
    if (template == null || !mounted) return;

    await CustomTemplateStore.instance.add(template);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.train_routineSaved(template.name)),
        backgroundColor: AppColors.bgCardLight,
      ),
    );
  }

  Future<void> _editRoutine(CustomTemplate template) async {
    final updated = await Navigator.push<CustomTemplate>(
      context,
      MaterialPageRoute(
        builder: (_) => RoutineBuilderScreen(
          initialName: template.name,
          initialDay: _dayForTemplate(template),
          routineOrder: template.routineOrder,
          initialTemplate: template,
        ),
      ),
    );
    if (updated == null || !mounted) return;

    await CustomTemplateStore.instance.update(updated);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(S.of(context).train_routineUpdated(updated.name)),
        backgroundColor: AppColors.bgCardLight,
      ),
    );
  }

  void _onLauncherChanged() => _consumePendingTemplate();

  void _handleWatchCommand(String type, Map<String, dynamic> data) {
    final restTimer = RestTimerController.instance;
    switch (type) {
      case 'startTimer':
        restTimer.resume(seconds: (data['timerDuration'] as num?)?.toInt());
        break;
      case 'stopTimer':
        restTimer.pause();
        break;
      case 'resetTimer':
        restTimer.reset();
        break;
      case 'setTimer':
        final seconds = (data['timerDuration'] as num?)?.toInt();
        if (seconds != null && seconds > 0) restTimer.selectPreset(seconds);
        break;
    }
  }

  void _consumePendingTemplate() {
    if (_workoutStarted) return;
    final template = WorkoutLauncher.instance.consumeTemplate();
    if (template != null) {
      unawaited(_startQueuedTemplate(template));
      return;
    }
    final workout = WorkoutLauncher.instance.consumeWorkout();
    if (workout != null) {
      _startFromWorkout(workout);
    }
  }

  Future<void> _startQueuedTemplate(WorkoutTemplate template) async {
    final isPaidBuiltIn = template.id.startsWith('tpl_') && !template.isFree;
    if (isPaidBuiltIn && !await requirePro(context)) return;
    if (!mounted) return;
    final personalized = _personalizeTemplate(template);
    if (personalized.exercises.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).weeklyPlan_noCompatible),
          backgroundColor: AppColors.bgCardLight,
        ),
      );
      return;
    }
    _startFromTemplate(personalized);
  }

  void _startFromWorkout(Workout w) {
    setState(() {
      _exercises.clear();
      for (final ex in w.exercises) {
        final lastWeight = _lastWeightFor(ex.name);
        _exercises.add(
          SessionExercise(
            id: '${w.id}_${ex.name}_${DateTime.now().millisecondsSinceEpoch}',
            name: ex.name,
            muscleGroup: ex.muscleGroup,
            equipment: '',
            routineBlockName: ex.routineBlockName,
            sets: ex.sets
                .map(
                  (s) =>
                      SessionSet(reps: s.reps, weight: lastWeight ?? s.weight),
                )
                .toList(),
          ),
        );
      }
    });
    _startWorkout(
      name: w.name,
      routineDay: w.routineDay,
      routineOrder: w.routineOrder,
      launchSource: WorkoutLaunchSource.workoutHistory,
    );
  }

  void _syncWatch() {
    if (!mounted) return;
    final l10n = S.of(context);
    WatchService.instance.updateWorkoutState(
      active: _workoutStarted,
      name: _workoutName == null
          ? l10n.train_freeWorkout
          : ExerciseLocalization.workoutName(l10n, _workoutName!),
      elapsedSeconds: _elapsedSeconds,
      exercises: _exercises
          .map(
            (e) => {
              'id': e.id,
              'name': ExerciseLocalization.name(l10n, e.name),
              'muscleGroup': ExerciseLocalization.muscle(l10n, e.muscleGroup),
              'completedSets': e.completedSets,
              'totalSets': e.sets.length,
            },
          )
          .toList(),
    );
  }

  /// Rebuilds elapsed time from [_startedAt] so a suspended Dart ticker does
  /// not freeze the session clock after the phone is locked.
  void _catchUpFromClock({required bool syncWatch}) {
    if (!_timerRunning || _startedAt == null) return;
    final elapsed = DateTime.now()
        .difference(_startedAt!)
        .inSeconds
        .clamp(0, 86400);
    if (elapsed == _elapsedSeconds) return;
    if (mounted) {
      setState(() => _elapsedSeconds = elapsed);
    } else {
      _elapsedSeconds = elapsed;
    }
    if (syncWatch) _syncWatch();
  }

  // ── Workout control ──────────────────────────────────────────────────────

  void _startWorkout({
    String? name,
    String? routineDay,
    int? routineOrder,
    WorkoutLaunchSource launchSource = WorkoutLaunchSource.freeSession,
  }) {
    final now = DateTime.now();
    setState(() {
      _workoutStarted = true;
      _workoutName = name;
      _routineDay = routineDay;
      _routineOrder = routineOrder;
      _launchSource = launchSource;
      _elapsedSeconds = 0;
      _timerRunning = true;
      _startedAt = now;
    });
    _scheduleWorkoutTimer();
    HapticFeedback.lightImpact();
    _syncWatch();
    _persistActiveWorkout();
  }

  void _scheduleWorkoutTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!_timerRunning || _startedAt == null) return;
      final elapsed = DateTime.now()
          .difference(_startedAt!)
          .inSeconds
          .clamp(0, 86400);
      if (elapsed == _elapsedSeconds) return;
      final crossedFive = elapsed ~/ 5 != _elapsedSeconds ~/ 5;
      final crossedTen = elapsed ~/ 10 != _elapsedSeconds ~/ 10;
      setState(() => _elapsedSeconds = elapsed);
      if (crossedFive) _syncWatch();
      if (crossedTen) _persistActiveWorkout();
    });
  }

  void _startTimer() {
    if (_timerRunning) return;
    HapticFeedback.lightImpact();
    setState(() {
      _timerRunning = true;
      _startedAt = DateTime.now().subtract(Duration(seconds: _elapsedSeconds));
    });
    _syncWatch();
    _persistActiveWorkout();
    _scheduleWorkoutTimer();
  }

  void _startFromTemplate(WorkoutTemplate t) {
    setState(() {
      _exercises.clear();
      for (final ex in t.exercises) {
        final lastWeight = _lastWeightFor(ex.name, equipment: ex.equipment);
        _exercises.add(
          SessionExercise(
            id: '${t.id}_${ex.name}_${DateTime.now().millisecondsSinceEpoch}',
            name: ex.name,
            muscleGroup: ex.muscleGroup,
            equipment: ex.equipment,
            sets: List.generate(
              ex.sets,
              (_) => SessionSet(reps: ex.reps, weight: lastWeight ?? 0),
            ),
          ),
        );
      }
    });
    _startWorkout(name: t.name, launchSource: WorkoutLaunchSource.savedRoutine);
  }

  void _startFromCustomTemplate(CustomTemplate t) {
    setState(() {
      _exercises.clear();
      for (final ex in t.exercises) {
        final lastWeight = _lastWeightFor(ex.name, equipment: ex.equipment);
        _exercises.add(
          SessionExercise(
            id: '${t.id}_${ex.name}_${DateTime.now().millisecondsSinceEpoch}',
            name: ex.name,
            muscleGroup: ex.muscleGroup,
            equipment: ex.equipment,
            routineBlockName: t.name,
            sets: List.generate(
              ex.sets,
              (_) => SessionSet(reps: ex.reps, weight: lastWeight ?? ex.weight),
            ),
          ),
        );
      }
    });
    _startWorkout(
      name: t.name,
      routineDay: t.routineDay,
      routineOrder: t.routineOrder,
      launchSource: WorkoutLaunchSource.savedRoutine,
    );
  }

  void _startRoutineDay(RoutineDay day, List<CustomTemplate> blocks) {
    final sorted = [...blocks]..sort(_compareRoutineTemplates);
    setState(() {
      _exercises.clear();
      for (final block in sorted) {
        for (final ex in block.exercises) {
          final lastWeight = _lastWeightFor(ex.name, equipment: ex.equipment);
          _exercises.add(
            SessionExercise(
              id: '${block.id}_${ex.name}_${DateTime.now().microsecondsSinceEpoch}',
              name: ex.name,
              muscleGroup: ex.muscleGroup,
              equipment: ex.equipment,
              routineBlockName: block.name,
              sets: List.generate(
                ex.sets,
                (_) =>
                    SessionSet(reps: ex.reps, weight: lastWeight ?? ex.weight),
              ),
            ),
          );
        }
      }
    });
    _startWorkout(
      name: S.of(context).train_routineForDay(routineDayLabel(context, day)),
      routineDay: day.storageKey,
      launchSource: WorkoutLaunchSource.savedRoutine,
    );
  }

  void _cancelWorkout() {
    final hasProgress =
        _timerRunning ||
        _elapsedSeconds > 0 ||
        _exercises.any((e) => e.sets.any((s) => s.completed));
    if (!hasProgress) {
      // Nothing to lose — exit immediately.
      _resetWorkoutState();
      return;
    }
    final l10n = S.of(context);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.bgCard,
        title: Text(
          l10n.train_cancelWorkout,
          style: const TextStyle(color: AppColors.textPrimary),
        ),
        content: Text(
          l10n.train_cancelConfirm,
          style: const TextStyle(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(
              l10n.train_continue,
              style: const TextStyle(color: AppColors.primary),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              _resetWorkoutState();
            },
            child: Text(
              l10n.common_cancel,
              style: const TextStyle(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
  }

  void _resetWorkoutState() {
    _timer?.cancel();
    RestTimerController.instance.dismiss();
    setState(() {
      _workoutStarted = false;
      _timerRunning = false;
      _workoutName = null;
      _routineDay = null;
      _routineOrder = null;
      _launchSource = WorkoutLaunchSource.freeSession;
      _exercises.clear();
      _elapsedSeconds = 0;
      _startedAt = null;
    });
    _syncWatch();
    ActiveWorkoutStore.instance.clear();
  }

  void _finishWorkout() {
    if (_exercises.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).train_addExerciseFirst),
          backgroundColor: AppColors.bgCardLight,
        ),
      );
      return;
    }
    final completedSets = _exercises.fold<int>(
      0,
      (total, exercise) => total + exercise.completedSets,
    );
    if (completedSets == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).train_completeSetFirst),
          backgroundColor: AppColors.bgCardLight,
        ),
      );
      return;
    }
    _timer?.cancel();
    setState(() {
      _timerRunning = false;
      _startedAt = null;
    });
    _persistActiveWorkout();
    _showSummaryDialog();
  }

  void _showSummaryDialog() {
    final l10n = S.of(context);
    final totalSets = _exercises.fold(0, (s, e) => s + e.sets.length);
    final totalVolume = _exercises.fold(0, (s, e) => s + e.totalVolume);
    final completedSets = _exercises.fold(0, (s, e) => s + e.completedSets);
    final completedExercises = _exercises
        .where((exercise) => exercise.completedSets > 0)
        .length;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.bgCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            const Icon(
              Icons.emoji_events_rounded,
              color: AppColors.accentYellow,
              size: 24,
            ),
            const SizedBox(width: 8),
            Text(
              l10n.train_workoutCompleted,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_workoutName != null) ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary.withAlpha(25),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  ExerciseLocalization.workoutName(l10n, _workoutName!),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
            const SizedBox(height: 4),
            _SummaryStat(
              icon: Icons.timer_rounded,
              label: l10n.common_duration,
              value: _formatTime(_elapsedSeconds),
              color: AppColors.accent,
            ),
            const SizedBox(height: 8),
            _SummaryStat(
              icon: Icons.fitness_center_rounded,
              label: l10n.common_exercises,
              value: '$completedExercises',
              color: AppColors.primary,
            ),
            const SizedBox(height: 8),
            _SummaryStat(
              icon: Icons.repeat_rounded,
              label: l10n.train_completedSets,
              value: '$completedSets / $totalSets',
              color: AppColors.accentOrange,
            ),
            const SizedBox(height: 8),
            _SummaryStat(
              icon: Icons.bar_chart_rounded,
              label: l10n.train_totalVolume,
              value: '$totalVolume kg',
              color: AppColors.accentYellow,
            ),
          ],
        ),
        actions: [
          Column(
            children: [
              if (_launchSource.canSaveAsRoutine) ...[
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () => _saveAsTemplate(ctx),
                    icon: const Icon(Icons.bookmark_add_rounded, size: 18),
                    label: Text(l10n.train_saveAsRoutine),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.accentOrange,
                      side: const BorderSide(color: AppColors.accentOrange),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 11),
                      textStyle: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
              ],
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _saveWorkout();
                    final newAchievements = AchievementStore.instance
                        .checkAfterWorkout(S.of(ctx));
                    Navigator.pop(ctx);
                    RestTimerController.instance.dismiss();
                    setState(() {
                      _workoutStarted = false;
                      _timerRunning = false;
                      _workoutName = null;
                      _routineDay = null;
                      _routineOrder = null;
                      _launchSource = WorkoutLaunchSource.freeSession;
                      _exercises.clear();
                      _elapsedSeconds = 0;
                      _startedAt = null;
                    });
                    _syncWatch();
                    ActiveWorkoutStore.instance.clear();
                    if (newAchievements.isNotEmpty) {
                      _showAchievementPopup(newAchievements);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Text(
                    l10n.train_finish,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _saveWorkout() {
    final l10n = S.of(context);
    final workout = Workout(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: _workoutName ?? l10n.train_freeWorkout,
      date: DateTime.now(),
      duration: Duration(seconds: _elapsedSeconds),
      exercises: _exercises
          .map(
            (e) => WorkoutExercise(
              id: e.id,
              name: e.name,
              muscleGroup: e.muscleGroup,
              notes: e.notes,
              routineBlockName: e.routineBlockName,
              sets: e.sets
                  .asMap()
                  .entries
                  .map(
                    (entry) => WorkoutSet(
                      setNumber: entry.key + 1,
                      reps: entry.value.reps,
                      weight: entry.value.weight,
                      completed: entry.value.completed,
                    ),
                  )
                  .toList(),
            ),
          )
          .toList(),
      totalVolume: _exercises.fold(0, (s, e) => s + e.totalVolume),
      routineDay: _routineDay,
      routineOrder: _routineOrder,
    );
    WorkoutStore.instance.add(workout);
  }

  void _showAchievementPopup(List<Achievement> achievements) {
    final l10n = S.of(context);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.bgCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            const Icon(
              Icons.celebration_rounded,
              color: AppColors.accentYellow,
              size: 24,
            ),
            const SizedBox(width: 8),
            Text(
              l10n.train_newAchievement,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: achievements
              .map(
                (a) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: a.color.withAlpha(30),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(a.icon, color: a.color, size: 22),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              a.title,
                              style: const TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              a.description,
                              style: const TextStyle(
                                color: AppColors.textMuted,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(ctx),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentYellow,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: Text(
                l10n.train_great,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _saveAsTemplate(BuildContext dialogCtx) {
    final l10n = S.of(context);
    final nameCtrl = TextEditingController(
      text: _workoutName ?? l10n.train_defaultRoutineName,
    );
    RoutineDay? selectedDay =
        RoutineDay.fromStorage(_routineDay) ??
        routineDayFromName(nameCtrl.text);
    showDialog(
      context: dialogCtx,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          backgroundColor: AppColors.bgCard,
          title: Text(
            l10n.train_saveAsRoutine,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: nameCtrl,
                autofocus: true,
                style: const TextStyle(color: AppColors.textPrimary),
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  hintText: l10n.train_routineNameHint,
                  filled: true,
                  fillColor: AppColors.bgCardLight,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 12,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Text(
                l10n.train_trainingDay,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              DropdownButtonFormField<String>(
                initialValue: selectedDay?.storageKey ?? '',
                dropdownColor: AppColors.bgCardLight,
                style: const TextStyle(color: AppColors.textPrimary),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.bgCardLight,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                ),
                items: [
                  DropdownMenuItem<String>(
                    value: '',
                    child: Text(l10n.train_noAssignedDay),
                  ),
                  ...RoutineDay.values.map(
                    (day) => DropdownMenuItem<String>(
                      value: day.storageKey,
                      child: Text(routineDayLabel(context, day)),
                    ),
                  ),
                ],
                onChanged: (value) => setDialogState(
                  () => selectedDay = RoutineDay.fromStorage(value),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.train_trainingDayHint,
                style: const TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 11,
                  height: 1.35,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text(
                l10n.common_cancel,
                style: const TextStyle(color: AppColors.textMuted),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final name = nameCtrl.text.trim();
                if (name.isEmpty) return;
                final day = selectedDay;
                final template = CustomTemplate(
                  id: 'custom_tpl_${DateTime.now().millisecondsSinceEpoch}',
                  name: name,
                  routineDay: day?.storageKey,
                  routineOrder: day == null ? null : _nextRoutineOrder(day),
                  exercises: _exercises
                      .map(
                        (e) => TemplateExercise(
                          name: e.name,
                          muscleGroup: e.muscleGroup,
                          equipment: e.equipment,
                          sets: e.sets.length,
                          reps: e.sets.isNotEmpty ? e.sets.first.reps : 10,
                          weight: e.sets.isNotEmpty ? e.sets.first.weight : 0,
                        ),
                      )
                      .toList(),
                );
                CustomTemplateStore.instance.add(template);
                Navigator.pop(ctx);
                ScaffoldMessenger.of(dialogCtx).showSnackBar(
                  SnackBar(
                    content: Text(l10n.train_routineSaved(name)),
                    backgroundColor: AppColors.bgCardLight,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accentOrange,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                l10n.common_save,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ProgressionRecommendation? _recommendationFor(
    String exerciseName, {
    String equipment = '',
  }) {
    return ProgressionService.recommend(
      exerciseName: exerciseName,
      equipment: equipment,
      workouts: WorkoutStore.instance.workouts,
    );
  }

  double? _lastWeightFor(String exerciseName, {String equipment = ''}) {
    final weight = _recommendationFor(
      exerciseName,
      equipment: equipment,
    )?.previousWeight;
    return weight == null || weight <= 0 ? null : weight;
  }

  void _applyRecommendation(
    int exerciseIndex,
    ProgressionRecommendation value,
  ) {
    HapticFeedback.selectionClick();
    final exercise = _exercises[exerciseIndex];
    setState(() {
      for (var i = 0; i < exercise.sets.length; i++) {
        final set = exercise.sets[i];
        if (set.completed) continue;
        exercise.sets[i] = set.copyWith(
          reps: value.suggestedReps,
          weight: value.suggestedWeight,
        );
      }
    });
    _persistActiveWorkout();
    _syncWatch();
  }

  Future<void> _addExercise() async {
    final ex = await Navigator.push<Exercise>(
      context,
      MaterialPageRoute(builder: (_) => const ExercisePickerScreen()),
    );
    if (ex == null) return;
    final lastWeight = _lastWeightFor(ex.name, equipment: ex.equipment);
    setState(() {
      _exercises.add(
        SessionExercise(
          id: '${ex.id}_${DateTime.now().millisecondsSinceEpoch}',
          name: ex.name,
          muscleGroup: ex.muscleGroup,
          equipment: ex.equipment,
          sets: [SessionSet(reps: 10, weight: lastWeight ?? 0)],
        ),
      );
    });
    _persistActiveWorkout();
    _syncWatch();
  }

  void _removeExercise(int index) {
    final ex = _exercises[index];
    final hasCompletedSets = ex.sets.any((s) => s.completed);
    if (!hasCompletedSets) {
      setState(() => _exercises.removeAt(index));
      _persistActiveWorkout();
      _syncWatch();
      return;
    }
    final l10n = S.of(context);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.bgCard,
        title: Text(
          l10n.train_deleteExercise,
          style: const TextStyle(color: AppColors.textPrimary),
        ),
        content: Text(
          l10n.train_deleteExerciseConfirm(ex.name),
          style: const TextStyle(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(
              l10n.common_cancel,
              style: const TextStyle(color: AppColors.textMuted),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              setState(() => _exercises.removeAt(index));
              _persistActiveWorkout();
              _syncWatch();
            },
            child: Text(
              l10n.common_delete,
              style: const TextStyle(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
  }

  void _reorderExercise(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) newIndex--;
      final item = _exercises.removeAt(oldIndex);
      _exercises.insert(newIndex, item);
    });
    _persistActiveWorkout();
    _syncWatch();
  }

  void _addSet(int exIndex) {
    final ex = _exercises[exIndex];
    final last = ex.sets.isNotEmpty
        ? ex.sets.last
        : SessionSet(reps: 10, weight: 0);
    setState(() {
      ex.sets.add(SessionSet(reps: last.reps, weight: last.weight));
    });
    _persistActiveWorkout();
    _syncWatch();
  }

  Future<void> _removeSet(int exIndex, int setIndex) async {
    if (_exercises[exIndex].sets.length <= 1) return;
    final set = _exercises[exIndex].sets[setIndex];
    if (set.completed) {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          backgroundColor: AppColors.bgCard,
          title: Text(S.of(context).train_removeCompletedSetTitle),
          content: Text(
            S.of(context).train_removeCompletedSetBody(setIndex + 1),
            style: const TextStyle(color: AppColors.textSecondary),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: Text(S.of(context).common_cancel),
            ),
            TextButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: Text(
                S.of(context).common_delete,
                style: const TextStyle(color: AppColors.error),
              ),
            ),
          ],
        ),
      );
      if (confirmed != true || !mounted) return;
    }
    if (exIndex >= _exercises.length ||
        setIndex >= _exercises[exIndex].sets.length ||
        !identical(_exercises[exIndex].sets[setIndex], set)) {
      return;
    }
    setState(() => _exercises[exIndex].sets.removeAt(setIndex));
    _persistActiveWorkout();
    _syncWatch();
  }

  void _toggleSetDone(int exIndex, int setIndex) {
    final s = _exercises[exIndex].sets[setIndex];
    final wasCompleted = s.completed;
    setState(() {
      s.completed = !wasCompleted;
    });
    _persistActiveWorkout();
    _syncWatch();
    // Auto-start the rest timer when a set transitions to completed.
    if (!wasCompleted) {
      RestTimerController.instance.startWithDefault();
    }
  }

  String _formatTime(int seconds) {
    final h = seconds ~/ 3600;
    final m = (seconds % 3600) ~/ 60;
    final s = seconds % 60;
    if (h > 0) {
      return '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
    }
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  // ── Template preview ─────────────────────────────────────────────────────

  Future<void> _showTemplatePreview(WorkoutTemplate t) async {
    if (!t.isFree) {
      if (!await requirePro(context)) return;
      if (!mounted) return;
    }
    final personalized = _personalizeTemplate(t);
    if (personalized.exercises.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(S.of(context).weeklyPlan_noCompatible),
          backgroundColor: AppColors.bgCardLight,
        ),
      );
      return;
    }
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => _TemplatePreviewSheet(
        template: personalized,
        onStart: () {
          Navigator.pop(context);
          _startFromTemplate(personalized);
        },
      ),
    );
  }

  WorkoutTemplate _personalizeTemplate(WorkoutTemplate template) {
    final preferences = TrainingPreferencesStore.instance.preferences;
    if (preferences == null) return template;

    final selectedNames = <String>{};
    final exercises = <TemplateExercise>[];
    for (final exercise in template.exercises) {
      var name = exercise.name;
      var muscleGroup = exercise.muscleGroup;
      var equipment = exercise.equipment;
      if (!WeeklyPlanService.supportsEquipment(
        equipment,
        preferences.equipment,
      )) {
        Exercise? alternative;
        for (final candidate in mockExercises) {
          if (candidate.muscleGroup == muscleGroup &&
              !selectedNames.contains(candidate.name) &&
              WeeklyPlanService.supportsEquipment(
                candidate.equipment,
                preferences.equipment,
              ) &&
              (preferences.experience != ExperienceLevel.beginner ||
                  candidate.difficulty != 'Avanzado')) {
            alternative = candidate;
            break;
          }
        }
        if (alternative == null) continue;
        name = alternative.name;
        muscleGroup = alternative.muscleGroup;
        equipment = alternative.equipment;
      }
      if (!selectedNames.add(name)) continue;

      final isTimed = exercise.weight == 0 && exercise.reps >= 30;
      final sets = switch (preferences.experience) {
        ExperienceLevel.beginner => exercise.sets.clamp(2, 3),
        ExperienceLevel.intermediate => exercise.sets.clamp(3, 4),
        ExperienceLevel.advanced => exercise.sets,
      };
      final reps = isTimed
          ? exercise.reps
          : switch (preferences.goal) {
              TrainingGoal.strength => exercise.reps.clamp(4, 6),
              TrainingGoal.muscleGain => exercise.reps.clamp(8, 12),
              TrainingGoal.fatLoss => exercise.reps.clamp(10, 15),
              TrainingGoal.generalFitness => exercise.reps.clamp(8, 12),
            };
      exercises.add(
        TemplateExercise(
          name: name,
          muscleGroup: muscleGroup,
          equipment: equipment,
          sets: sets.toInt(),
          reps: reps.toInt(),
          // Built-in routines never guess a safe load. A known historical
          // load is applied only when the workout actually starts.
          weight: 0,
        ),
      );
    }

    return WorkoutTemplate(
      id: template.id,
      name: template.name,
      subtitle: template.subtitle,
      icon: template.icon,
      color: template.color,
      exercises: exercises,
    );
  }

  void _showCustomTemplatePreview(CustomTemplate ct) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => _CustomTemplatePreviewSheet(
        template: ct,
        onStart: () {
          Navigator.pop(context);
          _startFromCustomTemplate(ct);
        },
        onDelete: () {
          Navigator.pop(context);
          _confirmDeleteTemplate(ct);
        },
        onEdit: () {
          Navigator.pop(context);
          _editRoutine(ct);
        },
      ),
    );
  }

  void _openRoutineDay(RoutineDay day) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => _RoutineDayScreen(
          day: day,
          dayForTemplate: _dayForTemplate,
          onStartAll: (blocks) {
            Navigator.pop(context);
            _startRoutineDay(day, blocks);
          },
          onStartBlock: (template) {
            Navigator.pop(context);
            _showCustomTemplatePreview(template);
          },
          onAddRoutine: () => _createRoutine(initialDay: day),
          onEdit: _editRoutine,
          onOrganize: _organizeTemplate,
          onDelete: _confirmDeleteTemplate,
        ),
      ),
    );
  }

  void _organizeTemplate(CustomTemplate template) {
    final l10n = S.of(context);
    RoutineDay? selectedDay = _dayForTemplate(template);
    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          backgroundColor: AppColors.bgCard,
          title: Text(
            l10n.train_organizeRoutine,
            style: const TextStyle(color: AppColors.textPrimary),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                template.name,
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 14),
              DropdownButtonFormField<String>(
                initialValue: selectedDay?.storageKey ?? '',
                dropdownColor: AppColors.bgCardLight,
                style: const TextStyle(color: AppColors.textPrimary),
                decoration: InputDecoration(
                  labelText: l10n.train_trainingDay,
                  labelStyle: const TextStyle(color: AppColors.textMuted),
                  filled: true,
                  fillColor: AppColors.bgCardLight,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                items: [
                  DropdownMenuItem<String>(
                    value: '',
                    child: Text(l10n.train_noAssignedDay),
                  ),
                  ...RoutineDay.values.map(
                    (day) => DropdownMenuItem<String>(
                      value: day.storageKey,
                      child: Text(routineDayLabel(context, day)),
                    ),
                  ),
                ],
                onChanged: (value) => setDialogState(
                  () => selectedDay = RoutineDay.fromStorage(value),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: Text(l10n.common_cancel),
            ),
            TextButton(
              onPressed: () {
                final oldDay = _dayForTemplate(template);
                final day = selectedDay;
                final updated = day == null
                    ? template.copyWith(clearRoutineDay: true)
                    : template.copyWith(
                        routineDay: day.storageKey,
                        routineOrder: oldDay == day
                            ? template.routineOrder ??
                                  routineOrderFromName(template.name)
                            : _nextRoutineOrder(day),
                      );
                CustomTemplateStore.instance.update(updated);
                Navigator.pop(ctx);
              },
              child: Text(
                l10n.common_save,
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _confirmDeleteTemplate(CustomTemplate ct) {
    final l10n = S.of(context);
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.bgCard,
        title: Text(
          l10n.train_deleteRoutine,
          style: const TextStyle(color: AppColors.textPrimary),
        ),
        content: Text(
          l10n.train_deleteRoutineConfirm(ct.name),
          style: const TextStyle(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(
              l10n.common_cancel,
              style: const TextStyle(color: AppColors.textMuted),
            ),
          ),
          TextButton(
            onPressed: () {
              CustomTemplateStore.instance.remove(ct.id);
              Navigator.pop(ctx);
            },
            child: Text(
              l10n.common_delete,
              style: const TextStyle(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _workoutStarted ? _buildActiveWorkout() : _buildEmptyState(),
    );
  }

  // ── Empty / pre-workout state ────────────────────────────────────────────

  Widget _buildEmptyState() {
    final l10n = S.of(context);
    final customTemplates = CustomTemplateStore.instance.templates;
    final populatedDays = RoutineDay.values
        .where((day) => _templatesForDay(day).isNotEmpty)
        .toList();
    final unassignedTemplates = customTemplates
        .where((template) => _dayForTemplate(template) == null)
        .toList();
    return CustomScrollView(
      slivers: [
        SliverAppBar(title: Text(l10n.train_title), floating: true),

        // Hero + free workout button
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 28, 28, 0),
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.primary, AppColors.primaryDark],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withAlpha(80),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.fitness_center_rounded,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  l10n.train_readyTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.train_readySubtitle,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () => _startWorkout(),
                    icon: const Icon(Icons.play_arrow_rounded),
                    label: Text(l10n.train_freeSession),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Divider "O elige una rutina"
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 28, 28, 0),
            child: Row(
              children: [
                const Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    l10n.train_orChooseRoutine,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.textMuted,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Expanded(child: Divider()),
              ],
            ),
          ),
        ),

        // Custom templates
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
          sliver: SliverToBoxAdapter(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    l10n.train_myRoutines,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: _createRoutine,
                  icon: const Icon(Icons.add_rounded, size: 18),
                  label: Text(l10n.train_createRoutine),
                ),
              ],
            ),
          ),
        ),
        if (customTemplates.isNotEmpty) ...[
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, i) {
                final day = populatedDays[i];
                final templates = _templatesForDay(day);
                return _RoutineDayCard(
                  day: day,
                  blockCount: templates.length,
                  exerciseCount: templates.fold(
                    0,
                    (sum, template) => sum + template.exercises.length,
                  ),
                  onTap: () => _openRoutineDay(day),
                );
              }, childCount: populatedDays.length),
            ),
          ),
          if (unassignedTemplates.isNotEmpty) ...[
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
              sliver: SliverToBoxAdapter(
                child: Text(
                  l10n.train_noAssignedDay,
                  style: const TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, i) {
                  final ct = unassignedTemplates[i];
                  return _CustomTemplateCard(
                    template: ct,
                    onTap: () => _showCustomTemplatePreview(ct),
                    onEdit: () => _editRoutine(ct),
                    onOrganize: () => _organizeTemplate(ct),
                    onDelete: () => _confirmDeleteTemplate(ct),
                  );
                }, childCount: unassignedTemplates.length),
              ),
            ),
          ],
        ],
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
            child: Text(
              l10n.train_predefinedRoutines,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
        ),

        // Template list
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) => _TemplateCard(
                template: workoutTemplates[i],
                onTap: () => _showTemplatePreview(workoutTemplates[i]),
              ),
              childCount: workoutTemplates.length,
            ),
          ),
        ),
      ],
    );
  }

  // ── Active workout ───────────────────────────────────────────────────────

  Widget _buildActiveWorkout() {
    return Column(
      children: [
        _buildHeader(),
        Expanded(
          child: _exercises.isEmpty
              ? _buildNoExercisesHint()
              : ReorderableListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
                  itemCount: _exercises.length,
                  onReorder: _reorderExercise,
                  proxyDecorator: (child, index, animation) => Material(
                    color: Colors.transparent,
                    elevation: 4,
                    shadowColor: AppColors.primary.withAlpha(80),
                    borderRadius: BorderRadius.circular(16),
                    child: child,
                  ),
                  itemBuilder: (context, i) {
                    final exercise = _exercises[i];
                    final showBlockHeader =
                        exercise.routineBlockName != null &&
                        (i == 0 ||
                            _exercises[i - 1].routineBlockName !=
                                exercise.routineBlockName);
                    final recommendation = _recommendationFor(
                      exercise.name,
                      equipment: exercise.equipment,
                    );
                    return Column(
                      key: ValueKey(exercise.id),
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (showBlockHeader)
                          _RoutineBlockHeader(name: exercise.routineBlockName!),
                        _ExerciseCard(
                          exercise: exercise,
                          lastWeight: recommendation?.previousWeight,
                          recommendation: recommendation,
                          onApplyRecommendation: recommendation == null
                              ? null
                              : () => _applyRecommendation(i, recommendation),
                          onAddSet: () => _addSet(i),
                          onRemoveSet: (si) => _removeSet(i, si),
                          onToggleDone: (si) => _toggleSetDone(i, si),
                          onDelete: () => _removeExercise(i),
                          onSetChanged: () => setState(() {}),
                        ),
                      ],
                    );
                  },
                ),
        ),
        const RestTimerOverlay(),
        _buildBottomBar(),
      ],
    );
  }

  Widget _buildHeader() {
    final l10n = S.of(context);
    final dotColor = _timerRunning ? AppColors.accent : AppColors.textMuted;
    final statusLabel = _timerRunning
        ? l10n.train_inProgress
        : l10n.train_readyToStart;
    final labelColor = _timerRunning ? AppColors.accent : AppColors.textMuted;

    return SafeArea(
      bottom: false,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        decoration: const BoxDecoration(
          color: AppColors.bgCard,
          border: Border(
            bottom: BorderSide(color: AppColors.bgCardLight, width: 1),
          ),
        ),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: dotColor,
                shape: BoxShape.circle,
                boxShadow: _timerRunning
                    ? [
                        BoxShadow(
                          color: AppColors.accent.withAlpha(128),
                          blurRadius: 6,
                        ),
                      ]
                    : null,
              ),
            ),
            const SizedBox(width: 10),
            if (_workoutName != null)
              Expanded(
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        ExerciseLocalization.workoutName(
                          S.of(context),
                          _workoutName!,
                        ),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: labelColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (_timerRunning)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.bgCardLight,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          _formatTime(_elapsedSeconds),
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w700,
                            fontSize: 13,
                          ),
                        ),
                      ),
                  ],
                ),
              )
            else ...[
              Text(
                statusLabel,
                style: TextStyle(
                  color: labelColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
              const SizedBox(width: 6),
              if (_timerRunning)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.bgCardLight,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    _formatTime(_elapsedSeconds),
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                ),
              const Spacer(),
            ],
            if (!_timerRunning) ...[
              IconButton(
                onPressed: _cancelWorkout,
                icon: const Icon(Icons.close_rounded, size: 22),
                color: AppColors.textMuted,
                tooltip: l10n.common_cancel,
                visualDensity: VisualDensity.compact,
                padding: const EdgeInsets.symmetric(horizontal: 6),
                constraints: const BoxConstraints(),
              ),
              const SizedBox(width: 4),
              TextButton.icon(
                onPressed: _startTimer,
                icon: const Icon(Icons.play_arrow_rounded, size: 18),
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                ),
                label: Text(
                  l10n.train_startSession,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ] else
              TextButton(
                onPressed: _cancelWorkout,
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.error,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                ),
                child: Text(
                  l10n.common_cancel,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoExercisesHint() {
    final l10n = S.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.add_box_outlined,
              color: AppColors.textMuted,
              size: 48,
            ),
            const SizedBox(height: 12),
            Text(
              l10n.train_noExercisesYet,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              l10n.train_addExerciseHint,
              style: const TextStyle(color: AppColors.textMuted, fontSize: 13),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            OutlinedButton.icon(
              onPressed: _addExercise,
              icon: const Icon(Icons.add_rounded),
              label: Text(l10n.train_addExercise),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primary,
                side: const BorderSide(color: AppColors.primary),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    final l10n = S.of(context);
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
        decoration: const BoxDecoration(
          color: AppColors.bgCard,
          border: Border(
            top: BorderSide(color: AppColors.bgCardLight, width: 1),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: _addExercise,
                icon: const Icon(Icons.add_rounded, size: 18),
                label: Text(l10n.train_exercise),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  side: const BorderSide(color: AppColors.primary),
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                  textStyle: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: ElevatedButton.icon(
                onPressed: _finishWorkout,
                icon: const Icon(Icons.check_rounded, size: 18),
                label: Text(l10n.train_finish),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
