class BodyMeasurement {
  final String id;
  final DateTime date;
  final double? weight; // kg
  final double? waist; // cm
  final double? chest; // cm
  final double? hips; // cm
  final String? photoPath; // absolute path to local file

  const BodyMeasurement({
    required this.id,
    required this.date,
    this.weight,
    this.waist,
    this.chest,
    this.hips,
    this.photoPath,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date.toIso8601String(),
        'weight': weight,
        'waist': waist,
        'chest': chest,
        'hips': hips,
        'photoPath': photoPath,
      };

  factory BodyMeasurement.fromJson(Map<String, dynamic> json) =>
      BodyMeasurement(
        id: json['id'] as String,
        date: DateTime.parse(json['date'] as String),
        weight: (json['weight'] as num?)?.toDouble(),
        waist: (json['waist'] as num?)?.toDouble(),
        chest: (json['chest'] as num?)?.toDouble(),
        hips: (json['hips'] as num?)?.toDouble(),
        photoPath: json['photoPath'] as String?,
      );
}
