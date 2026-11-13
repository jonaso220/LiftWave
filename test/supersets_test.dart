import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:liftwave/data/custom_template_store.dart';
import 'package:liftwave/data/workout_templates.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';
import 'package:liftwave/l10n/generated/app_localizations_es.dart';
import 'package:liftwave/models/models.dart';
import 'package:liftwave/models/session_models.dart';
import 'package:liftwave/screens/train/routine_builder_screen.dart';
import 'package:liftwave/widgets/set_type_badge.dart';

TemplateExercise _planned(String name, {String? supersetId}) =>
    TemplateExercise(
      name: name,
      muscleGroup: 'Pecho',
      equipment: 'Mancuernas',
      sets: 3,
      reps: 10,
      weight: 0,
      supersetId: supersetId,
    );

/// Opens the routine builder on [template] and returns what it saves.
Future<CustomTemplate? Function()> _openBuilder(
  WidgetTester tester,
  CustomTemplate template,
) async {
  // Tall enough to lay out every exercise card.
  tester.view.physicalSize = const Size(800, 2600);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);

  CustomTemplate? result;
  await tester.pumpWidget(
    MaterialApp(
      locale: const Locale('es'),
      localizationsDelegates: S.localizationsDelegates,
      supportedLocales: S.supportedLocales,
      home: Builder(
        builder: (context) => ElevatedButton(
          onPressed: () async {
            result = await Navigator.push<CustomTemplate>(
              context,
              MaterialPageRoute(
                builder: (_) => RoutineBuilderScreen(
                  initialName: template.name,
                  initialTemplate: template,
                ),
              ),
            );
          },
          child: const Text('Abrir'),
        ),
      ),
    ),
  );
  await tester.tap(find.text('Abrir'));
  await tester.pumpAndSettle();
  return () => result;
}

SessionExercise _exercise(String name, {int sets = 3, String? supersetId}) =>
    SessionExercise(
      id: name,
      name: name,
      muscleGroup: 'Pecho',
      equipment: 'Mancuernas',
      sets: List.generate(sets, (_) => SessionSet(reps: 10, weight: 20)),
      supersetId: supersetId,
    );

List<String?> _ids(List<SessionExercise> exercises) =>
    exercises.map((e) => e.supersetId).toList();

