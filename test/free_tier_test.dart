import 'package:flutter_test/flutter_test.dart';
import 'package:liftwave/data/workout_templates.dart';

void main() {
  test('free tier includes a full-body and a push/pull program', () {
    final free = workoutTemplates.where((t) => t.isFree).map((t) => t.id);
    expect(free, unorderedEquals(['tpl_fullbody', 'tpl_push', 'tpl_pull']));
  });

  test('every free template id exists and some templates stay PRO', () {
    final ids = workoutTemplates.map((t) => t.id).toSet();
    expect(ids.containsAll(freeTemplateIds), isTrue);
    expect(workoutTemplates.where((t) => !t.isFree), isNotEmpty);
  });
}
