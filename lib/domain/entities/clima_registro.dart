/// Registro climático manual o simulado (sin sensores IoT reales por ahora)
class ClimaRegistro {
  final String id;
  final String loteId;
  final DateTime fecha;
  final double temperaturaC;
  final double humedadPorcentaje;
  final double precipitacionMm;
  final double? velocidadVientoKmh;
  final String? observaciones;
  final DateTime? creadoEn;

  const ClimaRegistro({
    required this.id,
    required this.loteId,
    required this.fecha,
    required this.temperaturaC,
    required this.humedadPorcentaje,
    required this.precipitacionMm,
    this.velocidadVientoKmh,
    this.observaciones,
    this.creadoEn,
  });
}
