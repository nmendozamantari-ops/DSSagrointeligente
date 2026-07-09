import '../../entities/lote.dart';
import '../../repositories/lote_repository.dart';

class ObtenerLotesUsecase {
  final LoteRepository _repository;

  ObtenerLotesUsecase(this._repository);

  Stream<List<Lote>> call() => _repository.watchAll();
}

class ActualizarLoteUsecase {
  final LoteRepository _repository;

  ActualizarLoteUsecase(this._repository);

  Future<void> call(Lote lote) => _repository.update(lote);
}

class EliminarLoteUsecase {
  final LoteRepository _repository;

  EliminarLoteUsecase(this._repository);

  Future<void> call(String id) => _repository.delete(id);
}
