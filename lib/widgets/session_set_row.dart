import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/services.dart';
import '../l10n/generated/app_localizations.dart';
import '../models/models.dart';
import '../models/session_models.dart';
import '../theme/app_theme.dart';
import '../utils/weight_format.dart';
import '../utils/weight_units.dart';
import 'set_type_badge.dart';

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

  /// Shows large −/+ buttons under the row (the next set to log), so common
  /// adjustments do not need the keyboard.
  final bool showSteppers;

  /// Load change per tap, in the user's unit (kg or lb). Zero hides the
  /// weight buttons (bodyweight work).
  final double weightStep;

  /// The number shown on a normal set. Warm-ups carry a letter instead, so
  /// this counts working sets only; defaults to the position in the list.
  final int? number;

  /// Called when the user picks another set type from the badge's menu.
  /// Null makes the badge a plain label.
  final ValueChanged<SetType>? onTypeChanged;

  /// The exercise is held for a time: the "reps" value is seconds, and the
  /// quick buttons move it in steps of [holdStepSeconds].
  final bool timed;

  /// Starts a countdown for this set (timed exercises). Null hides the
  /// button.
  final VoidCallback? onStartHold;

  const SessionSetRow({
    super.key,
    required this.set,
    required this.index,
    required this.onToggle,
    this.number,
    this.onTypeChanged,
    this.timed = false,
    this.onStartHold,
    this.previous,
    this.onRemove,
    required this.onChanged,
    this.onEdited,
    this.onUsePrevious,
    this.showSteppers = false,
    this.weightStep = 2.5,
  });

  @override
  State<SessionSetRow> createState() => _SessionSetRowState();
}

class _SessionSetRowState extends State<SessionSetRow> {
  /// Same ceilings as the history editor: beyond them the value is a typo
  /// ("1000" for "100,0") that would inflate volume and unlock achievements.
  static const double _maxWeightKg = 1000;
  static const int _maxReps = 999;

