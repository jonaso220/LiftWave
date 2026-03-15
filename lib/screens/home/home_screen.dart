import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../theme/app_theme.dart';
import '../../data/mock_data.dart';
import '../../data/workout_store.dart';
import '../../data/progress_store.dart';
import '../../models/models.dart';
import '../../services/auth_service.dart';
import '../../services/subscription_service.dart';
import '../paywall/paywall_screen.dart';
import '../progress/progress_screen.dart';

class HomeScreen extends StatefulWidget {
  final void Function(int) onNavigate;

  const HomeScreen({super.key, required this.onNavigate});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WorkoutStore.instance.addListener(_onStoreChanged);
    ProgressStore.instance.addListener(_onStoreChanged);
  }

  @override
  void dispose() {
    WorkoutStore.instance.removeListener(_onStoreChanged);
    ProgressStore.instance.removeListener(_onStoreChanged);
    super.dispose();
  }

  void _onStoreChanged() => setState(() {});

  // ── Computed properties ──────────────────────────────────────────────────

  List<Workout> get _weekWorkouts {
    final now = DateTime.now();
    final weekStart = now.subtract(Duration(days: now.weekday - 1));
    final start = DateTime(weekStart.year, weekStart.month, weekStart.day);
    return WorkoutStore.instance.workouts
        .where((w) => !w.date.isBefore(start))
        .toList();
  }

  Workout? get _lastWorkout => WorkoutStore.instance.workouts.isEmpty
      ? null
      : WorkoutStore.instance.workouts.first;

  String _greeting() {
    final h = DateTime.now().hour;
    final user = FirebaseAuth.instance.currentUser;
    final name = user?.displayName?.split(' ').first ?? '';
    final suffix = name.isNotEmpty ? ', $name!' : '!';
    if (h < 12) return '¡Buenos días$suffix';
    if (h < 19) return '¡Buenas tardes$suffix';
    return '¡Buenas noches$suffix';
  }

  Widget _buildProfileAvatar() {
    final user = FirebaseAuth.instance.currentUser;
    final photoUrl = user?.photoURL;
    final initial = (user?.displayName?.isNotEmpty == true)
        ? user!.displayName![0].toUpperCase()
        : '?';

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        width: 36,
        height: 36,
        child: photoUrl != null
            ? Image.network(
                photoUrl,
                width: 36,
                height: 36,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => _fallbackAvatar(initial),
              )
            : _fallbackAvatar(initial),
      ),
    );
  }

  Widget _fallbackAvatar(String initial) {
    return Container(
      width: 36,
      height: 36,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.accentOrange, AppColors.accentYellow],
        ),
      ),
      child: Center(
        child: Text(initial,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16)),
      ),
    );
  }

  void _showProfileMenu(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.bgCard,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (ctx) => SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.textMuted.withAlpha(80),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),
              // User info
              if (user != null) ...[
                _buildProfileAvatar(),
                const SizedBox(height: 12),
                Text(
                  user.displayName ?? '',
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  user.email ?? '',
                  style: const TextStyle(
                    color: AppColors.textMuted,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 24),
              ],
              // Subscription status
              ListTile(
                leading: Icon(
                  SubscriptionService.instance.isPro
                      ? Icons.workspace_premium_rounded
                      : Icons.star_outline_rounded,
                  color: AppColors.accentYellow,
                ),
                title: Text(
                  SubscriptionService.instance.isPro
                      ? 'LiftWave PRO'
                      : 'Plan gratuito',
                  style: const TextStyle(color: AppColors.textPrimary),
                ),
                subtitle: Text(
                  SubscriptionService.instance.isPro
                      ? 'Suscripción activa'
                      : 'Actualizar a PRO',
                  style: const TextStyle(
                      color: AppColors.textMuted, fontSize: 12),
                ),
                onTap: SubscriptionService.instance.isPro
                    ? null
                    : () {
                        Navigator.pop(ctx);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const PaywallScreen()),
                        );
                      },
              ),
              // Redeem promo code
              ListTile(
                leading: const Icon(Icons.card_giftcard_rounded,
                    color: AppColors.textSecondary),
                title: const Text('Canjear código',
                    style: TextStyle(color: AppColors.textPrimary)),
                onTap: () {
                  Navigator.pop(ctx);
                  _showRedeemCodeDialog(context);
                },
              ),
              // Restore purchases
              ListTile(
                leading: const Icon(Icons.restore_rounded,
                    color: AppColors.textSecondary),
                title: const Text('Restaurar compras',
                    style: TextStyle(color: AppColors.textPrimary)),
                onTap: () async {
                  Navigator.pop(ctx);
                  final restored =
                      await SubscriptionService.instance.restorePurchases();
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(restored
                          ? 'Compras restauradas correctamente'
                          : 'No se encontraron compras previas'),
                      backgroundColor:
                          restored ? AppColors.accent : AppColors.textMuted,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ));
                  }
                },
              ),
              const Divider(indent: 16, endIndent: 16),
              // Sign out
              ListTile(
                leading: const Icon(Icons.logout_rounded,
                    color: AppColors.textSecondary),
                title: const Text('Cerrar sesión',
                    style: TextStyle(color: AppColors.textPrimary)),
                onTap: () async {
                  Navigator.pop(ctx);
                  await AuthService.instance.signOut();
                },
              ),
              // Delete account
              ListTile(
                leading: const Icon(Icons.delete_forever_rounded,
                    color: AppColors.error),
                title: const Text('Eliminar cuenta',
                    style: TextStyle(color: AppColors.error)),
                onTap: () {
                  Navigator.pop(ctx);
                  _confirmDeleteAccount(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showRedeemCodeDialog(BuildContext context) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.bgCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Canjear código',
            style: TextStyle(color: AppColors.textPrimary)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Ingresa tu código promocional para desbloquear LiftWave PRO.',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller,
              textCapitalization: TextCapitalization.characters,
              style: const TextStyle(
                  color: AppColors.textPrimary, letterSpacing: 1.5),
              decoration: InputDecoration(
                hintText: 'CÓDIGO',
                hintStyle: const TextStyle(color: AppColors.textMuted),
                filled: true,
                fillColor: AppColors.bgDark,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () async {
              final code = controller.text;
              Navigator.pop(ctx);
              final success =
                  await SubscriptionService.instance.redeemCode(code);
              if (!mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(success
                    ? 'LiftWave PRO activado'
                    : 'Código inválido'),
                backgroundColor:
                    success ? AppColors.accent : AppColors.error,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ));
              if (success) setState(() {});
            },
            child: const Text('Canjear',
                style: TextStyle(color: AppColors.accent)),
          ),
        ],
      ),
    );
  }

  void _confirmDeleteAccount(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.bgCard,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text('Eliminar cuenta',
            style: TextStyle(color: AppColors.textPrimary)),
        content: const Text(
          '¿Estás seguro? Esta acción es irreversible y se eliminarán todos tus datos.',
          style: TextStyle(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(ctx);
              try {
                await AuthService.instance.deleteAccount();
              } on FirebaseAuthException catch (e) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(AuthService.errorMessage(e.code)),
                      backgroundColor: AppColors.error,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  );
                }
              } catch (_) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(
                          'Para eliminar tu cuenta, cierra sesión, vuelve a iniciar y reintenta.'),
                      backgroundColor: AppColors.error,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  );
                }
              }
            },
            child: const Text('Eliminar',
                style: TextStyle(color: AppColors.error)),
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes % 60;
    if (h > 0) return '${h}h ${m}m';
    return '${m}m';
  }

  String _formatVolume(int kg) {
    if (kg >= 1000) return '${(kg / 1000).toStringAsFixed(1)}k';
    return '$kg';
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final d = DateTime(date.year, date.month, date.day);
    final diff = today.difference(d).inDays;
    if (diff == 0) return 'Hoy';
    if (diff == 1) return 'Ayer';
    if (diff < 7) return 'Hace $diff días';
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    final weekWorkouts = _weekWorkouts;
    final lastWorkout = _lastWorkout;
    final totalWeekVolume =
        weekWorkouts.fold(0, (s, w) => s + w.totalVolume);
    final totalWeekDuration =
        weekWorkouts.fold(Duration.zero, (s, w) => s + w.duration);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  _buildGreetingCard(context, weekWorkouts.length)
                      .animate()
                      .fadeIn(duration: 400.ms)
                      .slideY(begin: 0.1, end: 0),
                  const SizedBox(height: 20),
                  _buildStatsRow(
                    context,
                    weekCount: weekWorkouts.length,
                    lastDuration: lastWorkout?.duration,
                    weekVolume: totalWeekVolume,
                    weekDuration: totalWeekDuration,
                  )
                      .animate()
                      .fadeIn(delay: 100.ms, duration: 400.ms)
                      .slideY(begin: 0.1, end: 0),
                  const SizedBox(height: 24),
                  _buildQuickActions(context)
                      .animate()
                      .fadeIn(delay: 200.ms, duration: 400.ms),
                  const SizedBox(height: 24),
                  _buildLastWorkoutCard(context, lastWorkout)
                      .animate()
                      .fadeIn(delay: 300.ms, duration: 400.ms),
                  const SizedBox(height: 24),
                  _buildProgressCard(context)
                      .animate()
                      .fadeIn(delay: 380.ms, duration: 400.ms),
                  const SizedBox(height: 24),
                  _buildRecentExercises(context)
                      .animate()
                      .fadeIn(delay: 460.ms, duration: 400.ms),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 0,
      floating: true,
      pinned: false,
      toolbarHeight: 64,
      backgroundColor: AppColors.bgDark,
      title: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/icon/icon_1024_transparent.png',
              width: 36,
              height: 36,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Text(
            'LiftWave',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.5,
                ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: AppColors.bgCard,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.notifications_none_rounded,
                color: AppColors.textSecondary, size: 20),
          ),
          onPressed: () {},
        ),
        const SizedBox(width: 8),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: () => _showProfileMenu(context),
            child: _buildProfileAvatar(),
          ),
        ),
      ],
    );
  }

  Widget _buildGreetingCard(BuildContext context, int weekCount) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            _greeting(),
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 6),
          Text(
            weekCount == 0
                ? 'Aún no has entrenado esta semana. ¡Empieza hoy!'
                : weekCount == 1
                    ? 'Llevas 1 entrenamiento esta semana. ¡Sigue así!'
                    : 'Llevas $weekCount entrenamientos esta semana. ¡Sigue así!',
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () => widget.onNavigate(1),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.play_arrow_rounded,
                      color: AppColors.primary, size: 18),
                  SizedBox(width: 6),
                  Text(
                    'Iniciar entrenamiento',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow(
    BuildContext context, {
    required int weekCount,
    required Duration? lastDuration,
    required int weekVolume,
    required Duration weekDuration,
  }) {
    return Row(
      children: [
        Expanded(
          child: _StatCard(
            icon: Icons.fitness_center_rounded,
            value: '$weekCount',
            label: 'Esta semana',
            color: AppColors.primary,
            onTap: () => widget.onNavigate(2),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _StatCard(
            icon: Icons.timer_rounded,
            value: weekCount == 0
                ? '—'
                : _formatDuration(weekDuration),
            label: 'Tiempo semana',
            color: AppColors.accent,
            onTap: () => widget.onNavigate(2),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _StatCard(
            icon: Icons.bar_chart_rounded,
            value: weekCount == 0 ? '—' : '${_formatVolume(weekVolume)} kg',
            label: 'Volumen semana',
            color: AppColors.accentOrange,
            onTap: () => widget.onNavigate(2),
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    final actions = [
      _QuickAction(
          icon: Icons.fitness_center_rounded,
          label: 'Entrenar',
          color: AppColors.primary,
          onTap: () => widget.onNavigate(1)),
      _QuickAction(
          icon: Icons.history_rounded,
          label: 'Historial',
          color: AppColors.accent,
          onTap: () => widget.onNavigate(2)),
      _QuickAction(
          icon: Icons.timer_rounded,
          label: 'Descanso',
          color: AppColors.accentOrange,
          onTap: () => widget.onNavigate(3)),
      _QuickAction(
          icon: Icons.menu_book_rounded,
          label: 'Ejercicios',
          color: AppColors.accentYellow,
          onTap: () => widget.onNavigate(4)),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Acceso rápido',
            style: Theme.of(context).textTheme.headlineSmall),
        const SizedBox(height: 12),
        Row(
          children: actions
              .map((a) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: GestureDetector(
                        onTap: a.onTap,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          decoration: BoxDecoration(
                            color: a.color.withAlpha(30),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                                color: a.color.withAlpha(64), width: 1),
                          ),
                          child: Column(
                            children: [
                              Icon(a.icon, color: a.color, size: 24),
                              const SizedBox(height: 6),
                              Text(
                                a.label,
                                style: TextStyle(
                                  color: a.color,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildLastWorkoutCard(BuildContext context, Workout? workout) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Último entrenamiento',
                style: Theme.of(context).textTheme.headlineSmall),
            GestureDetector(
              onTap: () => widget.onNavigate(2),
              child: const Text('Ver todo',
                  style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 13,
                      fontWeight: FontWeight.w600)),
            ),
          ],
        ),
        const SizedBox(height: 12),
        if (workout == null)
          GestureDetector(
            onTap: () => widget.onNavigate(1),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.bgCard,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.bgCardLight, width: 1),
              ),
              child: Column(
                children: [
                  const Icon(Icons.fitness_center_rounded,
                      color: AppColors.textMuted, size: 32),
                  const SizedBox(height: 10),
                  const Text(
                    'Aún sin entrenamientos',
                    style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Completa tu primer entrenamiento y aparecerá aquí.',
                    style: TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 12,
                        height: 1.4),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withAlpha(25),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'Ir a Entrenar →',
                      style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          )
        else
          GestureDetector(
            onTap: () => widget.onNavigate(2),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.bgCard,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.bgCardLight, width: 1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withAlpha(38),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.fitness_center_rounded,
                            color: AppColors.primary, size: 18),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(workout.name,
                                style:
                                    Theme.of(context).textTheme.titleLarge),
                            const SizedBox(height: 2),
                            Text(
                              '${_formatDate(workout.date)} · ${_formatDuration(workout.duration)}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.chevron_right_rounded,
                          color: AppColors.textMuted),
                    ],
                  ),
                  const SizedBox(height: 14),
                  const Divider(height: 1),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      _WorkoutStat(
                          label: 'Ejercicios',
                          value: '${workout.exercises.length}'),
                      _WorkoutStat(
                          label: 'Series',
                          value: '${workout.totalSets}'),
                      _WorkoutStat(
                          label: 'Volumen',
                          value: '${_formatVolume(workout.totalVolume)} kg'),
                    ],
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildProgressCard(BuildContext context) {
    final latest = ProgressStore.instance.latest;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Progreso',
                style: Theme.of(context).textTheme.headlineSmall),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const ProgressScreen()),
              ),
              child: const Text('Ver todo',
                  style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 13,
                      fontWeight: FontWeight.w600)),
            ),
          ],
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const ProgressScreen()),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.bgCard,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.bgCardLight, width: 1),
            ),
            child: latest == null
                ? Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.accent.withAlpha(25),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.monitor_weight_outlined,
                            color: AppColors.accent, size: 22),
                      ),
                      const SizedBox(width: 14),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Sin registros aún',
                                style: TextStyle(
                                    color: AppColors.textPrimary,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600)),
                            SizedBox(height: 3),
                            Text('Registra tu peso y medidas',
                                style: TextStyle(
                                    color: AppColors.textMuted,
                                    fontSize: 12)),
                          ],
                        ),
                      ),
                      const Icon(Icons.chevron_right_rounded,
                          color: AppColors.textMuted),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: AppColors.accent.withAlpha(25),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.monitor_weight_outlined,
                                color: AppColors.accent, size: 18),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Último registro',
                                    style: TextStyle(
                                        color: AppColors.textPrimary,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)),
                                const SizedBox(height: 2),
                                Text(
                                  '${latest.date.day}/${latest.date.month}/${latest.date.year}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall,
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.chevron_right_rounded,
                              color: AppColors.textMuted),
                        ],
                      ),
                      const SizedBox(height: 14),
                      const Divider(height: 1),
                      const SizedBox(height: 14),
                      Row(
                        children: [
                          if (latest.weight != null)
                            _ProgressStat(
                                label: 'Peso',
                                value:
                                    '${latest.weight!.toStringAsFixed(1)} kg',
                                color: AppColors.accent),
                          if (latest.waist != null)
                            _ProgressStat(
                                label: 'Cintura',
                                value:
                                    '${latest.waist!.toStringAsFixed(1)} cm',
                                color: AppColors.primary),
                          if (latest.chest != null)
                            _ProgressStat(
                                label: 'Pecho',
                                value:
                                    '${latest.chest!.toStringAsFixed(1)} cm',
                                color: AppColors.accentOrange),
                          if (latest.hips != null)
                            _ProgressStat(
                                label: 'Cadera',
                                value:
                                    '${latest.hips!.toStringAsFixed(1)} cm',
                                color: AppColors.accentYellow),
                        ],
                      ),
                    ],
                  ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecentExercises(BuildContext context) {
    final recent = mockExercises.take(3).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Biblioteca de ejercicios',
                style: Theme.of(context).textTheme.headlineSmall),
            GestureDetector(
              onTap: () => widget.onNavigate(4),
              child: const Text('Ver todos',
                  style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 13,
                      fontWeight: FontWeight.w600)),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          '${mockExercises.length} ejercicios disponibles',
          style: const TextStyle(color: AppColors.textMuted, fontSize: 12),
        ),
        const SizedBox(height: 12),
        ...recent.map((ex) => _RecentExerciseItem(
              exercise: ex,
              onTap: () => widget.onNavigate(4),
            )),
      ],
    );
  }
}

