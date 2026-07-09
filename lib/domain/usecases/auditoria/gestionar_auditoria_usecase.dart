import '../../entities/auditoria_log.dart';
import '../../repositories/auditoria_repository.dart';

class RegistrarAuditoriaUsecase {
  final AuditoriaRepository _repository;

  RegistrarAuditoriaUsecase(this._repository);

  Future<void> call({
    required String accion,
    required String modulo,
    String? detalle,
    String? entidadId,
  }) {
    return _repository.log(
      accion: accion,
      modulo: modulo,
      detalle: detalle,
      entidadId: entidadId,
    );
  }
}

class ObtenerAuditoriaUsecase {
  final AuditoriaRepository _repository;

  ObtenerAuditoriaUsecase(this._repository);

  Stream<List<AuditoriaLog>> call({int limit = 100}) =>
      _repository.watchAll(limit: limit);
}
