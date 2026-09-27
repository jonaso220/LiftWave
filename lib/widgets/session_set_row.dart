import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';
import '../l10n/generated/app_localizations.dart';
import '../models/models.dart';
import '../models/session_models.dart';
import '../theme/app_theme.dart';
import '../utils/weight_format.dart';

/// Column proportions shared by [SessionSetRow] and the header above it:
/// SET · PREVIOUS · KG · REPS · ✓.
abstract final class SessionSetColumns {
  static const int set = 2;
  static const int previous = 4;
  static const int weight = 4;
  static const int reps = 3;
  static const int done = 3;
}

class SessionSetRow extends StatefulWidget {
  final SessionSet set;
  final int index;

  /// The set performed at the same position last time, if any.
  final WorkoutSet? previous;
  final VoidCallback onToggle;

  /// Removes the set (swipe left). Null when the set cannot be removed.
  final Future<void> Function()? onRemove;
  final VoidCallback onChanged;

  /// Called after the user edits reps or weight, with the values the set
  /// held before the edit.
  final void Function(int previousReps, double previousWeight)? onEdited;

  /// Copies [previous] into this set. Only offered while it is pending.
  final VoidCallback? onUsePrevious;

  const SessionSetRow({
    super.key,
    required this.set,
    required this.index,
    required this.onToggle,
    this.previous,
    this.onRemove,
    required this.onChanged,
    this.onEdited,
    this.onUsePrevious,
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

  void _edit(void Function() apply) {
    final previousReps = widget.set.reps;
    final previousWeight = widget.set.weight;
    apply();
    widget.onEdited?.call(previousReps, previousWeight);
    widget.onChanged();
  }

  void _toggle() {
    HapticFeedback.lightImpact();
    widget.onToggle();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final done = widget.set.completed;
    final setLabel = '${l10n.train_setHeader} ${widget.index + 1}';
    // Opaque so the swipe-to-remove background only shows beside the row.
    final row = Container(
      color: done
          ? Color.alphaBlend(AppColors.accent.withAlpha(13), AppColors.bgCard)
          : AppColors.bgCard,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Row(
        children: [
          Expanded(
            flex: SessionSetColumns.set,
            child: Center(
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
          ),
          Expanded(
            flex: SessionSetColumns.previous,
            child: _PreviousCell(
              previous: widget.previous,
              onTap: done ? null : widget.onUsePrevious,
            ),
          ),
          Expanded(
            flex: SessionSetColumns.weight,
            child: _NumField(
              controller: _weightCtrl,
              hint: '0',
              isInteger: false,
              done: done,
              onChanged: (v) => _edit(
                () => widget.set.weight =
                    double.tryParse(v.replaceAll(',', '.')) ?? 0,
              ),
            ),
          ),
          Expanded(
            flex: SessionSetColumns.reps,
            child: _NumField(
              controller: _repsCtrl,
              hint: '0',
              isInteger: true,
              done: done,
              onChanged: (v) =>
                  _edit(() => widget.set.reps = int.tryParse(v) ?? 0),
            ),
          ),
          Expanded(
            flex: SessionSetColumns.done,
            // The whole cell toggles the set, not just the checkbox, so it
            // is easy to hit between sets.
            child: GestureDetector(
              onTap: _toggle,
              behavior: HitTestBehavior.opaque,
              excludeFromSemantics: true,
              child: SizedBox(
                height: 52,
                child: Center(
                  child: Transform.scale(
                    scale: 1.3,
                    child: Checkbox(
                      value: done,
                      onChanged: (_) => _toggle(),
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
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    final onRemove = widget.onRemove;
    if (onRemove == null) return row;
    final removeLabel = '${l10n.train_removeSet}: $setLabel';
    return Semantics(
      customSemanticsActions: {
        CustomSemanticsAction(label: removeLabel): () => onRemove(),
      },
      child: Dismissible(
        key: ObjectKey(widget.set),
        direction: DismissDirection.endToStart,
        // The parent removes the set itself (asking first when it is already
        // completed); the row just slides back if the user keeps it.
        confirmDismiss: (_) async {
          await onRemove();
          return false;
        },
        background: Container(
          color: AppColors.error.withAlpha(40),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          child: Tooltip(
            message: removeLabel,
            child: const Icon(
              Icons.delete_outline_rounded,
              color: AppColors.error,
            ),
          ),
        ),
        child: row,
      ),
    );
  }
}

class _PreviousCell extends StatelessWidget {
  final WorkoutSet? previous;
  final VoidCallback? onTap;

  const _PreviousCell({required this.previous, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final prev = previous;
    if (prev == null) {
      return const Text(
        '—',
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColors.textMuted, fontSize: 13),
      );
    }
    final l10n = S.of(context);
    final label = prev.weight > 0
        ? '${formatWeight(prev.weight, Localizations.localeOf(context).toString())} × ${prev.reps}'
        : '${prev.reps} ${l10n.common_reps.toLowerCase()}';
    final text = Text(
      label,
      textAlign: TextAlign.center,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        color: AppColors.textMuted,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    );
    if (onTap == null) return text;
    return Tooltip(
      message: l10n.train_usePrevious,
      child: InkWell(
        onTap: () {
          HapticFeedback.selectionClick();
          onTap!();
        },
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(height: 44, child: Center(child: text)),
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
      padding: const EdgeInsets.symmetric(horizontal: 3),
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
            horizontal: 6,
            vertical: 10,
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
