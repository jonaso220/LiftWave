import 'package:liftwave/l10n/generated/app_localizations.dart';

/// Keeps the exercise's Spanish canonical name stable for history/sync while
/// returning localized display content for the current UI locale.
class ExerciseLocalization {
  ExerciseLocalization._();

  static String name(S l10n, String canonicalName, {String? id}) {
    final exerciseId = id ?? _canonicalIds[canonicalName];
    final translated = _coreNames(l10n)[exerciseId];
    if (translated != null) return translated;
    if (l10n.localeName.startsWith('es')) return canonicalName;
    return _englishFallbackNames[canonicalName] ?? canonicalName;
  }

  static String description(
    S l10n,
    String canonicalDescription, {
    required String id,
  }) {
    final translated = _coreDescriptions(l10n)[id];
    if (translated != null) return translated;
    // Custom exercises are user-authored content, so their description must
    // remain intact regardless of the app locale.
    if (!id.startsWith('e_')) return canonicalDescription;
    return l10n.localeName.startsWith('es')
        ? canonicalDescription
        : l10n.exercises_descriptionUnavailable;
  }

  static List<String> benefits(
    S l10n,
    List<String> canonicalBenefits, {
    required String id,
  }) {
    final translated = _coreBenefits(l10n)[id];
    if (translated != null) return translated;
    if (!id.startsWith('e_')) return canonicalBenefits;
    return l10n.localeName.startsWith('es') ? canonicalBenefits : const [];
  }

  static String muscle(S l10n, String canonical) => switch (canonical) {
    'Pecho' => l10n.muscle_chest,
    'Espalda' => l10n.muscle_back,
    'Piernas' => l10n.muscle_legs,
    'Hombros' => l10n.muscle_shoulders,
    'Brazos' => l10n.muscle_arms,
    'Core' => l10n.muscle_core,
    'CrossFit' => l10n.muscle_crossfit,
    'Todos' => l10n.muscle_all,
    _ => canonical,
  };

  static String equipment(S l10n, String canonical) => switch (canonical) {
    'Barra' => l10n.equipment_barbell,
    'Mancuernas' => l10n.equipment_dumbbells,
    'Máquina' => l10n.equipment_machine,
    'Polea' => l10n.equipment_cable,
    'Peso corporal' => l10n.equipment_bodyweight,
    'Barra fija' => l10n.equipment_pullupBar,
    'Sin material' => l10n.equipment_noEquipment,
    'Paralelas' => l10n.equipment_parallelBars,
    'Anillas' => l10n.equipment_rings,
    'Cajón' => l10n.equipment_box,
    'Cuerda' => l10n.equipment_rope,
    'Pelota' => l10n.equipment_ball,
    'Kettlebell' => l10n.equipment_kettlebell,
    'Todos' => l10n.equipment_all,
    _ => canonical,
  };

  static String difficulty(S l10n, String canonical) => switch (canonical) {
    'Principiante' => l10n.difficulty_beginner,
    'Intermedio' => l10n.difficulty_intermediate,
    'Avanzado' => l10n.difficulty_advanced,
    _ => canonical,
  };

