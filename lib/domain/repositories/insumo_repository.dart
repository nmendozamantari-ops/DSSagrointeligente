import '../entities/insumo_aplicacion.dart';

abstract class InsumoRepository {
  Stream<List<InsumoAplicacion>> watchAll();
  Stream<List<InsumoAplicacion>> watchByCultivo(String cultivoId);
  Future<String> create(InsumoAplicacion insumo);
  Future<void> delete(String id);
}
