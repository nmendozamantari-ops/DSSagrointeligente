import '../entities/cosecha.dart';

abstract class CosechaRepository {
  Stream<List<Cosecha>> watchAll();
  Stream<List<Cosecha>> watchByCultivo(String cultivoId);
  Future<String> create(Cosecha cosecha);
  Future<void> update(Cosecha cosecha);
  Future<void> delete(String id);
}
