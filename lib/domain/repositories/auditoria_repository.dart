import '../entities/auditoria_log.dart';

abstract class AuditoriaRepository {
  Stream<List<AuditoriaLog>> watchAll({int limit = 100});
  Future<void> log({
    required String accion,
    required String modulo,
    String? detalle,
    String? entidadId,
  });
}
