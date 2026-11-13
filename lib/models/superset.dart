// A superset is a run of neighbouring exercises that share a `supersetId`:
// the user does one set of each in turn and rests after the round.
//
// The same rule holds wherever exercises are listed in order: a session in
// progress, a saved routine and the routine builder.

/// An exercise that may belong to a superset.
abstract interface class SupersetMember {
  /// Shared by the exercises alternated as one superset; null on its own.
  /// Only neighbours in the list with the same id form a group.
  String? get supersetId;
}

/// A [SupersetMember] that can be moved in and out of a superset.
abstract interface class MutableSupersetMember implements SupersetMember {
  set supersetId(String? value);
}

/// An id for a superset that is being created now.
String newSupersetId() => 'ss_${DateTime.now().microsecondsSinceEpoch}';

/// Indexes of the superset the exercise at [index] belongs to, in order.
/// Just `[index]` when it is done on its own.
List<int> supersetMembers(List<SupersetMember> exercises, int index) {
  final id = exercises[index].supersetId;
  if (id == null) return [index];
  var first = index;
  while (first > 0 && exercises[first - 1].supersetId == id) {
    first--;
  }
  var last = index;
  while (last < exercises.length - 1 && exercises[last + 1].supersetId == id) {
    last++;
  }
  return [for (var i = first; i <= last; i++) i];
}

bool isInSuperset(List<SupersetMember> exercises, int index) =>
    supersetMembers(exercises, index).length > 1;

/// Whether the exercise at [index] is already grouped with the one after it.
bool isLinkedWithNext(List<SupersetMember> exercises, int index) =>
    index < exercises.length - 1 &&
    exercises[index].supersetId != null &&
    exercises[index].supersetId == exercises[index + 1].supersetId;

/// Groups the exercise at [index] with the next one, joining whatever
/// superset either of them was already in. [newId] names a new group.
void linkWithNext(
  List<MutableSupersetMember> exercises,
  int index,
  String newId,
) {
  if (index < 0 || index >= exercises.length - 1) return;
  final members = {
    ...supersetMembers(exercises, index),
    ...supersetMembers(exercises, index + 1),
  };
  final id = exercises[index].supersetId ?? newId;
  for (final member in members) {
    exercises[member].supersetId = id;
  }
}

/// Takes the exercise at [index] out of its superset. An exercise in the
/// middle splits the group in two; one left alone stops being a superset.
void unlinkFromSuperset(List<MutableSupersetMember> exercises, int index) {
  final members = supersetMembers(exercises, index);
  exercises[index].supersetId = null;
  // What followed it becomes a group of its own, so the two halves no
  // longer share an id.
  final after = members.where((member) => member > index).toList();
  if (after.isNotEmpty) {
    final id = '${exercises[after.first].supersetId}_b';
    for (final member in after) {
      exercises[member].supersetId = id;
    }
  }
  normalizeSupersets(exercises);
}

/// Drops the id of any exercise left without a neighbour that shares it
/// (after reordering, removing or unlinking).
void normalizeSupersets(List<MutableSupersetMember> exercises) {
  for (var i = 0; i < exercises.length; i++) {
    if (exercises[i].supersetId != null && !isInSuperset(exercises, i)) {
      exercises[i].supersetId = null;
    }
  }
}
