import '../entities/proveedor.dart';

abstract class ProveedorRepository {
  Stream<List<Proveedor>> watchAll();
  Future<Proveedor?> getById(String id);
  Future<String> create(Proveedor proveedor);
  Future<void> update(Proveedor proveedor);
  Future<void> delete(String id);
}
