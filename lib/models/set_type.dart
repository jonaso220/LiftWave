/// What kind of set this is.
///
/// Stored by [storageKey]. A normal set stores nothing, so workouts saved
/// before set types existed (and builds that do not know them) read the
/// same as always.
enum SetType {
  normal('normal'),

  /// A lighter set to prepare. It is logged and shown, but it is not
  /// training work: no volume, no records, no progression.
  warmup('warmup'),

  /// A set done right after the previous one with less load.
  drop('drop'),

  /// A set taken to muscular failure.
  failure('failure');

  const SetType(this.storageKey);

  final String storageKey;

  /// Whether the set counts toward volume, records, weekly sets and the
  /// next-session suggestion.
  bool get countsAsWork => this != SetType.warmup;

  static SetType fromStorage(Object? value) {
    for (final type in values) {
      if (type.storageKey == value) return type;
    }
    return SetType.normal;
  }
}

/// Exercises that are held or carried for a time rather than counted in
/// repetitions, by their catalogue (Spanish) name. For these a set's `reps`
/// value is its duration in seconds. The user can switch any exercise
/// either way during a session.
const Set<String> _timedByDefault = {
  'Plancha',
  'Plancha lateral',
  'Hollow hold',
  "Farmer's Carry",
};

bool isTimedByDefault(String exerciseName) =>
    _timedByDefault.contains(exerciseName);

/// Seconds added or removed per tap, and suggested from one session to the
/// next, for a timed exercise.
const int holdStepSeconds = 5;
