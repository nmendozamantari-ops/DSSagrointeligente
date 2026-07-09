import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants/app_roles.dart';
import '../constants/firestore_collections.dart';

/// Excepción de dominio para errores de autenticación,
/// para no filtrar FirebaseAuthException hacia la capa de presentación.
class AuthException implements Exception {
  final String message;
  AuthException(this.message);

  @override
  String toString() => message;
}

/// Servicio de autenticación. Envuelve FirebaseAuth + creación del doc
/// de usuario en Firestore (colección `usuarios`) con su rol.
class AuthService {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  AuthService({
    FirebaseAuth? auth,
    FirebaseFirestore? firestore,
  })  : _auth = auth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  User? get currentUser => _auth.currentUser;

  bool get isLoggedIn => _auth.currentUser != null;

  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthException(_mapAuthError(e.code));
    }
  }

  Future<UserCredential> register({
    required String email,
    required String password,
    required String fullName,
    required AppRole role,
  }) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      await credential.user?.updateDisplayName(fullName);

      await _firestore
          .collection(FirestoreCollections.usuarios)
          .doc(credential.user!.uid)
          .set({
        'uid': credential.user!.uid,
        'nombre': fullName,
        'correo': email.trim(),
        'role': role.value,
        'activo': true,
        'creadoEn': FieldValue.serverTimestamp(),
      });

      return credential;
    } on FirebaseAuthException catch (e) {
      throw AuthException(_mapAuthError(e.code));
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
    } on FirebaseAuthException catch (e) {
      throw AuthException(_mapAuthError(e.code));
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
  }

  /// Obtiene el rol del usuario actual desde Firestore
  Future<AppRole?> getCurrentUserRole() async {
    final uid = currentUser?.uid;
    if (uid == null) return null;

    final doc = await _firestore
        .collection(FirestoreCollections.usuarios)
        .doc(uid)
        .get();

    if (!doc.exists) return null;
    final roleValue = doc.data()?['role'] as String?;
    if (roleValue == null) return null;
    return AppRoleX.fromValue(roleValue);
  }

  String _mapAuthError(String code) {
    switch (code) {
      case 'user-not-found':
        return 'No existe una cuenta con ese correo';
      case 'wrong-password':
      case 'invalid-credential':
        return 'Contraseña incorrecta';
      case 'email-already-in-use':
        return 'Ya existe una cuenta con ese correo';
      case 'weak-password':
        return 'La contraseña es demasiado débil';
      case 'invalid-email':
        return 'Correo electrónico inválido';
      case 'user-disabled':
        return 'Esta cuenta ha sido deshabilitada';
      case 'too-many-requests':
        return 'Demasiados intentos. Intenta más tarde';
      default:
        return 'Error de autenticación: $code';
    }
  }
}
