enum TrainingGoal { muscleGain, strength, fatLoss, generalFitness }

enum ExperienceLevel { beginner, intermediate, advanced }

enum TrainingEquipment {
  noEquipment,
  dumbbells,
  barbell,
  machines,
  cable,
  pullUpBar,
}

class TrainingPreferences {
  final TrainingGoal goal;
  final ExperienceLevel experience;
  final int daysPerWeek;
  final Set<TrainingEquipment> equipment;

  const TrainingPreferences({
    required this.goal,
    required this.experience,
    required this.daysPerWeek,
    required this.equipment,
  });

  Map<String, dynamic> toJson() => {
    'goal': goal.name,
    'experience': experience.name,
    'daysPerWeek': daysPerWeek,
    'equipment': equipment.map((item) => item.name).toList()..sort(),
  };

  factory TrainingPreferences.fromJson(Map<String, dynamic> json) {
    final rawGoal = json['goal'];
    final rawExperience = json['experience'];
    final rawDaysValue = json['daysPerWeek'];
    final rawEquipmentValue = json['equipment'];
    final goalName = rawGoal is String ? rawGoal : null;
    final experienceName = rawExperience is String ? rawExperience : null;
    final rawDays = rawDaysValue is num ? rawDaysValue.toInt() : 3;
    final rawEquipment = rawEquipmentValue is List
        ? rawEquipmentValue
        : const [];
    final equipment = rawEquipment
        .whereType<String>()
        .map(_equipmentFromName)
        .whereType<TrainingEquipment>()
        .toSet();
    if (equipment.length > 1) {
      equipment.remove(TrainingEquipment.noEquipment);
    }

    return TrainingPreferences(
      goal: TrainingGoal.values.firstWhere(
        (value) => value.name == goalName,
        orElse: () => TrainingGoal.generalFitness,
      ),
      experience: ExperienceLevel.values.firstWhere(
        (value) => value.name == experienceName,
        orElse: () => ExperienceLevel.beginner,
      ),
      daysPerWeek: rawDays.clamp(1, 7),
      equipment: equipment.isEmpty
          ? const {TrainingEquipment.noEquipment}
          : equipment,
    );
  }

  static TrainingEquipment? _equipmentFromName(String name) {
    for (final value in TrainingEquipment.values) {
      if (value.name == name) return value;
    }
    return null;
  }
}