  late final TextEditingController _repsCtrl;
  late final TextEditingController _weightCtrl;
  final FocusNode _repsFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _repsCtrl = TextEditingController(
      text: widget.set.reps > 0 ? '${widget.set.reps}' : '',
    );
    _weightCtrl = TextEditingController(text: _weightText());
    WeightUnits.instance.addListener(_syncFields);
  }

  /// The stored load (always kg) in the unit the user reads and types.
  String _weightText() =>
      widget.set.weight > 0 ? _fmt(kgToDisplay(widget.set.weight)) : '';

  void _syncFields() {
    _repsCtrl.text = widget.set.reps > 0 ? '${widget.set.reps}' : '';
    _weightCtrl.text = _weightText();
  }

  @override
  void didUpdateWidget(covariant SessionSetRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (identical(oldWidget.set, widget.set)) return;
    _syncFields();
  }

  @override
  void dispose() {
    WeightUnits.instance.removeListener(_syncFields);
    _repsCtrl.dispose();
    _weightCtrl.dispose();
    _repsFocus.dispose();
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

  /// Applies a stepper tap, clamped at zero, and refreshes this row's fields.
  /// [weight] is in the user's unit, so 135 lb + 5 lb is exactly 140 lb.
  void _bump({double weight = 0, int reps = 0}) {
    HapticFeedback.selectionClick();
    _edit(() {
      if (weight != 0) {
        final shown = kgToDisplay(widget.set.weight) + weight;
        final next = (shown * 100).round() / 100;
        final kg = next <= 0 ? 0.0 : displayToKg(next);
        widget.set.weight = kg > _maxWeightKg ? _maxWeightKg : kg;
      }
      if (reps != 0) {
        widget.set.reps = (widget.set.reps + reps).clamp(0, _maxReps);
      }
    });
    _syncFields();
  }

  void _toggle() {
    // A set with no repetitions is not a completed set; send the user to the
    // field instead of logging an empty one.
    if (!widget.set.completed && widget.set.reps <= 0) {
      HapticFeedback.heavyImpact();
      _repsFocus.requestFocus();
      // Reopens the keyboard when the field already had focus but the user
      // had dismissed it.
      SystemChannels.textInput.invokeMethod<void>('TextInput.show');
      return;
    }
    HapticFeedback.lightImpact();
    widget.onToggle();
  }

  Widget _buildSteppers(BuildContext context, S l10n) {
    final step = widget.weightStep;
    final stepLabel = formatWeight(
      step,
      Localizations.localeOf(context).toString(),
    );
    final rep = l10n.train_repShort;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 2, 0, 8),
      child: Row(
        children: [
          if (step > 0) ...[
            _StepButton(
              label: '−$stepLabel $weightSymbol',
              onTap: () => _bump(weight: -step),
            ),
            _StepButton(
              label: '+$stepLabel $weightSymbol',
              onTap: () => _bump(weight: step),
            ),
            const SizedBox(width: 8),
          ],
          if (widget.timed) ...[
            _StepButton(
              label: '−$holdStepSeconds ${l10n.train_secondsShort}',
              onTap: () => _bump(reps: -holdStepSeconds),
            ),
            _StepButton(
              label: '+$holdStepSeconds ${l10n.train_secondsShort}',
              onTap: () => _bump(reps: holdStepSeconds),
            ),
            if (widget.onStartHold != null)
              _StepButton(
                // An icon, not "▶": Android draws that character as an emoji.
                icon: Icons.play_arrow_rounded,
                label: l10n.train_startHold,
                onTap: widget.set.reps > 0 ? widget.onStartHold! : _toggle,
              ),
          ] else ...[
            _StepButton(label: '−1 $rep', onTap: () => _bump(reps: -1)),
            _StepButton(label: '+1 $rep', onTap: () => _bump(reps: 1)),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final done = widget.set.completed;
    final number = widget.number ?? widget.index + 1;
    final type = widget.set.type;
    final setLabel = type == SetType.normal
        ? '${l10n.train_setHeader} $number'
        : '${l10n.train_setHeader} ${widget.index + 1}, '
              '${setTypeName(l10n, type)}';
    final badge = SetTypeBadge(type: type, number: number, done: done);
    // Opaque so the swipe-to-remove background only shows beside the row.
    final row = Container(
      color: done
          ? Color.alphaBlend(AppColors.accent.withAlpha(13), AppColors.bgCard)
          : AppColors.bgCard,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: SessionSetColumns.set,
                child: Center(
                  child: widget.onTypeChanged == null
                      ? badge
                      : _SetTypeMenu(
                          current: type,
                          onSelected: widget.onTypeChanged!,
                          child: badge,
                        ),
                ),
              ),
              Expanded(
                flex: SessionSetColumns.previous,
                child: _PreviousCell(
                  previous: widget.previous,
                  timed: widget.timed,
                  onTap: done ? null : widget.onUsePrevious,
                ),
              ),
              Expanded(
                flex: SessionSetColumns.weight,
                child: _NumField(
                  controller: _weightCtrl,
                  hint: '0',
                  isInteger: false,
                  max: kgToDisplay(_maxWeightKg),
                  done: done,
                  onChanged: (v) => _edit(
                    () => widget.set.weight = displayToKg(
                      double.tryParse(v.replaceAll(',', '.')) ?? 0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: SessionSetColumns.reps,
                child: _NumField(
                  controller: _repsCtrl,
                  focusNode: _repsFocus,
                  hint: '0',
                  isInteger: true,
                  max: _maxReps.toDouble(),
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
          if (widget.showSteppers && !done) _buildSteppers(context, l10n),
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

class _StepButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback onTap;

  const _StepButton({required this.label, required this.onTap, this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: OutlinedButton(
          onPressed: onTap,
          style: OutlinedButton.styleFrom(
            foregroundColor: AppColors.primaryLight,
            side: BorderSide(color: AppColors.bgCardLight),
            minimumSize: const Size(0, 40),
            padding: const EdgeInsets.symmetric(horizontal: 4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            textStyle: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: icon == null
                ? Text(label)
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(icon, size: 18),
                      const SizedBox(width: 2),
                      Text(label),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

/// The set badge as a button: tapping it offers the set types.
class _SetTypeMenu extends StatelessWidget {
  final SetType current;
  final ValueChanged<SetType> onSelected;
  final Widget child;

  const _SetTypeMenu({
    required this.current,
    required this.onSelected,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return PopupMenuButton<SetType>(
      tooltip: l10n.setType_title,
      initialValue: current,
      color: AppColors.bgCardLight,
      padding: EdgeInsets.zero,
      onSelected: (type) {
        HapticFeedback.selectionClick();
        onSelected(type);
      },
      itemBuilder: (_) => [
        for (final type in SetType.values)
          PopupMenuItem<SetType>(
            value: type,
            child: Row(
              children: [
                SetTypeBadge(type: type, number: 1, size: 26),
                const SizedBox(width: 12),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        setTypeName(l10n, type),
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 14,
                        ),
                      ),
                      if (type == SetType.warmup)
                        Text(
                          l10n.setType_warmupHint,
                          style: TextStyle(
                            color: AppColors.textMuted,
                            fontSize: 11,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
      // A 44 pt target around the 28 pt badge.
      child: SizedBox(width: 44, height: 44, child: Center(child: child)),
    );
  }
}

class _PreviousCell extends StatelessWidget {
  final WorkoutSet? previous;
  final bool timed;
  final VoidCallback? onTap;

  const _PreviousCell({
    required this.previous,
    required this.onTap,
    this.timed = false,
  });

  @override
  Widget build(BuildContext context) {
    final prev = previous;
    if (prev == null) {
      return Text(
        '—',
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColors.textMuted, fontSize: 13),
      );
    }
    final l10n = S.of(context);
    final amount = timed
        ? '${prev.reps} ${l10n.train_secondsShort}'
        : '${prev.reps}';
    final label = prev.weight > 0
        ? '${formatLoad(prev.weight, Localizations.localeOf(context).toString())} × $amount'
        : timed
        ? amount
        : '${prev.reps} ${l10n.common_reps.toLowerCase()}';
    final text = Text(
      label,
      textAlign: TextAlign.center,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
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
  final double max;
  final bool done;
  final FocusNode? focusNode;
  final void Function(String) onChanged;

  const _NumField({
    required this.controller,
    required this.hint,
    required this.isInteger,
    required this.max,
    required this.done,
    required this.onChanged,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        onChanged: onChanged,
        // Tapping anywhere else closes the keyboard (iOS has no "done" key
        // on the number pad).
        onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
        enabled: !done,
        textAlign: TextAlign.center,
        keyboardType: isInteger
            ? TextInputType.number
            : const TextInputType.numberWithOptions(decimal: true),
        inputFormatters: [
          if (isInteger)
            FilteringTextInputFormatter.digitsOnly
          else
            FilteringTextInputFormatter.allow(RegExp(r'^\d*[\.,]?\d*')),
          _MaxValueFormatter(max),
        ],
        style: TextStyle(
          color: done ? AppColors.accent : AppColors.textPrimary,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: AppColors.textMuted, fontSize: 14),
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

/// Refuses an edit that would take the field above [max], so what is shown
/// never differs from what is stored.
class _MaxValueFormatter extends TextInputFormatter {
  final double max;

  const _MaxValueFormatter(this.max);

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final value = double.tryParse(newValue.text.replaceAll(',', '.'));
    return value != null && value > max ? oldValue : newValue;
  }
}
