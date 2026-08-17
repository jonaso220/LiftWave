import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';

import '../../data/custom_template_store.dart';
import '../../data/workout_templates.dart';
import '../../models/models.dart';
import '../../theme/app_theme.dart';
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
          },
        )
        .toList(),
  });

  bool get _hasUnsavedChanges => _draftSignature() != _initialSignature;

  int _orderForDay(RoutineDay day) {
    final initial = widget.initialTemplate;
    final initialDay = initial == null
        ? widget.initialDay
        : RoutineDay.fromStorage(initial.routineDay) ??
              routineDayFromName(initial.name) ??
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
              (RoutineDay.fromStorage(template.routineDay) ??
                  routineDayFromName(template.name)) ==
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
          style: const TextStyle(color: AppColors.textSecondary),
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
        routineDay: day?.storageKey,
        routineOrder: day == null ? null : _orderForDay(day),
        exercises: _exercises
            .map(
              (draft) => TemplateExercise(
                name: draft.exercise.name,
                muscleGroup: draft.exercise.muscleGroup,
                equipment: draft.exercise.equipment,
                sets: draft.sets,
                reps: draft.reps,
                weight: 0,
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
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 13,
                height: 1.45,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              l10n.train_routineNameHint,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _nameController,
              autofocus: widget.initialDay == null,
              textCapitalization: TextCapitalization.sentences,
              style: const TextStyle(color: AppColors.textPrimary),
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
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              initialValue: _selectedDay?.storageKey ?? '',
              dropdownColor: AppColors.bgCardLight,
              style: const TextStyle(color: AppColors.textPrimary),
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
              style: const TextStyle(
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
                          style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          l10n.train_addFirstExerciseHint,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
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
              ...List.generate(
                _exercises.length,
                (index) => _PlannedExerciseCard(
                  key: ValueKey('${_exercises[index].exercise.id}-$index'),
                  draft: _exercises[index],
                  onChanged: () => setState(() {}),
                  onRemove: () => setState(() => _exercises.removeAt(index)),
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

class _PlannedExercise {
  final Exercise exercise;
  int sets;
  int reps;

  _PlannedExercise({required this.exercise}) : sets = 3, reps = 10;

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
      reps = template.reps;
}

class _PlannedExerciseCard extends StatelessWidget {
  final _PlannedExercise draft;
  final VoidCallback onChanged;
  final VoidCallback onRemove;

  const _PlannedExerciseCard({
    super.key,
    required this.draft,
    required this.onChanged,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.fromLTRB(14, 12, 10, 12),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.bgCardLight),
      ),
      child: Column(
        children: [
          Row(
            children: [
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
                      style: const TextStyle(
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
                            style: const TextStyle(
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
                icon: const Icon(
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
        ],
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
            style: const TextStyle(
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
                style: const TextStyle(
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
      visualDensity: VisualDensity.compact,
      constraints: const BoxConstraints.tightFor(width: 32, height: 32),
      padding: EdgeInsets.zero,
      icon: Icon(icon, size: 18),
    );
  }
}
