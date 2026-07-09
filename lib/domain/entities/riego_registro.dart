enum MetodoRiego { goteo, aspersion, gravedad, manual }

extension MetodoRiegoX on MetodoRiego {
  String get label {
    switch (this) {
      case MetodoRiego.goteo:
        return 'Goteo';
      case MetodoRiego.aspersion:
        return 'Aspersión';
      case MetodoRiego.gravedad:
        return 'Gravedad';
      case MetodoRiego.manual:
        return 'Manual';
    }
  }

  String get value => name;

  static MetodoRiego fromValue(String value) {
    return MetodoRiego.values.firstWhere(
      (e) => e.value == value,
      orElse: () => MetodoRiego.manual,
    );
  }
}

class RiegoRegistro {
  final String id;
  final String loteId;
  final String? cultivoId;
  final DateTime fecha;
  final double volumenAguaLitros;
  final MetodoRiego metodo;
  final int duracionMinutos;
  final bool programado;
  final String? notas;
  final DateTime? creadoEn;

  const RiegoRegistro({
    required this.id,
    required this.loteId,
    this.cultivoId,
    required this.fecha,
    required this.volumenAguaLitros,
    required this.metodo,
    required this.duracionMinutos,
    this.programado = false,
    this.notas,
    this.creadoEn,
  });
}
