import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../data/workout_templates.dart';
import '../../models/session_models.dart';
import '../../models/models.dart';
import '../../data/workout_store.dart';
import '../../services/watch_service.dart';
import '../../theme/app_theme.dart';
import '../../utils/pro_gate.dart';
import '../../widgets/common/muscle_chip.dart';
import 'exercise_picker_screen.dart';

class TrainScreen extends StatefulWidget {
  const TrainScreen({super.key});

  @override
  State<TrainScreen> createState() => _TrainScreenState();
}

class _TrainScreenState extends State<TrainScreen> {
  bool _workoutStarted = false;
  Timer? _timer;
  int _elapsedSeconds = 0;
  final List<SessionExercise> _exercises = [];
  String? _workoutName; // null → 'Entrenamiento libre'

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _syncWatch() {
    WatchService.instance.updateWorkoutState(
      active: _workoutStarted,
      name: _workoutName ?? 'Entrenamiento libre',
      elapsedSeconds: _elapsedSeconds,
      exercises: _exercises
          .map((e) => {
                'name': e.name,
                'muscleGroup': e.muscleGroup,
                'completedSets': e.completedSets,
                'totalSets': e.sets.length,
              })
          .toList(),
    );
  }

  // ── Workout control ──────────────────────────────────────────────────────

