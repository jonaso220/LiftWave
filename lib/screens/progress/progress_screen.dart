import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../../data/progress_store.dart';
import '../../models/progress_models.dart';
import '../../services/subscription_service.dart';
import '../../theme/app_theme.dart';
import '../../utils/pro_gate.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  _Metric _metric = _Metric.weight;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    ProgressStore.instance.addListener(_onChanged);
  }

  @override
  void dispose() {
    _tabController.dispose();
    ProgressStore.instance.removeListener(_onChanged);
    super.dispose();
  }

  void _onChanged() => setState(() {});

  void _showAddSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const _AddMeasurementSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgDark,
      appBar: AppBar(
        backgroundColor: AppColors.bgDark,
        title: const Text('Progreso corporal'),
        actions: [
          IconButton(
            icon: Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: AppColors.primary.withAlpha(25),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.add_rounded,
                  color: AppColors.primary, size: 20),
            ),
            onPressed: _showAddSheet,
          ),
          const SizedBox(width: 8),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.textMuted,
          indicatorColor: AppColors.primary,
          indicatorSize: TabBarIndicatorSize.label,
          tabs: const [
            Tab(text: 'Medidas'),
            Tab(text: 'Fotos'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _MedidasTab(
            metric: _metric,
            onMetricChanged: (m) => setState(() => _metric = m),
            onAdd: _showAddSheet,
          ),
          _FotosTab(onAdd: _showAddSheet),
        ],
      ),
    );
  }
}

// ── Metrics enum ──────────────────────────────────────────────────────────────

enum _Metric {
  weight('Peso', 'kg'),
  waist('Cintura', 'cm'),
  chest('Pecho', 'cm'),
  hips('Cadera', 'cm');

  final String label;
  final String unit;
  const _Metric(this.label, this.unit);

  double? valueOf(BodyMeasurement m) {
    switch (this) {
      case _Metric.weight:
        return m.weight;
      case _Metric.waist:
        return m.waist;
      case _Metric.chest:
        return m.chest;
      case _Metric.hips:
        return m.hips;
    }
  }

  Color get color {
    switch (this) {
      case _Metric.weight:
        return AppColors.primary;
      case _Metric.waist:
        return AppColors.accent;
      case _Metric.chest:
        return AppColors.accentOrange;
      case _Metric.hips:
        return AppColors.accentYellow;
    }
  }
}

// ── Medidas tab ───────────────────────────────────────────────────────────────

class _MedidasTab extends StatelessWidget {
  final _Metric metric;
  final ValueChanged<_Metric> onMetricChanged;
  final VoidCallback onAdd;

  const _MedidasTab({
    required this.metric,
    required this.onMetricChanged,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    final store = ProgressStore.instance;
    final all = store.measurements;
    final withData =
        all.where((m) => metric.valueOf(m) != null).toList();

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
      children: [
        // ── Summary row ──
        _SummaryRow(),
        const SizedBox(height: 20),

        // ── Metric selector ──
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _Metric.values.map((m) {
              final selected = m == metric;
              final needsPro =
                  m != _Metric.weight && !SubscriptionService.instance.isPro;
              return GestureDetector(
                onTap: () async {
                  if (needsPro) {
                    if (!await requirePro(context)) return;
                  }
                  onMetricChanged(m);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: selected
                        ? m.color
                        : AppColors.bgCard,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: selected ? m.color : AppColors.bgCardLight,
                    ),
                  ),
                  child: Text(
                    '${m.label} (${m.unit})',
                    style: TextStyle(
                      color: selected
                          ? Colors.white
                          : AppColors.textMuted,
                      fontSize: 13,
                      fontWeight: selected
                          ? FontWeight.w600
                          : FontWeight.w400,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 16),

        // ── Chart ──
        _ChartCard(metric: metric, dataPoints: withData),
        const SizedBox(height: 20),

        // ── History list ──
        if (all.isEmpty)
          _EmptyState(onAdd: onAdd)
        else ...[
          Text('Historial',
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 12),
          ...store.measurementsDesc.map(
            (m) => _MeasurementTile(measurement: m),
          ),
        ],
      ],
    );
  }
}

// ── Summary row showing latest values ─────────────────────────────────────────

class _SummaryRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final latest = ProgressStore.instance.latest;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.bgCardLight),
      ),
      child: Row(
        children: [
          _SummaryItem(
            label: 'Peso',
            value: latest?.weight != null
                ? '${latest!.weight!.toStringAsFixed(1)} kg'
                : '—',
            color: _Metric.weight.color,
          ),
          _vDivider(),
          _SummaryItem(
            label: 'Cintura',
            value: latest?.waist != null
                ? '${latest!.waist!.toStringAsFixed(1)} cm'
                : '—',
            color: _Metric.waist.color,
          ),
          _vDivider(),
          _SummaryItem(
            label: 'Pecho',
            value: latest?.chest != null
                ? '${latest!.chest!.toStringAsFixed(1)} cm'
                : '—',
            color: _Metric.chest.color,
          ),
          _vDivider(),
          _SummaryItem(
            label: 'Cadera',
            value: latest?.hips != null
                ? '${latest!.hips!.toStringAsFixed(1)} cm'
                : '—',
            color: _Metric.hips.color,
          ),
        ],
      ),
    );
  }

  Widget _vDivider() => Container(
        width: 1,
        height: 36,
        color: AppColors.bgCardLight,
        margin: const EdgeInsets.symmetric(horizontal: 8),
      );
}