  static String secondaryMuscle(S l10n, String canonical) =>
      switch (canonical) {
        'Tríceps' => l10n.secondary_triceps,
        'Deltoides anterior' => l10n.secondary_anteriorDeltoid,
        'Bíceps' => l10n.secondary_biceps,
        'Glúteos' => l10n.secondary_glutes,
        'Isquiotibiales' => l10n.secondary_hamstrings,
        'Trapecio' => l10n.secondary_trapezius,
        'Trapecios' => l10n.secondary_trapezius,
        'Romboides' => l10n.secondary_rhomboids,
        'Lumbar' => l10n.secondary_lowerBack,
        'Cuádriceps' => l10n.secondary_quads,
        'Gemelos' => l10n.secondary_calves,
        'Manguito rotador' => l10n.secondary_rotatorCuff,
        'Braquial' => l10n.secondary_brachialis,
        'Braquiorradial' => l10n.secondary_brachioradialis,
        'Ancóneo' => l10n.secondary_anconeus,
        'Anconeo' => l10n.secondary_anconeus,
        'Antebrazos' => l10n.secondary_brachioradialis,
        'Oblicuos' => l10n.secondary_obliques,
        'Flexores de cadera' => l10n.secondary_hipFlexors,
        'Deltoides' => l10n.secondary_deltoids,
        'Dorsales' => l10n.secondary_lats,
        'Dorsal' => l10n.secondary_lats,
        'Hip flexors' => l10n.secondary_hipFlexors,
        'Core' => l10n.muscle_core,
        'Espalda' => l10n.muscle_back,
        'Espalda alta' => l10n.muscle_back,
        'Espalda baja' => l10n.secondary_lowerBack,
        'Hombros' => l10n.muscle_shoulders,
        'Pecho' => l10n.muscle_chest,
        'Piernas' => l10n.muscle_legs,
        _ => canonical,
      };

  static String templateName(S l10n, String id, String fallback) =>
      switch (id) {
        'tpl_fullbody' => l10n.template_fullBody_name,
        'tpl_push' => l10n.template_push_name,
        'tpl_pull' => l10n.template_pull_name,
        'tpl_torso' => l10n.template_torso_name,
        'tpl_legs' => l10n.template_legs_name,
        _ => fallback,
      };

  static String workoutName(S l10n, String canonical) => switch (canonical) {
    'Full Body' => l10n.template_fullBody_name,
    'Empuje' => l10n.template_push_name,
    'Tracción' => l10n.template_pull_name,
    'Torso' => l10n.template_torso_name,
    'Piernas' => l10n.template_legs_name,
    _ => canonical,
  };

  static String templateSubtitle(S l10n, String id, String fallback) =>
      switch (id) {
        'tpl_fullbody' => l10n.template_fullBody_subtitle,
        'tpl_push' => l10n.template_push_subtitle,
        'tpl_pull' => l10n.template_pull_subtitle,
        'tpl_torso' => l10n.template_torso_subtitle,
        'tpl_legs' => l10n.template_legs_subtitle,
        _ => fallback,
      };

  static Map<String, String> _coreNames(S l) => {
    'e_pecho_1': l.ex_pecho_1_name,
    'e_pecho_2': l.ex_pecho_2_name,
    'e_pecho_3': l.ex_pecho_3_name,
    'e_pecho_4': l.ex_pecho_4_name,
    'e_pecho_5': l.ex_pecho_5_name,
    'e_esp_1': l.ex_esp_1_name,
    'e_esp_2': l.ex_esp_2_name,
    'e_esp_3': l.ex_esp_3_name,
    'e_esp_4': l.ex_esp_4_name,
    'e_esp_5': l.ex_esp_5_name,
    'e_pier_1': l.ex_pier_1_name,
    'e_pier_2': l.ex_pier_2_name,
    'e_pier_3': l.ex_pier_3_name,
    'e_pier_4': l.ex_pier_4_name,
    'e_pier_5': l.ex_pier_5_name,
    'e_hom_1': l.ex_hom_1_name,
    'e_hom_2': l.ex_hom_2_name,
    'e_hom_3': l.ex_hom_3_name,
    'e_hom_4': l.ex_hom_4_name,
    'e_bra_1': l.ex_bra_1_name,
    'e_bra_2': l.ex_bra_2_name,
    'e_bra_3': l.ex_bra_3_name,
    'e_bra_4': l.ex_bra_4_name,
    'e_bra_5': l.ex_bra_5_name,
    'e_core_1': l.ex_core_1_name,
    'e_core_2': l.ex_core_2_name,
    'e_core_3': l.ex_core_3_name,
    'e_core_4': l.ex_core_4_name,
  };

