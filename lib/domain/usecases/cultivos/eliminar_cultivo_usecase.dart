import '../../repositories/cultivo_repository.dart';

class EliminarCultivoUsecase {
  final CultivoRepository _repository;

  EliminarCultivoUsecase(this._repository);

  Future<void> call(String id) => _repository.delete(id);
}
