import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/app_theme.dart';
import '../../data/mock_data.dart';
import '../../models/models.dart';
import '../../services/subscription_service.dart';
import '../../utils/pro_gate.dart';
import '../../widgets/common/muscle_chip.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({super.key});

  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  String _searchQuery = '';
  String _selectedMuscle = 'Todos';
  String _selectedEquipment = 'Todos';

  List<Exercise> get _filtered {
    return mockExercises.where((e) {
      final matchSearch = _searchQuery.isEmpty ||
          e.name.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchMuscle =
          _selectedMuscle == 'Todos' || e.muscleGroup == _selectedMuscle;
      final matchEquip =
          _selectedEquipment == 'Todos' || e.equipment == _selectedEquipment;
      return matchSearch && matchMuscle && matchEquip;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filtered = _filtered;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Ejercicios'),
            floating: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSearchBar()
                      .animate()
                      .fadeIn(duration: 300.ms),
                  const SizedBox(height: 14),
                  _buildMuscleFilter()
                      .animate()
                      .fadeIn(delay: 80.ms, duration: 300.ms),
                  const SizedBox(height: 10),
                  _buildEquipmentFilter()
                      .animate()
                      .fadeIn(delay: 130.ms, duration: 300.ms),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        '${filtered.length} ejercicio${filtered.length != 1 ? 's' : ''}',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      if (_selectedMuscle != 'Todos' ||
                          _selectedEquipment != 'Todos' ||
                          _searchQuery.isNotEmpty) ...[
                        const Spacer(),
                        GestureDetector(
                          onTap: () => setState(() {
                            _searchQuery = '';
                            _selectedMuscle = 'Todos';
                            _selectedEquipment = 'Todos';
                          }),
                          child: const Text('Limpiar filtros',
                              style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: filtered.isEmpty
                ? SliverToBoxAdapter(
                    child: _buildEmpty(),
                  )
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return _ExerciseCard(exercise: filtered[index])
                            .animate()
                            .fadeIn(
                                delay: Duration(milliseconds: 40 * index),
                                duration: 250.ms)
                            .slideY(begin: 0.03, end: 0);
                      },
                      childCount: filtered.length,
                    ),
                  ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      onChanged: (v) => setState(() => _searchQuery = v),
      style: const TextStyle(color: AppColors.textPrimary),
      decoration: InputDecoration(
        hintText: 'Buscar ejercicios...',
        prefixIcon: const Icon(Icons.search_rounded,
            color: AppColors.textMuted, size: 20),
        suffixIcon: _searchQuery.isNotEmpty
            ? GestureDetector(
                onTap: () => setState(() => _searchQuery = ''),
                child: const Icon(Icons.close_rounded,
                    color: AppColors.textMuted, size: 18),
              )
            : null,
      ),
    );
  }

  Widget _buildMuscleFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Músculo',
            style: TextStyle(
                color: AppColors.textMuted,
                fontSize: 11,
                fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: muscleGroups.map((m) {
              final isSelected = m == _selectedMuscle;
              return GestureDetector(
                onTap: () => setState(() => _selectedMuscle = m),
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 7),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primary
                        : AppColors.bgCard,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.bgCardLight,
                    ),
                  ),
                  child: Text(
                    m,
                    style: TextStyle(
                      color: isSelected
                          ? Colors.white
                          : AppColors.textSecondary,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildEquipmentFilter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Material',
            style: TextStyle(
                color: AppColors.textMuted,
                fontSize: 11,
                fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: equipmentList.map((eq) {
              final isSelected = eq == _selectedEquipment;
              return GestureDetector(
                onTap: () => setState(() => _selectedEquipment = eq),
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14, vertical: 7),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.accentOrange
                        : AppColors.bgCard,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected
                          ? AppColors.accentOrange
                          : AppColors.bgCardLight,
                    ),
                  ),
                  child: Text(
                    eq,
                    style: TextStyle(
                      color: isSelected
                          ? Colors.white
                          : AppColors.textSecondary,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildEmpty() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Column(
        children: [
          const Icon(Icons.search_off_rounded,
              color: AppColors.textMuted, size: 48),
          const SizedBox(height: 12),
          const Text('Sin resultados',
              style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Text(
            'Prueba con otros filtros o términos de búsqueda',
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _ExerciseCard extends StatelessWidget {
  final Exercise exercise;

  const _ExerciseCard({required this.exercise});

  Color _difficultyColor(String diff) {
    switch (diff) {
      case 'Principiante':
        return AppColors.accent;
      case 'Intermedio':
        return AppColors.accentYellow;
      case 'Avanzado':
        return AppColors.error;
      default:
        return AppColors.textMuted;
    }
  }

  @override
  Widget build(BuildContext context) {
    final diffColor = _difficultyColor(exercise.difficulty);

    return GestureDetector(
      onTap: () => _showDetail(context),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.bgCard,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.bgCardLight),
        ),
        child: Row(
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary.withOpacity(0.2),
                    AppColors.primaryLight.withOpacity(0.1),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.fitness_center_rounded,
                  color: AppColors.primary, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(exercise.name,
                      style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      MuscleChip(label: exercise.muscleGroup),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: AppColors.bgCardLight,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(exercise.equipment,
                            style: const TextStyle(
                                color: AppColors.textMuted,
                                fontSize: 11,
                                fontWeight: FontWeight.w500)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: diffColor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(height: 4),
                Text(exercise.difficulty,
                    style: TextStyle(
                        color: diffColor,
                        fontSize: 10,
                        fontWeight: FontWeight.w600)),
                if (!SubscriptionService.instance.isPro) ...[
                  const SizedBox(height: 4),
                  const ProBadge(),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showDetail(BuildContext context) async {
    if (!await requirePro(context)) return;
    if (!context.mounted) return;
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.bgCard,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      isScrollControlled: true,
      builder: (_) => _ExerciseDetailSheet(exercise: exercise),
    );
  }
}

class _ExerciseDetailSheet extends StatelessWidget {
  final Exercise exercise;

  const _ExerciseDetailSheet({required this.exercise});

  Color _difficultyColor(String diff) {
    switch (diff) {
      case 'Principiante':
        return AppColors.accent;
      case 'Intermedio':
        return AppColors.accentYellow;
      case 'Avanzado':
        return AppColors.error;
      default:
        return AppColors.textMuted;
    }
  }

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
    final muscleColor = _colorForMuscle(exercise.muscleGroup);
    final diffColor = _difficultyColor(exercise.difficulty);

    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 0.9,
      minChildSize: 0.4,
      expand: false,
      builder: (context, scrollController) => SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.bgCardLight,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: muscleColor.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(Icons.fitness_center_rounded,
                        color: muscleColor, size: 28),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(exercise.name,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            MuscleChip(label: exercise.muscleGroup),
                            const SizedBox(width: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: diffColor.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(exercise.difficulty,
                                  style: TextStyle(
                                      color: diffColor,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 16),

              // ── Info tiles ──
              Row(
                children: [
                  Expanded(
                    child: _InfoTile(
                        icon: Icons.category_rounded,
                        label: 'Grupo muscular',
                        value: exercise.muscleGroup,
                        color: muscleColor),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _InfoTile(
                        icon: Icons.build_rounded,
                        label: 'Material',
                        value: exercise.equipment,
                        color: AppColors.accentOrange),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // ── Descripción ──
              _SectionTitle(title: 'Ejecución'),
              const SizedBox(height: 10),
              Text(exercise.description,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(height: 1.65, color: AppColors.textSecondary)),
              const SizedBox(height: 20),

              // ── Músculos secundarios ──
              if (exercise.secondaryMuscles.isNotEmpty) ...[
                _SectionTitle(title: 'Músculos secundarios'),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: exercise.secondaryMuscles
                      .map((m) => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: AppColors.bgCardLight,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(m,
                                style: const TextStyle(
                                    color: AppColors.textSecondary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500)),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 20),
              ],

              // ── Beneficios ──
              if (exercise.benefits.isNotEmpty) ...[
                _SectionTitle(title: 'Beneficios'),
                const SizedBox(height: 10),
                ...exercise.benefits.map((b) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            margin: const EdgeInsets.only(top: 6, right: 10),
                            decoration: BoxDecoration(
                              color: muscleColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Expanded(
                            child: Text(b,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        height: 1.5,
                                        color: AppColors.textSecondary)),
                          ),
                        ],
                      ),
                    )),
                const SizedBox(height: 12),
              ],
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.add_rounded),
                  label: const Text('Añadir al entrenamiento'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: Theme.of(context)
            .textTheme
            .titleMedium
            ?.copyWith(fontWeight: FontWeight.w700, color: AppColors.textPrimary));
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _InfoTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(height: 8),
          Text(value,
              style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w700)),
          const SizedBox(height: 2),
          Text(label,
              style: const TextStyle(
                  color: AppColors.textMuted, fontSize: 11)),
        ],
      ),
    );
  }
}
