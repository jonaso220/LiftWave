import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/progress_models.dart';
import '../services/firebase_service.dart';

/// Singleton that holds body measurements.
/// Primary storage: Firestore (cloud sync).
/// Secondary storage: SharedPreferences (local cache / offline fallback).
class ProgressStore extends ChangeNotifier {
  ProgressStore._() {
    // Listen to auth state: reload on login, clear on logout
    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user != null) {
        _load();
      } else {
        _measurements.clear();
        notifyListeners();
      }
    });
  }
  static final ProgressStore instance = ProgressStore._();

  static const _localKey = 'body_measurements';

  List<BodyMeasurement> _measurements = [];

  /// Measurements sorted oldest → newest (for charting).
  List<BodyMeasurement> get measurements =>
      List.unmodifiable(_measurements);

  /// Newest measurement first (for display lists).
  List<BodyMeasurement> get measurementsDesc =>
      List.unmodifiable(_measurements.reversed.toList());

  BodyMeasurement? get latest =>
      _measurements.isEmpty ? null : _measurements.last;

  List<BodyMeasurement> get withPhoto =>
      _measurements.where((m) => m.photoPath != null).toList();

  // ── Load ─────────────────────────────────────────────────────────────────

  Future<void> _load() async {
    // 1. Show local cache immediately
    await _loadLocal();

    // 2. Fetch from Firestore and merge
    try {
      final snap = await FirebaseService.instance.measurementsRef
          .orderBy('date', descending: false)
          .get();

      if (snap.docs.isNotEmpty) {
        _measurements = snap.docs.map((doc) {
          final data = Map<String, dynamic>.from(doc.data());
          if (data['date'] is Timestamp) {
            data['date'] =
                (data['date'] as Timestamp).toDate().toIso8601String();
          }
          return BodyMeasurement.fromJson(data);
        }).toList()
          ..sort((a, b) => a.date.compareTo(b.date));

        await _persistLocal();
      }
    } catch (e) {
      debugPrint('ProgressStore._load Firestore error: $e');
    }

    notifyListeners();
  }

  Future<void> _loadLocal() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final raw = prefs.getStringList(_localKey) ?? [];
      _measurements = raw
          .map((s) => BodyMeasurement.fromJson(jsonDecode(s)))
          .toList()
        ..sort((a, b) => a.date.compareTo(b.date));
      notifyListeners();
    } catch (e) {
      debugPrint('ProgressStore._loadLocal error: $e');
    }
  }

  // ── Add ──────────────────────────────────────────────────────────────────

  Future<void> add(BodyMeasurement m) async {
    _measurements.add(m);
    _measurements.sort((a, b) => a.date.compareTo(b.date));
    notifyListeners();

    await Future.wait([
      _persistLocal(),
      _saveToFirestore(m),
    ]);
  }

  // ── Remove ───────────────────────────────────────────────────────────────

  Future<void> remove(String id) async {
    _measurements.removeWhere((m) => m.id == id);
    notifyListeners();

    await Future.wait([
      _persistLocal(),
      _deleteFromFirestore(id),
    ]);
  }

  // ── Private helpers ───────────────────────────────────────────────────────

  Future<void> _persistLocal() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(
        _localKey,
        _measurements.map((m) => jsonEncode(m.toJson())).toList(),
      );
    } catch (e) {
      debugPrint('ProgressStore._persistLocal error: $e');
    }
  }

  Future<void> _saveToFirestore(BodyMeasurement m) async {
    try {
      await FirebaseService.instance.measurementsRef
          .doc(m.id)
          .set(m.toJson());
    } catch (e) {
      debugPrint('ProgressStore._saveToFirestore error: $e');
    }
  }

  Future<void> _deleteFromFirestore(String id) async {
    try {
      await FirebaseService.instance.measurementsRef.doc(id).delete();
    } catch (e) {
      debugPrint('ProgressStore._deleteFromFirestore error: $e');
    }
  }
}
