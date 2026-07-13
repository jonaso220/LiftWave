import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Deletes all cloud and device-local data owned by a LiftWave user.
///
/// Firebase Auth does not cascade deletes into Firestore, so account deletion
/// must explicitly remove every known subcollection before the auth identity
/// disappears and can no longer satisfy the Firestore security rules.
class UserDataDeletionService {
  UserDataDeletionService._();

  static Future<void> deleteCloudData(String uid) async {
    final firestore = FirebaseFirestore.instance;
    for (final collection in const [
      'workouts',
      'measurements',
      'customExercises',
      'customTemplates',
    ]) {
      await _deleteCollection(firestore.collection('users/$uid/$collection'));
    }

    final meta = firestore.collection('users/$uid/meta');
    await Future.wait([
      meta.doc('achievements').delete(),
      meta.doc('trainingPreferences').delete(),
    ]);
    await firestore.doc('users/$uid').delete();
  }

  static Future<void> _deleteCollection(
    CollectionReference<Map<String, dynamic>> collection,
  ) async {
    while (true) {
      final snapshot = await collection.limit(200).get();
      if (snapshot.docs.isEmpty) return;
      final batch = FirebaseFirestore.instance.batch();
      for (final document in snapshot.docs) {
        batch.delete(document.reference);
      }
      await batch.commit();
    }
  }

  static Future<void> deleteLocalData(String uid) async {
    final prefs = await SharedPreferences.getInstance();
    final photoPaths = <String>{};
    final rawMeasurements = prefs.getStringList('body_measurements_$uid');
    if (rawMeasurements != null) {
      for (final raw in rawMeasurements) {
        try {
          final data = Map<String, dynamic>.from(jsonDecode(raw) as Map);
          final path = data['photoPath'] as String?;
          if (path != null && path.isNotEmpty) photoPaths.add(path);
        } on Object {
          // A malformed cache entry must not block account deletion.
        }
      }
    }

    for (final path in photoPaths) {
      try {
        final file = File(path);
        if (await file.exists()) await file.delete();
      } on FileSystemException catch (error) {
        debugPrint('Local progress photo cleanup failed: $error');
      }
    }

    for (final key in [
      'workouts_cache_$uid',
      'workouts_sync_queue_$uid',
      'body_measurements_$uid',
      'measurements_sync_queue_$uid',
      'custom_exercises_$uid',
      'custom_exercises_sync_queue_$uid',
      'custom_templates_$uid',
      'custom_templates_sync_queue_$uid',
      'training_preferences_$uid',
      'training_preferences_sync_queue_$uid',
      'achievements_unlocked_$uid',
      'active_workout_state_$uid',
    ]) {
      await prefs.remove(key);
    }
  }
}
