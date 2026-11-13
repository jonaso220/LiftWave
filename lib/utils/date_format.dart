import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

/// Numeric dates in the order the user's region writes them: 12/11/2026 in
/// Uruguay or Spain, 11/12/2026 in the United States, 2026/11/12 in Japan.
/// A fixed day/month/year reads as the wrong date for half of them.
///
/// The device's region decides (the app's own language list has no
/// countries); the app language and then day/month/year are the fallbacks.
String formatShortDate(BuildContext context, DateTime date) =>
    _format(context, date, DateFormat.yMd) ??
    '${date.day}/${date.month}/${date.year}';

/// Day and month only, for chart axes.
String formatDayMonth(BuildContext context, DateTime date) =>
    _format(context, date, DateFormat.Md) ?? '${date.day}/${date.month}';

String? _format(
  BuildContext context,
  DateTime date,
  DateFormat Function(String locale) pattern,
) {
  for (final locale in [
    PlatformDispatcher.instance.locale.toString(),
    Localizations.localeOf(context).toString(),
  ]) {
    try {
      return pattern(locale).format(date);
    } on Object {
      // No date data for this locale: try the next one.
    }
  }
  return null;
}
