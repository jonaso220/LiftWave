import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/plate_calculator.dart';
import '../../theme/app_theme.dart';
import '../../utils/weight_format.dart';
import '../../utils/weight_units.dart';

/// Opens the plate calculator, starting from [initialKg] (the load of the
/// set the user is about to do) when there is one.
Future<void> showPlateCalculator(BuildContext context, {double? initialKg}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => PlateCalculatorSheet(initialKg: initialKg),
  );
}

class PlateCalculatorSheet extends StatefulWidget {
  final double? initialKg;

  const PlateCalculatorSheet({super.key, this.initialKg});

  @override
  State<PlateCalculatorSheet> createState() => _PlateCalculatorSheetState();
}

class _PlateCalculatorSheetState extends State<PlateCalculatorSheet> {
  late final TextEditingController _targetCtrl;
  late final bool _pounds;
  late double _bar;

  List<double> get _bars =>
      _pounds ? PlateCalculator.lbBars : PlateCalculator.kgBars;
  List<double> get _plates =>
      _pounds ? PlateCalculator.lbPlates : PlateCalculator.kgPlates;

  /// The bar is remembered per unit: a 20 kg choice says nothing in pounds.
  String get _barKey => _pounds ? 'plate_bar_lb' : 'plate_bar_kg';

  @override
  void initState() {
    super.initState();
    _pounds = WeightUnits.instance.unit == WeightUnit.lb;
    _bar = _bars.first;
    _targetCtrl = TextEditingController();
    _restoreBar();
  }

  bool _prefilled = false;

  /// Fills the field with the starting load once the locale is known, so
  /// it is written the way the user types it ("62,5" where the decimal
  /// separator is a comma).
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_prefilled) return;
    _prefilled = true;
    final initial = widget.initialKg;
    if (initial == null || initial <= 0) return;
    final separator = NumberFormat.decimalPattern(
      Localizations.localeOf(context).toString(),
    ).symbols.DECIMAL_SEP;
    _targetCtrl.text = _number(
      kgToDisplay(initial),
    ).replaceAll('.', separator == ',' ? ',' : '.');
  }

  Future<void> _restoreBar() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final stored = prefs.getDouble(_barKey);
      if (stored != null && _bars.contains(stored) && mounted) {
        setState(() => _bar = stored);
      }
    } catch (_) {
      // The default bar is used.
    }
  }

  Future<void> _selectBar(double bar) async {
    HapticFeedback.selectionClick();
    setState(() => _bar = bar);
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setDouble(_barKey, bar);
    } catch (_) {
      // The choice still applies while the sheet is open.
    }
  }

  @override
  void dispose() {
    _targetCtrl.dispose();
    super.dispose();
  }

  String _number(double value) => value == value.roundToDouble()
      ? value.toInt().toString()
      : value.toString();

  String _withUnit(double value) =>
      '${formatWeight(value, Localizations.localeOf(context).toString())} $weightSymbol';

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final target = double.tryParse(_targetCtrl.text.replaceAll(',', '.'));
    final load = target == null || target <= 0
        ? null
        : PlateCalculator.load(total: target, bar: _bar, plates: _plates);

    return Padding(
      // Keeps the sheet above the keyboard.
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.bgCard,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: SafeArea(
          top: false,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                Row(
                  children: [
                    Icon(
                      Icons.fitness_center_rounded,
                      color: AppColors.primaryLight,
                      size: 22,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      l10n.plates_title,
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _targetCtrl,
                  autofocus: widget.initialKg == null || widget.initialKg! <= 0,
                  onChanged: (_) => setState(() {}),
                  onTapOutside: (_) =>
                      FocusManager.instance.primaryFocus?.unfocus(),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                      RegExp(r'^\d{0,4}[\.,]?\d{0,2}'),
                    ),
                  ],
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: InputDecoration(
                    labelText: l10n.plates_target,
                    suffixText: weightSymbol,
                    fillColor: AppColors.bgDark,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  l10n.plates_bar,
                  style: TextStyle(color: AppColors.textMuted, fontSize: 12),
                ),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 8,
                  children: [
                    for (final bar in _bars)
                      ChoiceChip(
                        label: Text(_withUnit(bar)),
                        selected: bar == _bar,
                        onSelected: (_) => _selectBar(bar),
                        showCheckmark: false,
                        selectedColor: AppColors.primary,
                        backgroundColor: AppColors.bgCardLight,
                        labelStyle: TextStyle(
                          color: bar == _bar
                              ? Colors.white
                              : AppColors.textSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 18),
                if (load != null) _buildResult(l10n, load),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResult(S l10n, PlateLoad load) {
    final String? note;
    final Color noteColor;
    if (load.belowBar) {
      note = l10n.plates_belowBar;
      noteColor = AppColors.asText(AppColors.accentYellow);
    } else if (load.missing > 0) {
      note = l10n.plates_missing(_withUnit(load.missing));
      noteColor = AppColors.asText(AppColors.accentYellow);
    } else if (load.perSide.isEmpty) {
      note = l10n.plates_onlyBar;
      noteColor = AppColors.textSecondary;
    } else {
      note = null;
      noteColor = AppColors.textSecondary;
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.bgDark,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.bgCardLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!load.belowBar) ...[
            _BarDiagram(plates: load.perSide, allPlates: _plates),
            const SizedBox(height: 14),
          ],
          if (load.perSide.isNotEmpty) ...[
            Text(
              l10n.plates_perSide,
              style: TextStyle(color: AppColors.textMuted, fontSize: 12),
            ),
            const SizedBox(height: 6),
            Wrap(
              spacing: 8,
              runSpacing: 6,
              children: [
                for (final (plate, count) in load.grouped)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.bgCardLight,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      count > 1
                          ? '$count × ${_withUnit(plate)}'
                          : _withUnit(plate),
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
              ],
            ),
          ],
          if (note != null) ...[
            if (load.perSide.isNotEmpty) const SizedBox(height: 10),
            Text(
              note,
              style: TextStyle(
                color: noteColor,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

/// One end of the bar with its plates, heaviest against the collar.
class _BarDiagram extends StatelessWidget {
  final List<double> plates;
  final List<double> allPlates;

  const _BarDiagram({required this.plates, required this.allPlates});

  // Competition colours for the big plates; neutral tones for the change.
  static const _colors = [
    Color(0xFFE63946),
    Color(0xFF3A86FF),
    Color(0xFFFFC43D),
    Color(0xFF2BB673),
    Color(0xFFD9DCE3),
    Color(0xFF9AA0AE),
    Color(0xFF6F7585),
  ];

  @override
  Widget build(BuildContext context) {
    final steel = AppColors.textMuted;
    return SizedBox(
      height: 104,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Shaft and collar.
            Container(width: 56, height: 8, color: steel),
            Container(
              width: 8,
              height: 26,
              decoration: BoxDecoration(
                color: steel,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            for (final plate in plates) _plate(plate),
            // What is left of the sleeve.
            Container(
              width: 28,
              height: 12,
              decoration: BoxDecoration(
                color: steel,
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(3),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _plate(double plate) {
    final index = allPlates.indexOf(plate);
    final rank = index < 0 ? allPlates.length - 1 : index;
    // Heavier plates are taller and thicker.
    final height = 100.0 - rank * 10;
    final width = rank < 2
        ? 18.0
        : rank < 4
        ? 14.0
        : 10.0;
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 1),
      decoration: BoxDecoration(
        color: _colors[rank.clamp(0, _colors.length - 1)],
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
