enum CalidadCosecha { primera, segunda, tercera, descarte }

extension CalidadCosechaX on CalidadCosecha {
  String get label {
    switch (this) {
      case CalidadCosecha.primera:
        return 'Primera';
      case CalidadCosecha.segunda:
        return 'Segunda';
      case CalidadCosecha.tercera:
        return 'Tercera';
      case CalidadCosecha.descarte:
        return 'Descarte';
    }
  }

  String get value => name;

  static CalidadCosecha fromValue(String value) {
    return CalidadCosecha.values.firstWhere(
      (e) => e.value == value,
      orElse: () => CalidadCosecha.primera,
    );
  }
}

class Cosecha {
  final String id;
  final String cultivoId;
  final String loteId;
  final DateTime fecha;
  final double cantidadKg;
  final CalidadCosecha calidad;
  final double? costoProduccionTotal;
  final String? notas;
  final DateTime? creadoEn;

  const Cosecha({
    required this.id,
    required this.cultivoId,
    required this.loteId,
    required this.fecha,
    required this.cantidadKg,
    this.calidad = CalidadCosecha.primera,
    this.costoProduccionTotal,
    this.notas,
    this.creadoEn,
  });
}
