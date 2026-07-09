enum TipoInsumo { fertilizante, pesticida, fungicida, semilla, otro }

extension TipoInsumoX on TipoInsumo {
  String get label {
    switch (this) {
      case TipoInsumo.fertilizante:
        return 'Fertilizante';
      case TipoInsumo.pesticida:
        return 'Pesticida';
      case TipoInsumo.fungicida:
        return 'Fungicida';
      case TipoInsumo.semilla:
        return 'Semilla';
      case TipoInsumo.otro:
        return 'Otro';
    }
  }

  String get value => name;

  static TipoInsumo fromValue(String value) {
    return TipoInsumo.values.firstWhere(
      (e) => e.value == value,
      orElse: () => TipoInsumo.otro,
    );
  }
}

class InsumoAplicacion {
  final String id;
  final String cultivoId;
  final String loteId;
  final String? proveedorId;
  final TipoInsumo tipo;
  final String nombreProducto;
  final DateTime fechaAplicacion;
  final double cantidad;
  final String unidad;
  final double costoTotal;
  final String? notas;
  final DateTime? creadoEn;

  const InsumoAplicacion({
    required this.id,
    required this.cultivoId,
    required this.loteId,
    this.proveedorId,
    required this.tipo,
    required this.nombreProducto,
    required this.fechaAplicacion,
    required this.cantidad,
    required this.unidad,
    required this.costoTotal,
    this.notas,
    this.creadoEn,
  });
}
