part of 'train_screen.dart';

/// End of a workout: the summary dialog, saving the session (and
/// optionally a routine), achievements and the guest sign-up prompt.
extension _WorkoutSummary on _TrainScreenState {
  void _showSummaryDialog() {
    final l10n = S.of(context);
    final totalSets = _exercises.fold(0, (s, e) => s + e.sets.length);
    final totalVolume = _exercises.fold(0, (s, e) => s + e.totalVolume);
    final completedSets = _exercises.fold(0, (s, e) => s + e.completedSets);
    final completedExercises = _exercises
        .where((exercise) => exercise.completedSets > 0)
        .length;
    // The session is not saved yet, so the store only holds earlier ones.
    final history = WorkoutStore.instance.workouts;
    final records = WorkoutSummaryService.personalRecords(
      exercises: _exercises,
      history: history,
    );
    final comparison = WorkoutSummaryService.compareWithPrevious(
      workoutName: _workoutName,
      routineDay: _routineDay,
      routineOrder: _routineOrder,
      volume: totalVolume,
      history: history,
    );
    final locale = Localizations.localeOf(context).toString();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        scrollable: true,
        backgroundColor: AppColors.bgCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Icon(
              Icons.emoji_events_rounded,
              color: AppColors.accentYellow,
              size: 24,
            ),
            const SizedBox(width: 8),
            Text(
              l10n.train_workoutCompleted,
              style: TextStyle(
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
              value: formatVolume(totalVolume),
              color: AppColors.accentYellow,
            ),
            if (comparison != null) ...[
              const SizedBox(height: 12),
              _VolumeComparisonLine(
                comparison: comparison,
                formatKg: (kg) => formatVolume(kg),
              ),
            ],
            if (records.isNotEmpty) ...[
              const SizedBox(height: 14),
              _PersonalRecordsCard(
                records: records,
                formatKg: (kg) => formatLoadWithUnit(kg, locale),
              ),
            ],
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
                    _resetWorkoutState();
                    unawaited(_afterWorkoutSaved(newAchievements));
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

  /// Celebrates new achievements, then asks a guest to save their progress.
  Future<void> _afterWorkoutSaved(List<Achievement> newAchievements) async {
    if (newAchievements.isNotEmpty) {
      await _showAchievementPopup(newAchievements);
    }
    if (mounted) await maybeShowSaveProgressPrompt(context);
  }

  Future<void> _showAchievementPopup(List<Achievement> achievements) {
    final l10n = S.of(context);
    return showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.bgCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Icon(
              Icons.celebration_rounded,
              color: AppColors.accentYellow,
              size: 24,
            ),
            const SizedBox(width: 8),
            Text(
              l10n.train_newAchievement,
              style: TextStyle(
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
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              a.description,
                              style: TextStyle(
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
            style: TextStyle(
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
                style: TextStyle(color: AppColors.textPrimary),
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
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 6),
              DropdownButtonFormField<String>(
                initialValue: selectedDay?.storageKey ?? '',
                dropdownColor: AppColors.bgCardLight,
                style: TextStyle(color: AppColors.textPrimary),
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
                style: TextStyle(
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
                style: TextStyle(color: AppColors.textMuted),
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
                          restSeconds: e.restSeconds,
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
}
