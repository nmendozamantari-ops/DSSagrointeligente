import '../entities/alerta.dart';

abstract class AlertaRepository {
  Stream<List<Alerta>> watchAll();
  Stream<List<Alerta>> watchNoLeidas();
  Future<String> create(Alerta alerta);
  Future<void> marcarLeida(String id);
  Future<void> delete(String id);
}
