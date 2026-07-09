import '../../entities/clima_registro.dart';
import '../../repositories/clima_repository.dart';

class RegistrarClimaUsecase {
  final ClimaRepository _repository;

  RegistrarClimaUsecase(this._repository);

  Future<String> call(ClimaRegistro registro) {
    if (registro.humedadPorcentaje < 0 || registro.humedadPorcentaje > 100) {
      throw ArgumentError('La humedad debe estar entre 0 y 100%');
    }
    return _repository.create(registro);
  }
}

class ObtenerClimaUsecase {
  final ClimaRepository _repository;

  ObtenerClimaUsecase(this._repository);

  Stream<List<ClimaRegistro>> call() => _repository.watchAll();

  Stream<List<ClimaRegistro>> porLote(String loteId) =>
      _repository.watchByLote(loteId);
}
