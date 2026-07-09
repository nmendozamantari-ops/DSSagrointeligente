/// Representa un lote candidato a recibir recursos (agua/insumos)
class LoteRecurso {
  final String loteId;
  final String nombreLote;
  final double areaHectareas;

  /// 0 (muy húmedo / sin estrés) a 100 (muy seco / estrés alto)
  final double indiceEstresHidrico;

  /// 0 (bajo valor) a 100 (alto valor, ej. cultivo de alto rendimiento/precio)
  final double prioridadCultivo;

  const LoteRecurso({
    required this.loteId,
    required this.nombreLote,
    required this.areaHectareas,
    required this.indiceEstresHidrico,
    required this.prioridadCultivo,
  });
}

class AsignacionRecurso {
  final String loteId;
  final String nombreLote;
  final double litrosAsignados;
  final double porcentajeDelTotal;
  final String justificacion;

  const AsignacionRecurso({
    required this.loteId,
    required this.nombreLote,
    required this.litrosAsignados,
    required this.porcentajeDelTotal,
    required this.justificacion,
  });
}

/// Optimización de recursos por reglas: distribuye un volumen total de agua
/// (u otro insumo, en las mismas unidades) proporcionalmente al estrés
/// hídrico y la prioridad del cultivo de cada lote. Es una heurística de
/// asignación ponderada, no un solver de optimización matemática (LP/MILP).
class OptimizarRecursosUsecase {
  List<AsignacionRecurso> call({
    required List<LoteRecurso> lotes,
    required double volumenTotalDisponible,
  }) {
    if (lotes.isEmpty || volumenTotalDisponible <= 0) return [];

    // Peso = 60% estrés hídrico + 40% prioridad del cultivo, ponderado por área
    final pesos = <String, double>{};
    double sumaPesos = 0;

    for (final lote in lotes) {
      final peso = (lote.indiceEstresHidrico * 0.6 +
              lote.prioridadCultivo * 0.4) *
          lote.areaHectareas;
      pesos[lote.loteId] = peso;
      sumaPesos += peso;
    }

    if (sumaPesos == 0) {
      // Reparto equitativo si no hay diferencias significativas
      final partesIguales = volumenTotalDisponible / lotes.length;
      return lotes
          .map((l) => AsignacionRecurso(
                loteId: l.loteId,
                nombreLote: l.nombreLote,
                litrosAsignados: partesIguales,
                porcentajeDelTotal: 100 / lotes.length,
                justificacion: 'Reparto equitativo (sin datos de estrés/prioridad)',
              ))
          .toList();
    }

    return lotes.map((lote) {
      final peso = pesos[lote.loteId]!;
      final proporcion = peso / sumaPesos;
      final litros = volumenTotalDisponible * proporcion;

      String justificacion;
      if (lote.indiceEstresHidrico >= 70) {
        justificacion = 'Prioridad alta por estrés hídrico crítico';
      } else if (lote.prioridadCultivo >= 70) {
        justificacion = 'Prioridad alta por valor del cultivo';
      } else {
        justificacion = 'Asignación proporcional estándar';
      }

      return AsignacionRecurso(
        loteId: lote.loteId,
        nombreLote: lote.nombreLote,
        litrosAsignados: litros,
        porcentajeDelTotal: proporcion * 100,
        justificacion: justificacion,
      );
    }).toList()
      ..sort((a, b) => b.litrosAsignados.compareTo(a.litrosAsignados));
  }
}
