import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';
import '../../data/workout_store.dart';
import '../../theme/app_theme.dart';

class ExerciseProgressSheet extends StatefulWidget {
  final String exerciseName;

  const ExerciseProgressSheet({super.key, required this.exerciseName});

  @override
  State<ExerciseProgressSheet> createState() => _ExerciseProgressSheetState();
}

class _ExerciseProgressSheetState extends State<ExerciseProgressSheet> {
  bool _showVolume = false; // false = peso máximo, true = volumen

  List<_DataPoint> _buildData() {
    final points = <_DataPoint>[];
    for (final w in WorkoutStore.instance.workouts.reversed) {
      for (final e in w.exercises) {
        if (e.name == widget.exerciseName) {
          final maxWeight =
              e.sets.fold<double>(0, (m, s) => math.max(m, s.weight));
          final volume =
              e.sets.fold<int>(0, (s, set) => s + (set.reps * set.weight).round());
          points.add(_DataPoint(
            date: w.date,
            maxWeight: maxWeight,
            volume: volume.toDouble(),
          ));
        }
      }
    }
    return points;
  }

  @override
  Widget build(BuildContext context) {
    final data = _buildData();
    return DraggableScrollableSheet(
      initialChildSize: 0.55,
      minChildSize: 0.35,
      maxChildSize: 0.85,
      builder: (_, scrollCtrl) => Container(
        decoration: const BoxDecoration(
          color: AppColors.bgCard,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          children: [
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
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 4),
              child: Row(
                children: [
                  const Icon(Icons.show_chart_rounded,
                      color: AppColors.accent, size: 22),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      widget.exerciseName,
                      style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                children: [
                  _ToggleChip(
                    label: S.of(context).progress_maxWeight,
                    selected: !_showVolume,
                    color: AppColors.accent,
                    onTap: () => setState(() => _showVolume = false),
                  ),
                  const SizedBox(width: 8),
                  _ToggleChip(
                    label: S.of(context).progress_volumeLabel,
                    selected: _showVolume,
                    color: AppColors.accentOrange,
                    onTap: () => setState(() => _showVolume = true),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: data.length < 2
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.bar_chart_rounded,
                                color: AppColors.textMuted, size: 40),
                            const SizedBox(height: 12),
                            Text(
                              data.isEmpty
                                  ? S.of(context).progress_noData
                                  : S.of(context).progress_needMoreSessions,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: AppColors.textMuted, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    )
                  : SingleChildScrollView(
                      controller: scrollCtrl,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSummary(data),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 200,
                            child: CustomPaint(
                              size: Size.infinite,
                              painter: _ProgressPainter(
                                spots: data.asMap().entries.map((e) {
                                  final val = _showVolume
                                      ? e.value.volume
                                      : e.value.maxWeight;
                                  return (
                                    x: e.key.toDouble(),
                                    y: val,
                                  );
                                }).toList(),
                                color: _showVolume
                                    ? AppColors.accentOrange
                                    : AppColors.accent,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          _buildHistory(data),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummary(List<_DataPoint> data) {
    final current = _showVolume ? data.last.volume : data.last.maxWeight;
    final first = _showVolume ? data.first.volume : data.first.maxWeight;
    final diff = current - first;
    final pct = first > 0 ? (diff / first * 100) : 0.0;
    final best = _showVolume
        ? data.map((d) => d.volume).reduce(math.max)
        : data.map((d) => d.maxWeight).reduce(math.max);

    return Row(
      children: [
        Expanded(
          child: _StatBox(
            label: _showVolume ? S.of(context).progress_lastVolume : S.of(context).progress_lastWeight,
            value:
                '${current == current.roundToDouble() ? current.toStringAsFixed(0) : current.toStringAsFixed(1)} kg',
            color: _showVolume ? AppColors.accentOrange : AppColors.accent,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _StatBox(
            label: S.of(context).progress_best,
            value:
                '${best == best.roundToDouble() ? best.toStringAsFixed(0) : best.toStringAsFixed(1)} kg',
            color: AppColors.accentYellow,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _StatBox(
            label: S.of(context).progress_progressLabel,
            value:
                '${diff >= 0 ? '+' : ''}${pct.toStringAsFixed(0)}%',
            color: diff >= 0 ? AppColors.accent : AppColors.error,
          ),
        ),
      ],
    );
  }

  Widget _buildHistory(List<_DataPoint> data) {
    final reversed = data.reversed.toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).progress_historyTitle,
            style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w700)),
        const SizedBox(height: 8),
        ...reversed.take(10).map((d) {
          final val = _showVolume ? d.volume : d.maxWeight;
          return Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              children: [
                Text(
                  '${d.date.day}/${d.date.month}/${d.date.year}',
                  style: const TextStyle(
                      color: AppColors.textMuted, fontSize: 12),
                ),
                const Spacer(),
                Text(
                  '${val == val.roundToDouble() ? val.toStringAsFixed(0) : val.toStringAsFixed(1)} kg',
                  style: const TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}

class _DataPoint {
  final DateTime date;
  final double maxWeight;
  final double volume;

  _DataPoint({
    required this.date,
    required this.maxWeight,
    required this.volume,
  });
}

class _ToggleChip extends StatelessWidget {
  final String label;
  final bool selected;
  final Color color;
  final VoidCallback onTap;

  const _ToggleChip({
    required this.label,
    required this.selected,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: selected ? color : AppColors.bgCardLight,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : AppColors.textSecondary,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _StatBox({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withAlpha(20),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withAlpha(50)),
      ),
      child: Column(
        children: [
          Text(value,
              style: TextStyle(
                  color: color, fontSize: 15, fontWeight: FontWeight.w700)),
          const SizedBox(height: 2),
          Text(label,
              style:
                  const TextStyle(color: AppColors.textMuted, fontSize: 10)),
        ],
      ),
    );
  }
}

class _ProgressPainter extends CustomPainter {
  final List<({double x, double y})> spots;
  final Color color;

  const _ProgressPainter({required this.spots, required this.color});

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
    final bgPaint = Paint()..color = const Color(0xFF1A1A2E);
    final dotPaint = Paint()..color = color;
    for (final o in offsets) {
      canvas.drawCircle(o, 5, bgPaint);
      canvas.drawCircle(o, 3.5, dotPaint);
    }
  }

  @override
  bool shouldRepaint(_ProgressPainter old) =>
      old.spots != spots || old.color != color;
}
