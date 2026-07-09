enum TipoAlerta { climatica, plaga, riego, rendimiento, sistema }

enum SeveridadAlerta { info, advertencia, critica }

extension TipoAlertaX on TipoAlerta {
  String get label {
    switch (this) {
      case TipoAlerta.climatica:
        return 'Climática';
      case TipoAlerta.plaga:
        return 'Plaga';
      case TipoAlerta.riego:
        return 'Riego';
      case TipoAlerta.rendimiento:
        return 'Rendimiento';
      case TipoAlerta.sistema:
        return 'Sistema';
    }
  }

  String get value => name;

  static TipoAlerta fromValue(String value) {
    return TipoAlerta.values.firstWhere(
      (e) => e.value == value,
      orElse: () => TipoAlerta.sistema,
    );
  }
}

extension SeveridadAlertaX on SeveridadAlerta {
  String get label {
    switch (this) {
      case SeveridadAlerta.info:
        return 'Informativa';
      case SeveridadAlerta.advertencia:
        return 'Advertencia';
      case SeveridadAlerta.critica:
        return 'Crítica';
    }
  }

  String get value => name;

  static SeveridadAlerta fromValue(String value) {
    return SeveridadAlerta.values.firstWhere(
      (e) => e.value == value,
      orElse: () => SeveridadAlerta.info,
    );
  }
}

/// Alerta generada por el motor de reglas (agroclimática o de riesgo),
/// no proviene de un modelo ML real, sino de heurísticas definidas en
/// `domain/usecases/analitico/generar_alertas_usecase.dart`.
class Alerta {
  final String id;
  final TipoAlerta tipo;
  final SeveridadAlerta severidad;
  final String titulo;
  final String mensaje;
  final String? loteId;
  final String? cultivoId;
  final bool leida;
  final DateTime fecha;

  const Alerta({
    required this.id,
    required this.tipo,
    required this.severidad,
    required this.titulo,
    required this.mensaje,
    this.loteId,
    this.cultivoId,
    this.leida = false,
    required this.fecha,
  });
}
