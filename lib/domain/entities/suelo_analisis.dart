class SueloAnalisis {
  final String id;
  final String loteId;
  final DateTime fecha;
  final double ph;
  final double materiaOrganicaPorcentaje;
  final double nitrogenoPpm;
  final double fosforoPpm;
  final double potasioPpm;
  final String? textura;
  final String? recomendacionesTecnicas;
  final DateTime? creadoEn;

  const SueloAnalisis({
    required this.id,
    required this.loteId,
    required this.fecha,
    required this.ph,
    required this.materiaOrganicaPorcentaje,
    required this.nitrogenoPpm,
    required this.fosforoPpm,
    required this.potasioPpm,
    this.textura,
    this.recomendacionesTecnicas,
    this.creadoEn,
  });

  /// Clasificación simple de fertilidad basada en reglas (heurística, sin ML real)
  String get clasificacionFertilidad {
    if (materiaOrganicaPorcentaje >= 4 && ph >= 6 && ph <= 7.5) {
      return 'Alta';
    } else if (materiaOrganicaPorcentaje >= 2) {
      return 'Media';
    }
    return 'Baja';
  }
}