  static Map<String, String> _coreDescriptions(S l) => {
    'e_pecho_1': l.ex_pecho_1_desc,
    'e_pecho_2': l.ex_pecho_2_desc,
    'e_pecho_3': l.ex_pecho_3_desc,
    'e_pecho_4': l.ex_pecho_4_desc,
    'e_pecho_5': l.ex_pecho_5_desc,
    'e_esp_1': l.ex_esp_1_desc,
    'e_esp_2': l.ex_esp_2_desc,
    'e_esp_3': l.ex_esp_3_desc,
    'e_esp_4': l.ex_esp_4_desc,
    'e_esp_5': l.ex_esp_5_desc,
    'e_pier_1': l.ex_pier_1_desc,
    'e_pier_2': l.ex_pier_2_desc,
    'e_pier_3': l.ex_pier_3_desc,
    'e_pier_4': l.ex_pier_4_desc,
    'e_pier_5': l.ex_pier_5_desc,
    'e_hom_1': l.ex_hom_1_desc,
    'e_hom_2': l.ex_hom_2_desc,
    'e_hom_3': l.ex_hom_3_desc,
    'e_hom_4': l.ex_hom_4_desc,
    'e_bra_1': l.ex_bra_1_desc,
    'e_bra_2': l.ex_bra_2_desc,
    'e_bra_3': l.ex_bra_3_desc,
    'e_bra_4': l.ex_bra_4_desc,
    'e_bra_5': l.ex_bra_5_desc,
    'e_core_1': l.ex_core_1_desc,
    'e_core_2': l.ex_core_2_desc,
    'e_core_3': l.ex_core_3_desc,
    'e_core_4': l.ex_core_4_desc,
  };

  static Map<String, List<String>> _coreBenefits(S l) => {
    'e_pecho_1': [l.ex_pecho_1_b1, l.ex_pecho_1_b2, l.ex_pecho_1_b3],
    'e_pecho_2': [l.ex_pecho_2_b1, l.ex_pecho_2_b2, l.ex_pecho_2_b3],
    'e_pecho_3': [l.ex_pecho_3_b1, l.ex_pecho_3_b2, l.ex_pecho_3_b3],
    'e_pecho_4': [l.ex_pecho_4_b1, l.ex_pecho_4_b2, l.ex_pecho_4_b3],
    'e_pecho_5': [l.ex_pecho_5_b1, l.ex_pecho_5_b2, l.ex_pecho_5_b3],
    'e_esp_1': [l.ex_esp_1_b1, l.ex_esp_1_b2, l.ex_esp_1_b3],
    'e_esp_2': [l.ex_esp_2_b1, l.ex_esp_2_b2, l.ex_esp_2_b3],
    'e_esp_3': [l.ex_esp_3_b1, l.ex_esp_3_b2, l.ex_esp_3_b3],
    'e_esp_4': [l.ex_esp_4_b1, l.ex_esp_4_b2, l.ex_esp_4_b3],
    'e_esp_5': [l.ex_esp_5_b1, l.ex_esp_5_b2, l.ex_esp_5_b3],
    'e_pier_1': [l.ex_pier_1_b1, l.ex_pier_1_b2, l.ex_pier_1_b3],
    'e_pier_2': [l.ex_pier_2_b1, l.ex_pier_2_b2, l.ex_pier_2_b3],
    'e_pier_3': [l.ex_pier_3_b1, l.ex_pier_3_b2, l.ex_pier_3_b3],
    'e_pier_4': [l.ex_pier_4_b1, l.ex_pier_4_b2, l.ex_pier_4_b3],
    'e_pier_5': [l.ex_pier_5_b1, l.ex_pier_5_b2, l.ex_pier_5_b3],
    'e_hom_1': [l.ex_hom_1_b1, l.ex_hom_1_b2, l.ex_hom_1_b3],
    'e_hom_2': [l.ex_hom_2_b1, l.ex_hom_2_b2, l.ex_hom_2_b3],
    'e_hom_3': [l.ex_hom_3_b1, l.ex_hom_3_b2, l.ex_hom_3_b3],
    'e_hom_4': [l.ex_hom_4_b1, l.ex_hom_4_b2, l.ex_hom_4_b3],
    'e_bra_1': [l.ex_bra_1_b1, l.ex_bra_1_b2, l.ex_bra_1_b3],
    'e_bra_2': [l.ex_bra_2_b1, l.ex_bra_2_b2, l.ex_bra_2_b3],
    'e_bra_3': [l.ex_bra_3_b1, l.ex_bra_3_b2, l.ex_bra_3_b3],
    'e_bra_4': [l.ex_bra_4_b1, l.ex_bra_4_b2, l.ex_bra_4_b3],
    'e_bra_5': [l.ex_bra_5_b1, l.ex_bra_5_b2, l.ex_bra_5_b3],
    'e_core_1': [l.ex_core_1_b1, l.ex_core_1_b2, l.ex_core_1_b3],
    'e_core_2': [l.ex_core_2_b1, l.ex_core_2_b2, l.ex_core_2_b3],
    'e_core_3': [l.ex_core_3_b1, l.ex_core_3_b2, l.ex_core_3_b3],
    'e_core_4': [l.ex_core_4_b1, l.ex_core_4_b2, l.ex_core_4_b3],
  };

