import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../services/watch_service.dart';
import '../../theme/app_theme.dart';
import '../../utils/pro_gate.dart';

class RestScreen extends StatefulWidget {
  const RestScreen({super.key});

  @override
  State<RestScreen> createState() => _RestScreenState();
}

class _RestScreenState extends State<RestScreen>
    with SingleTickerProviderStateMixin {
  static const _presets = [30, 60, 90, 120, 180];

  int _selectedPreset = 90;
  int _remaining = 90;
  int _total = 90;
  bool _isRunning = false;
  bool _isCustom = false;
  Timer? _timer;
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pulseController.dispose();
    super.dispose();
  }

  void _syncWatch() {
    WatchService.instance.updateTimerState(
      running: _isRunning,
      remaining: _remaining,
      total: _total,
    );
  }

  // ── Timer controls ─────────────────────────────────────────────────────────

  void _startStop() {
    HapticFeedback.lightImpact();
    if (_isRunning) {
      _timer?.cancel();
      setState(() => _isRunning = false);
      _syncWatch();
    } else {
      if (_remaining == 0) {
        setState(() {
          _remaining = _total;
        });
      }
      setState(() => _isRunning = true);
      _syncWatch();
      _timer = Timer.periodic(const Duration(seconds: 1), (_) {
        if (_remaining <= 0) {
          _timer?.cancel();
          HapticFeedback.heavyImpact();
          setState(() => _isRunning = false);
          _syncWatch();
        } else {
          setState(() => _remaining--);
          if (_remaining == 3) HapticFeedback.selectionClick();
          _syncWatch();
        }
      });
    }
  }

  void _reset() {
    HapticFeedback.mediumImpact();
    _timer?.cancel();
    setState(() {
      _remaining = _total;
      _isRunning = false;
    });
    _syncWatch();
  }

  void _selectPreset(int seconds) {
    _timer?.cancel();
    setState(() {
      _selectedPreset = seconds;
      _remaining = seconds;
      _total = seconds;
      _isRunning = false;
      _isCustom = false;
    });
    _syncWatch();
  }

  void _applyCustom(int seconds) {
    if (seconds <= 0) return;
    _timer?.cancel();
    setState(() {
      _remaining = seconds;
      _total = seconds;
      _isRunning = false;
      _isCustom = true;
    });
    _syncWatch();
  }

  void _addTime(int seconds) {
    HapticFeedback.selectionClick();
    setState(() {
      _remaining = (_remaining + seconds).clamp(0, 3600);
      if (_remaining > _total) _total = _remaining;
    });
  }

  // ── Custom time picker ─────────────────────────────────────────────────────

  void _showCustomTimePicker() {
    int mins = _total ~/ 60;
    int secs = _total % 60;

    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.bgCard,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      isScrollControlled: true,
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.only(
            left: 24,
            right: 24,
            top: 24,
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 32,
          ),
          child: _CustomTimeSheet(
            initialMinutes: mins,
            initialSeconds: secs,
            onConfirm: (m, s) {
              Navigator.pop(ctx);
              _applyCustom(m * 60 + s);
            },
          ),
        );
      },
    );
  }

  // ── Helpers ────────────────────────────────────────────────────────────────

  String _formatTime(int seconds) {
    final m = (seconds ~/ 60).toString().padLeft(2, '0');
    final s = (seconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  String _presetLabel(int s) {
    if (s < 60) return '${s}s';
    if (s % 60 == 0) return '${s ~/ 60}m';
    return '${s ~/ 60}m${s % 60}s';
  }

  double get _progress =>
      _total > 0 ? (_total - _remaining) / _total : 1.0;

  Color get _timerColor {
    if (!_isRunning && _remaining == _total) return AppColors.primary;
    if (_remaining == 0) return AppColors.accent;
    if (_remaining <= 10) return AppColors.error;
    if (_remaining <= 30) return AppColors.accentOrange;
    return AppColors.accent;
  }

  // ── Build ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(title: Text(S.of(context).rest_title), floating: true),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  _buildStatusBanner()
                      .animate(key: ValueKey(_isRunning))
                      .fadeIn(duration: 250.ms),
                  const SizedBox(height: 32),
                  _buildTimer()
                      .animate()
                      .fadeIn(delay: 80.ms, duration: 350.ms)
                      .scale(
                          begin: const Offset(0.92, 0.92),
                          end: const Offset(1, 1)),
                  const SizedBox(height: 28),
                  _buildAdjustButtons()
                      .animate()
                      .fadeIn(delay: 160.ms, duration: 300.ms),
                  const SizedBox(height: 28),
                  _buildControls()
                      .animate()
                      .fadeIn(delay: 200.ms, duration: 300.ms),
                  const SizedBox(height: 32),
                  _buildPresets()
                      .animate()
                      .fadeIn(delay: 260.ms, duration: 300.ms),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBanner() {
    final String label;
    final Color color;
    final IconData icon;

    if (_remaining == 0 && !_isRunning && _total > 0) {
      label = S.of(context).rest_ready;
      color = AppColors.accent;
      icon = Icons.check_circle_rounded;
    } else if (_isRunning && _remaining <= 10) {
      label = S.of(context).rest_almostReady;
      color = AppColors.error;
      icon = Icons.warning_amber_rounded;
    } else if (_isRunning) {
      label = S.of(context).rest_resting;
      color = AppColors.accent;
      icon = Icons.self_improvement_rounded;
    } else {
      label = _isCustom
          ? S.of(context).rest_customTime(_presetLabel(_total))
          : S.of(context).rest_choosePreset;
      color = AppColors.textMuted;
      icon = Icons.timer_rounded;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: color.withAlpha(25),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withAlpha(76)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 16),
          const SizedBox(width: 8),
          Text(label,
              style: TextStyle(
                  color: color,
                  fontSize: 13,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildTimer() {
    return CircularPercentIndicator(
      radius: 130,
      lineWidth: 12,
      percent: _progress.clamp(0.0, 1.0),
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: TextStyle(
              color: _timerColor,
              fontSize: 52,
              fontWeight: FontWeight.w800,
              letterSpacing: -2,
            ),
            child: Text(_formatTime(_remaining)),
          ),
          const SizedBox(height: 4),
          Text(
            S.of(context).rest_of(_formatTime(_total)),
            style: const TextStyle(
              color: AppColors.textMuted,
              fontSize: 13,
            ),
          ),
        ],
      ),
      progressColor: _timerColor,
      backgroundColor: AppColors.bgCardLight,
      circularStrokeCap: CircularStrokeCap.round,
      animation: true,
      animateFromLastPercent: true,
      animationDuration: 500,
    );
  }

  Widget _buildAdjustButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _AdjustButton(
            label: '-1min',
            onTap: () => _addTime(-60),
            color: AppColors.error),
        const SizedBox(width: 10),
        _AdjustButton(
            label: '-30s',
            onTap: () => _addTime(-30),
            color: AppColors.accentOrange),
        const SizedBox(width: 10),
        _AdjustButton(
            label: '+30s',
            onTap: () => _addTime(30),
            color: AppColors.accent),
        const SizedBox(width: 10),
        _AdjustButton(
            label: '+1min',
            onTap: () => _addTime(60),
            color: AppColors.primary),
      ],
    );
  }

  Widget _buildControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Reset
        _ControlButton(
          icon: Icons.refresh_rounded,
          onTap: _reset,
          size: 52,
        ),
        const SizedBox(width: 20),
        // Play / Pause
        GestureDetector(
          onTap: _startStop,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: _isRunning
                    ? [AppColors.accentOrange, AppColors.error]
                    : [AppColors.primary, AppColors.primaryDark],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: (_isRunning
                          ? AppColors.accentOrange
                          : AppColors.primary)
                      .withAlpha(100),
                  blurRadius: 18,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Icon(
              _isRunning ? Icons.pause_rounded : Icons.play_arrow_rounded,
              color: Colors.white,
              size: 36,
            ),
          ),
        ),
        const SizedBox(width: 20),
        // Skip to end (mark done)
        _ControlButton(
          icon: Icons.skip_next_rounded,
          onTap: () {
            _timer?.cancel();
            HapticFeedback.mediumImpact();
            setState(() {
              _remaining = 0;
              _isRunning = false;
            });
          },
          size: 52,
        ),
      ],
    );
  }

  Widget _buildPresets() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(S.of(context).rest_presets,
            style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 13,
                fontWeight: FontWeight.w600)),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            ..._presets.map((s) {
              final isSelected = !_isCustom && s == _selectedPreset;
              return _PresetChip(
                label: _presetLabel(s),
                isSelected: isSelected,
                onTap: () => _selectPreset(s),
              );
            }),
            _PresetChip(
              label: S.of(context).rest_customize,
              isSelected: _isCustom,
              isCustom: true,
              isPro: true,
              onTap: () async {
                if (!await requirePro(context)) return;
                _showCustomTimePicker();
              },
            ),
          ],
        ),
      ],
    );
  }
}

