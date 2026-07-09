import '../../entities/plaga_registro.dart';
import '../../repositories/plaga_repository.dart';

class RegistrarPlagaUsecase {
  final PlagaRepository _repository;

  RegistrarPlagaUsecase(this._repository);

  Future<String> call(PlagaRegistro registro) {
    if (registro.nombrePlaga.trim().isEmpty) {
      throw ArgumentError('El nombre de la plaga/enfermedad es requerido');
    }
    return _repository.create(registro);
  }
}

class ActualizarPlagaUsecase {
  final PlagaRepository _repository;

  ActualizarPlagaUsecase(this._repository);

  Future<void> call(PlagaRegistro registro) => _repository.update(registro);
}

class ObtenerPlagasUsecase {
  final PlagaRepository _repository;

  ObtenerPlagasUsecase(this._repository);

  Stream<List<PlagaRegistro>> call() => _repository.watchAll();

  Stream<List<PlagaRegistro>> porCultivo(String cultivoId) =>
      _repository.watchByCultivo(cultivoId);
}
