import 'package:flutter_test/flutter_test.dart';
import 'package:liftwave/main.dart';

void main() {
  testWidgets('LiftWave app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const LiftWaveApp());
    expect(find.text('LiftWave'), findsWidgets);
  });
}
