import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../l10n/generated/app_localizations.dart';
import '../models/session_models.dart';
import '../theme/app_theme.dart';

class SessionSetRow extends StatefulWidget {
  final SessionSet set;
  final int index;
  final VoidCallback onToggle;
  final VoidCallback? onRemove;
  final VoidCallback onChanged;

  const SessionSetRow({
    super.key,
    required this.set,
    required this.index,
    required this.onToggle,
    this.onRemove,
    required this.onChanged,
  });

  @override
  State<SessionSetRow> createState() => _SessionSetRowState();
}

class _SessionSetRowState extends State<SessionSetRow> {
  late final TextEditingController _repsCtrl;
  late final TextEditingController _weightCtrl;

  @override
  void initState() {
    super.initState();
    _repsCtrl = TextEditingController(
      text: widget.set.reps > 0 ? '${widget.set.reps}' : '',
    );
    _weightCtrl = TextEditingController(
      text: widget.set.weight > 0 ? _fmt(widget.set.weight) : '',
    );
  }

  @override
  void didUpdateWidget(covariant SessionSetRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (identical(oldWidget.set, widget.set)) return;
    _repsCtrl.text = widget.set.reps > 0 ? '${widget.set.reps}' : '';
    _weightCtrl.text = widget.set.weight > 0 ? _fmt(widget.set.weight) : '';
  }

  @override
  void dispose() {
    _repsCtrl.dispose();
    _weightCtrl.dispose();
    super.dispose();
  }

  String _fmt(double v) =>
      v == v.roundToDouble() ? v.toInt().toString() : v.toString();

  @override
  Widget build(BuildContext context) {
    final done = widget.set.completed;
    final setLabel = '${S.of(context).train_setHeader} ${widget.index + 1}';
    return Container(
      color: done ? AppColors.accent.withAlpha(13) : Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
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
                    color: done ? AppColors.accent : AppColors.textSecondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: _NumField(
              controller: _repsCtrl,
              hint: '0',
              isInteger: true,
              done: done,
              onChanged: (v) {
                widget.set.reps = int.tryParse(v) ?? 0;
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
                          double.tryParse(v.replaceAll(',', '.')) ?? 0;
                      widget.onChanged();
                    },
                  ),
                ),
                if (widget.onRemove != null)
                  IconButton(
                    tooltip: '${S.of(context).train_removeSet}: $setLabel',
                    onPressed: widget.onRemove,
                    constraints: const BoxConstraints.tightFor(
                      width: 44,
                      height: 44,
                    ),
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.remove_circle_outline_rounded,
                      color: AppColors.textMuted.withAlpha(180),
                      size: 20,
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Checkbox(
                value: done,
                onChanged: (_) {
                  HapticFeedback.lightImpact();
                  widget.onToggle();
                },
                semanticLabel: setLabel,
                activeColor: AppColors.accent,
                checkColor: Colors.white,
                fillColor: WidgetStateProperty.resolveWith(
                  (states) => states.contains(WidgetState.selected)
                      ? AppColors.accent
                      : AppColors.bgCardLight,
                ),
                side: BorderSide.none,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
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
            : [FilteringTextInputFormatter.allow(RegExp(r'^\d*[\.,]?\d*'))],
        style: TextStyle(
          color: done ? AppColors.accent : AppColors.textPrimary,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: AppColors.textMuted, fontSize: 14),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 8,
          ),
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
