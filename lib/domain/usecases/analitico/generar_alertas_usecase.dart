import '../../entities/clima_registro.dart';
import '../../entities/plaga_registro.dart';
import '../../entities/suelo_analisis.dart';
import '../../entities/alerta.dart';

/// Motor de alertas basado en reglas (umbrales agronómicos), tal como se
/// definió en el alcance: "sin modelos ML reales entrenados". Genera
/// entidades `Alerta` listas para persistir, no las guarda directamente
/// (eso lo hace el repository desde la capa de presentation/providers).
class GenerarAlertasUsecase {
  List<Alerta> porClima(ClimaRegistro registro) {
    final alertas = <Alerta>[];
    final ahora = DateTime.now();

    if (registro.temperaturaC >= 35) {
      alertas.add(Alerta(
        id: '',
        tipo: TipoAlerta.climatica,
        severidad: SeveridadAlerta.advertencia,
        titulo: 'Temperatura elevada',
        mensaje:
            'Se registró una temperatura de ${registro.temperaturaC}°C en el '
            'lote. Riesgo de estrés térmico para el cultivo.',
        loteId: registro.loteId,
        fecha: ahora,
      ));
    }

    if (registro.temperaturaC <= 2) {
      alertas.add(Alerta(
        id: '',
        tipo: TipoAlerta.climatica,
        severidad: SeveridadAlerta.critica,
        titulo: 'Riesgo de helada',
        mensaje:
            'Temperatura de ${registro.temperaturaC}°C detectada. Riesgo '
            'crítico de helada para el cultivo.',
        loteId: registro.loteId,
        fecha: ahora,
      ));
    }

    if (registro.precipitacionMm >= 50) {
      alertas.add(Alerta(
        id: '',
        tipo: TipoAlerta.climatica,
        severidad: SeveridadAlerta.advertencia,
        titulo: 'Lluvia intensa registrada',
        mensaje:
            'Se registraron ${registro.precipitacionMm} mm de precipitación. '
            'Evaluar riesgo de encharcamiento o erosión.',
        loteId: registro.loteId,
        fecha: ahora,
      ));
    }

    if (registro.humedadPorcentaje >= 85) {
      alertas.add(Alerta(
        id: '',
        tipo: TipoAlerta.climatica,
        severidad: SeveridadAlerta.info,
        titulo: 'Humedad relativa alta',
        mensaje:
            'Humedad relativa de ${registro.humedadPorcentaje}%. Condición '
            'favorable para el desarrollo de hongos; monitorear el cultivo.',
        loteId: registro.loteId,
        fecha: ahora,
      ));
    }

    return alertas;
  }

  List<Alerta> porPlaga(PlagaRegistro registro) {
    if (registro.resuelto) return [];

    final ahora = DateTime.now();
    SeveridadAlerta severidad;
    switch (registro.nivelRiesgo) {
      case NivelRiesgoPlaga.critico:
        severidad = SeveridadAlerta.critica;
        break;
      case NivelRiesgoPlaga.alto:
        severidad = SeveridadAlerta.advertencia;
        break;
      default:
        severidad = SeveridadAlerta.info;
    }

    return [
      Alerta(
        id: '',
        tipo: TipoAlerta.plaga,
        severidad: severidad,
        titulo: 'Detección: ${registro.nombrePlaga}',
        mensaje:
            'Riesgo ${registro.nivelRiesgo.label.toLowerCase()} detectado en '
            'el cultivo. Revisar tratamiento recomendado.',
        loteId: registro.loteId,
        cultivoId: registro.cultivoId,
        fecha: ahora,
      ),
    ];
  }

  List<Alerta> porSuelo(SueloAnalisis analisis) {
    final alertas = <Alerta>[];
    final ahora = DateTime.now();

    if (analisis.ph < 5.0 || analisis.ph > 8.0) {
      alertas.add(Alerta(
        id: '',
        tipo: TipoAlerta.sistema,
        severidad: SeveridadAlerta.advertencia,
        titulo: 'pH del suelo fuera de rango',
        mensaje:
            'El pH (${analisis.ph}) está muy alejado del rango óptimo (6.0-7.0). '
            'Se recomienda corrección antes de la siembra.',
        loteId: analisis.loteId,
        fecha: ahora,
      ));
    }

    return alertas;
  }
}
