import '../../entities/cosecha.dart';
import '../../repositories/cosecha_repository.dart';

class RegistrarCosechaUsecase {
  final CosechaRepository _repository;

  RegistrarCosechaUsecase(this._repository);

  Future<String> call(Cosecha cosecha) {
    if (cosecha.cantidadKg <= 0) {
      throw ArgumentError('La cantidad cosechada debe ser mayor a 0');
    }
    return _repository.create(cosecha);
  }
}

class ObtenerCosechasUsecase {
  final CosechaRepository _repository;

  ObtenerCosechasUsecase(this._repository);

  Stream<List<Cosecha>> call() => _repository.watchAll();

  Stream<List<Cosecha>> porCultivo(String cultivoId) =>
      _repository.watchByCultivo(cultivoId);
}
