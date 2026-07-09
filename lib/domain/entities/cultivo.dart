/// Estados posibles del ciclo de un cultivo
enum EstadoCultivo { planificado, sembrado, enCrecimiento, cosechado, finalizado }

extension EstadoCultivoX on EstadoCultivo {
  String get label {
    switch (this) {
      case EstadoCultivo.planificado:
        return 'Planificado';
      case EstadoCultivo.sembrado:
        return 'Sembrado';
      case EstadoCultivo.enCrecimiento:
        return 'En crecimiento';
      case EstadoCultivo.cosechado:
        return 'Cosechado';
      case EstadoCultivo.finalizado:
        return 'Finalizado';
    }
  }

  String get value => name;

  static EstadoCultivo fromValue(String value) {
    return EstadoCultivo.values.firstWhere(
      (e) => e.value == value,
      orElse: () => EstadoCultivo.planificado,
    );
  }
}

class Cultivo {
  final String id;
  final String nombre;
  final String variedad;
  final String loteId;
  final DateTime fechaSiembra;
  final DateTime? fechaCosechaEstimada;
  final double areaHectareas;
  final EstadoCultivo estado;
  final double? rendimientoEsperadoKgHa;
  final String? notas;
  final DateTime? creadoEn;

  const Cultivo({
    required this.id,
    required this.nombre,
    required this.variedad,
    required this.loteId,
    required this.fechaSiembra,
    this.fechaCosechaEstimada,
    required this.areaHectareas,
    this.estado = EstadoCultivo.planificado,
    this.rendimientoEsperadoKgHa,
    this.notas,
    this.creadoEn,
  });

  Cultivo copyWith({
    String? nombre,
    String? variedad,
    String? loteId,
    DateTime? fechaSiembra,
    DateTime? fechaCosechaEstimada,
    double? areaHectareas,
    EstadoCultivo? estado,
    double? rendimientoEsperadoKgHa,
    String? notas,
  }) {
    return Cultivo(
      id: id,
      nombre: nombre ?? this.nombre,
      variedad: variedad ?? this.variedad,
      loteId: loteId ?? this.loteId,
      fechaSiembra: fechaSiembra ?? this.fechaSiembra,
      fechaCosechaEstimada: fechaCosechaEstimada ?? this.fechaCosechaEstimada,
      areaHectareas: areaHectareas ?? this.areaHectareas,
      estado: estado ?? this.estado,
      rendimientoEsperadoKgHa:
          rendimientoEsperadoKgHa ?? this.rendimientoEsperadoKgHa,
      notas: notas ?? this.notas,
      creadoEn: creadoEn,
    );
  }
}
