import 'dart:io';
import 'dart:ui';

import 'package:liftwave/l10n/generated/app_localizations.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../data/workout_store.dart';
import '../models/models.dart';

class CsvExporter {
  /// [origin] is the on-screen rectangle of the control that started the
  /// export. iPad anchors the share sheet to it and refuses to open without
  /// one.
  static Future<void> exportAndShare(S l10n, {Rect? origin}) async {
    final workouts = WorkoutStore.instance.workouts;
    final csv = buildCsv(workouts, l10n.csv_header);

    // Write to temp file
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/liftwave_export.csv');
    await file.writeAsString(csv);

    // Share
    await Share.shareXFiles(
      [XFile(file.path)],
      subject: l10n.csv_subject,
      sharePositionOrigin: origin,
    );
  }

  static String buildCsv(List<Workout> workouts, String header) {
    final buffer = StringBuffer();

    // Header
    buffer.writeln(header);

    for (final w in workouts) {
      final dateStr =
          '${w.date.year}-${w.date.month.toString().padLeft(2, '0')}-${w.date.day.toString().padLeft(2, '0')}';
      for (final e in w.exercises) {
        for (final s in e.effectiveCompletedSets) {
          final volume = (s.reps * s.weight).round();
          buffer.writeln(
            '$dateStr,"${_escape(w.name)}","${_escape(e.name)}","${_escape(e.muscleGroup)}",${s.setNumber},${s.reps},${s.weight},$volume',
          );
        }
      }
    }

    return buffer.toString();
  }

  static String _escape(String s) => s.replaceAll('"', '""');
}
