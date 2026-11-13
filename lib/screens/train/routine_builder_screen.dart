import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';

import '../../data/custom_template_store.dart';
import '../../data/workout_templates.dart';
import '../../models/models.dart';
import '../../theme/app_theme.dart';
import '../../models/session_models.dart';
import '../../widgets/rest_picker.dart';
import '../../widgets/set_type_badge.dart';
import '../../utils/exercise_localization.dart';
import '../../utils/routine_days.dart';
import '../../widgets/common/muscle_chip.dart';
import 'exercise_picker_screen.dart';

class RoutineBuilderScreen extends StatefulWidget {
  final RoutineDay? initialDay;
  final int? routineOrder;
  final String initialName;
  final CustomTemplate? initialTemplate;

  const RoutineBuilderScreen({
    super.key,
    required this.initialName,
    this.initialDay,
    this.routineOrder,
    this.initialTemplate,
  });

  @override
  State<RoutineBuilderScreen> createState() => _RoutineBuilderScreenState();
}

class _RoutineBuilderScreenState extends State<RoutineBuilderScreen> {
  late final TextEditingController _nameController;
  late RoutineDay? _selectedDay;
  final List<_PlannedExercise> _exercises = [];
  bool _showNameError = false;
  bool _allowPop = false;
  late final String _initialSignature;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName);
    _selectedDay = widget.initialDay;
    final initialTemplate = widget.initialTemplate;
    if (initialTemplate != null) {
      _exercises.addAll(
        initialTemplate.exercises.map(_PlannedExercise.fromTemplate),
      );
    }
    _initialSignature = _draftSignature();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _addExercise() async {
    final exercise = await Navigator.push<Exercise>(
      context,
      MaterialPageRoute(builder: (_) => const ExercisePickerScreen()),
    );
    if (exercise == null || !mounted) return;

    setState(() {
      _exercises.add(_PlannedExercise(exercise: exercise));
    });
  }

  String _draftSignature() => jsonEncode({
    'name': _nameController.text,
    'routineDay': _selectedDay?.storageKey,
    'exercises': _exercises
        .map(
          (draft) => {
            'name': draft.exercise.name,
            'muscleGroup': draft.exercise.muscleGroup,
            'equipment': draft.exercise.equipment,
            'sets': draft.sets,
            'reps': draft.reps,
            'restSeconds': draft.restSeconds,
            'supersetId': draft.supersetId,
          },
        )
        .toList(),
  });

  bool get _hasUnsavedChanges => _draftSignature() != _initialSignature;

  void _linkSuperset(int index) {
    setState(() => linkWithNext(_exercises, index, newSupersetId()));
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(S.of(context).superset_hint)));
  }

  void _unlinkSuperset(int index) {
    setState(() => unlinkFromSuperset(_exercises, index));
  }

  int _orderForDay(RoutineDay day) {
    final initial = widget.initialTemplate;
    final initialDay = initial == null
        ? widget.initialDay
        : routineDayForHistoryGrouping(
                storedDay: initial.routineDay,
                name: initial.name,
              ) ??
              widget.initialDay;
    if (initial != null && initialDay == day) {
      return initial.routineOrder ??
          widget.routineOrder ??
          routineOrderFromName(initial.name, fallback: 1);
    }
    if (initial == null &&
        widget.initialDay == day &&
        widget.routineOrder != null) {
      return widget.routineOrder!;
    }

    final orders = CustomTemplateStore.instance.templates
        .where((template) => template.id != initial?.id)
        .where(
          (template) =>
              routineDayForHistoryGrouping(
                storedDay: template.routineDay,
                name: template.name,
              ) ==
              day,
        )
        .map(
          (template) =>
              template.routineOrder ??
              routineOrderFromName(template.name, fallback: 0),
        );
    return orders.isEmpty ? 1 : orders.reduce((a, b) => a > b ? a : b) + 1;
  }

  Future<void> _confirmDiscardAndPop() async {
    if (!_hasUnsavedChanges) {
      setState(() => _allowPop = true);
      Navigator.pop(context);
      return;
    }
    final discard = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.bgCard,
        title: Text(S.of(context).common_discardChangesTitle),
        content: Text(
          S.of(context).common_discardChangesBody,
          style: TextStyle(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(S.of(context).common_keepEditing),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              S.of(context).common_discard,
              style: const TextStyle(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
    if (discard != true || !mounted) return;
    setState(() => _allowPop = true);
    Navigator.pop(context);
  }

  void _save() {
    final l10n = S.of(context);
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      setState(() => _showNameError = true);
      return;
    }
    if (_exercises.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.train_addExerciseFirst),
          backgroundColor: AppColors.bgCardLight,
        ),
      );
      return;
    }

    final day = _selectedDay;
    _allowPop = true;
    Navigator.pop(
      context,
      CustomTemplate(
        id:
            widget.initialTemplate?.id ??
            'custom_tpl_${DateTime.now().millisecondsSinceEpoch}',
        name: name,
        routineDay: day?.storageKey ?? routineDayUnassigned,
        routineOrder: day == null ? null : _orderForDay(day),
        exercises: _exercises
            .map(
              (draft) => TemplateExercise(
                name: draft.exercise.name,
                muscleGroup: draft.exercise.muscleGroup,
                equipment: draft.exercise.equipment,
                sets: draft.sets,
                reps: draft.reps,
                weight: draft.weight,
                restSeconds: draft.restSeconds,
                supersetId: draft.supersetId,
              ),
            )
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return PopScope<CustomTemplate>(
      canPop: _allowPop || !_hasUnsavedChanges,
      onPopInvokedWithResult: (didPop, _) async {
        if (!didPop) await _confirmDiscardAndPop();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(onPressed: _confirmDiscardAndPop),
          title: Text(
            widget.initialTemplate == null
                ? l10n.train_createRoutine
                : l10n.train_editRoutine,
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 120),
          children: [
            Text(
              l10n.train_createRoutineHint,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 13,
                height: 1.45,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              l10n.train_routineNameHint,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _nameController,
              // Only a brand-new routine starts by typing its name; opening
              // the keyboard over one being edited hides its exercises.
              autofocus:
                  widget.initialTemplate == null && widget.initialDay == null,
              textCapitalization: TextCapitalization.sentences,
              style: TextStyle(color: AppColors.textPrimary),
              onChanged: (_) => setState(() => _showNameError = false),
              decoration: InputDecoration(
                hintText: l10n.train_routineNameHint,
                errorText: _showNameError
                    ? l10n.train_routineNameRequired
                    : null,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              l10n.train_trainingDay,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              initialValue: _selectedDay?.storageKey ?? '',
              dropdownColor: AppColors.bgCardLight,
              style: TextStyle(color: AppColors.textPrimary),
              decoration: const InputDecoration(),
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
              onChanged: (value) {
                setState(() => _selectedDay = RoutineDay.fromStorage(value));
              },
            ),
            const SizedBox(height: 10),
            Text(
              l10n.train_trainingDayHint,
              style: TextStyle(
                color: AppColors.textMuted,
                fontSize: 11,
                height: 1.35,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Text(
                    l10n.common_exercises,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                TextButton.icon(
                  onPressed: _addExercise,
                  icon: const Icon(Icons.add_rounded, size: 18),
                  label: Text(l10n.train_addExercise),
                ),
              ],
            ),
            const SizedBox(height: 8),
            if (_exercises.isEmpty)
              Semantics(
                label: l10n.train_addFirstExercise,
                hint: l10n.train_addFirstExerciseHint,
                button: true,
                excludeSemantics: true,
                child: InkWell(
                  onTap: _addExercise,
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 28,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.bgCard,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.bgCardLight),
                    ),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.playlist_add_rounded,
                          color: AppColors.primary,
                          size: 32,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          l10n.train_addFirstExercise,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          l10n.train_addFirstExerciseHint,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 12,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            else
              // The order here is the order of the workout, so it can be
              // rearranged by dragging the handle on each card.
              ReorderableListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                buildDefaultDragHandles: false,
                itemCount: _exercises.length,
                onReorder: (oldIndex, newIndex) => setState(() {
                  if (newIndex > oldIndex) newIndex--;
                  _exercises.insert(newIndex, _exercises.removeAt(oldIndex));
                  // A superset is made of neighbours: moving one out
                  // breaks it.
                  normalizeSupersets(_exercises);
                }),
                proxyDecorator: (child, _, _) =>
                    Material(color: Colors.transparent, child: child),
                itemBuilder: (context, index) => _PlannedExerciseCard(
                  key: ObjectKey(_exercises[index]),
                  index: index,
                  draft: _exercises[index],
                  onChanged: () => setState(() {}),
                  onRemove: () => setState(() {
                    _exercises.removeAt(index);
                    normalizeSupersets(_exercises);
                  }),
                  inSuperset: isInSuperset(_exercises, index),
                  onLinkNext:
                      index < _exercises.length - 1 &&
                          !isLinkedWithNext(_exercises, index)
                      ? () => _linkSuperset(index)
                      : null,
                  onUnlink: isInSuperset(_exercises, index)
                      ? () => _unlinkSuperset(index)
                      : null,
                ),
              ),
          ],
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
            child: ElevatedButton.icon(
              onPressed: _save,
              icon: const Icon(Icons.check_rounded),
              label: Text(l10n.common_save),
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
        ),
      ),
    );
  }
}

class _PlannedExercise implements MutableSupersetMember {
  final Exercise exercise;
  int sets;
  int reps;
  int? restSeconds;

  @override
  String? supersetId;

  /// Load saved with the routine ("Save as routine" stores the one used).
  /// The builder has no field for it, so it is carried through untouched.
  final double weight;

  _PlannedExercise({required this.exercise}) : sets = 3, reps = 10, weight = 0;

  _PlannedExercise.fromTemplate(TemplateExercise template)
    : exercise = Exercise(
        id: 'routine_${template.name}_${template.equipment}',
        name: template.name,
        muscleGroup: template.muscleGroup,
        equipment: template.equipment,
        difficulty: '',
        description: '',
      ),
      sets = template.sets,
      reps = template.reps,
      restSeconds = template.restSeconds,
      supersetId = template.supersetId,
      weight = template.weight;
}

class _PlannedExerciseCard extends StatelessWidget {
  final int index;
  final _PlannedExercise draft;
  final VoidCallback onChanged;
  final VoidCallback onRemove;

  /// The exercise is alternated with its neighbours as a superset.
  final bool inSuperset;

  /// Groups this exercise with the next one; null when that is not possible.
  final VoidCallback? onLinkNext;

  /// Takes this exercise out of its superset; null when it is in none.
  final VoidCallback? onUnlink;

  const _PlannedExerciseCard({
    super.key,
    required this.index,
    required this.draft,
    required this.onChanged,
    required this.onRemove,
    this.inSuperset = false,
    this.onLinkNext,
    this.onUnlink,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
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
        children: [
          if (inSuperset) const SupersetStrip(),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 12, 10, 12),
            child: _buildBody(context, l10n),
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context, S l10n) {
    return Column(
      children: [
        Row(
          children: [
            ReorderableDragStartListener(
              index: index,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 10, 8),
                child: Icon(
                  Icons.drag_handle_rounded,
                  color: AppColors.textMuted,
                  size: 22,
                  semanticLabel: WidgetsLocalizations.of(context).reorderItemUp,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ExerciseLocalization.name(
                      l10n,
                      draft.exercise.name,
                      id: draft.exercise.id,
                    ),
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 6,
                    runSpacing: 4,
                    children: [
                      MuscleChip(label: draft.exercise.muscleGroup),
                      if (draft.exercise.equipment.isNotEmpty)
                        Text(
                          ExerciseLocalization.equipment(
                            l10n,
                            draft.exercise.equipment,
                          ),
                          style: TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 11,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              tooltip: l10n.train_deleteExercise,
              onPressed: onRemove,
              icon: Icon(
                Icons.close_rounded,
                color: AppColors.textMuted,
                size: 20,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _NumberStepper(
                label: l10n.common_sets,
                value: draft.sets,
                minimum: 1,
                maximum: 12,
                onChanged: (value) {
                  draft.sets = value;
                  onChanged();
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _NumberStepper(
                label: l10n.train_repsHeader,
                value: draft.reps,
                minimum: 1,
                maximum: 100,
                onChanged: (value) {
                  draft.reps = value;
                  onChanged();
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Text(
              l10n.rest_label,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            RestBadge(
              seconds: draft.restSeconds,
              onTap: () async {
                final choice = await showRestPicker(
                  context,
                  current: draft.restSeconds,
                );
                if (choice == null) return;
                draft.restSeconds = choice.seconds;
                onChanged();
              },
            ),
          ],
        ),
        if (onLinkNext != null || onUnlink != null)
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Wrap(
              spacing: 4,
              children: [
                if (onLinkNext != null)
                  _SupersetAction(
                    icon: Icons.link_rounded,
                    label: l10n.superset_linkNext,
                    onPressed: onLinkNext!,
                  ),
                if (onUnlink != null)
                  _SupersetAction(
                    icon: Icons.link_off_rounded,
                    label: l10n.superset_unlink,
                    onPressed: onUnlink!,
                  ),
              ],
            ),
          ),
      ],
    );
  }
}

class _SupersetAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _SupersetAction({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 16),
      label: Text(label),
      style: TextButton.styleFrom(
        foregroundColor: AppColors.asText(AppColors.primaryLight),
        padding: const EdgeInsets.symmetric(horizontal: 6),
        minimumSize: const Size(0, 40),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _NumberStepper extends StatelessWidget {
  final String label;
  final int value;
  final int minimum;
  final int maximum;
  final ValueChanged<int> onChanged;

  const _NumberStepper({
    required this.label,
    required this.value,
    required this.minimum,
    required this.maximum,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
      decoration: BoxDecoration(
        color: AppColors.bgCardLight,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              color: AppColors.textMuted,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _StepperButton(
                icon: Icons.remove_rounded,
                enabled: value > minimum,
                onPressed: () => onChanged(value - 1),
              ),
              Text(
                '$value',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
              _StepperButton(
                icon: Icons.add_rounded,
                enabled: value < maximum,
                onPressed: () => onChanged(value + 1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StepperButton extends StatelessWidget {
  final IconData icon;
  final bool enabled;
  final VoidCallback onPressed;

  const _StepperButton({
    required this.icon,
    required this.enabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: enabled ? onPressed : null,
      constraints: const BoxConstraints.tightFor(width: 44, height: 40),
      padding: EdgeInsets.zero,
      icon: Icon(icon, size: 18),
    );
  }
}
