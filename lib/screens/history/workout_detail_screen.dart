import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/app_theme.dart';
import '../../models/models.dart';

class WorkoutDetailScreen extends StatelessWidget {
  final Workout workout;

  const WorkoutDetailScreen({super.key, required this.workout});

  String _formatDate(DateTime date) {
    const months = [
      'enero', 'febrero', 'marzo', 'abril', 'mayo', 'junio',
      'julio', 'agosto', 'septiembre', 'octubre', 'noviembre', 'diciembre'
    ];
    return '${date.day} de ${months[date.month - 1]} de ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 180,
            pinned: true,
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.bgCard.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.arrow_back_ios_new_rounded,
                    color: AppColors.textPrimary, size: 18),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.primary, AppColors.primaryDark],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 60, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          workout.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _formatDate(workout.date),
                          style: const TextStyle(
                              color: Colors.white70, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSummaryCards(context)
                      .animate()
                      .fadeIn(duration: 300.ms),
                  const SizedBox(height: 24),
                  Text('Ejercicios realizados',
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 12),
                  ...workout.exercises.asMap().entries.map(
                        (entry) =>
                            _ExerciseDetailCard(exercise: entry.value)
                                .animate()
                                .fadeIn(
                                    delay: Duration(
                                        milliseconds: 80 * entry.key),
                                    duration: 300.ms)
                                .slideY(begin: 0.05, end: 0),
                      ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCards(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _DetailStatCard(
            icon: Icons.timer_rounded,
            value: '${workout.duration.inMinutes} min',
            label: 'Duración',
            color: AppColors.accent,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _DetailStatCard(
            icon: Icons.fitness_center_rounded,
            value: '${workout.exercises.length}',
            label: 'Ejercicios',
            color: AppColors.primary,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _DetailStatCard(
            icon: Icons.bar_chart_rounded,
            value: '${workout.totalVolume} kg',
            label: 'Volumen',
            color: AppColors.accentOrange,
          ),
        ),
      ],
    );
  }
}

class _DetailStatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;

  const _DetailStatCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: color.withOpacity(0.25)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 8),
          Text(value,
              style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w700)),
          const SizedBox(height: 2),
          Text(label,
              style: const TextStyle(
                  color: AppColors.textMuted, fontSize: 10)),
        ],
      ),
    );
  }
}

class _ExerciseDetailCard extends StatelessWidget {
  final WorkoutExercise exercise;

  const _ExerciseDetailCard({required this.exercise});

  Color _colorForMuscle(String muscle) {
    switch (muscle) {
      case 'Pecho':
        return AppColors.chest;
      case 'Espalda':
        return AppColors.back;
      case 'Piernas':
        return AppColors.legs;
      case 'Hombros':
        return AppColors.shoulders;
      case 'Brazos':
        return AppColors.arms;
      case 'Core':
        return AppColors.core;
      default:
        return AppColors.primary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _colorForMuscle(exercise.muscleGroup);
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
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.fitness_center_rounded,
                      color: color, size: 18),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(exercise.name,
                          style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: 3),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(exercise.muscleGroup,
                            style: TextStyle(
                                color: color,
                                fontSize: 11,
                                fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                ),
                Text(
                  '${exercise.sets.length} series',
                  style: const TextStyle(
                      color: AppColors.textMuted, fontSize: 12),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            child: Row(
              children: const [
                Expanded(
                    flex: 1,
                    child: Text('Serie',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 11,
                            fontWeight: FontWeight.w600))),
                Expanded(
                    flex: 2,
                    child: Text('Reps',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 11,
                            fontWeight: FontWeight.w600))),
                Expanded(
                    flex: 2,
                    child: Text('Peso',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 11,
                            fontWeight: FontWeight.w600))),
                Expanded(
                    flex: 2,
                    child: Text('Volumen',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 11,
                            fontWeight: FontWeight.w600))),
              ],
            ),
          ),
          ...exercise.sets.map(
            (set) => Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.accent.withOpacity(0.04),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: AppColors.bgCardLight,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: Text(
                          '${set.setNumber}',
                          style: const TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      '${set.reps}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      set.weight > 0
                          ? '${set.weight.toStringAsFixed(0)} kg'
                          : 'Corporal',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      set.weight > 0
                          ? '${(set.reps * set.weight).toStringAsFixed(0)} kg'
                          : '-',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: color,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