// ── Custom time bottom sheet ──────────────────────────────────────────────────

class _CustomTimeSheet extends StatefulWidget {
  final int initialMinutes;
  final int initialSeconds;
  final void Function(int minutes, int seconds) onConfirm;

  const _CustomTimeSheet({
    required this.initialMinutes,
    required this.initialSeconds,
    required this.onConfirm,
  });

  @override
  State<_CustomTimeSheet> createState() => _CustomTimeSheetState();
}

class _CustomTimeSheetState extends State<_CustomTimeSheet> {
  late final TextEditingController _minsCtrl;
  late final TextEditingController _secsCtrl;

  @override
  void initState() {
    super.initState();
    _minsCtrl =
        TextEditingController(text: '${widget.initialMinutes}');
    _secsCtrl =
        TextEditingController(text: widget.initialSeconds.toString().padLeft(2, '0'));
  }

  @override
  void dispose() {
    _minsCtrl.dispose();
    _secsCtrl.dispose();
    super.dispose();
  }

  void _confirm() {
    final m = int.tryParse(_minsCtrl.text) ?? 0;
    final s = (int.tryParse(_secsCtrl.text) ?? 0).clamp(0, 59);
    if (m == 0 && s == 0) return;
    widget.onConfirm(m, s);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
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
        const SizedBox(height: 20),
        Text(S.of(context).rest_customTimeTitle,
            style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w700)),
        const SizedBox(height: 6),
        Text(S.of(context).rest_customTimeSubtitle,
            style:
                const TextStyle(color: AppColors.textSecondary, fontSize: 13)),
        const SizedBox(height: 28),
        Row(
          children: [
            Expanded(
              child: _TimeField(
                controller: _minsCtrl,
                label: S.of(context).rest_minutes,
                max: 99,
              ),
            ),
            const SizedBox(width: 12),
            const Text(':',
                style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 32,
                    fontWeight: FontWeight.w300)),
            const SizedBox(width: 12),
            Expanded(
              child: _TimeField(
                controller: _secsCtrl,
                label: S.of(context).rest_seconds,
                max: 59,
              ),
            ),
          ],
        ),
        const SizedBox(height: 28),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _confirm,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)),
              textStyle: const TextStyle(
                  fontSize: 15, fontWeight: FontWeight.w700),
            ),
            child: Text(S.of(context).rest_setTime),
          ),
        ),
      ],
    );
  }
}

