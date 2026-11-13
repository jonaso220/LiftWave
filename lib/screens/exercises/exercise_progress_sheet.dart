import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';
import '../../data/workout_store.dart';
import '../../services/exercise_records.dart';
import '../../theme/app_theme.dart';
import '../../utils/exercise_localization.dart';
import '../../utils/pro_gate.dart';
import '../../utils/weight_units.dart';
import '../../utils/date_format.dart';

/// Opens the progress charts for [exerciseName], a PRO feature. Free users
/// see the paywall first; the sheet opens if they subscribe there.
Future<void> showExerciseProgress(
  BuildContext context,
  String exerciseName,
) async {
  if (!await requirePro(context)) return;
  if (!context.mounted) return;
  await showModalBottomSheet<void>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (_) => ExerciseProgressSheet(exerciseName: exerciseName),
  );
}

class ExerciseProgressSheet extends StatefulWidget {
  final String exerciseName;

  const ExerciseProgressSheet({super.key, required this.exerciseName});

  @override
  State<ExerciseProgressSheet> createState() => _ExerciseProgressSheetState();
}

class _ExerciseProgressSheetState extends State<ExerciseProgressSheet> {
  _Metric _metric = _Metric.weight;

  bool get _showVolume => _metric == _Metric.volume;

  Color get _metricColor => switch (_metric) {
    _Metric.weight => AppColors.accent,
    _Metric.volume => AppColors.accentOrange,
    _Metric.oneRm => AppColors.primaryLight,
  };

  double _valueOf(_DataPoint point) => switch (_metric) {
    _Metric.weight => point.maxWeight,
    _Metric.volume => point.volume,
    _Metric.oneRm => point.oneRm ?? 0,
  };

  /// A load or a volume (stored in kg) in the user's unit.
  String _formatValue(double kg) => _showVolume
      ? formatVolume(kg)
      : formatLoadWithUnit(kg, Localizations.localeOf(context).toString());

  List<_DataPoint> _buildData() {
    final points = <_DataPoint>[];
    for (final w in WorkoutStore.instance.workouts.reversed) {
      for (final e in w.exercises) {
        if (e.name == widget.exerciseName) {
          final completedSets = e.workingSets.toList();
          if (completedSets.isEmpty) continue;
          final maxWeight = completedSets.fold<double>(
            0,
            (m, s) => math.max(m, s.weight),
          );
          final volume = completedSets.fold<int>(
            0,
            (s, set) => s + (set.reps * set.weight).round(),
          );
          points.add(
            _DataPoint(
              date: w.date,
              maxWeight: maxWeight,
              volume: volume.toDouble(),
              oneRm: bestEstimatedOneRepMax(completedSets),
            ),
          );
        }
      }
    }
    return points;
  }

