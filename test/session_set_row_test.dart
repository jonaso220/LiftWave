import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';
import 'package:liftwave/models/models.dart';
import 'package:liftwave/models/session_models.dart';
import 'package:liftwave/services/progression_service.dart';
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
    await tester.enterText(find.byType(TextField).first, '');
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
    await tester.enterText(find.byType(TextField).at(1), '');
    await tester.tap(find.byType(Checkbox));
    expect(SessionSet.fromJson(set.toJson()).reps, 0);
  });

  testWidgets('decimal comma survives editing and completing a set', (
    tester,
  ) async {
    final set = SessionSet(reps: 10, weight: 20);
    await pumpRow(tester, set);
    await tester.enterText(find.byType(TextField).first, '22,5');
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

  group('editing a set updates the pending sets that followed it', () {
    SessionExercise exercise(List<SessionSet> sets) => SessionExercise(
      id: 'squat',
      name: 'Squat',
      muscleGroup: 'Legs',
      equipment: 'Barbell',
      sets: sets,
    );

    test('carries new weight and reps to later pending sets', () {
      final ex = exercise([
        SessionSet(reps: 10, weight: 60),
        SessionSet(reps: 10, weight: 60),
        SessionSet(reps: 10, weight: 60),
      ]);
      ex.sets[0].weight = 70;
      ex.propagateEdit(0, previousWeight: 60);
      ex.sets[0].reps = 8;
      ex.propagateEdit(0, previousReps: 10);

      expect(ex.sets.map((s) => s.weight), [70, 70, 70]);
      expect(ex.sets.map((s) => s.reps), [8, 8, 8]);
    });

    test('keeps completed, earlier and deliberately different sets', () {
      final ex = exercise([
        SessionSet(reps: 10, weight: 60, completed: true),
        SessionSet(reps: 10, weight: 60),
        SessionSet(reps: 10, weight: 60, completed: true),
        SessionSet(reps: 8, weight: 70),
        SessionSet(reps: 10, weight: 60),
      ]);
      final untouched = ex.sets[3];
      ex.sets[1].weight = 65;
      ex.propagateEdit(1, previousWeight: 60);

      expect(ex.sets.map((s) => s.weight), [60, 65, 60, 70, 65]);
      expect(identical(ex.sets[3], untouched), isTrue);
    });

    test('replaces updated sets so their rows re-read the values', () {
      final ex = exercise([
        SessionSet(reps: 10, weight: 60),
        SessionSet(reps: 10, weight: 60),
      ]);
      final edited = ex.sets[0];
      final follower = ex.sets[1];
      edited.weight = 62.5;
      ex.propagateEdit(0, previousWeight: 60);

      expect(identical(ex.sets[0], edited), isTrue);
      expect(identical(ex.sets[1], follower), isFalse);
      expect(ex.sets[1].weight, 62.5);
    });

    test('filling a set from the previous session carries forward', () {
      final ex = exercise([
        SessionSet(reps: 10, weight: 0),
        SessionSet(reps: 10, weight: 0),
      ]);
      ex.fillSet(0, reps: 8, weight: 80);

      expect(ex.sets.map((s) => s.weight), [80, 80]);
      expect(ex.sets.map((s) => s.reps), [8, 8]);
    });
  });

  test('previous sets come from the latest session with completed work', () {
    Workout session(String id, DateTime date, List<WorkoutSet> sets) => Workout(
      id: id,
      name: id,
      date: date,
      duration: const Duration(minutes: 45),
      totalVolume: 0,
      exercises: [
        WorkoutExercise(
          id: '$id-squat',
          name: 'Squat',
          muscleGroup: 'Legs',
          sets: sets,
        ),
      ],
    );

    final sets = ProgressionService.previousSets(
      exerciseName: ' squat ',
      workouts: [
        session('older', DateTime(2026, 9, 1), const [
          WorkoutSet(setNumber: 1, reps: 10, weight: 50, completed: true),
        ]),
        session('latest', DateTime(2026, 9, 8), const [
          WorkoutSet(setNumber: 1, reps: 8, weight: 60, completed: true),
          WorkoutSet(setNumber: 2, reps: 8, weight: 60, completed: false),
          WorkoutSet(setNumber: 3, reps: 6, weight: 65, completed: true),
        ]),
        session('skipped', DateTime(2026, 9, 10), const [
          WorkoutSet(setNumber: 1, reps: 8, weight: 70, completed: false),
        ]),
      ],
    );

    expect(sets.map((s) => '${s.weight}x${s.reps}'), ['60.0x8', '65.0x6']);
    expect(
      ProgressionService.previousSets(exerciseName: 'Deadlift', workouts: []),
      isEmpty,
    );
  });

  group('set row layout', () {
    Future<void> pumpRows(
      WidgetTester tester,
      SessionExercise exercise, {
      WorkoutSet? previous,
      List<int>? removed,
    }) async {
      await tester.pumpWidget(
        MaterialApp(
          locale: const Locale('es'),
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
                      previous: i == 0 ? previous : null,
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
                      onUsePrevious: previous == null
                          ? null
                          : () => update(
                              () => exercise.fillSet(
                                i,
                                reps: previous.reps,
                                weight: previous.weight,
                              ),
                            ),
                      onRemove: removed == null
                          ? null
                          : () async => update(() {
                              removed.add(i);
                              exercise.sets.removeAt(i);
                            }),
                    ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    SessionExercise bench(List<SessionSet> sets) => SessionExercise(
      id: 'bench',
      name: 'Bench',
      muscleGroup: 'Chest',
      equipment: 'Barbell',
      sets: sets,
    );

    testWidgets('typing a new load updates the pending rows below', (
      tester,
    ) async {
      final ex = bench([
        SessionSet(reps: 10, weight: 60),
        SessionSet(reps: 10, weight: 60),
      ]);
      await pumpRows(tester, ex);
      await tester.enterText(find.byType(TextField).first, '70');
      await tester.pump();

      expect(ex.sets.map((s) => s.weight), [70, 70]);
      // Second row: [KG, REPS] → its weight field is the third TextField.
      expect(
        tester.widget<TextField>(find.byType(TextField).at(2)).controller!.text,
        '70',
      );
    });

    testWidgets('the previous column shows and copies the last session', (
      tester,
    ) async {
      final ex = bench([SessionSet(reps: 10, weight: 0)]);
      await pumpRows(
        tester,
        ex,
        previous: const WorkoutSet(
          setNumber: 1,
          reps: 8,
          weight: 62.5,
          completed: true,
        ),
      );

      expect(find.text('62,5 × 8'), findsOneWidget);
      await tester.tap(find.text('62,5 × 8'));
      await tester.pump();

      expect(ex.sets.single.weight, 62.5);
      expect(ex.sets.single.reps, 8);
      expect(
        tester.widget<TextField>(find.byType(TextField).first).controller!.text,
        '62.5',
      );
    });

    testWidgets('rows without history show a dash', (tester) async {
      await pumpRows(tester, bench([SessionSet(reps: 10, weight: 20)]));
      expect(find.text('—'), findsOneWidget);
    });

    testWidgets('the whole done cell toggles the set', (tester) async {
      final ex = bench([SessionSet(reps: 10, weight: 20)]);
      await pumpRows(tester, ex);
      final box = tester.getRect(find.byType(Checkbox));
      // Tap inside the done column but outside the checkbox itself.
      await tester.tapAt(Offset(box.right + 6, box.center.dy));
      await tester.pump();
      expect(ex.sets.single.completed, isTrue);
      expect(tester.getSize(find.byType(Checkbox)).height, greaterThan(40));
    });

    testWidgets('swiping left removes the set', (tester) async {
      final removed = <int>[];
      final ex = bench([
        SessionSet(reps: 10, weight: 20),
        SessionSet(reps: 8, weight: 25),
      ]);
      await pumpRows(tester, ex, removed: removed);
      await tester.drag(find.text('1'), const Offset(-600, 0));
      await tester.pumpAndSettle();

      expect(removed, [0]);
      expect(ex.sets.single.weight, 25);
      expect(find.byType(SessionSetRow), findsOneWidget);
    });
  });
}
