/// Works out which plates go on each side of a bar.
///
/// Everything here is in the unit the user trains in (kg or lb): plates and
/// bars come in round numbers of that unit, so converting would only add
/// rounding noise.
class PlateCalculator {
  const PlateCalculator._();

  /// Plates found in most gyms, heaviest first.
  static const List<double> kgPlates = [25, 20, 15, 10, 5, 2.5, 1.25];
  static const List<double> lbPlates = [45, 35, 25, 10, 5, 2.5];

  /// Common bars: Olympic, women's Olympic, and lighter technique / EZ bars.
  static const List<double> kgBars = [20, 15, 10];
  static const List<double> lbBars = [45, 35, 25];

  /// Whether an exercise done with this equipment is loaded with plates on
  /// a bar. A pull-up bar ("Barra fija") is not.
  static bool appliesTo(String equipment) {
    final normalized = equipment.trim().toLowerCase();
    if (normalized.contains('fija')) return false;
    return normalized.contains('barra') || normalized.contains('barbell');
  }

  /// The plates for one side that bring a [bar] as close to [total] as the
  /// [plates] allow without going over.
  ///
  /// Heaviest plates first, the way a bar is loaded. With these sets every
  /// plate is a multiple of the smallest one, so that always reaches the
  /// exact weight when the plates can make it.
  static PlateLoad load({
    required double total,
    required double bar,
    required List<double> plates,
  }) {
    if (total < bar) {
      return PlateLoad(
        perSide: const [],
        loaded: bar,
        missing: 0,
        belowBar: true,
      );
    }
    // Work in hundredths to keep 1.25 and 2.5 exact.
    var remaining = (((total - bar) / 2) * 100).round();
    final perSide = <double>[];
    final sorted = [...plates]..sort((a, b) => b.compareTo(a));
    for (final plate in sorted) {
      final hundredths = (plate * 100).round();
      if (hundredths <= 0) continue;
      while (remaining >= hundredths) {
        perSide.add(plate);
        remaining -= hundredths;
      }
    }
    final missing = remaining * 2 / 100;
    return PlateLoad(
      perSide: perSide,
      loaded: total - missing,
      missing: missing,
      belowBar: false,
    );
  }
}

/// The result of [PlateCalculator.load].
class PlateLoad {
  /// Plates on each side, from the collar outwards (heaviest first).
  final List<double> perSide;

  /// The weight actually on the bar, bar included.
  final double loaded;

  /// What is left of the target that these plates cannot make up.
  final double missing;

  /// The target is lighter than the empty bar.
  final bool belowBar;

  const PlateLoad({
    required this.perSide,
    required this.loaded,
    required this.missing,
    required this.belowBar,
  });

  bool get isExact => !belowBar && missing == 0;

  /// Plates grouped for display: `[(25, 2), (5, 1)]` for 25 + 25 + 5.
  List<(double plate, int count)> get grouped {
    final groups = <(double, int)>[];
    for (final plate in perSide) {
      if (groups.isNotEmpty && groups.last.$1 == plate) {
        groups[groups.length - 1] = (plate, groups.last.$2 + 1);
      } else {
        groups.add((plate, 1));
      }
    }
    return groups;
  }
}
