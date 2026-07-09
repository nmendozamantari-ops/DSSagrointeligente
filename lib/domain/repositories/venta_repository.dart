import '../entities/venta.dart';

abstract class VentaRepository {
  Stream<List<Venta>> watchAll();
  Stream<List<Venta>> watchByCliente(String clienteId);
  Future<String> create(Venta venta);
  Future<void> update(Venta venta);
  Future<void> delete(String id);
}
