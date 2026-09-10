import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';
import 'package:liftwave/models/session_models.dart';
import 'package:liftwave/utils/weight_format.dart';
import 'package:liftwave/widgets/session_set_row.dart';

void main() {
  Future<void> pumpRow(WidgetTester tester, SessionSet set) async {
    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('es'),
        localizationsDelegates: S.localizationsDelegates,
        supportedLocales: S.supportedLocales,
        home: Scaffold(
          body: StatefulBuilder(
            builder: (context, update) {
              return SessionSetRow(
                set: set,
                index: 0,
                onToggle: () => update(() => set.completed = !set.completed),
                onChanged: () => update(() {}),
              );
            },
          ),
        ),
      ),
    );
  }

  testWidgets('clearing weight cannot retain a hidden load in saved volume', (
    tester,
  ) async {
    final set = SessionSet(reps: 10, weight: 22.5);
    await pumpRow(tester, set);
    await tester.enterText(find.byType(TextField).at(1), '');
    await tester.tap(find.byType(Checkbox));
    await tester.pump();

    final saved = SessionSet.fromJson(set.toJson());
    expect(saved.completed, isTrue);
    expect(saved.weight, 0);
    final exercise = SessionExercise(
      id: 'bench',
      name: 'Bench',
      muscleGroup: 'Chest',
      equipment: 'Barbell',
      sets: [saved],
    );
    expect(exercise.totalVolume, 0);
  });

  testWidgets('cleared repetitions persist as zero', (tester) async {
    final set = SessionSet(reps: 10, weight: 20);
    await pumpRow(tester, set);
    await tester.enterText(find.byType(TextField).first, '');
    await tester.tap(find.byType(Checkbox));
    expect(SessionSet.fromJson(set.toJson()).reps, 0);
  });

  testWidgets('decimal comma survives editing and completing a set', (
    tester,
  ) async {
    final set = SessionSet(reps: 10, weight: 20);
    await pumpRow(tester, set);
    await tester.enterText(find.byType(TextField).at(1), '22,5');
    await tester.tap(find.byType(Checkbox));
    expect(SessionSet.fromJson(set.toJson()).weight, 22.5);
  });

  test('history formatting preserves fractional loads and locale', () {
    expect(formatWeight(22.5, 'es'), '22,5');
    expect(formatWeight(1.25, 'es'), '1,25');
    expect(formatWeight(22.5, 'en'), '22.5');
    expect(formatWeight(20, 'es'), '20');
    expect(formatWeight(11 * 1.25, 'es'), '13,75');
  });
}
