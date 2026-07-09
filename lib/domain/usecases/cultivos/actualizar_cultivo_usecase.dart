import '../../entities/cultivo.dart';
import '../../repositories/cultivo_repository.dart';

class ActualizarCultivoUsecase {
  final CultivoRepository _repository;

  ActualizarCultivoUsecase(this._repository);

  Future<void> call(Cultivo cultivo) => _repository.update(cultivo);
}
