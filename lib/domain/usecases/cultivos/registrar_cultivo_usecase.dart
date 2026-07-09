import '../../entities/cultivo.dart';
import '../../repositories/cultivo_repository.dart';

class RegistrarCultivoUsecase {
  final CultivoRepository _repository;

  RegistrarCultivoUsecase(this._repository);

  Future<String> call(Cultivo cultivo) {
    if (cultivo.nombre.trim().isEmpty) {
      throw ArgumentError('El nombre del cultivo es requerido');
    }
    if (cultivo.areaHectareas <= 0) {
      throw ArgumentError('El área debe ser mayor a 0');
    }
    return _repository.create(cultivo);
  }
}
