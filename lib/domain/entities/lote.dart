class Lote {
  final String id;
  final String nombre;
  final double areaHectareas;
  final String? ubicacion;
  final double? latitud;
  final double? longitud;
  final String? tipoSuelo;
  final bool activo;
  final DateTime? creadoEn;

  const Lote({
    required this.id,
    required this.nombre,
    required this.areaHectareas,
    this.ubicacion,
    this.latitud,
    this.longitud,
    this.tipoSuelo,
    this.activo = true,
    this.creadoEn,
  });

  Lote copyWith({
    String? nombre,
    double? areaHectareas,
    String? ubicacion,
    double? latitud,
    double? longitud,
    String? tipoSuelo,
    bool? activo,
  }) {
    return Lote(
      id: id,
      nombre: nombre ?? this.nombre,
      areaHectareas: areaHectareas ?? this.areaHectareas,
      ubicacion: ubicacion ?? this.ubicacion,
      latitud: latitud ?? this.latitud,
      longitud: longitud ?? this.longitud,
      tipoSuelo: tipoSuelo ?? this.tipoSuelo,
      activo: activo ?? this.activo,
      creadoEn: creadoEn,
    );
  }
}
