import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:liftwave/l10n/generated/app_localizations.dart';
import 'package:liftwave/screens/train/plate_calculator_sheet.dart';
import 'package:liftwave/services/plate_calculator.dart';
import 'package:liftwave/utils/weight_units.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  PlateLoad kg(double total, {double bar = 20}) => PlateCalculator.load(
    total: total,
    bar: bar,
    plates: PlateCalculator.kgPlates,
  );
  PlateLoad lb(double total, {double bar = 45}) => PlateCalculator.load(
    total: total,
    bar: bar,
    plates: PlateCalculator.lbPlates,
  );

  group('kilograms', () {
    test('loads the heaviest plates first', () {
      expect(kg(100).perSide, [25, 15]);
      expect(kg(100).isExact, isTrue);
      expect(kg(60).perSide, [20]);
      expect(kg(140).perSide, [25, 25, 10]);
    });

    test('uses the change plates for odd weights', () {
      expect(kg(62.5).perSide, [20, 1.25]);
      expect(kg(47.5).perSide, [10, 2.5, 1.25]);
      expect(kg(62.5).isExact, isTrue);
    });

    test('a lighter bar takes more plates for the same total', () {
      expect(kg(60, bar: 15).perSide, [20, 2.5]);
      expect(kg(60, bar: 10).perSide, [25]);
    });

    test('reports what cannot be loaded and the weight that is', () {
      final load = kg(61);
      expect(load.perSide, [20]);
      expect(load.isExact, isFalse);
      expect(load.missing, 1);
      expect(load.loaded, 60);
    });

    test('the empty bar and anything below it', () {
      expect(kg(20).perSide, isEmpty);
      expect(kg(20).isExact, isTrue);
      expect(kg(15).belowBar, isTrue);
      expect(kg(15).perSide, isEmpty);
    });
  });

  group('pounds', () {
    test('standard barbell loads', () {
      expect(lb(135).perSide, [45]);
      expect(lb(225).perSide, [45, 45]);
      expect(lb(315).perSide, [45, 45, 45]);
      expect(lb(185).perSide, [45, 25]);
      expect(lb(140).perSide, [45, 2.5]);
      expect(lb(50).perSide, [2.5]);
    });

    test('identical plates are grouped for display', () {
      expect(lb(315).grouped, [(45.0, 3)]);
      expect(lb(275).grouped, [(45.0, 2), (25.0, 1)]);
    });
  });

  test('only barbell work is loaded with plates', () {
    expect(PlateCalculator.appliesTo('Barra'), isTrue);
    expect(PlateCalculator.appliesTo('Barbell'), isTrue);
    expect(PlateCalculator.appliesTo('Barra fija'), isFalse);
    expect(PlateCalculator.appliesTo('Mancuernas'), isFalse);
    expect(PlateCalculator.appliesTo('Peso corporal'), isFalse);
    expect(PlateCalculator.appliesTo(''), isFalse);
  });

  group('sheet', () {
    tearDown(() => WeightUnits.instance.setForTesting(WeightUnit.kg));

    Future<void> pump(WidgetTester tester, {double? initialKg}) async {
      SharedPreferences.setMockInitialValues({});
      await tester.pumpWidget(
        MaterialApp(
          locale: const Locale('es'),
          localizationsDelegates: S.localizationsDelegates,
          supportedLocales: S.supportedLocales,
          home: Scaffold(body: PlateCalculatorSheet(initialKg: initialKg)),
        ),
      );
      await tester.pumpAndSettle();
    }

    testWidgets('starts from the set being done and lists each side', (
      tester,
    ) async {
      await pump(tester, initialKg: 100);
      expect(find.text('Calculadora de discos'), findsOneWidget);
      expect(find.text('Por lado'), findsOneWidget);
      expect(find.text('25 kg'), findsOneWidget);
      // "15 kg" is also one of the bar choices.
      expect(find.text('15 kg'), findsNWidgets(2));
    });

    testWidgets('changing the bar and the weight recalculates', (tester) async {
      await pump(tester, initialKg: 60);
      // "20 kg" is the bar chip and the single plate per side.
      expect(find.text('20 kg'), findsNWidgets(2));

      await tester.tap(find.text('10 kg'));
      await tester.pumpAndSettle();
      expect(find.text('25 kg'), findsOneWidget);

      await tester.enterText(find.byType(TextField), '5');
      await tester.pumpAndSettle();
      expect(find.text('El peso es menor que la barra'), findsOneWidget);

      await tester.enterText(find.byType(TextField), '61');
      await tester.pumpAndSettle();
      expect(
        find.text('Faltan 1 kg que no se pueden cargar con estos discos'),
        findsOneWidget,
      );
    });

    testWidgets('the starting load is written with the locale decimal mark', (
      tester,
    ) async {
      await pump(tester, initialKg: 62.5);
      expect(
        tester.widget<TextField>(find.byType(TextField)).controller!.text,
        '62,5',
      );
      expect(find.text('1,25 kg'), findsOneWidget);
    });

    testWidgets('works in pounds when that is the unit', (tester) async {
      WeightUnits.instance.setForTesting(WeightUnit.lb);
      // 102.058 kg is 225 lb.
      await pump(tester, initialKg: displayToKg(225));
      expect(find.text('2 × 45 lb'), findsOneWidget);
    });
  });
}
