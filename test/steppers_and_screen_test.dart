import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';
import 'package:liftwave/models/session_models.dart';
import 'package:liftwave/services/progression_service.dart';
import 'package:liftwave/services/screen_awake_service.dart';
import 'package:liftwave/services/workout_launcher.dart';
import 'package:liftwave/widgets/session_set_row.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('set steppers', () {
    Future<void> pumpRows(
      WidgetTester tester,
      SessionExercise exercise, {
      double weightStep = 2.5,
    }) async {
      await tester.pumpWidget(
        MaterialApp(
          locale: const Locale('es'),
          localizationsDelegates: S.localizationsDelegates,
          supportedLocales: S.supportedLocales,
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, update) {
                final next = exercise.sets.indexWhere((s) => !s.completed);
                return Column(
                  children: [
                    for (var i = 0; i < exercise.sets.length; i++)
                      SessionSetRow(
                        key: ObjectKey(exercise.sets[i]),
                        set: exercise.sets[i],
                        index: i,
                        onToggle: () => update(
                          () => exercise.sets[i].completed =
                              !exercise.sets[i].completed,
                        ),
                        onChanged: () => update(() {}),
                        onEdited: (reps, weight) => exercise.propagateEdit(
                          i,
                          previousReps: reps,
                          previousWeight: weight,
                        ),
                        showSteppers: i == next,
                        weightStep: weightStep,
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      );
    }

    SessionExercise bench(List<SessionSet> sets) => SessionExercise(
      id: 'bench',
      name: 'Press banca',
      muscleGroup: 'Pecho',
      equipment: 'Barra',
      sets: sets,
    );

    testWidgets('only the next set to log shows the buttons', (tester) async {
      final ex = bench([
        SessionSet(reps: 8, weight: 60, completed: true),
        SessionSet(reps: 8, weight: 60),
        SessionSet(reps: 8, weight: 60),
      ]);
      await pumpRows(tester, ex);
      expect(find.text('+2,5 kg'), findsOneWidget);
      expect(find.text('+1 rep'), findsOneWidget);
    });

    testWidgets('+2,5 kg updates the set, its field and the sets after it', (
      tester,
    ) async {
      final ex = bench([
        SessionSet(reps: 8, weight: 60),
        SessionSet(reps: 8, weight: 60),
      ]);
      await pumpRows(tester, ex);
      await tester.tap(find.text('+2,5 kg'));
      await tester.pump();

      expect(ex.sets.map((s) => s.weight), [62.5, 62.5]);
      expect(
        tester.widget<TextField>(find.byType(TextField).first).controller!.text,
        '62.5',
      );
    });

    testWidgets('reps never go below zero', (tester) async {
      final ex = bench([SessionSet(reps: 1, weight: 20)]);
      await pumpRows(tester, ex);
      await tester.tap(find.text('−1 rep'));
      await tester.pump();
      await tester.tap(find.text('−1 rep'));
      await tester.pump();
      expect(ex.sets.single.reps, 0);
    });

    testWidgets('bodyweight work only offers rep buttons', (tester) async {
      await pumpRows(
        tester,
        bench([SessionSet(reps: 10, weight: 0)]),
        weightStep: 0,
      );
      expect(find.textContaining('kg'), findsNothing);
      expect(find.text('+1 rep'), findsOneWidget);
    });

    test('load steps follow the equipment', () {
      expect(ProgressionService.loadIncrementFor('Barra'), 2.5);
      expect(ProgressionService.loadIncrementFor('Mancuernas'), 2);
      expect(ProgressionService.isBodyweight('Peso corporal'), isTrue);
      expect(ProgressionService.isBodyweight(''), isFalse);
    });
  });

  group('keep screen on', () {
    late List<bool> calls;

    setUp(() {
      calls = [];
      SharedPreferences.setMockInitialValues({});
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(
            const MethodChannel('com.liftwave.liftwave/screen'),
            (call) async {
              if (call.method == 'setKeepOn') calls.add(call.arguments as bool);
              return null;
            },
          );
      WorkoutLauncher.instance.sessionActive.value = false;
    });

    tearDown(() {
      ScreenAwakeService.instance.resetForTesting();
      WorkoutLauncher.instance.sessionActive.value = false;
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(
            const MethodChannel('com.liftwave.liftwave/screen'),
            null,
          );
    });

    testWidgets('follows the active workout', (tester) async {
      await ScreenAwakeService.instance.init();
      WorkoutLauncher.instance.sessionActive.value = true;
      await tester.pump();
      WorkoutLauncher.instance.sessionActive.value = false;
      await tester.pump();

      expect(calls, [false, true, false]);
    });

    testWidgets('the Profile switch turns it off mid-workout', (tester) async {
      await ScreenAwakeService.instance.init();
      WorkoutLauncher.instance.sessionActive.value = true;
      await tester.pump();
      await ScreenAwakeService.instance.setEnabled(false);

      expect(calls.last, isFalse);
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getBool('keep_screen_on_during_workout'), isFalse);
    });
  });
}
