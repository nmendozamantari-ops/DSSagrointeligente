import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../constants/firestore_collections.dart';

/// Excepción de dominio para errores de datos, evita filtrar
/// FirebaseException hacia domain/presentation.
class DataException implements Exception {
  final String message;
  DataException(this.message);

  @override
  String toString() => message;
}

/// Servicio genérico de acceso a Firestore.
/// Los repositories concretos (en `data/repositories`) lo usan por composición
/// en vez de repetir boilerplate de CRUD en cada uno.
class FirestoreService {
  final FirebaseFirestore _db;

  FirestoreService({FirebaseFirestore? firestore})
      : _db = firestore ?? FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> collection(String path) =>
      _db.collection(path);

  Future<String> create(String collectionPath, Map<String, dynamic> data) async {
    try {
      final docRef = await _db.collection(collectionPath).add({
        ...data,
        'creadoEn': FieldValue.serverTimestamp(),
      });
      return docRef.id;
    } on FirebaseException catch (e) {
      throw DataException('Error al crear registro: ${e.message}');
    }
  }

  Future<void> createWithId(
      String collectionPath, String id, Map<String, dynamic> data) async {
    try {
      await _db.collection(collectionPath).doc(id).set({
        ...data,
        'creadoEn': FieldValue.serverTimestamp(),
      });
    } on FirebaseException catch (e) {
      throw DataException('Error al crear registro: ${e.message}');
    }
  }

  Future<void> update(
      String collectionPath, String id, Map<String, dynamic> data) async {
    try {
      await _db.collection(collectionPath).doc(id).update({
        ...data,
        'actualizadoEn': FieldValue.serverTimestamp(),
      });
    } on FirebaseException catch (e) {
      throw DataException('Error al actualizar registro: ${e.message}');
    }
  }

  Future<void> delete(String collectionPath, String id) async {
    try {
      await _db.collection(collectionPath).doc(id).delete();
    } on FirebaseException catch (e) {
      throw DataException('Error al eliminar registro: ${e.message}');
    }
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getById(
      String collectionPath, String id) async {
    try {
      return await _db.collection(collectionPath).doc(id).get();
    } on FirebaseException catch (e) {
      throw DataException('Error al obtener registro: ${e.message}');
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamAll(
    String collectionPath, {
    String orderBy = 'creadoEn',
    bool descending = true,
  }) {
    return _db
        .collection(collectionPath)
        .orderBy(orderBy, descending: descending)
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamWhere(
    String collectionPath, {
    required String field,
    required dynamic isEqualTo,
    String orderBy = 'creadoEn',
    bool descending = true,
  }) {
    return _db
        .collection(collectionPath)
        .where(field, isEqualTo: isEqualTo)
        .orderBy(orderBy, descending: descending)
        .snapshots();
  }

  /// Registra una acción en `auditoria_logs` (Auditoría, Seguridad y
  /// Trazabilidad, transversal a todo el sistema según el esquema).
  Future<void> logAuditoria({
    required String accion,
    required String modulo,
    String? detalle,
    String? entidadId,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    try {
      await _db.collection(FirestoreCollections.auditoriaLogs).add({
        'usuarioId': user?.uid,
        'usuarioCorreo': user?.email,
        'accion': accion,
        'modulo': modulo,
        'entidadId': entidadId,
        'detalle': detalle,
        'fecha': FieldValue.serverTimestamp(),
      });
    } catch (_) {
      // La auditoría no debe romper el flujo principal si falla el log.
    }
  }
}
