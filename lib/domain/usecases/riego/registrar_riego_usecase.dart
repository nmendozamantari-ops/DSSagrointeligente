import '../../entities/riego_registro.dart';
import '../../repositories/riego_repository.dart';

class RegistrarRiegoUsecase {
  final RiegoRepository _repository;

  RegistrarRiegoUsecase(this._repository);

  Future<String> call(RiegoRegistro registro) {
    if (registro.volumenAguaLitros <= 0) {
      throw ArgumentError('El volumen de agua debe ser mayor a 0');
    }
    return _repository.create(registro);
  }
}

/// Caso de uso para programar un riego futuro (marca `programado: true`).
/// La ejecución real de la programación (notificaciones, cron) queda
/// como punto de extensión documentado.
class ProgramarRiegoUsecase {
  final RiegoRepository _repository;

  ProgramarRiegoUsecase(this._repository);

  Future<String> call(RiegoRegistro registro) {
    final programado = RiegoRegistro(
      id: registro.id,
      loteId: registro.loteId,
      cultivoId: registro.cultivoId,
      fecha: registro.fecha,
      volumenAguaLitros: registro.volumenAguaLitros,
      metodo: registro.metodo,
      duracionMinutos: registro.duracionMinutos,
      programado: true,
      notas: registro.notas,
    );
    return _repository.create(programado);
  }
}

class ObtenerRiegosUsecase {
  final RiegoRepository _repository;

  ObtenerRiegosUsecase(this._repository);

  Stream<List<RiegoRegistro>> call() => _repository.watchAll();

  Stream<List<RiegoRegistro>> porLote(String loteId) =>
      _repository.watchByLote(loteId);
}
