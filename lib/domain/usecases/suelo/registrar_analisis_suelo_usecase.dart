import '../../entities/suelo_analisis.dart';
import '../../repositories/suelo_repository.dart';

class RegistrarAnalisisSueloUsecase {
  final SueloRepository _repository;

  RegistrarAnalisisSueloUsecase(this._repository);

  Future<String> call(SueloAnalisis analisis) {
    if (analisis.ph < 0 || analisis.ph > 14) {
      throw ArgumentError('El pH debe estar entre 0 y 14');
    }
    return _repository.create(analisis);
  }
}

class ObtenerAnalisisSueloUsecase {
  final SueloRepository _repository;

  ObtenerAnalisisSueloUsecase(this._repository);

  Stream<List<SueloAnalisis>> call() => _repository.watchAll();

  Stream<List<SueloAnalisis>> porLote(String loteId) =>
      _repository.watchByLote(loteId);
}
