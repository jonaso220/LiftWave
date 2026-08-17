part of 'train_screen.dart';

// ── Template card (list item in empty state) ──────────────────────────────────

class _TemplateCard extends StatelessWidget {
  final WorkoutTemplate template;
  final VoidCallback onTap;

  const _TemplateCard({required this.template, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final t = template;
    final displayName = ExerciseLocalization.templateName(l10n, t.id, t.name);
    final displaySubtitle = ExerciseLocalization.templateSubtitle(
      l10n,
      t.id,
      t.subtitle,
    );
    return Semantics(
      label: '$displayName. $displaySubtitle',
      button: true,
      child: ExcludeSemantics(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.bgCard,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.bgCardLight),
            ),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: t.color.withAlpha(30),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(t.icon, color: t.color, size: 24),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            displayName,
                            style: const TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          if (!t.isFree) ...[
                            const SizedBox(width: 6),
                            const ProBadge(),
                          ],
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        displaySubtitle,
                        style: const TextStyle(
                          color: AppColors.textMuted,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        children: t.muscleGroups
                            .map((mg) => _SmallMuscleTag(muscle: mg))
                            .toList(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${t.exercises.length}',
                      style: TextStyle(
                        color: t.color,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      l10n.train_abbreviationExercises,
                      style: const TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 10,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Icon(
                      Icons.chevron_right_rounded,
                      color: AppColors.textMuted,
                      size: 18,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ── Custom template card ──────────────────────────────────────────────────────

class _CustomTemplateCard extends StatelessWidget {
  final CustomTemplate template;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onOrganize;
  final VoidCallback onDelete;

  const _CustomTemplateCard({
    required this.template,
    required this.onTap,
    required this.onEdit,
    required this.onOrganize,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final t = template;
    return Semantics(
      label: t.name,
      button: true,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.bgCard,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.accentOrange.withAlpha(60)),
          ),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.accentOrange.withAlpha(30),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.bookmark_rounded,
                  color: AppColors.accentOrange,
                  size: 24,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      t.name,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      l10n.train_exerciseCount(t.exercises.length),
                      style: const TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 4,
                      runSpacing: 4,
                      children: t.muscleGroups
                          .map((mg) => _SmallMuscleTag(muscle: mg))
                          .toList(),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Column(
                children: [
                  Semantics(
                    label: l10n.train_editRoutine,
                    button: true,
                    child: GestureDetector(
                      onTap: onEdit,
                      child: const Icon(
                        Icons.edit_rounded,
                        color: AppColors.primaryLight,
                        size: 19,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Semantics(
                    label: l10n.train_organizeRoutine,
                    button: true,
                    child: GestureDetector(
                      onTap: onOrganize,
                      child: const Icon(
                        Icons.event_note_rounded,
                        color: AppColors.primary,
                        size: 19,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Semantics(
                    label: l10n.common_delete,
                    button: true,
                    child: GestureDetector(
                      onTap: onDelete,
                      child: const Icon(
                        Icons.delete_outline_rounded,
                        color: AppColors.textMuted,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoutineDayCard extends StatelessWidget {
  final RoutineDay day;
  final int blockCount;
  final int exerciseCount;
  final VoidCallback onTap;

  const _RoutineDayCard({
    required this.day,
    required this.blockCount,
    required this.exerciseCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final label = routineDayLabel(context, day);
    return Semantics(
      label:
          '$label. ${l10n.train_blockCount(blockCount)}. '
          '${l10n.train_exerciseCount(exerciseCount)}',
      button: true,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.bgCard,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.primary.withAlpha(60)),
          ),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.primary.withAlpha(30),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.calendar_view_day_rounded,
                  color: AppColors.primary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 17,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '${l10n.train_blockCount(blockCount)} · '
                      '${l10n.train_exerciseCount(exerciseCount)}',
                      style: const TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.textMuted,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoutineDayScreen extends StatefulWidget {
  final RoutineDay day;
  final RoutineDay? Function(CustomTemplate) dayForTemplate;
  final void Function(List<CustomTemplate>) onStartAll;
  final void Function(CustomTemplate) onStartBlock;
  final VoidCallback onAddRoutine;
  final void Function(CustomTemplate) onEdit;
  final void Function(CustomTemplate) onOrganize;
  final void Function(CustomTemplate) onDelete;

  const _RoutineDayScreen({
    required this.day,
    required this.dayForTemplate,
    required this.onStartAll,
    required this.onStartBlock,
    required this.onAddRoutine,
    required this.onEdit,
    required this.onOrganize,
    required this.onDelete,
  });

  @override
  State<_RoutineDayScreen> createState() => _RoutineDayScreenState();
}

class _RoutineDayScreenState extends State<_RoutineDayScreen> {
  @override
  void initState() {
    super.initState();
    CustomTemplateStore.instance.addListener(_onChanged);
    WorkoutStore.instance.addListener(_onChanged);
  }

  @override
  void dispose() {
    CustomTemplateStore.instance.removeListener(_onChanged);
    WorkoutStore.instance.removeListener(_onChanged);
    super.dispose();
  }

  void _onChanged() {
    if (mounted) setState(() {});
  }

  List<CustomTemplate> get _blocks {
    final result = CustomTemplateStore.instance.templates
        .where((template) => widget.dayForTemplate(template) == widget.day)
        .toList();
    result.sort(_compareRoutineTemplates);
    return result;
  }

  void _reorder(int oldIndex, int newIndex) {
    final blocks = _blocks;
    if (newIndex > oldIndex) newIndex--;
    final moved = blocks.removeAt(oldIndex);
    blocks.insert(newIndex, moved);
    CustomTemplateStore.instance.reorderDay(widget.day.storageKey, blocks);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final blocks = _blocks;
    final label = routineDayLabel(context, widget.day);
    final exerciseCount = blocks.fold(
      0,
      (sum, template) => sum + template.exercises.length,
    );

    return Scaffold(
      appBar: AppBar(title: Text(label)),
      body: blocks.isEmpty
          ? Center(
              child: Text(
                l10n.train_noRoutinesForDay,
                style: const TextStyle(color: AppColors.textMuted),
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 18, 20, 10),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withAlpha(20),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AppColors.primary.withAlpha(45),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.train_routineForDay(label),
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${l10n.train_blockCount(blocks.length)} · '
                          '${l10n.train_exerciseCount(exerciseCount)}',
                          style: const TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          l10n.train_reorderBlocksHint,
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReorderableListView.builder(
                    padding: const EdgeInsets.fromLTRB(20, 4, 20, 28),
                    itemCount: blocks.length,
                    onReorder: _reorder,
                    itemBuilder: (context, index) {
                      final block = blocks[index];
                      final isCompleted = routineBlockWasCompleted(
                        day: widget.day,
                        blockName: block.name,
                        blockOrder:
                            block.routineOrder ??
                            routineOrderFromName(
                              block.name,
                              fallback: index + 1,
                            ),
                        workouts: WorkoutStore.instance.workouts,
                      );
                      return _RoutineBlockTile(
                        key: ValueKey(block.id),
                        index: index,
                        template: block,
                        isCompleted: isCompleted,
                        onTap: () => widget.onStartBlock(block),
                        onEdit: () => widget.onEdit(block),
                        onOrganize: () => widget.onOrganize(block),
                        onDelete: () => widget.onDelete(block),
                      );
                    },
                  ),
                ),
              ],
            ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: widget.onAddRoutine,
                  icon: const Icon(Icons.add_rounded),
                  label: Text(l10n.train_addRoutineForDay(label)),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    side: BorderSide(color: AppColors.primary.withAlpha(115)),
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              if (blocks.isNotEmpty) ...[
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () => widget.onStartAll(blocks),
                    icon: const Icon(Icons.play_arrow_rounded),
                    label: Text(l10n.train_startCompleteRoutine),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _RoutineBlockTile extends StatelessWidget {
  final int index;
  final CustomTemplate template;
  final bool isCompleted;
  final VoidCallback onTap;
  final VoidCallback onEdit;
  final VoidCallback onOrganize;
  final VoidCallback onDelete;

  const _RoutineBlockTile({
    super.key,
    required this.index,
    required this.template,
    required this.isCompleted,
    required this.onTap,
    required this.onEdit,
    required this.onOrganize,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: isCompleted
            ? AppColors.routineCompleted.withAlpha(24)
            : AppColors.bgCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isCompleted
              ? AppColors.routineCompleted.withAlpha(155)
              : AppColors.bgCardLight,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              ReorderableDragStartListener(
                index: index,
                child: const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.drag_handle_rounded,
                    color: AppColors.textMuted,
                  ),
                ),
              ),
              Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isCompleted
                      ? AppColors.routineCompleted.withAlpha(38)
                      : AppColors.primary.withAlpha(25),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    color: isCompleted
                        ? AppColors.routineCompleted
                        : AppColors.primary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      template.name,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      l10n.train_exerciseCount(template.exercises.length),
                      style: const TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              if (isCompleted)
                Semantics(
                  label: l10n.train_workoutCompleted,
                  child: const Padding(
                    padding: EdgeInsets.only(right: 2),
                    child: Icon(
                      Icons.check_circle_rounded,
                      color: AppColors.routineCompleted,
                      size: 21,
                    ),
                  ),
                ),
              PopupMenuButton<String>(
                color: AppColors.bgCardLight,
                onSelected: (value) {
                  if (value == 'edit') onEdit();
                  if (value == 'organize') onOrganize();
                  if (value == 'delete') onDelete();
                },
                itemBuilder: (_) => [
                  PopupMenuItem(
                    value: 'edit',
                    child: Text(
                      l10n.train_editRoutine,
                      style: const TextStyle(color: AppColors.textPrimary),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'organize',
                    child: Text(
                      l10n.train_organizeRoutine,
                      style: const TextStyle(color: AppColors.textPrimary),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: Text(
                      l10n.common_delete,
                      style: const TextStyle(color: AppColors.error),
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
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: c.withAlpha(25),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        ExerciseLocalization.muscle(S.of(context), muscle),
        style: TextStyle(color: c, fontSize: 10, fontWeight: FontWeight.w600),
      ),
    );
  }
}

// ── Template preview bottom sheet ─────────────────────────────────────────────

class _TemplatePreviewSheet extends StatelessWidget {
  final WorkoutTemplate template;
  final VoidCallback onStart;

  const _TemplatePreviewSheet({required this.template, required this.onStart});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final t = template;
    final displayName = ExerciseLocalization.templateName(l10n, t.id, t.name);
    final displaySubtitle = ExerciseLocalization.templateSubtitle(
      l10n,
      t.id,
      t.subtitle,
    );
    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (_, scrollCtrl) => Container(
        decoration: const BoxDecoration(
          color: AppColors.bgCard,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          children: [
            // Handle
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 4),
              child: Center(
                child: Container(
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.bgCardLight,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),

            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: t.color.withAlpha(30),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(t.icon, color: t.color, size: 24),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          displayName,
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          displaySubtitle,
                          style: const TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: t.color.withAlpha(25),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${t.exercises.length} ${l10n.train_abbreviationExercises}',
                      style: TextStyle(
                        color: t.color,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Divider(height: 1),

            // Exercise list
            Expanded(
              child: ListView.separated(
                controller: scrollCtrl,
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
                itemCount: t.exercises.length,
                separatorBuilder: (_, _) => const SizedBox(height: 8),
                itemBuilder: (_, i) => _PreviewExRow(
                  exercise: t.exercises[i],
                  index: i,
                  color: t.color,
                ),
              ),
            ),

            // Start button
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: onStart,
                    icon: const Icon(Icons.play_arrow_rounded),
                    label: Text(l10n.train_startTemplate(displayName)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: t.color,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
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

// ── Custom template preview bottom sheet ──────────────────────────────────────

class _CustomTemplatePreviewSheet extends StatelessWidget {
  final CustomTemplate template;
  final VoidCallback onStart;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const _CustomTemplatePreviewSheet({
    required this.template,
    required this.onStart,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final t = template;
    return DraggableScrollableSheet(
      initialChildSize: 0.65,
      minChildSize: 0.4,
      maxChildSize: 0.9,
      builder: (_, scrollCtrl) => Container(
        decoration: const BoxDecoration(
          color: AppColors.bgCard,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 4),
              child: Center(
                child: Container(
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.bgCardLight,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: AppColors.accentOrange.withAlpha(30),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.bookmark_rounded,
                      color: AppColors.accentOrange,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          t.name,
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          l10n.train_exerciseCount(t.exercises.length),
                          style: const TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    tooltip: l10n.train_editRoutine,
                    onPressed: onEdit,
                    icon: const Icon(
                      Icons.edit_rounded,
                      color: AppColors.primaryLight,
                      size: 22,
                    ),
                  ),
                  IconButton(
                    tooltip: l10n.train_deleteRoutine,
                    onPressed: onDelete,
                    icon: const Icon(
                      Icons.delete_outline_rounded,
                      color: AppColors.error,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: ListView.separated(
                controller: scrollCtrl,
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
                itemCount: t.exercises.length,
                separatorBuilder: (_, _) => const SizedBox(height: 8),
                itemBuilder: (_, i) => _PreviewExRow(
                  exercise: t.exercises[i],
                  index: i,
                  color: AppColors.accentOrange,
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: onStart,
                    icon: const Icon(Icons.play_arrow_rounded),
                    label: Text(l10n.train_startTemplate(t.name)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accentOrange,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
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

class _PreviewExRow extends StatelessWidget {
  final TemplateExercise exercise;
  final int index;
  final Color color;

  const _PreviewExRow({
    required this.exercise,
    required this.index,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final ex = exercise;
    final isBodyweight =
        ex.equipment == 'Peso corporal' || ex.equipment == 'Sin material';
    final weightStr = ex.weight > 0
        ? '${ex.weight.toInt()} kg'
        : isBodyweight
        ? l10n.train_bodyweightLabel
        : l10n.train_chooseWeight;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.bgDark,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.bgCardLight),
      ),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: color.withAlpha(25),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                '${index + 1}',
                style: TextStyle(
                  color: color,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ExerciseLocalization.name(S.of(context), ex.name),
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${ExerciseLocalization.muscle(S.of(context), ex.muscleGroup)} · ${ExerciseLocalization.equipment(S.of(context), ex.equipment)}',
                  style: const TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${ex.sets} × ${ex.reps}',
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                weightStr,
                style: const TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