void main() {
  group('grouping exercises into supersets', () {
    test('linking two exercises makes them one superset', () {
      final list = [_exercise('A'), _exercise('B'), _exercise('C')];
      linkWithNext(list, 0, 'ss1');

      expect(_ids(list), ['ss1', 'ss1', null]);
      expect(supersetMembers(list, 0), [0, 1]);
      expect(supersetMembers(list, 1), [0, 1]);
      expect(supersetMembers(list, 2), [2]);
      expect(isInSuperset(list, 0), isTrue);
      expect(isInSuperset(list, 2), isFalse);
      expect(isLinkedWithNext(list, 0), isTrue);
      expect(isLinkedWithNext(list, 1), isFalse);
    });

    test('linking onto an existing superset extends it', () {
      final list = [_exercise('A'), _exercise('B'), _exercise('C')];
      linkWithNext(list, 0, 'ss1');
      linkWithNext(list, 1, 'ss2');

      expect(_ids(list), ['ss1', 'ss1', 'ss1']);
      expect(supersetMembers(list, 2), [0, 1, 2]);
    });

    test('linking two supersets merges them', () {
      final list = [
        _exercise('A', supersetId: 'x'),
        _exercise('B', supersetId: 'x'),
        _exercise('C', supersetId: 'y'),
        _exercise('D', supersetId: 'y'),
      ];
      linkWithNext(list, 1, 'unused');

      expect(_ids(list), ['x', 'x', 'x', 'x']);
    });

    test('the last exercise has nothing to link with', () {
      final list = [_exercise('A'), _exercise('B')];
      linkWithNext(list, 1, 'ss1');

      expect(_ids(list), [null, null]);
    });

    test('two groups with the same id that are not neighbours stay apart', () {
      final list = [
        _exercise('A', supersetId: 'x'),
        _exercise('B', supersetId: 'x'),
        _exercise('C'),
        _exercise('D', supersetId: 'x'),
        _exercise('E', supersetId: 'x'),
      ];

      expect(supersetMembers(list, 0), [0, 1]);
      expect(supersetMembers(list, 4), [3, 4]);
    });
  });

  group('taking an exercise out of a superset', () {
    test('a pair stops being a superset', () {
      final list = [_exercise('A'), _exercise('B')];
      linkWithNext(list, 0, 'ss1');
      unlinkFromSuperset(list, 0);

      expect(_ids(list), [null, null]);
    });

    test('an end of a trio leaves the other two together', () {
      final list = [_exercise('A'), _exercise('B'), _exercise('C')];
      linkWithNext(list, 0, 'ss1');
      linkWithNext(list, 1, 'ss1');
      unlinkFromSuperset(list, 2);

      expect(supersetMembers(list, 0), [0, 1]);
      expect(list[2].supersetId, isNull);
    });

    test('the middle of four splits it; the middle of three ends it', () {
      final four = [
        _exercise('A'),
        _exercise('B'),
        _exercise('C'),
        _exercise('D'),
        _exercise('E'),
      ];
      for (var i = 0; i < 4; i++) {
        linkWithNext(four, i, 'ss1');
      }
      unlinkFromSuperset(four, 2);

      expect(supersetMembers(four, 0), [0, 1]);
      expect(supersetMembers(four, 2), [2]);
      expect(supersetMembers(four, 3), [3, 4]);
      expect(four[0].supersetId, isNot(four[3].supersetId));

      final three = [_exercise('A'), _exercise('B'), _exercise('C')];
      linkWithNext(three, 0, 'ss1');
      linkWithNext(three, 1, 'ss1');
      unlinkFromSuperset(three, 1);

      expect(_ids(three), [null, null, null]);
    });

    test('reordering or removing leaves no exercise grouped alone', () {
      final list = [_exercise('A'), _exercise('B'), _exercise('C')];
      linkWithNext(list, 0, 'ss1');

      // B is dragged below C.
      final moved = list.removeAt(1);
      list.insert(2, moved);
      normalizeSupersets(list);
      expect(_ids(list), [null, null, null]);

      linkWithNext(list, 1, 'ss2');
      list.removeAt(2);
      normalizeSupersets(list);
      expect(_ids(list), [null, null]);
    });
  });

  group('rest after a superset round', () {
    test('an exercise on its own rests after every set', () {
      final list = [_exercise('A'), _exercise('B')];
      list[0].sets[0].completed = true;

      expect(supersetRoundComplete(list, 0), isTrue);
    });

    test('a superset rests once every member has done the set', () {
      final list = [_exercise('A'), _exercise('B'), _exercise('C')];
      linkWithNext(list, 0, 'ss1');

      list[0].sets[0].completed = true;
      expect(supersetRoundComplete(list, 0), isFalse);

      list[1].sets[0].completed = true;
      expect(supersetRoundComplete(list, 1), isTrue);

      // Second round, started from the other exercise.
      list[1].sets[1].completed = true;
      expect(supersetRoundComplete(list, 1), isFalse);
      list[0].sets[1].completed = true;
      expect(supersetRoundComplete(list, 0), isTrue);
    });

    test('a member with fewer sets does not hold the round back', () {
      final list = [_exercise('A', sets: 3), _exercise('B', sets: 1)];
      linkWithNext(list, 0, 'ss1');
      list[0].sets[0].completed = true;
      list[1].sets[0].completed = true;

      list[0].sets[1].completed = true;
      expect(supersetRoundComplete(list, 0), isTrue);
    });

    test('a member without sets does not hold the round back', () {
      final list = [_exercise('A'), _exercise('B', sets: 0)];
      linkWithNext(list, 0, 'ss1');
      list[0].sets[0].completed = true;

      expect(supersetRoundComplete(list, 0), isTrue);
    });
  });

  group('storage', () {
    test('a session in progress keeps its supersets', () {
      final exercise = _exercise('A', supersetId: 'ss1');
      final restored = SessionExercise.fromJson(exercise.toJson());

      expect(restored.supersetId, 'ss1');
      expect(
        SessionExercise.fromJson(_exercise('B').toJson()).supersetId,
        isNull,
      );
    });

    test('a saved workout stores the superset only when there is one', () {
      const sets = [
        WorkoutSet(setNumber: 1, reps: 10, weight: 20, completed: true),
      ];
      const grouped = WorkoutExercise(
        id: 'a',
        name: 'Press de banca',
        muscleGroup: 'Pecho',
        sets: sets,
        supersetId: 'ss1',
      );
      const alone = WorkoutExercise(
        id: 'b',
        name: 'Remo con barra',
        muscleGroup: 'Espalda',
        sets: sets,
      );

      expect(grouped.toJson()['supersetId'], 'ss1');
      expect(alone.toJson().containsKey('supersetId'), isFalse);
      expect(WorkoutExercise.fromJson(grouped.toJson()).supersetId, 'ss1');
      // Workouts saved before supersets existed.
      expect(WorkoutExercise.fromJson(alone.toJson()).supersetId, isNull);
    });
  });

  group('supersets in a routine', () {
    test('a routine stores the superset only when there is one', () {
      final grouped = _planned('A', supersetId: 'ss1');
      final alone = _planned('B');

      expect(grouped.toJson()['supersetId'], 'ss1');
      expect(alone.toJson().containsKey('supersetId'), isFalse);
      expect(TemplateExercise.fromJson(grouped.toJson()).supersetId, 'ss1');
      // Routines saved before supersets existed.
      expect(TemplateExercise.fromJson(alone.toJson()).supersetId, isNull);
    });

    test('a saved routine keeps its supersets', () {
      final routine = CustomTemplate(
        id: 'r1',
        name: 'Torso',
        exercises: [
          _planned('A', supersetId: 'ss1'),
          _planned('B', supersetId: 'ss1'),
          _planned('C'),
        ],
      );
      final restored = CustomTemplate.fromJson(routine.toJson());

      expect(isInSuperset(restored.exercises, 0), isTrue);
      expect(isInSuperset(restored.exercises, 1), isTrue);
      expect(isInSuperset(restored.exercises, 2), isFalse);
    });

    testWidgets('the builder groups two exercises and saves them so', (
      tester,
    ) async {
      final result = await _openBuilder(
        tester,
        CustomTemplate(
          id: 'r1',
          name: 'Torso',
          exercises: [_planned('A'), _planned('B'), _planned('C')],
        ),
      );
      final l10n = SEs();
      expect(find.byType(SupersetStrip), findsNothing);
      // Every exercise but the last can be grouped with the next one.
      expect(find.text(l10n.superset_linkNext), findsNWidgets(2));
      expect(find.text(l10n.superset_unlink), findsNothing);

      await tester.tap(find.text(l10n.superset_linkNext).first);
      await tester.pumpAndSettle();

      expect(find.byType(SupersetStrip), findsNWidgets(2));
      // A is already grouped with B; B can still take C in.
      expect(find.text(l10n.superset_linkNext), findsOneWidget);
      expect(find.text(l10n.superset_unlink), findsNWidgets(2));

      await tester.tap(find.widgetWithText(ElevatedButton, l10n.common_save));
      await tester.pumpAndSettle();

      final saved = result()!;
      expect(saved.exercises[0].supersetId, isNotNull);
      expect(saved.exercises[1].supersetId, saved.exercises[0].supersetId);
      expect(saved.exercises[2].supersetId, isNull);
    });

    testWidgets('the builder shows a saved superset and can undo it', (
      tester,
    ) async {
      final result = await _openBuilder(
        tester,
        CustomTemplate(
          id: 'r1',
          name: 'Torso',
          exercises: [
            _planned('A', supersetId: 'ss1'),
            _planned('B', supersetId: 'ss1'),
            _planned('C'),
          ],
        ),
      );
      final l10n = SEs();
      expect(find.byType(SupersetStrip), findsNWidgets(2));

      await tester.tap(find.text(l10n.superset_unlink).first);
      await tester.pumpAndSettle();
      expect(find.byType(SupersetStrip), findsNothing);

      await tester.tap(find.widgetWithText(ElevatedButton, l10n.common_save));
      await tester.pumpAndSettle();
      expect(
        result()!.exercises.map((e) => e.supersetId),
        everyElement(isNull),
      );
    });

    testWidgets('removing an exercise leaves no one grouped alone', (
      tester,
    ) async {
      await _openBuilder(
        tester,
        CustomTemplate(
          id: 'r1',
          name: 'Torso',
          exercises: [
            _planned('A', supersetId: 'ss1'),
            _planned('B', supersetId: 'ss1'),
          ],
        ),
      );
      expect(find.byType(SupersetStrip), findsNWidgets(2));

      await tester.tap(find.byTooltip(SEs().train_deleteExercise).first);
      await tester.pumpAndSettle();

      expect(find.byType(SupersetStrip), findsNothing);
      expect(find.text(SEs().superset_unlink), findsNothing);
    });
  });

  testWidgets('the superset band is labelled in the app language', (
    tester,
  ) async {
    Future<void> pump(Locale locale) => tester.pumpWidget(
      MaterialApp(
        locale: locale,
        localizationsDelegates: S.localizationsDelegates,
        supportedLocales: S.supportedLocales,
        home: const Scaffold(body: SupersetStrip()),
      ),
    );

    await pump(const Locale('es'));
    await tester.pumpAndSettle();
    expect(find.text('SUPERSERIE'), findsOneWidget);

    await pump(const Locale('en'));
    await tester.pumpAndSettle();
    expect(find.text('SUPERSET'), findsOneWidget);
  });
}
