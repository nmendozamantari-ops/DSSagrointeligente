enum NivelRiesgoPlaga { bajo, medio, alto, critico }

extension NivelRiesgoPlagaX on NivelRiesgoPlaga {
  String get label {
    switch (this) {
      case NivelRiesgoPlaga.bajo:
        return 'Bajo';
      case NivelRiesgoPlaga.medio:
        return 'Medio';
      case NivelRiesgoPlaga.alto:
        return 'Alto';
      case NivelRiesgoPlaga.critico:
        return 'Crítico';
    }
  }

  String get value => name;

  static NivelRiesgoPlaga fromValue(String value) {
    return NivelRiesgoPlaga.values.firstWhere(
      (e) => e.value == value,
      orElse: () => NivelRiesgoPlaga.bajo,
    );
  }
}

class PlagaRegistro {
  final String id;
  final String cultivoId;
  final String loteId;
  final String nombrePlaga;
  final DateTime fechaDeteccion;
  final NivelRiesgoPlaga nivelRiesgo;
  final double? porcentajeAfectacion;
  final String? tratamientoAplicado;
  final bool resuelto;
  final String? fotoUrl;
  final DateTime? creadoEn;

  const PlagaRegistro({
    required this.id,
    required this.cultivoId,
    required this.loteId,
    required this.nombrePlaga,
    required this.fechaDeteccion,
    required this.nivelRiesgo,
    this.porcentajeAfectacion,
    this.tratamientoAplicado,
    this.resuelto = false,
    this.fotoUrl,
    this.creadoEn,
  });
}
