import 'package:intl/intl.dart';

/// Keep fractional training loads visible in the user's locale.
String formatWeight(double weight, String locale) {
  final format = NumberFormat.decimalPattern(locale)..maximumFractionDigits = 6;
  return format.format(weight);
}
