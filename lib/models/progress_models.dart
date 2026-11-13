class BodyMeasurement {
  final String id;
  final DateTime date;
  final double? weight; // kg
  final double? waist; // cm
  final double? chest; // cm
  final double? hips; // cm
  /// Absolute path to the local file, valid for this launch only. Only the
  /// file name is persisted (see [toLocalJson] and [rebasePhotoPath]).
  final String? photoPath;

  const BodyMeasurement({
    required this.id,
    required this.date,
    this.weight,
    this.waist,
    this.chest,
    this.hips,
    this.photoPath,
  });

  bool get hasPhoto => photoPath != null && photoPath!.isNotEmpty;

  BodyMeasurement copyWith({String? photoPath}) {
    return BodyMeasurement(
      id: id,
      date: date,
      weight: weight,
      waist: waist,
      chest: chest,
      hips: hips,
      photoPath: photoPath ?? this.photoPath,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'date': date.toIso8601String(),
    'weight': weight,
    'waist': waist,
    'chest': chest,
    'hips': hips,
    'photoPath': photoPath,
  };

  Map<String, dynamic> toCloudJson() =>
      Map<String, dynamic>.from(toJson())..remove('photoPath');

  /// Device cache form: the photo is stored by file name, because the
  /// directory it lives in is not stable (iOS moves the app container on
  /// every update).
  Map<String, dynamic> toLocalJson() =>
      Map<String, dynamic>.from(toJson())
        ..['photoPath'] = hasPhoto ? photoFileName(photoPath!) : null;

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

/// The last path segment of a stored photo reference, which may be a bare
/// file name or an absolute path written by an older build.
String photoFileName(String stored) {
  final separator = stored.lastIndexOf(RegExp(r'[/\\]'));
  return separator == -1 ? stored : stored.substring(separator + 1);
}

/// Resolves a stored photo reference against the current documents
/// directory, where every progress photo is saved.
String? rebasePhotoPath(String? stored, String documentsDir) {
  if (stored == null || stored.isEmpty) return null;
  final name = photoFileName(stored);
  if (name.isEmpty) return null;
  final base = documentsDir.endsWith('/')
      ? documentsDir.substring(0, documentsDir.length - 1)
      : documentsDir;
  return '$base/$name';
}
