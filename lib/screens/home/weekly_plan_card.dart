import 'package:flutter/material.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';

import '../../data/workout_templates.dart';
import '../../services/weekly_plan_service.dart';
import '../../theme/app_theme.dart';
import '../../utils/muscle_colors.dart';

class WeeklyPlanCard extends StatelessWidget {
  final WeeklyTrainingPlan? plan;
  final VoidCallback onConfigure;
  final void Function(WorkoutTemplate template) onStart;

  const WeeklyPlanCard({
    super.key,
    required this.plan,
    required this.onConfigure,
    required this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    final value = plan;
    if (value == null) return _buildSetup(context);
    final l10n = S.of(context);
    final percent = (value.adherence * 100).round();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              l10n.weeklyPlan_title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Spacer(),
            Text(
              l10n.weeklyPlan_sessions(
                value.completedWorkouts,
                value.targetWorkouts,
              ),
              style: const TextStyle(
                color: AppColors.primaryLight,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.bgCard,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: AppColors.bgCardLight),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _Metric(
                    value: '$percent%',
                    label: l10n.weeklyPlan_adherence,
                    color: AppColors.accent,
                  ),
                  _Metric(
                    value: '${value.remainingWorkouts}',
                    label: l10n.weeklyPlan_remaining,
                    color: AppColors.primary,
                  ),
                  _Metric(
                    value:
                        '${value.completedSetsByMuscle.values.fold<int>(0, (a, b) => a + b)}',
                    label: l10n.weeklyPlan_completedSets,
                    color: AppColors.accentOrange,
                  ),
                ],
              ),
              const SizedBox(height: 14),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: LinearProgressIndicator(
                  minHeight: 7,
                  value: value.adherence,
                  backgroundColor: AppColors.bgCardLight,
                  valueColor: const AlwaysStoppedAnimation(AppColors.accent),
                ),
              ),
              if (value.completedSetsByMuscle.isNotEmpty) ...[
                const SizedBox(height: 18),
                Text(
                  l10n.weeklyPlan_muscleBalance,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 9),
                ..._topMuscles(value).map(
                  (entry) => _MuscleProgress(
                    label: _muscleLabel(l10n, entry.key),
                    sets: entry.value,
                    maxSets: _maxSets(value),
                    color: colorForMuscle(entry.key),
                  ),
                ),
              ],
              const SizedBox(height: 18),
              if (value.targetReached)
                _CompletedPlan(message: l10n.weeklyPlan_completed)
              else if (value.nextWorkout != null)
                _NextWorkout(
                  plan: value,
                  onStart: () => onStart(value.nextWorkout!),
                )
              else
                _UnavailablePlan(
                  message: l10n.weeklyPlan_noCompatible,
                  button: l10n.weeklyPlan_adjustEquipment,
                  onConfigure: onConfigure,
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSetup(BuildContext context) {
    final l10n = S.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.weeklyPlan_title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: AppColors.primary.withAlpha(18),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: AppColors.primary.withAlpha(60)),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.auto_awesome_rounded,
                color: AppColors.primaryLight,
                size: 28,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.weeklyPlan_setupTitle,
                      style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      l10n.weeklyPlan_setupSubtitle,
                      style: const TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: onConfigure,
                child: Text(l10n.weeklyPlan_configure),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<MapEntry<String, int>> _topMuscles(WeeklyTrainingPlan value) {
    final entries = value.completedSetsByMuscle.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return entries.take(3).toList();
  }

  int _maxSets(WeeklyTrainingPlan value) => value.completedSetsByMuscle.values
      .fold<int>(1, (maximum, sets) => sets > maximum ? sets : maximum);

  String _muscleLabel(S l10n, String muscle) => switch (muscle) {
    'Pecho' => l10n.muscle_chest,
    'Espalda' => l10n.muscle_back,
    'Piernas' => l10n.muscle_legs,
    'Hombros' => l10n.muscle_shoulders,
    'Brazos' => l10n.muscle_arms,
    'Core' => l10n.muscle_core,
    'CrossFit' => l10n.muscle_crossfit,
    _ => muscle,
  };
}

class _Metric extends StatelessWidget {
  final String value;
  final String label;
  final Color color;

  const _Metric({
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(color: AppColors.textMuted, fontSize: 9),
          ),
        ],
      ),
    );
  }
}

class _MuscleProgress extends StatelessWidget {
  final String label;
  final int sets;
  final int maxSets;
  final Color color;

  const _MuscleProgress({
    required this.label,
    required this.sets,
    required this.maxSets,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Row(
        children: [
          SizedBox(
            width: 68,
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 10,
              ),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(3),
              child: LinearProgressIndicator(
                minHeight: 6,
                value: sets / maxSets,
                backgroundColor: AppColors.bgCardLight,
                valueColor: AlwaysStoppedAnimation(color),
              ),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 18,
            child: Text(
              '$sets',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: color,
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NextWorkout extends StatelessWidget {
  final WeeklyTrainingPlan plan;
  final VoidCallback onStart;

  const _NextWorkout({required this.plan, required this.onStart});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final workout = plan.nextWorkout!;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.primary.withAlpha(20),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.primary.withAlpha(60)),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: AppColors.primary.withAlpha(38),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.auto_awesome_rounded,
              color: AppColors.primaryLight,
              size: 21,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.weeklyPlan_nextSession,
                  style: const TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  workout.name,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  l10n.weeklyPlan_exerciseCount(workout.exercises.length),
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          FilledButton(
            onPressed: onStart,
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(horizontal: 13),
              minimumSize: const Size(0, 38),
            ),
            child: Text(l10n.weeklyPlan_start),
          ),
        ],
      ),
    );
  }
}

class _CompletedPlan extends StatelessWidget {
  final String message;

  const _CompletedPlan({required this.message});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.check_circle_rounded, color: AppColors.accent),
        const SizedBox(width: 9),
        Expanded(
          child: Text(
            message,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}

class _UnavailablePlan extends StatelessWidget {
  final String message;
  final String button;
  final VoidCallback onConfigure;

  const _UnavailablePlan({
    required this.message,
    required this.button,
    required this.onConfigure,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.info_outline_rounded, color: AppColors.warning),
        const SizedBox(width: 9),
        Expanded(
          child: Text(
            message,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 11,
            ),
          ),
        ),
        TextButton(onPressed: onConfigure, child: Text(button)),
      ],
    );
  }
}
