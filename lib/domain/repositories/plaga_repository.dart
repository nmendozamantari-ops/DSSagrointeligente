import '../entities/plaga_registro.dart';

abstract class PlagaRepository {
  Stream<List<PlagaRegistro>> watchAll();
  Stream<List<PlagaRegistro>> watchByCultivo(String cultivoId);
  Future<String> create(PlagaRegistro registro);
  Future<void> update(PlagaRegistro registro);
  Future<void> delete(String id);
}
