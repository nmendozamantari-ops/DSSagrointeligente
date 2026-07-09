import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

/// Servicio para subir/eliminar archivos en Firebase Storage
/// (fotos de cultivos, plagas, suelo, comprobantes de venta, avatares).
class StorageService {
  final FirebaseStorage _storage;

  StorageService({FirebaseStorage? storage})
      : _storage = storage ?? FirebaseStorage.instance;

  /// Sube un archivo y retorna la URL de descarga
  Future<String> uploadFile({
    required File file,
    required String folder,
    String? fileName,
  }) async {
    final name = fileName ?? DateTime.now().millisecondsSinceEpoch.toString();
    final ref = _storage.ref().child('$folder/$name');
    final task = await ref.putFile(file);
    return await task.ref.getDownloadURL();
  }

  Future<void> deleteFile(String downloadUrl) async {
    try {
      final ref = _storage.refFromURL(downloadUrl);
      await ref.delete();
    } catch (_) {
      // Si el archivo ya no existe, ignoramos el error.
    }
  }
}
