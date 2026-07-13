part of 'train_screen.dart';

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
        hintStyle: const TextStyle(color: AppColors.textMuted, fontSize: 12),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        border: InputBorder.none,
      ),
      style: const TextStyle(color: AppColors.textSecondary, fontSize: 12),
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
  final void Function(int) onRemoveSet;
  final void Function(int) onToggleDone;
  final VoidCallback onDelete;
  final VoidCallback onSetChanged;
  final double? _lastWeight;
  final ProgressionRecommendation? recommendation;
  final VoidCallback? onApplyRecommendation;

  const _ExerciseCard({
    super.key,
    required this.exercise,
    required this.onAddSet,
    required this.onRemoveSet,
    required this.onToggleDone,
    required this.onDelete,
    required this.onSetChanged,
    this.recommendation,
    this.onApplyRecommendation,
    double? lastWeight,
  }) : _lastWeight = lastWeight;

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final color = colorForMuscle(exercise.muscleGroup);
    final done = exercise.completedSets;
    final total = exercise.sets.length;
    final lastW = _lastWeight;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.bgCardLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 8, 10),
            child: Row(
              children: [
                const Icon(
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
                              style: const TextStyle(
                                color: AppColors.accent,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          if (done == 0 && lastW != null) ...[
                            const Spacer(),
                            Text(
                              l10n.train_lastWeight(
                                lastW == lastW.roundToDouble()
                                    ? lastW.toStringAsFixed(0)
                                    : lastW.toStringAsFixed(1),
                              ),
                              style: const TextStyle(
                                color: AppColors.textMuted,
                                fontSize: 10,
                              ),
                            ),
                          ],
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
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        builder: (_) =>
                            ExerciseProgressSheet(exerciseName: exercise.name),
                      );
                    }
                  },
                  itemBuilder: (_) => [
                    PopupMenuItem(
                      value: 'progress',
                      child: Row(
                        children: [
                          const Icon(
                            Icons.show_chart_rounded,
                            color: AppColors.accent,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            l10n.train_viewProgress,
                            style: const TextStyle(
                              color: AppColors.textPrimary,
                            ),
                          ),
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
                  icon: const Icon(
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
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
            child: Row(
              children: [
                _ColHeader(label: l10n.train_setHeader, flex: 1),
                _ColHeader(label: l10n.train_repsHeader, flex: 2),
                _ColHeader(label: l10n.train_weightHeader, flex: 3),
                const _ColHeader(label: '', flex: 1),
              ],
            ),
          ),
          const Divider(height: 1),
          ...exercise.sets.asMap().entries.map(
            (entry) => _SetRow(
              key: ValueKey('${exercise.id}_set_${entry.key}'),
              set: entry.value,
              index: entry.key,
              onToggle: () => onToggleDone(entry.key),
              onRemove: exercise.sets.length > 1
                  ? () => onRemoveSet(entry.key)
                  : null,
              onChanged: onSetChanged,
            ),
          ),
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

  String _formatWeight(double value) => value == value.roundToDouble()
      ? value.toStringAsFixed(0)
      : value.toStringAsFixed(1);

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final reason = switch (recommendation.action) {
      ProgressionAction.increaseLoad => l10n.train_increaseLoad,
      ProgressionAction.addRepetition ||
      ProgressionAction.bodyweightRepetition => l10n.train_addRepetition,
      ProgressionAction.consolidateLoad => l10n.train_consolidateLoad,
    };
    final target = recommendation.suggestedWeight > 0
        ? '${_formatWeight(recommendation.suggestedWeight)} kg × '
              '${recommendation.suggestedReps}'
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
              child: const Icon(
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
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    target,
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    reason,
                    style: const TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 10,
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

class _SetRow extends StatefulWidget {
  final SessionSet set;
  final int index;
  final VoidCallback onToggle;
  final VoidCallback? onRemove;
  final VoidCallback onChanged;

  const _SetRow({
    super.key,
    required this.set,
    required this.index,
    required this.onToggle,
    this.onRemove,
    required this.onChanged,
  });

  @override
  State<_SetRow> createState() => _SetRowState();
}

class _SetRowState extends State<_SetRow> {
  late final TextEditingController _repsCtrl;
  late final TextEditingController _weightCtrl;

  @override
  void initState() {
    super.initState();
    _repsCtrl = TextEditingController(
      text: widget.set.reps > 0 ? '${widget.set.reps}' : '',
    );
    _weightCtrl = TextEditingController(
      text: widget.set.weight > 0 ? _fmt(widget.set.weight) : '',
    );
  }

  @override
  void didUpdateWidget(covariant _SetRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (identical(oldWidget.set, widget.set)) return;
    _repsCtrl.text = widget.set.reps > 0 ? '${widget.set.reps}' : '';
    _weightCtrl.text = widget.set.weight > 0 ? _fmt(widget.set.weight) : '';
  }

  @override
  void dispose() {
    _repsCtrl.dispose();
    _weightCtrl.dispose();
    super.dispose();
  }

  String _fmt(double v) =>
      v == v.roundToDouble() ? v.toInt().toString() : v.toString();

  @override
  Widget build(BuildContext context) {
    final done = widget.set.completed;
    return Container(
      color: done ? AppColors.accent.withAlpha(13) : Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: done
                    ? AppColors.accent.withAlpha(51)
                    : AppColors.bgCardLight,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  '${widget.index + 1}',
                  style: TextStyle(
                    color: done ? AppColors.accent : AppColors.textSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: _NumField(
              controller: _repsCtrl,
              hint: '10',
              isInteger: true,
              done: done,
              onChanged: (v) {
                widget.set.reps = int.tryParse(v) ?? widget.set.reps;
                widget.onChanged();
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Expanded(
                  child: _NumField(
                    controller: _weightCtrl,
                    hint: '0',
                    isInteger: false,
                    done: done,
                    onChanged: (v) {
                      widget.set.weight =
                          double.tryParse(v.replaceAll(',', '.')) ??
                          widget.set.weight;
                      widget.onChanged();
                    },
                  ),
                ),
                if (widget.onRemove != null)
                  GestureDetector(
                    onTap: widget.onRemove,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Icon(
                        Icons.remove_circle_outline_rounded,
                        color: AppColors.textMuted.withAlpha(128),
                        size: 16,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                HapticFeedback.lightImpact();
                widget.onToggle();
              },
              child: Center(
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: done ? AppColors.accent : AppColors.bgCardLight,
                    borderRadius: BorderRadius.circular(8),
                    border: done
                        ? null
                        : Border.all(color: AppColors.bgCardLight),
                  ),
                  child: done
                      ? const Icon(
                          Icons.check_rounded,
                          color: Colors.white,
                          size: 16,
                        )
                      : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NumField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool isInteger;
  final bool done;
  final void Function(String) onChanged;

  const _NumField({
    required this.controller,
    required this.hint,
    required this.isInteger,
    required this.done,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        enabled: !done,
        textAlign: TextAlign.center,
        keyboardType: isInteger
            ? TextInputType.number
            : const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: isInteger
            ? [FilteringTextInputFormatter.digitsOnly]
            : [FilteringTextInputFormatter.allow(RegExp(r'^\d*[\.,]?\d*'))],
        style: TextStyle(
          color: done ? AppColors.accent : AppColors.textPrimary,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: AppColors.textMuted, fontSize: 14),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 8,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: done
              ? AppColors.accent.withAlpha(13)
              : AppColors.bgCardLight,
          isDense: true,
        ),
      ),
    );
  }
}

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
        style: const TextStyle(
          color: AppColors.textMuted,
          fontSize: 10,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
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
          style: const TextStyle(color: AppColors.textSecondary, fontSize: 13),
        ),
        const Spacer(),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
