import '../../entities/cultivo.dart';
import '../../repositories/cultivo_repository.dart';

class ObtenerCultivosUsecase {
  final CultivoRepository _repository;

  ObtenerCultivosUsecase(this._repository);

  Stream<List<Cultivo>> call() => _repository.watchAll();

  Stream<List<Cultivo>> porLote(String loteId) =>
      _repository.watchByLote(loteId);
}
