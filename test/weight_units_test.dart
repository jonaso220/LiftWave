import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';
import 'package:liftwave/models/models.dart';
import 'package:liftwave/models/session_models.dart';
import 'package:liftwave/services/progression_service.dart';
import 'package:liftwave/utils/weight_units.dart';
import 'package:liftwave/widgets/session_set_row.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  tearDown(() => WeightUnits.instance.setForTesting(WeightUnit.kg));

  group('conversions', () {
    test('kilograms are shown as stored', () {
      expect(weightSymbol, 'kg');
      expect(kgToDisplay(62.5), 62.5);
      expect(displayToKg(62.5), 62.5);
      expect(formatLoadWithUnit(62.5, 'es'), '62,5 kg');
      expect(formatVolume(8400, compact: true), '8.4k kg');
    });

    test('pounds round-trip exactly and read naturally', () {
      WeightUnits.instance.setForTesting(WeightUnit.lb);
      expect(weightSymbol, 'lb');
      final stored = displayToKg(135);
      expect(stored, closeTo(61.235, 0.001));
      expect(kgToDisplay(stored), 135);
      expect(formatLoadWithUnit(100, 'en'), '220.46 lb');
      expect(formatVolume(1000), '2205 lb');
      expect(formatVolume(1000, compact: true), '2.2k lb');
    });

    test('a pound load viewed in kilograms stays readable', () {
      WeightUnits.instance.setForTesting(WeightUnit.lb);
      final stored = displayToKg(135);
      WeightUnits.instance.setForTesting(WeightUnit.kg);
      expect(kgToDisplay(stored), 61.23);
    });

    test('steps are 2.5 kg (2 kg dumbbells) or 5 lb', () {
      expect(loadStepDisplay('Barra'), 2.5);
      expect(loadStepDisplay('Mancuernas'), 2);
      WeightUnits.instance.setForTesting(WeightUnit.lb);
      expect(loadStepDisplay('Barra'), 5);
      expect(loadStepDisplay('Mancuernas'), 5);
      expect(loadStepKg('Barra'), closeTo(2.268, 0.001));
    });
  });

  test('progression in pounds suggests the next 5 lb', () {
    WeightUnits.instance.setForTesting(WeightUnit.lb);
    final result = ProgressionService.recommend(
      exerciseName: 'Press banca',
      equipment: 'Barra',
      loadIncrementKg: loadStepKg('Barra'),
      workouts: [
        Workout(
          id: 'w',
          name: 'Empuje',
          date: DateTime(2026, 9, 20),
          duration: const Duration(minutes: 40),
          totalVolume: 0,
          exercises: [
            WorkoutExercise(
              id: 'bench',
              name: 'Press banca',
              muscleGroup: 'Pecho',
              sets: [
                WorkoutSet(
                  setNumber: 1,
                  reps: 12,
                  weight: displayToKg(135),
                  completed: true,
                ),
              ],
            ),
          ],
        ),
      ],
    )!;
    expect(kgToDisplay(result.suggestedWeight), 140);
  });

  group('set row in pounds', () {
    Future<void> pumpRows(WidgetTester tester, SessionExercise exercise) {
      return tester.pumpWidget(
        MaterialApp(
          locale: const Locale('en'),
          localizationsDelegates: S.localizationsDelegates,
          supportedLocales: S.supportedLocales,
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, update) => Column(
                children: [
                  for (var i = 0; i < exercise.sets.length; i++)
                    SessionSetRow(
                      key: ObjectKey(exercise.sets[i]),
                      set: exercise.sets[i],
                      index: i,
                      previous: i == 0
                          ? WorkoutSet(
                              setNumber: 1,
                              reps: 8,
                              weight: displayToKg(130),
                              completed: true,
                            )
                          : null,
                      onToggle: () {},
                      onChanged: () => update(() {}),
                      onEdited: (reps, weight) => exercise.propagateEdit(
                        i,
                        previousReps: reps,
                        previousWeight: weight,
                      ),
                      showSteppers: i == 0,
                      weightStep: 5,
                    ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    testWidgets('shows, steps and stores pounds correctly', (tester) async {
      WeightUnits.instance.setForTesting(WeightUnit.lb);
      final ex = SessionExercise(
        id: 'bench',
        name: 'Press banca',
        muscleGroup: 'Pecho',
        equipment: 'Barra',
        sets: [
          SessionSet(reps: 8, weight: displayToKg(135)),
          SessionSet(reps: 8, weight: displayToKg(135)),
        ],
      );
      await pumpRows(tester, ex);

      TextField field(int i) =>
          tester.widget<TextField>(find.byType(TextField).at(i));
      expect(field(0).controller!.text, '135');
      expect(find.text('130 × 8'), findsOneWidget);

      await tester.tap(find.text('+5 lb'));
      await tester.pump();
      expect(kgToDisplay(ex.sets[0].weight), 140);
      expect(kgToDisplay(ex.sets[1].weight), 140);
      expect(field(0).controller!.text, '140');

      await tester.enterText(find.byType(TextField).first, '225');
      await tester.pump();
      expect(ex.sets[0].weight, closeTo(102.058, 0.001));
    });

    testWidgets('switching units refreshes open fields', (tester) async {
      SharedPreferences.setMockInitialValues({});
      final ex = SessionExercise(
        id: 'bench',
        name: 'Press banca',
        muscleGroup: 'Pecho',
        equipment: 'Barra',
        sets: [SessionSet(reps: 8, weight: 100)],
      );
      await pumpRows(tester, ex);
      expect(
        tester.widget<TextField>(find.byType(TextField).first).controller!.text,
        '100',
      );

      await WeightUnits.instance.setUnit(WeightUnit.lb);
      await tester.pump();
      expect(
        tester.widget<TextField>(find.byType(TextField).first).controller!.text,
        '220.46',
      );
      // Switching units never rewrites the stored load.
      expect(ex.sets.single.weight, 100);
    });
  });
}
