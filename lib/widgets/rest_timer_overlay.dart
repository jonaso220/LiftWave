import 'package:flutter/material.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';

import '../services/rest_timer_controller.dart';
import '../theme/app_theme.dart';

/// Persistent banner shown at the bottom of the train screen while the rest
/// timer is active. Tap to expand the full controls sheet.
class RestTimerOverlay extends StatefulWidget {
  const RestTimerOverlay({super.key});

  @override
  State<RestTimerOverlay> createState() => _RestTimerOverlayState();
}

class _RestTimerOverlayState extends State<RestTimerOverlay> {
  final RestTimerController _c = RestTimerController.instance;

  @override
  void initState() {
    super.initState();
    _c.addListener(_onChange);
  }

  @override
  void dispose() {
    _c.removeListener(_onChange);
    super.dispose();
  }

  void _onChange() {
    if (mounted) setState(() {});
  }

  String _formatTime(int seconds) {
    final m = (seconds ~/ 60).toString().padLeft(2, '0');
    final s = (seconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  Color get _timerColor {
    if (_c.hasFinished) return AppColors.accent;
    if (_c.remaining <= 10) return AppColors.error;
    if (_c.remaining <= 30) return AppColors.accentOrange;
    return AppColors.primary;
  }

  @override
  Widget build(BuildContext context) {
    if (!_c.isVisible) return const SizedBox.shrink();
    final l10n = S.of(context);

    return AnimatedSlide(
      offset: _c.isVisible ? Offset.zero : const Offset(0, 1),
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOutCubic,
      child: Material(
        color: Colors.transparent,
        child: Semantics(
          container: true,
          explicitChildNodes: true,
          button: true,
          label: l10n.restTimer_openControls,
          child: InkWell(
            onTap: () => _showFullSheet(context),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.bgCard,
                border: Border(
                  top: BorderSide(color: _timerColor.withAlpha(120), width: 1),
                ),
                boxShadow: [
                  BoxShadow(
                    color: _timerColor.withAlpha(40),
                    blurRadius: 16,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: SafeArea(
                top: false,
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: _timerColor.withAlpha(30),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          _c.hasFinished
                              ? Icons.check_circle_rounded
                              : Icons.timer_rounded,
                          color: _timerColor,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _c.hasFinished
                                  ? l10n.restTimer_done
                                  : l10n.restTimer_resting,
                              style: TextStyle(
                                color: _timerColor,
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.3,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              _formatTime(_c.remaining),
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                letterSpacing: -0.5,
                                fontFeatures: const [
                                  FontFeature.tabularFigures(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      _MiniButton(
                        label: '-15s',
                        semanticLabel: l10n.restTimer_subtractSeconds(15),
                        onTap: () => _c.addTime(-15),
                      ),
                      const SizedBox(width: 6),
                      _MiniButton(
                        label: '+15s',
                        semanticLabel: l10n.restTimer_addSeconds(15),
                        onTap: () => _c.addTime(15),
                      ),
                      const SizedBox(width: 6),
                      _IconButton(
                        icon: _c.isRunning
                            ? Icons.pause_rounded
                            : Icons.play_arrow_rounded,
                        color: _timerColor,
                        filled: true,
                        semanticLabel: _c.isRunning
                            ? l10n.restTimer_pause
                            : l10n.restTimer_resume,
                        onTap: _c.toggle,
                      ),
                      const SizedBox(width: 6),
                      _IconButton(
                        icon: Icons.close_rounded,
                        color: AppColors.textMuted,
                        semanticLabel: l10n.restTimer_dismiss,
                        onTap: _c.dismiss,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showFullSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.bgCard,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      isScrollControlled: true,
      builder: (ctx) => _RestTimerSheet(controller: _c),
    );
  }
}

class _MiniButton extends StatelessWidget {
  final String label;
  final String semanticLabel;
  final VoidCallback onTap;
  const _MiniButton({
    required this.label,
    required this.semanticLabel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      button: true,
      excludeSemantics: true,
      child: Tooltip(
        message: semanticLabel,
        child: Material(
          color: AppColors.bgCardLight,
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(8),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
              child: Center(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final bool filled;
  final String semanticLabel;
  final VoidCallback onTap;
  const _IconButton({
    required this.icon,
    required this.color,
    this.filled = false,
    required this.semanticLabel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      button: true,
      excludeSemantics: true,
      child: Tooltip(
        message: semanticLabel,
        child: Material(
          color: filled ? color.withAlpha(30) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              width: 44,
              height: 44,
              child: Icon(icon, color: color, size: 22),
            ),
          ),
        ),
      ),
    );
  }
}

// ── Full-controls bottom sheet ───────────────────────────────────────────────

class _RestTimerSheet extends StatefulWidget {
  final RestTimerController controller;
  const _RestTimerSheet({required this.controller});

  @override
  State<_RestTimerSheet> createState() => _RestTimerSheetState();
}

class _RestTimerSheetState extends State<_RestTimerSheet> {
  RestTimerController get _c => widget.controller;

  @override
  void initState() {
    super.initState();
    _c.addListener(_onChange);
  }

  @override
  void dispose() {
    _c.removeListener(_onChange);
    super.dispose();
  }

  void _onChange() {
    if (mounted) setState(() {});
  }

  String _format(int s) {
    final m = (s ~/ 60).toString().padLeft(2, '0');
    final sec = (s % 60).toString().padLeft(2, '0');
    return '$m:$sec';
  }

  String _presetLabel(int s) {
    if (s < 60) return '${s}s';
    if (s % 60 == 0) return '${s ~/ 60}m';
    return '${s ~/ 60}m${s % 60}s';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.bgCardLight,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            l10n.restTimer_title,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            _format(_c.remaining),
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 64,
              fontWeight: FontWeight.w800,
              letterSpacing: -2,
              fontFeatures: [FontFeature.tabularFigures()],
            ),
          ),
          Text(
            l10n.rest_of(_format(_c.total)),
            style: const TextStyle(color: AppColors.textMuted, fontSize: 13),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _AdjustChip(
                label: '-1m',
                semanticLabel: l10n.restTimer_subtractSeconds(60),
                onTap: () => _c.addTime(-60),
              ),
              const SizedBox(width: 8),
              _AdjustChip(
                label: '-30s',
                semanticLabel: l10n.restTimer_subtractSeconds(30),
                onTap: () => _c.addTime(-30),
              ),
              const SizedBox(width: 8),
              _AdjustChip(
                label: '+30s',
                semanticLabel: l10n.restTimer_addSeconds(30),
                onTap: () => _c.addTime(30),
              ),
              const SizedBox(width: 8),
              _AdjustChip(
                label: '+1m',
                semanticLabel: l10n.restTimer_addSeconds(60),
                onTap: () => _c.addTime(60),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _CircleAction(
                icon: Icons.refresh_rounded,
                onTap: _c.reset,
                size: 52,
                color: AppColors.textSecondary,
                semanticLabel: l10n.restTimer_reset,
              ),
              const SizedBox(width: 20),
              _CircleAction(
                icon: _c.isRunning
                    ? Icons.pause_rounded
                    : Icons.play_arrow_rounded,
                onTap: _c.toggle,
                size: 72,
                color: AppColors.primary,
                filled: true,
                semanticLabel: _c.isRunning
                    ? l10n.restTimer_pause
                    : l10n.restTimer_resume,
              ),
              const SizedBox(width: 20),
              _CircleAction(
                icon: Icons.close_rounded,
                onTap: () {
                  _c.dismiss();
                  Navigator.pop(context);
                },
                size: 52,
                color: AppColors.textSecondary,
                semanticLabel: l10n.restTimer_dismiss,
              ),
            ],
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: RestTimerController.presets.map((s) {
              final selected = s == _c.total && !_c.isCustom;
              final label = _presetLabel(s);
              return Semantics(
                label: l10n.restTimer_preset(label),
                button: true,
                selected: selected,
                excludeSemantics: true,
                child: GestureDetector(
                  onTap: () => _c.selectPreset(s),
                  child: Container(
                    constraints: const BoxConstraints(minHeight: 44),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: selected
                          ? AppColors.primary.withAlpha(30)
                          : AppColors.bgCardLight,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: selected
                            ? AppColors.primary
                            : AppColors.bgCardLight,
                      ),
                    ),
                    child: Text(
                      label,
                      style: TextStyle(
                        color: selected
                            ? AppColors.primary
                            : AppColors.textSecondary,
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

class _AdjustChip extends StatelessWidget {
  final String label;
  final String semanticLabel;
  final VoidCallback onTap;
  const _AdjustChip({
    required this.label,
    required this.semanticLabel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      button: true,
      excludeSemantics: true,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints(minWidth: 44, minHeight: 44),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.bgCardLight,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            label,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}

class _CircleAction extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final double size;
  final Color color;
  final bool filled;
  final String semanticLabel;
  const _CircleAction({
    required this.icon,
    required this.onTap,
    required this.size,
    required this.color,
    this.filled = false,
    required this.semanticLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      button: true,
      excludeSemantics: true,
      child: Tooltip(
        message: semanticLabel,
        child: Material(
          color: filled ? color : color.withAlpha(25),
          shape: const CircleBorder(),
          child: InkWell(
            onTap: onTap,
            customBorder: const CircleBorder(),
            child: SizedBox(
              width: size < 44 ? 44 : size,
              height: size < 44 ? 44 : size,
              child: Icon(
                icon,
                color: filled ? Colors.white : color,
                size: size * 0.45,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
