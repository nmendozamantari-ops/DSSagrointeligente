import '../../entities/alerta.dart';
import '../../repositories/alerta_repository.dart';

class GuardarAlertasUsecase {
  final AlertaRepository _repository;

  GuardarAlertasUsecase(this._repository);

  Future<void> call(List<Alerta> alertas) async {
    for (final alerta in alertas) {
      await _repository.create(alerta);
    }
  }
}

class ObtenerAlertasUsecase {
  final AlertaRepository _repository;

  ObtenerAlertasUsecase(this._repository);

  Stream<List<Alerta>> call() => _repository.watchAll();

  Stream<List<Alerta>> noLeidas() => _repository.watchNoLeidas();
}

class MarcarAlertaLeidaUsecase {
  final AlertaRepository _repository;

  MarcarAlertaLeidaUsecase(this._repository);

  Future<void> call(String id) => _repository.marcarLeida(id);
}
