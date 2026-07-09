import '../../entities/lote.dart';
import '../../repositories/lote_repository.dart';

class RegistrarLoteUsecase {
  final LoteRepository _repository;

  RegistrarLoteUsecase(this._repository);

  Future<String> call(Lote lote) {
    if (lote.nombre.trim().isEmpty) {
      throw ArgumentError('El nombre del lote es requerido');
    }
    if (lote.areaHectareas <= 0) {
      throw ArgumentError('El área debe ser mayor a 0');
    }
    return _repository.create(lote);
  }
}
