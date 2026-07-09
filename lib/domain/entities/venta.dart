enum EstadoVenta { pendiente, pagada, cancelada }

extension EstadoVentaX on EstadoVenta {
  String get label {
    switch (this) {
      case EstadoVenta.pendiente:
        return 'Pendiente';
      case EstadoVenta.pagada:
        return 'Pagada';
      case EstadoVenta.cancelada:
        return 'Cancelada';
    }
  }

  String get value => name;

  static EstadoVenta fromValue(String value) {
    return EstadoVenta.values.firstWhere(
      (e) => e.value == value,
      orElse: () => EstadoVenta.pendiente,
    );
  }
}

class Venta {
  final String id;
  final String clienteId;
  final String cosechaId;
  final DateTime fecha;
  final double cantidadKg;
  final double precioUnitario;
  final EstadoVenta estado;
  final String? notas;
  final DateTime? creadoEn;

  const Venta({
    required this.id,
    required this.clienteId,
    required this.cosechaId,
    required this.fecha,
    required this.cantidadKg,
    required this.precioUnitario,
    this.estado = EstadoVenta.pendiente,
    this.notas,
    this.creadoEn,
  });

  double get total => cantidadKg * precioUnitario;
}
