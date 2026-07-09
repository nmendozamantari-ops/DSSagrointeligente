/// Roles de usuario definidos en el esquema del DSS AgroInteligente 4.0
enum AppRole {
  administradorCultivos,
  agronomoEspecialista,
  operadorCampo,
  analistaDatos,
  gerenteGeneral,
  productorAsociado,
}

extension AppRoleX on AppRole {
  /// Valor guardado en Firestore (users/{uid}.role)
  String get value {
    switch (this) {
      case AppRole.administradorCultivos:
        return 'administrador_cultivos';
      case AppRole.agronomoEspecialista:
        return 'agronomo_especialista';
      case AppRole.operadorCampo:
        return 'operador_campo';
      case AppRole.analistaDatos:
        return 'analista_datos';
      case AppRole.gerenteGeneral:
        return 'gerente_general';
      case AppRole.productorAsociado:
        return 'productor_asociado';
    }
  }

  /// Nombre legible para mostrar en UI
  String get label {
    switch (this) {
      case AppRole.administradorCultivos:
        return 'Administrador de Cultivos';
      case AppRole.agronomoEspecialista:
        return 'Agrónomo Especialista';
      case AppRole.operadorCampo:
        return 'Operador de Campo';
      case AppRole.analistaDatos:
        return 'Analista de Datos';
      case AppRole.gerenteGeneral:
        return 'Gerente General';
      case AppRole.productorAsociado:
        return 'Productor Asociado';
    }
  }

  static AppRole fromValue(String value) {
    return AppRole.values.firstWhere(
      (r) => r.value == value,
      orElse: () => AppRole.operadorCampo,
    );
  }
}

/// Features/módulos del sistema, usados para permisos por rol
enum AppFeature {
  gestionCultivos,
  monitoreoClimatico,
  manejoSuelos,
  riesgoPlagas,
  riegoInteligente,
  cosechaProduccion,
  comercializacion,
  alertas,
  prediccionRendimiento,
  recomendaciones,
  optimizacionRecursos,
  analisisRentabilidad,
  reportesDashboards,
  auditoria,
  gestionUsuarios,
}

/// Matriz de permisos: qué features puede ver cada rol.
/// Ajustable según reglas de negocio reales del cliente.
class RolePermissions {
  RolePermissions._();

  static const Map<AppRole, Set<AppFeature>> _matrix = {
    AppRole.gerenteGeneral: {
      // Ve todo
      AppFeature.gestionCultivos,
      AppFeature.monitoreoClimatico,
      AppFeature.manejoSuelos,
      AppFeature.riesgoPlagas,
      AppFeature.riegoInteligente,
      AppFeature.cosechaProduccion,
      AppFeature.comercializacion,
      AppFeature.alertas,
      AppFeature.prediccionRendimiento,
      AppFeature.recomendaciones,
      AppFeature.optimizacionRecursos,
      AppFeature.analisisRentabilidad,
      AppFeature.reportesDashboards,
      AppFeature.auditoria,
      AppFeature.gestionUsuarios,
    },
    AppRole.administradorCultivos: {
      AppFeature.gestionCultivos,
      AppFeature.monitoreoClimatico,
      AppFeature.manejoSuelos,
      AppFeature.riesgoPlagas,
      AppFeature.riegoInteligente,
      AppFeature.cosechaProduccion,
      AppFeature.alertas,
      AppFeature.prediccionRendimiento,
      AppFeature.recomendaciones,
      AppFeature.optimizacionRecursos,
      AppFeature.reportesDashboards,
    },
    AppRole.agronomoEspecialista: {
      AppFeature.gestionCultivos,
      AppFeature.monitoreoClimatico,
      AppFeature.manejoSuelos,
      AppFeature.riesgoPlagas,
      AppFeature.riegoInteligente,
      AppFeature.alertas,
      AppFeature.prediccionRendimiento,
      AppFeature.recomendaciones,
      AppFeature.reportesDashboards,
    },
    AppRole.operadorCampo: {
      // No ve rentabilidad, según lo indicado
      AppFeature.gestionCultivos,
      AppFeature.monitoreoClimatico,
      AppFeature.manejoSuelos,
      AppFeature.riesgoPlagas,
      AppFeature.riegoInteligente,
      AppFeature.cosechaProduccion,
      AppFeature.alertas,
    },
    AppRole.analistaDatos: {
      AppFeature.alertas,
      AppFeature.prediccionRendimiento,
      AppFeature.recomendaciones,
      AppFeature.optimizacionRecursos,
      AppFeature.analisisRentabilidad,
      AppFeature.reportesDashboards,
    },
    AppRole.productorAsociado: {
      AppFeature.gestionCultivos,
      AppFeature.cosechaProduccion,
      AppFeature.comercializacion,
      AppFeature.analisisRentabilidad,
      AppFeature.reportesDashboards,
    },
  };

  static Set<AppFeature> featuresFor(AppRole role) =>
      _matrix[role] ?? <AppFeature>{};

  static bool canAccess(AppRole role, AppFeature feature) =>
      featuresFor(role).contains(feature);
}
