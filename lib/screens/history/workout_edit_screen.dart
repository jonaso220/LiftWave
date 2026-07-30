import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';

import '../../data/workout_store.dart';
import '../../models/models.dart';
import '../../theme/app_theme.dart';
import '../../utils/exercise_localization.dart';

/// Editable view of a past workout. Users can fix reps, weight and notes
/// they forgot to log correctly. Adding/removing exercises is out of scope.
class WorkoutEditScreen extends StatefulWidget {
  final Workout workout;
  const WorkoutEditScreen({super.key, required this.workout});

  @override
  State<WorkoutEditScreen> createState() => _WorkoutEditScreenState();
}

class _WorkoutEditScreenState extends State<WorkoutEditScreen> {
  late final List<_EditableExercise> _exercises;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _exercises = widget.workout.exercises
        .map((e) => _EditableExercise.from(e))
        .toList();
  }

  @override
  void dispose() {
    for (final e in _exercises) {
      e.dispose();
    }
    super.dispose();
  }

  Future<void> _save() async {
    if (_saving) return;
    setState(() => _saving = true);

    final updatedExercises = _exercises.map((e) => e.toExercise()).toList();
    final newVolume = updatedExercises.fold<int>(
      0,
      (sum, exercise) => sum + exercise.completedVolume,
    );
    final updated = Workout(
      id: widget.workout.id,
      name: widget.workout.name,
      date: widget.workout.date,
      duration: widget.workout.duration,
      exercises: updatedExercises,
      totalVolume: newVolume,
      notes: widget.workout.notes,
      routineDay: widget.workout.routineDay,
      routineOrder: widget.workout.routineOrder,
    );
    await WorkoutStore.instance.update(updated);
    if (!mounted) return;
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      appBar: AppBar(
        title: Text(l10n.editWorkout_title),
        backgroundColor: AppColors.bgCard,
        actions: [
          TextButton(
            onPressed: _saving ? null : _save,
            child: _saving
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.primary,
                    ),
                  )
                : Text(
                    l10n.common_save,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        itemCount: _exercises.length,
        itemBuilder: (ctx, i) => _ExerciseCard(editable: _exercises[i]),
      ),
    );
  }
}

class _ExerciseCard extends StatelessWidget {
  final _EditableExercise editable;
  const _ExerciseCard({required this.editable});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.bgCardLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 14, 14, 8),
            child: Row(
              children: [
                const Icon(
                  Icons.fitness_center_rounded,
                  color: AppColors.primary,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    ExerciseLocalization.name(l10n, editable.name),
                    style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 0, 14, 12),
            child: TextField(
              controller: editable.notesCtrl,
              maxLines: 2,
              minLines: 1,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 13,
              ),
              decoration: InputDecoration(
                hintText: l10n.train_notesHint,
                hintStyle: const TextStyle(
                  color: AppColors.textMuted,
                  fontSize: 13,
                ),
                filled: true,
                fillColor: AppColors.bgCardLight,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
              ),
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    l10n.train_setHeader,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    l10n.common_reps,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    l10n.train_weightHeader,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.textMuted,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 36),
              ],
            ),
          ),
          ...editable.sets.asMap().entries.map((entry) {
            final i = entry.key;
            final s = entry.value;
            return Padding(
              padding: const EdgeInsets.fromLTRB(14, 4, 14, 4),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: AppColors.bgCardLight,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          '${i + 1}',
                          style: const TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: _NumberField(
                      controller: s.repsCtrl,
                      allowDecimal: false,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 2,
                    child: _NumberField(
                      controller: s.weightCtrl,
                      allowDecimal: true,
                    ),
                  ),
                  SizedBox(
                    width: 36,
                    child: ListenableBuilder(
                      listenable: s,
                      builder: (_, _) => IconButton(
                        visualDensity: VisualDensity.compact,
                        icon: Icon(
                          s.completed
                              ? Icons.check_circle_rounded
                              : Icons.radio_button_unchecked_rounded,
                          color: s.completed
                              ? AppColors.accent
                              : AppColors.textMuted,
                          size: 22,
                        ),
                        onPressed: s.toggleCompleted,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _NumberField extends StatelessWidget {
  final TextEditingController controller;
  final bool allowDecimal;
  const _NumberField({required this.controller, required this.allowDecimal});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.numberWithOptions(decimal: allowDecimal),
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          allowDecimal ? RegExp(r'^\d*[\.,]?\d*') : RegExp(r'^\d*'),
        ),
      ],
      style: const TextStyle(
        color: AppColors.textPrimary,
        fontSize: 15,
        fontWeight: FontWeight.w700,
      ),
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: AppColors.bgCardLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      ),
    );
  }
}

// ── Editable scratch models ──────────────────────────────────────────────────

class _EditableExercise extends ChangeNotifier {
  final String id;
  final String name;
  final String muscleGroup;
  final String? routineBlockName;
  final TextEditingController notesCtrl;
  final List<_EditableSet> sets;

  _EditableExercise._({
    required this.id,
    required this.name,
    required this.muscleGroup,
    required this.routineBlockName,
    required this.notesCtrl,
    required this.sets,
  });

  factory _EditableExercise.from(WorkoutExercise w) {
    return _EditableExercise._(
      id: w.id,
      name: w.name,
      muscleGroup: w.muscleGroup,
      routineBlockName: w.routineBlockName,
      notesCtrl: TextEditingController(text: w.notes ?? ''),
      sets: w.sets
          .map(
            (set) => _EditableSet.from(
              set,
              completed: w.isSetEffectivelyCompleted(set),
            ),
          )
          .toList(),
    );
  }

  WorkoutExercise toExercise() {
    return WorkoutExercise(
      id: id,
      name: name,
      muscleGroup: muscleGroup,
      sets: sets.asMap().entries.map((e) => e.value.toSet(e.key + 1)).toList(),
      notes: notesCtrl.text.trim().isEmpty ? null : notesCtrl.text.trim(),
      routineBlockName: routineBlockName,
    );
  }

  @override
  void dispose() {
    notesCtrl.dispose();
    for (final s in sets) {
      s.dispose();
    }
    super.dispose();
  }
}

class _EditableSet extends ChangeNotifier {
  final TextEditingController repsCtrl;
  final TextEditingController weightCtrl;
  bool _completed;

  _EditableSet._({
    required this.repsCtrl,
    required this.weightCtrl,
    required bool completed,
  }) : _completed = completed;

  factory _EditableSet.from(WorkoutSet s, {required bool completed}) =>
      _EditableSet._(
        repsCtrl: TextEditingController(text: '${s.reps}'),
        weightCtrl: TextEditingController(
          text: s.weight % 1 == 0
              ? s.weight.toStringAsFixed(0)
              : s.weight.toString(),
        ),
        completed: completed,
      );

  bool get completed => _completed;
  void toggleCompleted() {
    _completed = !_completed;
    notifyListeners();
  }

  WorkoutSet toSet(int setNumber) {
    final reps = int.tryParse(repsCtrl.text.trim()) ?? 0;
    final weight =
        double.tryParse(weightCtrl.text.trim().replaceAll(',', '.')) ?? 0;
    return WorkoutSet(
      setNumber: setNumber,
      reps: reps.clamp(0, 999),
      weight: weight.clamp(0, 1000).toDouble(),
      completed: _completed,
    );
  }

  @override
  void dispose() {
    repsCtrl.dispose();
    weightCtrl.dispose();
    super.dispose();
  }
}
