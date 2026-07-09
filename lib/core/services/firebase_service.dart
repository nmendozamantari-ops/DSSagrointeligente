import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import '../../firebase_options.dart';

/// Encapsula la inicialización de Firebase.
/// `firebase_options.dart` NO está incluido aquí: se genera automáticamente
/// al correr `flutterfire configure` desde la terminal (ver guía de conexión).
class FirebaseService {
  FirebaseService._();

  static bool _initialized = false;

  static Future<void> initialize() async {
    if (_initialized) return;
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      _initialized = true;
      if (kDebugMode) {
        debugPrint('✅ Firebase inicializado correctamente');
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint('❌ Error al inicializar Firebase: $e');
      }
      rethrow;
    }
  }
}
