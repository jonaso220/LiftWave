import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';

/// Singleton that initialises Firebase and exposes typed Firestore
/// collection references scoped to the authenticated user.
class FirebaseService {
  FirebaseService._();
  static final FirebaseService instance = FirebaseService._();

  /// Current user UID – always dynamic so it updates after login/logout.
  String get uid =>
      FirebaseAuth.instance.currentUser?.uid ?? 'unauthenticated';

  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  // ── Collection helpers ────────────────────────────────────────────────────

  CollectionReference<Map<String, dynamic>> get workoutsRef =>
      FirebaseFirestore.instance.collection('users/$uid/workouts');

  CollectionReference<Map<String, dynamic>> get measurementsRef =>
      FirebaseFirestore.instance.collection('users/$uid/measurements');
}
