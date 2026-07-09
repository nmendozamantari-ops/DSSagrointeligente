import '../entities/cliente.dart';

abstract class ClienteRepository {
  Stream<List<Cliente>> watchAll();
  Future<Cliente?> getById(String id);
  Future<String> create(Cliente cliente);
  Future<void> update(Cliente cliente);
  Future<void> delete(String id);
}