class _SummaryItem extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _SummaryItem(
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
          const SizedBox(height: 3),
          Text(label,
              style: const TextStyle(
                  color: AppColors.textMuted, fontSize: 10)),
        ],
      ),
    );
  }
}

// ── Chart card ────────────────────────────────────────────────────────────────

class _ChartCard extends StatelessWidget {
  final _Metric metric;
  final List<BodyMeasurement> dataPoints;

  const _ChartCard({required this.metric, required this.dataPoints});

  String _fmt(DateTime d) => '${d.day}/${d.month}';

  String _delta(List<BodyMeasurement> pts) {
    if (pts.length < 2) return '';
    final first = metric.valueOf(pts.first)!;
    final last = metric.valueOf(pts.last)!;
    final diff = last - first;
    final sign = diff >= 0 ? '+' : '';
    return '$sign${diff.toStringAsFixed(1)} ${metric.unit}';
  }

  @override
  Widget build(BuildContext context) {
    final hasPts = dataPoints.length >= 2;
    final latestVal = dataPoints.isNotEmpty
        ? metric.valueOf(dataPoints.last)
        : null;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.bgCardLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(metric.label,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.w700)),
              if (latestVal != null)
                Row(
                  children: [
                    Text(
                      '${latestVal.toStringAsFixed(1)} ${metric.unit}',
                      style: TextStyle(
                          color: metric.color,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    if (dataPoints.length >= 2) ...[
                      const SizedBox(width: 6),
                      Text(
                        _delta(dataPoints),
                        style: TextStyle(
                          color: () {
                            final d = metric.valueOf(dataPoints.last)! -
                                metric.valueOf(dataPoints.first)!;
                            return d <= 0
                                ? AppColors.accent
                                : AppColors.accentOrange;
                          }(),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ],
                ),
            ],
          ),
          const SizedBox(height: 16),
          if (!hasPts)
            SizedBox(
              height: 100,
              child: Center(
                child: Text(
                  dataPoints.isEmpty
                      ? 'Sin datos para esta métrica'
                      : 'Añade más registros para ver la gráfica',
                  style: const TextStyle(
                      color: AppColors.textMuted, fontSize: 13),
                ),
              ),
            )
          else ...[
            SizedBox(
              height: 120,
              child: CustomPaint(
                painter: _LinePainter(
                  spots: _toSpots(dataPoints),
                  color: metric.color,
                ),
                size: Size.infinite,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_fmt(dataPoints.first.date),
                    style: const TextStyle(
                        color: AppColors.textMuted, fontSize: 10)),
                Text(_fmt(dataPoints.last.date),
                    style: const TextStyle(
                        color: AppColors.textMuted, fontSize: 10)),
              ],
            ),
          ],
        ],
      ),
    );
  }

  List<({double x, double y})> _toSpots(
      List<BodyMeasurement> pts) {
    final base = pts.first.date;
    return pts
        .map((m) => (
              x: m.date.difference(base).inHours.toDouble(),
              y: metric.valueOf(m)!,
            ))
        .toList();
  }
}

// ── Line chart CustomPainter ──────────────────────────────────────────────────

class _LinePainter extends CustomPainter {
  final List<({double x, double y})> spots;
  final Color color;

