import '../../entities/cosecha.dart';

/// Resultado de la predicción de rendimiento
class PrediccionRendimiento {
  final double rendimientoEstimadoKgHa;
  final double tendenciaPorcentaje; // + o - respecto al histórico
  final String metodologia;
  final int cosechasAnalizadas;

  const PrediccionRendimiento({
    required this.rendimientoEstimadoKgHa,
    required this.tendenciaPorcentaje,
    required this.metodologia,
    required this.cosechasAnalizadas,
  });
}

/// Predicción de rendimiento basada en reglas/heurísticas (promedios
/// históricos y tendencia simple), NO en un modelo de Machine Learning
/// entrenado. Esto cumple con el "Motor Analítico" del esquema dentro
/// del alcance de una app de gestión (sin ML real).
class PredecirRendimientoUsecase {
  /// [cosechasHistoricas] deben venir ordenadas de más antigua a más reciente
  /// y pertenecer al mismo cultivo/lote para que la predicción tenga sentido.
  PrediccionRendimiento call({
    required List<Cosecha> cosechasHistoricas,
    required double areaHectareas,
  }) {
    if (cosechasHistoricas.isEmpty || areaHectareas <= 0) {
      return const PrediccionRendimiento(
        rendimientoEstimadoKgHa: 0,
        tendenciaPorcentaje: 0,
        metodologia: 'Sin datos históricos suficientes',
        cosechasAnalizadas: 0,
      );
    }

    final rendimientosPorHa =
        cosechasHistoricas.map((c) => c.cantidadKg / areaHectareas).toList();

    final promedio =
        rendimientosPorHa.reduce((a, b) => a + b) / rendimientosPorHa.length;

    double tendencia = 0;
    if (rendimientosPorHa.length >= 2) {
      final primero = rendimientosPorHa.first;
      final ultimo = rendimientosPorHa.last;
      if (primero > 0) {
        tendencia = ((ultimo - primero) / primero) * 100;
      }
    }

    // Ajuste simple: proyectamos el promedio ponderado por la tendencia
    final estimado = promedio * (1 + (tendencia / 100) * 0.3);

    return PrediccionRendimiento(
      rendimientoEstimadoKgHa: estimado.clamp(0, double.infinity),
      tendenciaPorcentaje: tendencia,
      metodologia:
          'Promedio histórico ponderado por tendencia (${rendimientosPorHa.length} cosechas)',
      cosechasAnalizadas: rendimientosPorHa.length,
    );
  }
}
