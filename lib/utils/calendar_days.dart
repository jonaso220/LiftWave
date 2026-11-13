/// Calendar arithmetic that stays correct when the clocks change.
///
/// `date.add(Duration(days: n))` moves by n × 24 hours. The week daylight
/// saving starts or ends, that lands an hour off: midnight minus "one day"
/// becomes 23:00 two days back, and two midnights a day apart are only 23
/// hours apart. Streaks, "today / yesterday" labels and week boundaries must
/// count calendar days instead.
library;

/// Midnight of [date]'s calendar day, in local time.
DateTime startOfDay(DateTime date) => DateTime(date.year, date.month, date.day);

/// Midnight of the calendar day [days] after [date] (negative for before).
DateTime addCalendarDays(DateTime date, int days) =>
    DateTime(date.year, date.month, date.day + days);

/// Whole calendar days from [from] to [to], ignoring the time of day.
int calendarDaysBetween(DateTime from, DateTime to) => DateTime.utc(
  to.year,
  to.month,
  to.day,
).difference(DateTime.utc(from.year, from.month, from.day)).inDays;

bool isSameCalendarDay(DateTime a, DateTime b) =>
    a.year == b.year && a.month == b.month && a.day == b.day;

/// Midnight of the Monday that starts [date]'s week.
DateTime startOfWeek(DateTime date) =>
    addCalendarDays(date, DateTime.monday - date.weekday);

/// The first day of [date]'s month, at midnight.
DateTime startOfMonth(DateTime date) => DateTime(date.year, date.month);

/// The first day of the month [months] after [date]'s (negative for before).
DateTime addMonths(DateTime date, int months) =>
    DateTime(date.year, date.month + months);

/// The cells of a month calendar whose weeks start on Monday: null for the
/// blanks before the 1st, then one date per day. The last week is padded
/// with nulls so every row has seven cells.
List<DateTime?> monthGrid(DateTime month) {
  final first = startOfMonth(month);
  final daysInMonth = DateTime(first.year, first.month + 1, 0).day;
  final cells = <DateTime?>[
    for (var i = 0; i < first.weekday - DateTime.monday; i++) null,
    for (var day = 1; day <= daysInMonth; day++)
      DateTime(first.year, first.month, day),
  ];
  while (cells.length % 7 != 0) {
    cells.add(null);
  }
  return cells;
}
