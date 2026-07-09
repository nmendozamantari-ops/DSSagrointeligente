/// Nombres de colecciones de Firestore (Data Warehouse Agro del esquema).
/// Centralizado para evitar strings mágicos repartidos en repositories.
class FirestoreCollections {
  FirestoreCollections._();

  static const String usuarios = 'usuarios';
  static const String cultivos = 'cultivos';
  static const String lotes = 'lotes';
  static const String climaRegistros = 'clima_registros';
  static const String sueloAnalisis = 'suelo_analisis';
  static const String plagasRegistros = 'plagas_registros';
  static const String riegoRegistros = 'riego_registros';
  static const String cosechas = 'cosechas';
  static const String ventas = 'ventas';
  static const String clientes = 'clientes';
  static const String proveedores = 'proveedores';
  static const String insumosAplicaciones = 'insumos_aplicaciones';
  static const String auditoriaLogs = 'auditoria_logs';
  static const String alertas = 'alertas';
}

/// Nombres de carpetas raíz en Firebase Storage
class StoragePaths {
  StoragePaths._();

  static const String fotosCultivos = 'fotos_cultivos';
  static const String fotosPlagas = 'fotos_plagas';
  static const String fotosSuelo = 'fotos_suelo';
  static const String comprobantesVenta = 'comprobantes_venta';
  static const String avatares = 'avatares';
}
