import '../../entities/insumo_aplicacion.dart';
import '../../repositories/insumo_repository.dart';

class RegistrarInsumoUsecase {
  final InsumoRepository _repository;

  RegistrarInsumoUsecase(this._repository);

  Future<String> call(InsumoAplicacion insumo) {
    if (insumo.cantidad <= 0) {
      throw ArgumentError('La cantidad debe ser mayor a 0');
    }
    if (insumo.costoTotal < 0) {
      throw ArgumentError('El costo no puede ser negativo');
    }
    return _repository.create(insumo);
  }
}

class ObtenerInsumosUsecase {
  final InsumoRepository _repository;

  ObtenerInsumosUsecase(this._repository);

  Stream<List<InsumoAplicacion>> call() => _repository.watchAll();

  Stream<List<InsumoAplicacion>> porCultivo(String cultivoId) =>
      _repository.watchByCultivo(cultivoId);
}