class _TimeField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final int max;

  const _TimeField({
    required this.controller,
    required this.label,
    required this.max,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                color: AppColors.textMuted,
                fontSize: 11,
                fontWeight: FontWeight.w600)),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            _MaxValueFormatter(max),
          ],
          style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 28,
              fontWeight: FontWeight.w700),
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.bgCardLight,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 14),
          ),
        ),
      ],
    );
  }
}

class _MaxValueFormatter extends TextInputFormatter {
  final int max;
  _MaxValueFormatter(this.max);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue old, TextEditingValue next) {
    if (next.text.isEmpty) return next;
    final v = int.tryParse(next.text);
    if (v == null || v > max) return old;
    return next;
  }
}

// ── Reusable small widgets ────────────────────────────────────────────────────

class _ControlButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final double size;

  const _ControlButton({
    required this.icon,
    required this.onTap,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: AppColors.bgCard,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.bgCardLight),
        ),
        child: Icon(icon, color: AppColors.textSecondary, size: 22),
      ),
    );
  }
}

class _AdjustButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final Color color;

  const _AdjustButton(
      {required this.label, required this.onTap, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
        decoration: BoxDecoration(
          color: color.withAlpha(25),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color.withAlpha(76)),
        ),
        child: Text(label,
            style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.w700)),
      ),
    );
  }
}

class _PresetChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final bool isCustom;
  final bool isPro;
  final Function() onTap;

  const _PresetChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.isCustom = false,
    this.isPro = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = isCustom ? AppColors.accentYellow : AppColors.primary;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding:
            const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? color : AppColors.bgCard,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? color : AppColors.bgCardLight,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isCustom) ...[
              Icon(Icons.tune_rounded,
                  size: 12,
                  color: isSelected ? Colors.white : color),
              const SizedBox(width: 4),
            ],
            Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : (isCustom ? color : AppColors.textSecondary),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            if (isPro) ...[
              const SizedBox(width: 4),
              const ProBadge(),
            ],
          ],
        ),
      ),
    );
  }
}
