import '../entities/riego_registro.dart';

abstract class RiegoRepository {
  Stream<List<RiegoRegistro>> watchByLote(String loteId);
  Stream<List<RiegoRegistro>> watchAll();
  Future<String> create(RiegoRegistro registro);
  Future<void> delete(String id);
}
