import '../entities/suelo_analisis.dart';

abstract class SueloRepository {
  Stream<List<SueloAnalisis>> watchByLote(String loteId);
  Stream<List<SueloAnalisis>> watchAll();
  Future<String> create(SueloAnalisis analisis);
  Future<void> delete(String id);
}