  void _startWorkout({String? name}) {
    setState(() {
      _workoutStarted = true;
      _workoutName = name;
      _elapsedSeconds = 0;
    });
    _syncWatch();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() => _elapsedSeconds++);
      if (_elapsedSeconds % 5 == 0) _syncWatch(); // sync every 5s
    });
  }

  void _startFromTemplate(WorkoutTemplate t) {
    setState(() {
      _exercises.clear();
      for (final ex in t.exercises) {
        _exercises.add(SessionExercise(
          id: '${t.id}_${ex.name}_${DateTime.now().millisecondsSinceEpoch}',
          name: ex.name,
          muscleGroup: ex.muscleGroup,
          equipment: ex.equipment,
          sets: ex.buildSets(),
        ));
      }
    });
    _startWorkout(name: t.name);
  }

  void _cancelWorkout() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.bgCard,
        title: const Text('Cancelar entrenamiento',
            style: TextStyle(color: AppColors.textPrimary)),
        content: const Text(
            '¿Seguro que quieres cancelar? Se perderá el progreso.',
            style: TextStyle(color: AppColors.textSecondary)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Seguir',
                style: TextStyle(color: AppColors.primary)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              _timer?.cancel();
              setState(() {
                _workoutStarted = false;
                _workoutName = null;
                _exercises.clear();
                _elapsedSeconds = 0;
              });
              _syncWatch();
            },
            child: const Text('Cancelar',
                style: TextStyle(color: AppColors.error)),
          ),
        ],
      ),
    );
  }

  void _finishWorkout() {
    if (_exercises.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Añade al menos un ejercicio antes de finalizar.'),
          backgroundColor: AppColors.bgCardLight,
        ),
      );
      return;
    }
    _timer?.cancel();
    _showSummaryDialog();
  }

  void _showSummaryDialog() {
    final totalSets = _exercises.fold(0, (s, e) => s + e.sets.length);
    final totalVolume = _exercises.fold(0, (s, e) => s + e.totalVolume);
    final completedSets = _exercises.fold(0, (s, e) => s + e.completedSets);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.bgCard,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Row(
          children: [
            Icon(Icons.emoji_events_rounded,
                color: AppColors.accentYellow, size: 24),
            SizedBox(width: 8),
            Text('¡Entrenamiento completado!',
                style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w700)),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_workoutName != null) ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withAlpha(25),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  _workoutName!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                      fontSize: 14),
                ),
              ),
              const SizedBox(height: 12),
            ],
            const SizedBox(height: 4),
            _SummaryStat(
                icon: Icons.timer_rounded,
                label: 'Duración',
                value: _formatTime(_elapsedSeconds),
                color: AppColors.accent),
            const SizedBox(height: 8),
            _SummaryStat(
                icon: Icons.fitness_center_rounded,
                label: 'Ejercicios',
                value: '${_exercises.length}',
                color: AppColors.primary),
            const SizedBox(height: 8),
            _SummaryStat(
                icon: Icons.repeat_rounded,
                label: 'Series completadas',
                value: '$completedSets / $totalSets',
                color: AppColors.accentOrange),
            const SizedBox(height: 8),
            _SummaryStat(
                icon: Icons.bar_chart_rounded,
                label: 'Volumen total',
                value: '$totalVolume kg',
                color: AppColors.accentYellow),
          ],
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                _saveWorkout();
                Navigator.pop(ctx);
                setState(() {
                  _workoutStarted = false;
                  _workoutName = null;
                  _exercises.clear();
                  _elapsedSeconds = 0;
                });
                _syncWatch();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text('Finalizar',
                  style: TextStyle(fontWeight: FontWeight.w700)),
            ),
          ),
        ],
      ),
    );
  }

  void _saveWorkout() {
    final workout = Workout(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: _workoutName ?? 'Entrenamiento libre',
      date: DateTime.now(),
      duration: Duration(seconds: _elapsedSeconds),
      exercises: _exercises
          .map((e) => WorkoutExercise(
                id: e.id,
                name: e.name,
                muscleGroup: e.muscleGroup,
                sets: e.sets
                    .asMap()
                    .entries
                    .map((entry) => WorkoutSet(
                          setNumber: entry.key + 1,
                          reps: entry.value.reps,
                          weight: entry.value.weight,
                          completed: entry.value.completed,
                        ))
                    .toList(),
              ))
          .toList(),
      totalVolume: _exercises.fold(0, (s, e) => s + e.totalVolume),
    );
    WorkoutStore.instance.add(workout);
  }

  Future<void> _addExercise() async {
    final ex = await Navigator.push<Exercise>(
      context,
      MaterialPageRoute(builder: (_) => const ExercisePickerScreen()),
    );
    if (ex == null) return;
    setState(() {
      _exercises.add(SessionExercise(
        id: '${ex.id}_${DateTime.now().millisecondsSinceEpoch}',
        name: ex.name,
        muscleGroup: ex.muscleGroup,
        equipment: ex.equipment,
        sets: [SessionSet(reps: 10, weight: 0)],
      ));
    });
  }

  void _removeExercise(int index) {
    setState(() => _exercises.removeAt(index));
  }

  void _addSet(int exIndex) {
    final last = _exercises[exIndex].sets.last;
    setState(() {
      _exercises[exIndex].sets.add(
            SessionSet(reps: last.reps, weight: last.weight),
          );
    });
  }

  void _removeSet(int exIndex, int setIndex) {
    if (_exercises[exIndex].sets.length <= 1) return;
    setState(() => _exercises[exIndex].sets.removeAt(setIndex));
  }

  void _toggleSetDone(int exIndex, int setIndex) {
    setState(() {
      final s = _exercises[exIndex].sets[setIndex];
      s.completed = !s.completed;
    });
  }

  String _formatTime(int seconds) {
    final h = seconds ~/ 3600;
    final m = (seconds % 3600) ~/ 60;
    final s = seconds % 60;
    if (h > 0) {
      return '${h.toString().padLeft(2, '0')}:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
    }
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  // ── Template preview ─────────────────────────────────────────────────────

  Future<void> _showTemplatePreview(WorkoutTemplate t) async {
    if (!await requirePro(context)) return;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => _TemplatePreviewSheet(
        template: t,
        onStart: () {
          Navigator.pop(context);
          _startFromTemplate(t);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _workoutStarted ? _buildActiveWorkout() : _buildEmptyState(),
    );
  }

  // ── Empty / pre-workout state ────────────────────────────────────────────

  Widget _buildEmptyState() {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(title: Text('Entrenar'), floating: true),

        // Hero + free workout button
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 28, 28, 0),
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.primary, AppColors.primaryDark],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withAlpha(80),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.fitness_center_rounded,
                      color: Colors.white, size: 36),
                ),
                const SizedBox(height: 20),
                Text(
                  '¿Listo para entrenar?',
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Inicia una sesión libre o elige una rutina preconfigurada.',
                  style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 14,
                      height: 1.5),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () => _startWorkout(),
                    icon: const Icon(Icons.play_arrow_rounded),
                    label: const Text('Sesión libre'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Divider "O elige una rutina"
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 28, 28, 0),
            child: Row(
              children: [
                const Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'O elige una rutina',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textMuted,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                const Expanded(child: Divider()),
              ],
            ),
          ),
        ),

        // Template list
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 40),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) => _TemplateCard(
                template: workoutTemplates[i],
                onTap: () => _showTemplatePreview(workoutTemplates[i]),
              ),
              childCount: workoutTemplates.length,
            ),
          ),
        ),
      ],
    );
  }

  // ── Active workout ───────────────────────────────────────────────────────

  Widget _buildActiveWorkout() {
    return Column(
      children: [
        _buildHeader(),
        Expanded(
          child: _exercises.isEmpty
              ? _buildNoExercisesHint()
              : ListView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
                  itemCount: _exercises.length,
                  itemBuilder: (context, i) => _ExerciseCard(
                    key: ValueKey(_exercises[i].id),
                    exercise: _exercises[i],
                    onAddSet: () => _addSet(i),
                    onRemoveSet: (si) => _removeSet(i, si),
                    onToggleDone: (si) => _toggleSetDone(i, si),
                    onDelete: () => _removeExercise(i),
                    onSetChanged: () => setState(() {}),
                  ),
                ),
        ),
        _buildBottomBar(),
      ],
    );
  }

  Widget _buildHeader() {
    return SafeArea(
      bottom: false,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
        decoration: const BoxDecoration(
          color: AppColors.bgCard,
          border: Border(
              bottom: BorderSide(color: AppColors.bgCardLight, width: 1)),
        ),
        child: Row(
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: AppColors.accent,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.accent.withAlpha(128),
                      blurRadius: 6)
                ],
              ),
            ),
            const SizedBox(width: 10),
            if (_workoutName != null)
              Expanded(
                child: Row(
                  children: [
                    Flexible(
                      child: Text(
                        _workoutName!,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: AppColors.accent,
                            fontWeight: FontWeight.w700,
                            fontSize: 13),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppColors.bgCardLight,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        _formatTime(_elapsedSeconds),
                        style: const TextStyle(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w700,
                            fontSize: 13),
                      ),
                    ),
                  ],
                ),
              )
            else ...[
              const Text('En curso',
                  style: TextStyle(
                      color: AppColors.accent,
                      fontWeight: FontWeight.w600,
                      fontSize: 13)),
              const SizedBox(width: 6),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: AppColors.bgCardLight,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _formatTime(_elapsedSeconds),
                  style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w700,
                      fontSize: 13),
                ),
              ),
              const Spacer(),
            ],
            TextButton(
              onPressed: _cancelWorkout,
              style: TextButton.styleFrom(
                  foregroundColor: AppColors.error,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 4)),
              child: const Text('Cancelar',
                  style: TextStyle(
                      fontSize: 13, fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoExercisesHint() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add_box_outlined,
                color: AppColors.textMuted, size: 48),
            const SizedBox(height: 12),
            const Text('Sin ejercicios aún',
                style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            const Text(
                'Toca el botón de abajo para añadir el primer ejercicio.',
                style: TextStyle(color: AppColors.textMuted, fontSize: 13),
                textAlign: TextAlign.center),
            const SizedBox(height: 24),
            OutlinedButton.icon(
              onPressed: _addExercise,
              icon: const Icon(Icons.add_rounded),
              label: const Text('Añadir ejercicio'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primary,
                side: const BorderSide(color: AppColors.primary),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
        decoration: const BoxDecoration(
          color: AppColors.bgCard,
          border: Border(
              top: BorderSide(color: AppColors.bgCardLight, width: 1)),
        ),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: _addExercise,
                icon: const Icon(Icons.add_rounded, size: 18),
                label: const Text('Ejercicio'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  side: const BorderSide(color: AppColors.primary),
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13)),
                  textStyle: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              flex: 2,
              child: ElevatedButton.icon(
                onPressed: _finishWorkout,
                icon: const Icon(Icons.check_rounded, size: 18),
                label: const Text('Finalizar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accent,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13)),
                  textStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Template card (list item in empty state) ──────────────────────────────────

class _TemplateCard extends StatelessWidget {
  final WorkoutTemplate template;
  final VoidCallback onTap;

  const _TemplateCard({required this.template, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final t = template;
    return GestureDetector(
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
                      Text(t.name,
                          style: const TextStyle(
                              color: AppColors.textPrimary,
                              fontSize: 15,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(width: 6),
                      const ProBadge(),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(t.subtitle,
                      style: const TextStyle(
                          color: AppColors.textMuted, fontSize: 12)),
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
                Text('${t.exercises.length}',
                    style: TextStyle(
                        color: t.color,
                        fontSize: 20,
                        fontWeight: FontWeight.w800)),
                const Text('ej.',
                    style: TextStyle(
                        color: AppColors.textMuted, fontSize: 10)),
                const SizedBox(height: 4),
                const Icon(Icons.chevron_right_rounded,
                    color: AppColors.textMuted, size: 18),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SmallMuscleTag extends StatelessWidget {
  final String muscle;
  const _SmallMuscleTag({required this.muscle});

  Color _color() {
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
    final c = _color();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: c.withAlpha(25),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(muscle,
          style: TextStyle(
              color: c, fontSize: 10, fontWeight: FontWeight.w600)),
    );
  }
}

// ── Template preview bottom sheet ─────────────────────────────────────────────

class _TemplatePreviewSheet extends StatelessWidget {
  final WorkoutTemplate template;
  final VoidCallback onStart;

  const _TemplatePreviewSheet(
      {required this.template, required this.onStart});

  @override
  Widget build(BuildContext context) {
    final t = template;
    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (_, scrollCtrl) => Container(
        decoration: const BoxDecoration(
          color: AppColors.bgCard,
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(24)),
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
                        Text(t.name,
                            style: const TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 20,
                                fontWeight: FontWeight.w700)),
                        Text(t.subtitle,
                            style: const TextStyle(
                                color: AppColors.textMuted,
                                fontSize: 13)),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: t.color.withAlpha(25),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      '${t.exercises.length} ej.',
                      style: TextStyle(
                          color: t.color,
                          fontWeight: FontWeight.w700,
                          fontSize: 12),
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
                separatorBuilder: (_, _) =>
                    const SizedBox(height: 8),
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
                padding:
                    const EdgeInsets.fromLTRB(20, 8, 20, 16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: onStart,
                    icon: const Icon(Icons.play_arrow_rounded),
                    label: Text('Empezar ${t.name}'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: t.color,
                      foregroundColor: Colors.white,
                      padding:
                          const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
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

  const _PreviewExRow(
      {required this.exercise,
      required this.index,
      required this.color});

  @override
  Widget build(BuildContext context) {
    final ex = exercise;
    final weightStr =
        ex.weight > 0 ? '${ex.weight.toInt()} kg' : 'Peso corporal';
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
              child: Text('${index + 1}',
                  style: TextStyle(
                      color: color,
                      fontSize: 12,
                      fontWeight: FontWeight.w700)),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(ex.name,
                    style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 13,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text('${ex.muscleGroup} · ${ex.equipment}',
                    style: const TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 11)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('${ex.sets} × ${ex.reps}',
                  style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 13,
                      fontWeight: FontWeight.w700)),
              Text(weightStr,
                  style: const TextStyle(
                      color: AppColors.textMuted, fontSize: 11)),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Exercise card ────────────────────────────────────────────────────────────

class _ExerciseCard extends StatelessWidget {
  final SessionExercise exercise;
  final VoidCallback onAddSet;
  final void Function(int) onRemoveSet;
  final void Function(int) onToggleDone;
  final VoidCallback onDelete;
  final VoidCallback onSetChanged;

  const _ExerciseCard({
    super.key,
    required this.exercise,
    required this.onAddSet,
    required this.onRemoveSet,
    required this.onToggleDone,
    required this.onDelete,
    required this.onSetChanged,
  });

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
    final done = exercise.completedSets;
    final total = exercise.sets.length;

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
                Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color: color.withAlpha(38),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.fitness_center_rounded,
                      color: color, size: 18),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(exercise.name,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w700)),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          MuscleChip(label: exercise.muscleGroup),
                          const SizedBox(width: 6),
                          if (done > 0)
                            Text('$done/$total series ✓',
                                style: const TextStyle(
                                    color: AppColors.accent,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ],
                  ),
                ),
                PopupMenuButton<String>(
                  color: AppColors.bgCardLight,
                  onSelected: (v) {
                    if (v == 'delete') onDelete();
                  },
                  itemBuilder: (_) => [
                    const PopupMenuItem(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(Icons.delete_outline_rounded,
                              color: AppColors.error, size: 18),
                          SizedBox(width: 8),
                          Text('Eliminar ejercicio',
                              style:
                                  TextStyle(color: AppColors.error)),
                        ],
                      ),
                    ),
                  ],
                  icon: const Icon(Icons.more_horiz_rounded,
                      color: AppColors.textMuted),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 14, vertical: 4),
            child: Row(
              children: const [
                _ColHeader(label: 'SERIE', flex: 1),
                _ColHeader(label: 'REPS', flex: 2),
                _ColHeader(label: 'PESO (kg)', flex: 3),
                _ColHeader(label: '', flex: 1),
              ],
            ),
          ),
          const Divider(height: 1),
          ...exercise.sets.asMap().entries.map(
                (entry) => _SetRow(
                  key:
                      ValueKey('${exercise.id}_set_${entry.key}'),
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
                bottom: Radius.circular(16)),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_rounded,
                      color: AppColors.primary, size: 16),
                  SizedBox(width: 4),
                  Text('Añadir serie',
                      style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 13,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
          ),
        ],
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
        text: widget.set.reps > 0 ? '${widget.set.reps}' : '');
    _weightCtrl = TextEditingController(
        text:
            widget.set.weight > 0 ? _fmt(widget.set.weight) : '');
  }

  @override
  void dispose() {
    _repsCtrl.dispose();
    _weightCtrl.dispose();
    super.dispose();
  }

  String _fmt(double v) =>
      v == v.roundToDouble()
          ? v.toInt().toString()
          : v.toString();

  @override
  Widget build(BuildContext context) {
    final done = widget.set.completed;
    return Container(
      color:
          done ? AppColors.accent.withAlpha(13) : Colors.transparent,
      padding:
          const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
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
                      color: done
                          ? AppColors.accent
                          : AppColors.textSecondary,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
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
                widget.set.reps =
                    int.tryParse(v) ?? widget.set.reps;
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
                          double.tryParse(v) ?? widget.set.weight;
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
                          color:
                              AppColors.textMuted.withAlpha(128),
                          size: 16),
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
                    color: done
                        ? AppColors.accent
                        : AppColors.bgCardLight,
                    borderRadius: BorderRadius.circular(8),
                    border: done
                        ? null
                        : Border.all(
                            color: AppColors.bgCardLight),
                  ),
                  child: done
                      ? const Icon(Icons.check_rounded,
                          color: Colors.white, size: 16)
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
            : [
                FilteringTextInputFormatter.allow(
                    RegExp(r'^\d*\.?\d*')),
              ],
        style: TextStyle(
          color: done ? AppColors.accent : AppColors.textPrimary,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
              color: AppColors.textMuted, fontSize: 14),
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 8, vertical: 8),
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
      child: Text(label,
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: AppColors.textMuted,
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5)),
    );
  }
}

class _SummaryStat extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _SummaryStat(
      {required this.icon,
      required this.label,
      required this.value,
      required this.color});

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
        Text(label,
            style: const TextStyle(
                color: AppColors.textSecondary, fontSize: 13)),
        const Spacer(),
        Text(value,
            style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w700)),
      ],
    );
  }
}
