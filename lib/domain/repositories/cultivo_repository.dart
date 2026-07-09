import '../entities/cultivo.dart';

abstract class CultivoRepository {
  Stream<List<Cultivo>> watchAll();
  Stream<List<Cultivo>> watchByLote(String loteId);
  Future<Cultivo?> getById(String id);
  Future<String> create(Cultivo cultivo);
  Future<void> update(Cultivo cultivo);
  Future<void> delete(String id);
}
