class AuditoriaLog {
  final String id;
  final String? usuarioId;
  final String? usuarioCorreo;
  final String accion;
  final String modulo;
  final String? entidadId;
  final String? detalle;
  final DateTime fecha;

  const AuditoriaLog({
    required this.id,
    this.usuarioId,
    this.usuarioCorreo,
    required this.accion,
    required this.modulo,
    this.entidadId,
    this.detalle,
    required this.fecha,
  });
}
