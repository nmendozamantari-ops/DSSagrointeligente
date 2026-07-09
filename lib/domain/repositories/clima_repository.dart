import '../entities/clima_registro.dart';

abstract class ClimaRepository {
  Stream<List<ClimaRegistro>> watchByLote(String loteId);
  Stream<List<ClimaRegistro>> watchAll();
  Future<String> create(ClimaRegistro registro);
  Future<void> delete(String id);
}
