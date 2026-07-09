import '../entities/lote.dart';

abstract class LoteRepository {
  Stream<List<Lote>> watchAll();
  Future<Lote?> getById(String id);
  Future<String> create(Lote lote);
  Future<void> update(Lote lote);
  Future<void> delete(String id);
}
