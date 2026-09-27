part of 'train_screen.dart';

/// What the Train tab shows when no workout is running: the user's own
/// routines first, predefined ones folded away, and a free session as the
/// fallback.
extension _RoutineChooser on _TrainScreenState {
  Widget _buildEmptyState() {
    final l10n = S.of(context);
    final customTemplates = CustomTemplateStore.instance.templates;
    final populatedDays = RoutineDay.values
        .where((day) => _templatesForDay(day).isNotEmpty)
        .toList();
    final unassignedTemplates = customTemplates
        .where((template) => _dayForTemplate(template) == null)
        .toList();
    final hasRoutines = customTemplates.isNotEmpty;
    final hasMultiRoutineDay = populatedDays.any(
      (day) => _templatesForDay(day).length > 1,
    );

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text(l10n.train_title),
          floating: true,
          actions: [
            IconButton(
              onPressed: _openExerciseLibrary,
              icon: const Icon(Icons.menu_book_rounded),
              tooltip: l10n.home_exerciseLibrary,
            ),
            const SizedBox(width: 4),
          ],
        ),

        // ── My routines ────────────────────────────────────────────────────
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
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
                if (hasRoutines)
                  TextButton.icon(
                    onPressed: _createRoutine,
                    icon: const Icon(Icons.add_rounded, size: 18),
                    label: Text(l10n.train_createRoutine),
                  ),
              ],
            ),
          ),
        ),
        if (!hasRoutines)
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
            sliver: SliverToBoxAdapter(
              child: _FirstRoutineCard(onCreate: _createRoutine),
            ),
          )
        else ...[
          // Only explain multi-routine days to users who have one.
          if (hasMultiRoutineDay)
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 2, 20, 0),
              sliver: SliverToBoxAdapter(
                child: Text(
                  l10n.train_routinesHint,
                  style: TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 12,
                    height: 1.4,
                  ),
                ),
              ),
            ),
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
                  style: TextStyle(
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

        // ── Predefined routines (folded once the user has their own) ───────
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          sliver: SliverToBoxAdapter(
            child: _PredefinedRoutinesSection(
              // A key per state so the default applies again when the user
              // creates (or deletes) their first routine.
              key: ValueKey(hasRoutines),
              initiallyExpanded: !hasRoutines,
              onOpen: _showTemplatePreview,
            ),
          ),
        ),

        // ── Free session as the fallback ─────────────────────────────────
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 40),
          sliver: SliverToBoxAdapter(
            child: Column(
              children: [
                Text(
                  l10n.train_freeSessionHint,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.textMuted, fontSize: 13),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () => _startWorkout(),
                    icon: const Icon(Icons.play_arrow_rounded),
                    label: Text(l10n.train_freeSession),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.primary,
                      side: const BorderSide(color: AppColors.primary),
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Explains what a routine is to someone who has none yet.
class _FirstRoutineCard extends StatelessWidget {
  final VoidCallback onCreate;

  const _FirstRoutineCard({required this.onCreate});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.primary.withAlpha(18),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.primary.withAlpha(60)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.playlist_add_rounded,
                color: AppColors.primaryLight,
                size: 26,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  l10n.train_firstRoutineTitle,
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            l10n.train_firstRoutineBody,
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: onCreate,
              icon: const Icon(Icons.add_rounded),
              label: Text(l10n.train_createRoutine),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 13),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Predefined routines behind a header that folds them away.
class _PredefinedRoutinesSection extends StatefulWidget {
  final bool initiallyExpanded;
  final void Function(WorkoutTemplate) onOpen;

  const _PredefinedRoutinesSection({
    super.key,
    required this.initiallyExpanded,
    required this.onOpen,
  });

  @override
  State<_PredefinedRoutinesSection> createState() =>
      _PredefinedRoutinesSectionState();
}

class _PredefinedRoutinesSectionState
    extends State<_PredefinedRoutinesSection> {
  late bool _expanded = widget.initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Semantics(
          button: true,
          expanded: _expanded,
          child: InkWell(
            onTap: () => setState(() => _expanded = !_expanded),
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '${l10n.train_predefinedRoutines} '
                      '(${workoutTemplates.length})',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  AnimatedRotation(
                    turns: _expanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 150),
                    child: Icon(
                      Icons.expand_more_rounded,
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (_expanded) ...[
          const SizedBox(height: 8),
          for (final template in workoutTemplates)
            _TemplateCard(
              template: template,
              onTap: () => widget.onOpen(template),
            ),
        ],
      ],
    );
  }
}
