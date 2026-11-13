part of 'train_screen.dart';

class _RoutineBlockHeader extends StatelessWidget {
  final String name;

  const _RoutineBlockHeader({required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 10, 4, 8),
      child: Row(
        children: [
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: AppColors.primary.withAlpha(28),
              borderRadius: BorderRadius.circular(9),
            ),
            child: const Icon(
              Icons.view_agenda_rounded,
              color: AppColors.primary,
              size: 16,
            ),
          ),
          const SizedBox(width: 9),
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Exercise card ────────────────────────────────────────────────────────────

/// Notes field for an exercise card. Owns its own [TextEditingController] so
/// it survives rebuilds (creating the controller inline in build() leaks it
/// and resets the cursor on every keystroke).
class _ExerciseNotesField extends StatefulWidget {
  final SessionExercise exercise;

  const _ExerciseNotesField({required this.exercise});

  @override
  State<_ExerciseNotesField> createState() => _ExerciseNotesFieldState();
}

class _ExerciseNotesFieldState extends State<_ExerciseNotesField> {
  late final TextEditingController _controller = TextEditingController(
    text: widget.exercise.notes,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return TextField(
      decoration: InputDecoration(
        hintText: l10n.train_notesHint,
        hintStyle: TextStyle(color: AppColors.textMuted, fontSize: 12),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        border: InputBorder.none,
      ),
      style: TextStyle(color: AppColors.textSecondary, fontSize: 12),
      maxLines: 1,
      controller: _controller,
      onChanged: (v) {
        widget.exercise.notes = v.isEmpty ? null : v;
      },
    );
  }
}

class _ExerciseCard extends StatelessWidget {
  final SessionExercise exercise;
  final VoidCallback onAddSet;
  final Future<void> Function(int) onRemoveSet;
  final void Function(int) onToggleDone;
  final VoidCallback onDelete;
  final VoidCallback onSetChanged;
  final List<WorkoutSet> previousSets;
  final ProgressionRecommendation? recommendation;
  final VoidCallback? onApplyRecommendation;

  /// Starts the countdown of a set of a timed exercise.
  final void Function(int setIndex)? onStartHold;

  /// The exercise is alternated with its neighbours as a superset.
  final bool inSuperset;

  /// Groups this exercise with the next one. Null when that is not possible
  /// (it is the last one, or they are already grouped).
  final VoidCallback? onLinkNext;

  /// Takes this exercise out of its superset. Null when it is in none.
  final VoidCallback? onUnlink;

  const _ExerciseCard({
    required this.exercise,
    required this.onAddSet,
    required this.onRemoveSet,
    required this.onToggleDone,
    required this.onDelete,
    required this.onSetChanged,
    this.previousSets = const [],
    this.recommendation,
    this.onApplyRecommendation,
    this.onStartHold,
    this.inSuperset = false,
    this.onLinkNext,
    this.onUnlink,
  });

  /// The set of the last session this row is compared with: warm-ups line
  /// up with warm-ups and working sets with working sets, each in order, so
  /// adding a warm-up today does not shift every "previous" value down.
  WorkoutSet? _previousFor(int index) {
    final isWork = exercise.sets[index].type.countsAsWork;
    var position = 0;
    for (var i = 0; i < index; i++) {
      if (exercise.sets[i].type.countsAsWork == isWork) position++;
    }
    final candidates = previousSets
        .where((set) => set.type.countsAsWork == isWork)
        .toList();
    return position < candidates.length ? candidates[position] : null;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final color = colorForMuscle(exercise.muscleGroup);
    final done = exercise.completedSets;
    final total = exercise.sets.length;
    // Steppers only under the next set to log, to keep the card compact.
    final nextPendingSet = exercise.sets.indexWhere((set) => !set.completed);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: inSuperset
              ? AppColors.primary.withAlpha(140)
              : AppColors.bgCardLight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (inSuperset) const SupersetStrip(),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 8, 10),
            child: Row(
              children: [
                Icon(
                  Icons.drag_handle_rounded,
                  color: AppColors.textMuted,
                  size: 20,
                ),
                const SizedBox(width: 6),
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: color.withAlpha(38),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.fitness_center_rounded,
                    color: color,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ExerciseLocalization.name(l10n, exercise.name),
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          MuscleChip(label: exercise.muscleGroup),
                          const SizedBox(width: 6),
                          if (done > 0)
                            Text(
                              l10n.train_setsProgress(done, total),
                              style: TextStyle(
                                color: AppColors.accent,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          // Last session's load now lives in the PREVIOUS
                          // column, so this spot shows the exercise's rest.
                          // It takes the room that is left: with the
                          // progress label showing, a long rest label
                          // overflowed the row on narrow phones.
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: RestBadge(
                                seconds: exercise.restSeconds,
                                onTap: () async {
                                  final choice = await showRestPicker(
                                    context,
                                    current: exercise.restSeconds,
                                  );
                                  if (choice == null) return;
                                  exercise.restSeconds = choice.seconds;
                                  onSetChanged();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                PopupMenuButton<String>(
                  color: AppColors.bgCardLight,
                  onSelected: (v) {
                    if (v == 'delete') onDelete();
                    if (v == 'progress') {
                      showExerciseProgress(context, exercise.name);
                    }
                    if (v == 'link') onLinkNext?.call();
                    if (v == 'unlink') onUnlink?.call();
                    if (v == 'measure') {
                      exercise.timed = !exercise.timed;
                      onSetChanged();
                    }
                    if (v == 'plates') {
                      // Starts from the set about to be done.
                      final pending = nextPendingSet == -1
                          ? exercise.sets.last
                          : exercise.sets[nextPendingSet];
                      showPlateCalculator(context, initialKg: pending.weight);
                    }
                  },
                  itemBuilder: (_) => [
                    if (onLinkNext != null)
                      PopupMenuItem(
                        value: 'link',
                        child: Row(
                          children: [
                            Icon(
                              Icons.link_rounded,
                              color: AppColors.primaryLight,
                              size: 18,
                            ),
                            const SizedBox(width: 8),
                            Flexible(
                              child: Text(
                                l10n.superset_linkNext,
                                style: TextStyle(color: AppColors.textPrimary),
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (onUnlink != null)
                      PopupMenuItem(
                        value: 'unlink',
                        child: Row(
                          children: [
                            Icon(
                              Icons.link_off_rounded,
                              color: AppColors.primaryLight,
                              size: 18,
                            ),
                            const SizedBox(width: 8),
                            Flexible(
                              child: Text(
                                l10n.superset_unlink,
                                style: TextStyle(color: AppColors.textPrimary),
                              ),
                            ),
                          ],
                        ),
                      ),
                    PopupMenuItem(
                      value: 'measure',
                      child: Row(
                        children: [
                          Icon(
                            exercise.timed
                                ? Icons.repeat_rounded
                                : Icons.timer_outlined,
                            color: AppColors.primaryLight,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            exercise.timed
                                ? l10n.train_measureByReps
                                : l10n.train_measureByTime,
                            style: TextStyle(color: AppColors.textPrimary),
                          ),
                        ],
                      ),
                    ),
                    if (PlateCalculator.appliesTo(exercise.equipment))
                      PopupMenuItem(
                        value: 'plates',
                        child: Row(
                          children: [
                            Icon(
                              Icons.calculate_outlined,
                              color: AppColors.primaryLight,
                              size: 18,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              l10n.plates_title,
                              style: TextStyle(color: AppColors.textPrimary),
                            ),
                          ],
                        ),
                      ),
                    PopupMenuItem(
                      value: 'progress',
                      child: Row(
                        children: [
                          Icon(
                            Icons.show_chart_rounded,
                            color: AppColors.accent,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            l10n.train_viewProgress,
                            style: TextStyle(color: AppColors.textPrimary),
                          ),
                          const SizedBox(width: 8),
                          const ProBadge(),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      child: Row(
                        children: [
                          const Icon(
                            Icons.delete_outline_rounded,
                            color: AppColors.error,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            l10n.train_deleteExercise,
                            style: const TextStyle(color: AppColors.error),
                          ),
                        ],
                      ),
                    ),
                  ],
                  icon: Icon(
                    Icons.more_horiz_rounded,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 14, 6),
            child: _ExerciseNotesField(exercise: exercise),
          ),
          if (done == 0 && recommendation != null)
            _ProgressionSuggestion(
              recommendation: recommendation!,
              onApply: onApplyRecommendation,
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            child: Row(
              children: [
                _ColHeader(
                  label: l10n.train_setHeader,
                  flex: SessionSetColumns.set,
                ),
                _ColHeader(
                  label: l10n.train_previousHeader,
                  flex: SessionSetColumns.previous,
                ),
                _ColHeader(
                  label: weightSymbol.toUpperCase(),
                  flex: SessionSetColumns.weight,
                ),
                _ColHeader(
                  label: exercise.timed
                      ? l10n.train_secondsHeader
                      : l10n.train_repsHeader,
                  flex: SessionSetColumns.reps,
                ),
                const _ColHeader(label: '', flex: SessionSetColumns.done),
              ],
            ),
          ),
          const Divider(height: 1),
          ...exercise.sets.asMap().entries.map((entry) {
            final index = entry.key;
            final isNextSet = index == nextPendingSet;
            final previous = _previousFor(index);
            return SessionSetRow(
              key: ObjectKey(entry.value),
              set: entry.value,
              index: index,
              number: exercise.workingNumberOf(index),
              onTypeChanged: (type) {
                entry.value.type = type;
                onSetChanged();
              },
              timed: exercise.timed,
              onStartHold: onStartHold == null
                  ? null
                  : () => onStartHold!(index),
              previous: previous,
              onToggle: () => onToggleDone(index),
              onRemove: exercise.sets.length > 1
                  ? () => onRemoveSet(index)
                  : null,
              onChanged: onSetChanged,
              showSteppers: isNextSet,
              weightStep:
                  ProgressionService.isBodyweight(exercise.equipment) &&
                      entry.value.weight == 0
                  ? 0
                  : loadStepDisplay(exercise.equipment),
              onEdited: (previousReps, previousWeight) =>
                  exercise.propagateEdit(
                    index,
                    previousReps: previousReps,
                    previousWeight: previousWeight,
                  ),
              onUsePrevious: previous == null
                  ? null
                  : () {
                      exercise.fillSet(
                        index,
                        reps: previous.reps,
                        weight: previous.weight,
                      );
                      onSetChanged();
                    },
            );
          }),
          InkWell(
            onTap: onAddSet,
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.add_rounded,
                    color: AppColors.primary,
                    size: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    l10n.train_addSet,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
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
}

class _ProgressionSuggestion extends StatelessWidget {
  final ProgressionRecommendation recommendation;
  final VoidCallback? onApply;

  const _ProgressionSuggestion({
    required this.recommendation,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final r = recommendation;
    final locale = Localizations.localeOf(context).toString();
    final previousWeight = formatLoadWithUnit(r.previousWeight, locale);
    // One sentence that explains the suggestion from last session's numbers.
    final reason = switch (r.action) {
      ProgressionAction.increaseLoad => l10n.train_reasonIncreaseLoad(
        r.previousReps,
        previousWeight,
        r.range.min,
        r.range.max,
      ),
      ProgressionAction.addRepetition => l10n.train_reasonAddRep(
        r.previousReps,
        previousWeight,
      ),
      ProgressionAction.consolidateLoad => l10n.train_reasonConsolidate(
        r.previousReps,
        previousWeight,
        r.range.min,
        r.range.max,
      ),
      ProgressionAction.bodyweightRepetition => l10n.train_reasonBodyweight(
        r.previousReps,
      ),
      ProgressionAction.holdLonger => l10n.train_reasonHold(r.previousReps),
    };
    final timed = r.action == ProgressionAction.holdLonger;
    final amount = timed
        ? '${r.suggestedReps} ${l10n.train_secondsShort}'
        : '${r.suggestedReps}';
    final target = recommendation.suggestedWeight > 0
        ? '${formatLoadWithUnit(recommendation.suggestedWeight, locale)} × '
              '$amount'
        : timed
        ? amount
        : '${recommendation.suggestedReps} ${l10n.common_reps.toLowerCase()}';

    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 2, 14, 10),
      child: Container(
        padding: const EdgeInsets.fromLTRB(12, 10, 8, 10),
        decoration: BoxDecoration(
          color: AppColors.primary.withAlpha(20),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.primary.withAlpha(64)),
        ),
        child: Row(
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: AppColors.primary.withAlpha(38),
                borderRadius: BorderRadius.circular(9),
              ),
              child: Icon(
                Icons.trending_up_rounded,
                color: AppColors.primaryLight,
                size: 19,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.train_nextSuggestion,
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    target,
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    reason,
                    style: TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 11,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: onApply,
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primaryLight,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                minimumSize: const Size(0, 36),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                l10n.train_applySuggestion,
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Set row ───────────────────────────────────────────────────────────────────

// ── Helpers ───────────────────────────────────────────────────────────────────

class _ColHeader extends StatelessWidget {
  final String label;
  final int flex;

  const _ColHeader({required this.label, required this.flex});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.textMuted,
          fontSize: 10,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

/// "+150 kg de volumen respecto a la última vez" under the summary stats.
class _VolumeComparisonLine extends StatelessWidget {
  final VolumeComparison comparison;

  /// Formats a volume in kg with the user's unit, e.g. "150 kg".
  final String Function(int kg) formatKg;

  const _VolumeComparisonLine({
    required this.comparison,
    required this.formatKg,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final delta = comparison.delta;
    final (text, icon, color) = delta > 0
        ? (
            l10n.train_volumeUp(formatKg(delta)),
            Icons.trending_up_rounded,
            AppColors.accent,
          )
        : delta < 0
        ? (
            l10n.train_volumeDown(formatKg(-delta)),
            Icons.trending_down_rounded,
            AppColors.textMuted,
          )
        : (
            l10n.train_volumeSame,
            Icons.trending_flat_rounded,
            AppColors.textMuted,
          );
    return Row(
      children: [
        Icon(icon, color: color, size: 18),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

/// Lists the exercises where the user lifted more than ever before.
class _PersonalRecordsCard extends StatelessWidget {
  final List<PersonalRecord> records;

  /// Formats a load in kg with the user's unit, e.g. "85 kg".
  final String Function(double kg) formatKg;

  const _PersonalRecordsCard({required this.records, required this.formatKg});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.accentYellow.withAlpha(25),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.accentYellow.withAlpha(90)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.workspace_premium_rounded,
                color: AppColors.accentYellow,
                size: 18,
              ),
              const SizedBox(width: 6),
              Text(
                l10n.train_newRecords,
                style: TextStyle(
                  color: AppColors.accentYellow,
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          for (final record in records)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text:
                          '${ExerciseLocalization.name(l10n, record.exerciseName)}  ',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text: l10n.train_recordLine(
                        formatKg(record.weight),
                        formatKg(record.previousBest),
                      ),
                      style: TextStyle(color: AppColors.textSecondary),
                    ),
                  ],
                ),
                style: const TextStyle(fontSize: 13),
              ),
            ),
        ],
      ),
    );
  }
}

class _SummaryStat extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _SummaryStat({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: color.withAlpha(38),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color, size: 18),
        ),
        const SizedBox(width: 12),
        Text(
          label,
          style: TextStyle(color: AppColors.textSecondary, fontSize: 13),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