  @override
  Widget build(BuildContext context) {
    final sessions = _buildData();
    // Sessions done only with high repetitions have no 1RM estimate.
    final data = _metric == _Metric.oneRm
        ? sessions.where((point) => point.oneRm != null).toList()
        : sessions;
    final records = ExerciseRecords.of(
      widget.exerciseName,
      WorkoutStore.instance.workouts,
    );
    return DraggableScrollableSheet(
      initialChildSize: 0.55,
      minChildSize: 0.35,
      maxChildSize: 0.85,
      builder: (_, scrollCtrl) => Container(
        decoration: BoxDecoration(
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
                  Icon(
                    Icons.show_chart_rounded,
                    color: AppColors.accent,
                    size: 22,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      ExerciseLocalization.name(
                        S.of(context),
                        widget.exerciseName,
                      ),
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
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
                    selected: _metric == _Metric.weight,
                    color: AppColors.accent,
                    onTap: () => setState(() => _metric = _Metric.weight),
                  ),
                  const SizedBox(width: 8),
                  _ToggleChip(
                    label: S.of(context).progress_volumeLabel,
                    selected: _showVolume,
                    color: AppColors.accentOrange,
                    onTap: () => setState(() => _metric = _Metric.volume),
                  ),
                  const SizedBox(width: 8),
                  _ToggleChip(
                    label: S.of(context).progress_oneRm,
                    selected: _metric == _Metric.oneRm,
                    color: AppColors.primary,
                    onTap: () => setState(() => _metric = _Metric.oneRm),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: sessions.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: _EmptyChart(
                          message: S.of(context).progress_noData,
                        ),
                      ),
                    )
                  : SingleChildScrollView(
                      controller: scrollCtrl,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (!records.isEmpty) ...[
                            _buildRecords(records),
                            const SizedBox(height: 20),
                          ],
                          if (data.length < 2)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 24),
                              child: _EmptyChart(
                                message: S
                                    .of(context)
                                    .progress_needMoreSessions,
                              ),
                            )
                          else ...[
                            _buildSummary(data),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: 200,
                              child: CustomPaint(
                                size: Size.infinite,
                                painter: _ProgressPainter(
                                  spots: [
                                    for (final entry in data.asMap().entries)
                                      (
                                        x: entry.key.toDouble(),
                                        y: _valueOf(entry.value),
                                      ),
                                  ],
                                  color: _metricColor,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            _buildHistory(data),
                          ],
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  /// All-time bests: the heaviest set and the best estimated 1RM, each
  /// with the set and the day it was done.
  Widget _buildRecords(ExerciseRecords records) {
    final l10n = S.of(context);
    final locale = Localizations.localeOf(context).toString();
    String lift(RecordLift record) =>
        '${formatLoadWithUnit(record.weight, locale)} × ${record.reps}'
        '  ·  ${formatShortDate(context, record.date)}';

    Widget row(String label, String value, String detail) => Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(color: AppColors.textMuted, fontSize: 12),
                ),
                const SizedBox(height: 2),
                Text(
                  detail,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );

    final heaviest = records.heaviest;
    final oneRm = records.bestOneRm;
    final oneRmLift = records.bestOneRmLift;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.accentYellow.withAlpha(18),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.accentYellow.withAlpha(60)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.emoji_events_rounded,
                color: AppColors.accentYellow,
                size: 18,
              ),
              const SizedBox(width: 6),
              Text(
                l10n.progress_recordsTitle,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          if (heaviest != null)
            row(
              l10n.progress_bestLift,
              formatLoadWithUnit(heaviest.weight, locale),
              lift(heaviest),
            ),
          if (oneRm != null && oneRmLift != null)
            row(
              l10n.progress_bestOneRm,
              formatLoadWithUnit(oneRm, locale),
              lift(oneRmLift),
            ),
        ],
      ),
    );
  }

  Widget _buildSummary(List<_DataPoint> data) {
    final current = _valueOf(data.last);
    final first = _valueOf(data.first);
    final diff = current - first;
    final pct = first > 0 ? (diff / first * 100) : 0.0;
    final best = data.map(_valueOf).reduce(math.max);

    return Row(
      children: [
        Expanded(
          child: _StatBox(
            label: switch (_metric) {
              _Metric.weight => S.of(context).progress_lastWeight,
              _Metric.volume => S.of(context).progress_lastVolume,
              _Metric.oneRm => S.of(context).progress_oneRm,
            },
            value: _formatValue(current),
            color: _metricColor,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _StatBox(
            label: S.of(context).progress_best,
            value: _formatValue(best),
            color: AppColors.accentYellow,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _StatBox(
            label: S.of(context).progress_progressLabel,
            value: '${diff >= 0 ? '+' : ''}${pct.toStringAsFixed(0)}%',
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
        Text(
          S.of(context).progress_historyTitle,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        ...reversed.take(10).map((d) {
          final val = _valueOf(d);
          return Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              children: [
                Text(
                  formatShortDate(context, d.date),
                  style: TextStyle(color: AppColors.textMuted, fontSize: 12),
                ),
                const Spacer(),
                Text(
                  _formatValue(val),
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }
}

enum _Metric { weight, volume, oneRm }

class _DataPoint {
  final DateTime date;
  final double maxWeight;
  final double volume;

  /// Best estimated 1RM of the session; null when every set was above the
  /// repetition range the estimate works for.
  final double? oneRm;

  _DataPoint({
    required this.date,
    required this.maxWeight,
    required this.volume,
    required this.oneRm,
  });
}

class _EmptyChart extends StatelessWidget {
  final String message;

  const _EmptyChart({required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.bar_chart_rounded, color: AppColors.textMuted, size: 40),
        const SizedBox(height: 12),
        Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.textMuted, fontSize: 13),
        ),
      ],
    );
  }
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
          Text(
            value,
            style: TextStyle(
              color: color,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: TextStyle(color: AppColors.textMuted, fontSize: 10),
          ),
        ],
      ),
    );
  }
}

class _ProgressPainter extends CustomPainter {
  final List<({double x, double y})> spots;
  final Color color;

  /// Grid lines follow the theme, so a theme switch must repaint.
  final Brightness brightness = AppColors.brightness;

  _ProgressPainter({required this.spots, required this.color});

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
      ..color = AppColors.textPrimary.withAlpha(15)
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
    final linePath = Path()..moveTo(offsets.first.dx, offsets.first.dy);
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
      old.spots != spots || old.color != color || old.brightness != brightness;
}
