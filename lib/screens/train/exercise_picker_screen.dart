import 'package:flutter/material.dart';
import '../../data/mock_data.dart';
import '../../models/models.dart';
import '../../theme/app_theme.dart';
import '../../widgets/common/muscle_chip.dart';

class ExercisePickerScreen extends StatefulWidget {
  const ExercisePickerScreen({super.key});

  @override
  State<ExercisePickerScreen> createState() => _ExercisePickerScreenState();
}

class _ExercisePickerScreenState extends State<ExercisePickerScreen> {
  String _query = '';
  String _muscle = 'Todos';

  List<Exercise> get _filtered => mockExercises.where((e) {
        final matchQ = _query.isEmpty ||
            e.name.toLowerCase().contains(_query.toLowerCase());
        final matchM = _muscle == 'Todos' || e.muscleGroup == _muscle;
        return matchQ && matchM;
      }).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      appBar: AppBar(
        title: const Text('Seleccionar ejercicio'),
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: TextField(
              autofocus: true,
              onChanged: (v) => setState(() => _query = v),
              style: const TextStyle(color: AppColors.textPrimary),
              decoration: InputDecoration(
                hintText: 'Buscar ejercicio...',
                prefixIcon: const Icon(Icons.search_rounded,
                    color: AppColors.textMuted, size: 20),
                suffixIcon: _query.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.close_rounded,
                            color: AppColors.textMuted, size: 18),
                        onPressed: () => setState(() => _query = ''),
                      )
                    : null,
              ),
            ),
          ),
          const SizedBox(height: 10),
          _buildMuscleFilter(),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              itemCount: _filtered.length,
              itemBuilder: (context, i) {
                final ex = _filtered[i];
                return _ExerciseRow(
                  exercise: ex,
                  onTap: () => Navigator.pop(context, ex),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMuscleFilter() {
    return SizedBox(
      height: 36,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: muscleGroups.map((m) {
          final sel = m == _muscle;
          return GestureDetector(
            onTap: () => setState(() => _muscle = m),
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: sel ? AppColors.primary : AppColors.bgCard,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: sel ? AppColors.primary : AppColors.bgCardLight,
                ),
              ),
              child: Text(
                m,
                style: TextStyle(
                  color: sel ? Colors.white : AppColors.textSecondary,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _ExerciseRow extends StatelessWidget {
  final Exercise exercise;
  final VoidCallback onTap;

  const _ExerciseRow({required this.exercise, required this.onTap});

  Color _colorForMuscle(String m) {
    switch (m) {
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
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        margin: const EdgeInsets.only(bottom: 6),
        decoration: BoxDecoration(
          color: AppColors.bgCard,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.bgCardLight),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color.withAlpha(38),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.fitness_center_rounded, color: color, size: 18),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(exercise.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          )),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      MuscleChip(label: exercise.muscleGroup),
                      const SizedBox(width: 6),
                      Text(exercise.equipment,
                          style: const TextStyle(
                              color: AppColors.textMuted, fontSize: 11)),
                    ],
                  ),
                ],
              ),
            ),
            const Icon(Icons.add_circle_rounded,
                color: AppColors.primary, size: 22),
          ],
        ),
      ),
    );
  }
}
