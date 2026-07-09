import '../../entities/suelo_analisis.dart';
import '../../entities/plaga_registro.dart';

class Recomendacion {
  final String titulo;
  final String descripcion;
  final String prioridad; // Alta / Media / Baja

  const Recomendacion({
    required this.titulo,
    required this.descripcion,
    required this.prioridad,
  });
}

/// Motor de recomendaciones basado en reglas de negocio (heurísticas
/// agronómicas simples), no en un modelo entrenado.
class GenerarRecomendacionesUsecase {
  List<Recomendacion> porAnalisisSuelo(SueloAnalisis analisis) {
    final recomendaciones = <Recomendacion>[];

    if (analisis.ph < 5.5) {
      recomendaciones.add(const Recomendacion(
        titulo: 'Corregir acidez del suelo',
        descripcion:
            'El pH es bajo (suelo ácido). Se recomienda aplicar cal agrícola '
            'para elevar el pH a un rango óptimo (6.0-7.0).',
        prioridad: 'Alta',
      ));
    } else if (analisis.ph > 7.5) {
      recomendaciones.add(const Recomendacion(
        titulo: 'Corregir alcalinidad del suelo',
        descripcion:
            'El pH es alto (suelo alcalino). Se recomienda aplicar azufre '
            'elemental o materia orgánica para reducir el pH.',
        prioridad: 'Media',
      ));
    }

    if (analisis.materiaOrganicaPorcentaje < 2) {
      recomendaciones.add(const Recomendacion(
        titulo: 'Incrementar materia orgánica',
        descripcion:
            'Niveles bajos de materia orgánica. Se recomienda incorporar '
            'compost o abono orgánico antes de la próxima siembra.',
        prioridad: 'Alta',
      ));
    }

    if (analisis.nitrogenoPpm < 20) {
      recomendaciones.add(const Recomendacion(
        titulo: 'Fertilización nitrogenada',
        descripcion:
            'Nivel de nitrógeno bajo. Se recomienda aplicar fertilizante '
            'nitrogenado según la etapa fenológica del cultivo.',
        prioridad: 'Media',
      ));
    }

    if (analisis.fosforoPpm < 15) {
      recomendaciones.add(const Recomendacion(
        titulo: 'Fertilización fosfatada',
        descripcion:
            'Nivel de fósforo bajo, puede afectar el desarrollo radicular. '
            'Se recomienda aplicar fertilizante fosfatado.',
        prioridad: 'Media',
      ));
    }

    if (recomendaciones.isEmpty) {
      recomendaciones.add(const Recomendacion(
        titulo: 'Suelo en condiciones adecuadas',
        descripcion:
            'Los parámetros analizados están dentro de rangos aceptables. '
            'Se recomienda mantenimiento preventivo regular.',
        prioridad: 'Baja',
      ));
    }

    return recomendaciones;
  }

  List<Recomendacion> porRiesgoPlaga(PlagaRegistro plaga) {
    switch (plaga.nivelRiesgo) {
      case NivelRiesgoPlaga.critico:
        return [
          const Recomendacion(
            titulo: 'Intervención inmediata requerida',
            descripcion:
                'Nivel de riesgo crítico. Se recomienda aplicar tratamiento '
                'fitosanitario de forma inmediata y aislar el área afectada.',
            prioridad: 'Alta',
          ),
        ];
      case NivelRiesgoPlaga.alto:
        return [
          const Recomendacion(
            titulo: 'Tratamiento fitosanitario urgente',
            descripcion:
                'Nivel de riesgo alto. Programar aplicación de tratamiento '
                'en las próximas 48 horas para evitar propagación.',
            prioridad: 'Alta',
          ),
        ];
      case NivelRiesgoPlaga.medio:
        return [
          const Recomendacion(
            titulo: 'Monitoreo cercano',
            descripcion:
                'Nivel de riesgo medio. Intensificar monitoreo del área '
                'afectada y evaluar tratamiento preventivo.',
            prioridad: 'Media',
          ),
        ];
      case NivelRiesgoPlaga.bajo:
        return [
          const Recomendacion(
            titulo: 'Monitoreo rutinario',
            descripcion:
                'Nivel de riesgo bajo. Continuar con el monitoreo rutinario '
                'del cultivo.',
            prioridad: 'Baja',
          ),
        ];
    }
  }
}