// ── Supporting widgets ────────────────────────────────────────────────────────

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.bgCard,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.bgCardLight, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: const TextStyle(
                color: AppColors.textMuted,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WorkoutStat extends StatelessWidget {
  final String label;
  final String value;

  const _WorkoutStat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(value,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              )),
          const SizedBox(height: 2),
          Text(label,
              style:
                  const TextStyle(color: AppColors.textMuted, fontSize: 11)),
        ],
      ),
    );
  }
}

class _QuickAction {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  _QuickAction({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });
}

class _ProgressStat extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _ProgressStat(
      {required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(value,
              style: TextStyle(
                  color: color,
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

class _RecentExerciseItem extends StatelessWidget {
  final Exercise exercise;
  final VoidCallback onTap;

  const _RecentExerciseItem({required this.exercise, required this.onTap});

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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.bgCard,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.bgCardLight, width: 1),
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: color.withAlpha(38),
                borderRadius: BorderRadius.circular(10),
              ),
              child:
                  Icon(Icons.fitness_center_rounded, color: color, size: 16),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(exercise.name,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.w600)),
                  const SizedBox(height: 2),
                  Text(
                      '${exercise.muscleGroup} · ${exercise.equipment} · ${exercise.difficulty}',
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
            const Icon(Icons.chevron_right_rounded,
                color: AppColors.textMuted, size: 18),
          ],
        ),
      ),
    );
  }
}