  static const _canonicalIds = <String, String>{
    'Press de banca': 'e_pecho_1',
    'Press inclinado con mancuernas': 'e_pecho_2',
    'Aperturas con mancuernas': 'e_pecho_3',
    'Fondos en paralelas': 'e_pecho_4',
    'Cruce de poleas': 'e_pecho_5',
    'Peso muerto': 'e_esp_1',
    'Dominadas': 'e_esp_2',
    'Remo con barra': 'e_esp_3',
    'Remo con mancuerna': 'e_esp_4',
    'Jalón al pecho': 'e_esp_5',
    'Sentadilla con barra': 'e_pier_1',
    'Prensa de piernas': 'e_pier_2',
    'Hip thrust': 'e_pier_3',
    'Zancadas': 'e_pier_4',
    'Curl de isquiotibiales': 'e_pier_5',
    'Press militar': 'e_hom_1',
    'Elevaciones laterales': 'e_hom_2',
    'Face pull': 'e_hom_3',
    'Press Arnold': 'e_hom_4',
    'Curl de bíceps con mancuernas': 'e_bra_1',
    'Curl en barra Z': 'e_bra_2',
    'Curl martillo': 'e_bra_3',
    'Extensión de tríceps en polea': 'e_bra_4',
    'Press francés': 'e_bra_5',
    'Plancha': 'e_core_1',
    'Crunch abdominal': 'e_core_2',
    'Elevación de piernas colgado': 'e_core_3',
    'Rueda abdominal': 'e_core_4',
  };

  static const _englishFallbackNames = <String, String>{
    'Press inclinado con barra': 'Incline Barbell Press',
    'Press declinado con mancuernas': 'Decline Dumbbell Press',
    'Flexiones': 'Push-ups',
    'Pullover con mancuerna': 'Dumbbell Pullover',
    'Remo en T': 'T-Bar Row',
    'Remo bajo en polea': 'Seated Cable Row',
    'Encogimientos con mancuernas': 'Dumbbell Shrugs',
    'Sentadilla frontal': 'Front Squat',
    'Sentadilla búlgara': 'Bulgarian Split Squat',
    'Peso muerto rumano': 'Romanian Deadlift',
    'Extensión de cuádriceps': 'Leg Extension',
    'Elevación de talones': 'Calf Raise',
    'Press de hombros con mancuernas': 'Dumbbell Shoulder Press',
    'Elevaciones frontales': 'Front Raises',
    'Pájaros con mancuernas': 'Dumbbell Reverse Fly',
    'Curl predicador': 'Preacher Curl',
    'Curl concentrado': 'Concentration Curl',
    'Press cerrado de banca': 'Close-Grip Bench Press',
    'Fondos en banco': 'Bench Dips',
    'Plancha lateral': 'Side Plank',
    'Cargada (Clean)': 'Clean',
    'Arrancada (Snatch)': 'Snatch',
    'Kettlebell Swing americano': 'American Kettlebell Swing',
    'Kettlebell Swing ruso': 'Russian Kettlebell Swing',
  };
}
