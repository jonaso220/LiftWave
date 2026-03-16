import 'dart:io';
import 'package:liftwave/l10n/generated/app_localizations.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../data/workout_store.dart';

class CsvExporter {
  static Future<void> exportAndShare(S l10n) async {
    final workouts = WorkoutStore.instance.workouts;
    final buffer = StringBuffer();

    // Header
    buffer.writeln(l10n.csv_header);

    for (final w in workouts) {
      final dateStr =
          '${w.date.year}-${w.date.month.toString().padLeft(2, '0')}-${w.date.day.toString().padLeft(2, '0')}';
      for (final e in w.exercises) {
        for (final s in e.sets) {
          final volume = (s.reps * s.weight).round();
          buffer.writeln(
            '$dateStr,"${_escape(w.name)}","${_escape(e.name)}","${_escape(e.muscleGroup)}",${s.setNumber},${s.reps},${s.weight},$volume',
          );
        }
      }
    }

    // Write to temp file
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/liftwave_export.csv');
    await file.writeAsString(buffer.toString());

    // Share
    await Share.shareXFiles(
      [XFile(file.path)],
      subject: l10n.csv_subject,
    );
  }

  static String _escape(String s) => s.replaceAll('"', '""');
}