  const _LinePainter({required this.spots, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    if (spots.length < 2) return;

    final minY = spots.map((s) => s.y).reduce(math.min);
    final maxY = spots.map((s) => s.y).reduce(math.max);
    final minX = spots.map((s) => s.x).reduce(math.min);
    final maxX = spots.map((s) => s.x).reduce(math.max);

    const padH = 6.0;
    const padV = 8.0;
    final w = size.width - padH * 2;
    final h = size.height - padV * 2;
    final xRange = maxX - minX;
    final yRange = maxY == minY ? 1.0 : maxY - minY;

    Offset toOff(double x, double y) => Offset(
          padH + (xRange == 0 ? w / 2 : (x - minX) / xRange * w),
          padV + h - (y - minY) / yRange * h,
        );

    final offsets = spots.map((s) => toOff(s.x, s.y)).toList();

    // Grid lines
    final gridPaint = Paint()
      ..color = Colors.white.withAlpha(15)
      ..strokeWidth = 1;
    for (int i = 0; i <= 3; i++) {
      final y = padV + h * i / 3;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), gridPaint);
    }

    // Gradient fill
    final fillPath = Path()
      ..moveTo(offsets.first.dx, size.height)
      ..lineTo(offsets.first.dx, offsets.first.dy);
    for (final o in offsets.skip(1)) {
      fillPath.lineTo(o.dx, o.dy);
    }
    fillPath
      ..lineTo(offsets.last.dx, size.height)
      ..close();

    canvas.drawPath(
      fillPath,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [color.withAlpha(80), color.withAlpha(0)],
        ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
        ..style = PaintingStyle.fill,
    );

    // Line
    final linePath = Path()
      ..moveTo(offsets.first.dx, offsets.first.dy);
    for (final o in offsets.skip(1)) {
      linePath.lineTo(o.dx, o.dy);
    }
    canvas.drawPath(
      linePath,
      Paint()
        ..color = color
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round,
    );

    // Dots
    final bgPaint = Paint()..color = const Color(0xFF1A1A2E); // bgCard approx
    final dotPaint = Paint()..color = color;
    for (final o in offsets) {
      canvas.drawCircle(o, 5, bgPaint);
      canvas.drawCircle(o, 3.5, dotPaint);
    }
  }

  @override
  bool shouldRepaint(_LinePainter old) =>
      old.spots != spots || old.color != color;
}

// ── Measurement tile ──────────────────────────────────────────────────────────

class _MeasurementTile extends StatelessWidget {
  final BodyMeasurement measurement;

  const _MeasurementTile({required this.measurement});

  String _fmtDate(DateTime d) {
    const months = [
      'ene', 'feb', 'mar', 'abr', 'may', 'jun',
      'jul', 'ago', 'sep', 'oct', 'nov', 'dic'
    ];
    return '${d.day} ${months[d.month - 1]} ${d.year}';
  }

  @override
  Widget build(BuildContext context) {
    final m = measurement;
    return Dismissible(
      key: Key(m.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: AppColors.error.withAlpha(25),
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Icon(Icons.delete_outline_rounded,
            color: AppColors.error),
      ),
      onDismissed: (_) => ProgressStore.instance.remove(m.id),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.bgCard,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.bgCardLight),
        ),
        child: Row(
          children: [
            // Date
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_fmtDate(m.date),
                    style: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 13,
                        fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                const Text('registro',
                    style: TextStyle(
                        color: AppColors.textMuted, fontSize: 10)),
              ],
            ),
            const SizedBox(width: 16),

            // Values
            Expanded(
              child: Wrap(
                spacing: 10,
                runSpacing: 6,
                children: [
                  if (m.weight != null)
                    _ValueChip(
                        label: '${m.weight!.toStringAsFixed(1)} kg',
                        color: _Metric.weight.color),
                  if (m.waist != null)
                    _ValueChip(
                        label: '${m.waist!.toStringAsFixed(1)} cm',
                        color: _Metric.waist.color),
                  if (m.chest != null)
                    _ValueChip(
                        label: '${m.chest!.toStringAsFixed(1)} cm',
                        color: _Metric.chest.color),
                  if (m.hips != null)
                    _ValueChip(
                        label: '${m.hips!.toStringAsFixed(1)} cm',
                        color: _Metric.hips.color),
                ],
              ),
            ),

            // Photo thumbnail
            if (m.photoPath != null) ...[
              const SizedBox(width: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(
                  File(m.photoPath!),
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => const SizedBox(width: 40),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ValueChip extends StatelessWidget {
  final String label;
  final Color color;

  const _ValueChip({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withAlpha(25),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(label,
          style: TextStyle(
              color: color, fontSize: 11, fontWeight: FontWeight.w600)),
    );
  }
}

// ── Empty state ───────────────────────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  final VoidCallback onAdd;

  const _EmptyState({required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          children: [
            const Icon(Icons.monitor_weight_outlined,
                color: AppColors.textMuted, size: 52),
            const SizedBox(height: 14),
            const Text('Sin registros aún',
                style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
            const SizedBox(height: 6),
            const Text(
              'Registra tu primer peso y medidas\npara ver tu evolución.',
              style: TextStyle(
                  color: AppColors.textMuted, fontSize: 13, height: 1.5),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: onAdd,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: AppColors.primary.withAlpha(25),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text('Añadir primer registro',
                    style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Fotos tab ─────────────────────────────────────────────────────────────────

class _FotosTab extends StatelessWidget {
  final VoidCallback onAdd;

  const _FotosTab({required this.onAdd});

  @override
  Widget build(BuildContext context) {
    if (!SubscriptionService.instance.isPro) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: AppColors.primary.withAlpha(20),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(Icons.photo_library_outlined,
                    color: AppColors.primary, size: 36),
              ),
              const SizedBox(height: 20),
              const Text('Fotos de progreso',
                  style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w700)),
              const SizedBox(height: 8),
              const Text(
                'Registra tu progreso visual con fotos.\nDisponible con LiftWave PRO.',
                style: TextStyle(
                    color: AppColors.textMuted, fontSize: 13, height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => requirePro(context),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.workspace_premium_rounded,
                          color: Colors.white, size: 18),
                      SizedBox(width: 8),
                      Text('Desbloquear con PRO',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 14)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    final photos = ProgressStore.instance.withPhoto;

    if (photos.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.photo_library_outlined,
                  color: AppColors.textMuted, size: 52),
              const SizedBox(height: 14),
              const Text('Sin fotos aún',
                  style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 6),
              const Text(
                'Añade una foto al registrar tus medidas\npara ver tu progreso visual.',
                style: TextStyle(
                    color: AppColors.textMuted, fontSize: 13, height: 1.5),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: onAdd,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withAlpha(25),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text('Añadir foto',
                      style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600)),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemCount: photos.length,
      itemBuilder: (context, i) {
        final m = photos[photos.length - 1 - i]; // newest first
        return _PhotoCard(measurement: m);
      },
    );
  }
}

class _PhotoCard extends StatelessWidget {
  final BodyMeasurement measurement;

  const _PhotoCard({required this.measurement});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showFullScreen(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.file(
              File(measurement.photoPath!),
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => Container(
                color: AppColors.bgCard,
                child: const Icon(Icons.broken_image_outlined,
                    color: AppColors.textMuted),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withAlpha(180)],
                  ),
                ),
                child: Text(
                  '${measurement.date.day}/${measurement.date.month}/${measurement.date.year}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showFullScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(backgroundColor: Colors.black),
          body: Center(
            child: InteractiveViewer(
              child: Image.file(File(measurement.photoPath!)),
            ),
          ),
        ),
      ),
    );
  }
}

// ── Add measurement bottom sheet ──────────────────────────────────────────────

class _AddMeasurementSheet extends StatefulWidget {
  const _AddMeasurementSheet();

  @override
  State<_AddMeasurementSheet> createState() => _AddMeasurementSheetState();
}

class _AddMeasurementSheetState extends State<_AddMeasurementSheet> {
  DateTime _date = DateTime.now();
  final _weightCtrl = TextEditingController();
  final _waistCtrl = TextEditingController();
  final _chestCtrl = TextEditingController();
  final _hipsCtrl = TextEditingController();
  String? _photoPath;
  bool _saving = false;

  @override
  void dispose() {
    _weightCtrl.dispose();
    _waistCtrl.dispose();
    _chestCtrl.dispose();
    _hipsCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickPhoto(ImageSource source) async {
    try {
      final picker = ImagePicker();
      final xfile = await picker.pickImage(
          source: source, imageQuality: 80, maxWidth: 1200);
      if (xfile == null) return;
      final dir = await getApplicationDocumentsDirectory();
      final filename =
          'progress_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final saved =
          await File(xfile.path).copy('${dir.path}/$filename');
      setState(() => _photoPath = saved.path);
    } catch (_) {
      // Camera not available in simulator — silently ignore
    }
  }

  void _showPhotoOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.bgCard,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (_) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt_rounded,
                  color: AppColors.primary),
              title: const Text('Cámara',
                  style: TextStyle(color: AppColors.textPrimary)),
              onTap: () {
                Navigator.pop(context);
                _pickPhoto(ImageSource.camera);
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_rounded,
                  color: AppColors.primary),
              title: const Text('Galería',
                  style: TextStyle(color: AppColors.textPrimary)),
              onTap: () {
                Navigator.pop(context);
                _pickPhoto(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      builder: (ctx, child) => Theme(
        data: Theme.of(ctx).copyWith(
          colorScheme: ColorScheme.dark(
            primary: AppColors.primary,
            surface: AppColors.bgCard,
            onSurface: AppColors.textPrimary,
          ),
        ),
        child: child!,
      ),
    );
    if (picked != null) setState(() => _date = picked);
  }

  Future<void> _save() async {
    final w = double.tryParse(_weightCtrl.text.replaceAll(',', '.'));
    final wa = double.tryParse(_waistCtrl.text.replaceAll(',', '.'));
    final ch = double.tryParse(_chestCtrl.text.replaceAll(',', '.'));
    final hi = double.tryParse(_hipsCtrl.text.replaceAll(',', '.'));

    if (w == null && wa == null && ch == null && hi == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Introduce al menos un valor'),
            backgroundColor: AppColors.error),
      );
      return;
    }

    setState(() => _saving = true);
    HapticFeedback.mediumImpact();

    await ProgressStore.instance.add(BodyMeasurement(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      date: _date,
      weight: w,
      waist: wa,
      chest: ch,
      hips: hi,
      photoPath: _photoPath,
    ));

    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.bgCard,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.fromLTRB(20, 16, 20, 20 + bottom),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle
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
            const SizedBox(height: 16),

            Text('Nuevo registro',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(height: 20),

            // Date picker
            GestureDetector(
              onTap: _pickDate,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 14, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.bgDark,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.bgCardLight),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today_rounded,
                        color: AppColors.primary, size: 18),
                    const SizedBox(width: 10),
                    Text(
                      '${_date.day}/${_date.month}/${_date.year}',
                      style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    const Icon(Icons.chevron_right_rounded,
                        color: AppColors.textMuted, size: 18),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Measurement fields
            Row(
              children: [
                Expanded(
                  child: _MeasureField(
                    controller: _weightCtrl,
                    label: 'Peso',
                    unit: 'kg',
                    color: _Metric.weight.color,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _MeasureField(
                    controller: _waistCtrl,
                    label: 'Cintura',
                    unit: 'cm',
                    color: _Metric.waist.color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: _MeasureField(
                    controller: _chestCtrl,
                    label: 'Pecho',
                    unit: 'cm',
                    color: _Metric.chest.color,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _MeasureField(
                    controller: _hipsCtrl,
                    label: 'Cadera',
                    unit: 'cm',
                    color: _Metric.hips.color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Photo button
            GestureDetector(
              onTap: _showPhotoOptions,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 14, vertical: 12),
                decoration: BoxDecoration(
                  color: AppColors.bgDark,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: _photoPath != null
                        ? AppColors.accent
                        : AppColors.bgCardLight,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      _photoPath != null
                          ? Icons.check_circle_rounded
                          : Icons.add_a_photo_rounded,
                      color: _photoPath != null
                          ? AppColors.accent
                          : AppColors.textMuted,
                      size: 18,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      _photoPath != null
                          ? 'Foto añadida'
                          : 'Añadir foto (opcional)',
                      style: TextStyle(
                        color: _photoPath != null
                            ? AppColors.accent
                            : AppColors.textMuted,
                        fontSize: 14,
                      ),
                    ),
                    if (_photoPath != null) ...[
                      const Spacer(),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.file(File(_photoPath!),
                            width: 36, height: 36, fit: BoxFit.cover),
                      ),
                    ],
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Save button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _saving ? null : _save,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                ),
                child: _saving
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                            color: Colors.white, strokeWidth: 2))
                    : const Text('Guardar registro',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MeasureField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String unit;
  final Color color;

  const _MeasureField({
    required this.controller,
    required this.label,
    required this.unit,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType:
          const TextInputType.numberWithOptions(decimal: true, signed: false),
      style: const TextStyle(color: AppColors.textPrimary, fontSize: 14),
      decoration: InputDecoration(
        labelText: '$label ($unit)',
        labelStyle: TextStyle(color: color, fontSize: 13),
        filled: true,
        fillColor: AppColors.bgDark,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.bgCardLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.bgCardLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: color),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      ),
    );
  }
}
