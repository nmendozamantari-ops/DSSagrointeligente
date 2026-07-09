/// Strings centralizados de la app.
/// (Si más adelante quieren internacionalización con flutter_intl/easy_localization,
/// esta clase sirve como paso intermedio antes de migrar a archivos .arb)
class AppStrings {
  AppStrings._();

  static const String appName = 'AgroInteligente 4.0';
  static const String appTagline =
      'Sistema de Soporte de Decisiones para gestión agrícola';

  // Auth
  static const String login = 'Iniciar sesión';
  static const String register = 'Registrarse';
  static const String email = 'Correo electrónico';
  static const String password = 'Contraseña';
  static const String confirmPassword = 'Confirmar contraseña';
  static const String fullName = 'Nombre completo';
  static const String selectRole = 'Selecciona tu rol';
  static const String logout = 'Cerrar sesión';
  static const String forgotPassword = '¿Olvidaste tu contraseña?';
  static const String noAccount = '¿No tienes cuenta? Regístrate';
  static const String hasAccount = '¿Ya tienes cuenta? Inicia sesión';

  // Dashboard / módulos
  static const String dashboard = 'Panel principal';
  static const String moduloOperativo = 'Gestión Operativa';
  static const String moduloAnalitico = 'Módulo Analítico';

  static const String gestionCultivos = 'Gestión de Cultivos';
  static const String monitoreoClimatico = 'Monitoreo Climático';
  static const String manejoSuelos = 'Manejo de Suelos';
  static const String riesgoPlagas = 'Riesgo de Plagas y Enfermedades';
  static const String riegoInteligente = 'Riego Inteligente';
  static const String cosechaProduccion = 'Cosecha y Producción';
  static const String comercializacion = 'Comercialización';
  static const String auditoriaTrazabilidad = 'Auditoría y Trazabilidad';

  static const String alertas = 'Alertas Agroclimáticas y de Riesgo';
  static const String prediccionRendimiento = 'Predicción de Rendimiento';
  static const String recomendaciones = 'Recomendaciones de Insumos y Tratamientos';
  static const String optimizacionRecursos = 'Optimización de Recursos';
  static const String analisisRentabilidad = 'Análisis de Rentabilidad';
  static const String reportesDashboards = 'Reportes y Dashboards';

  // Genéricos CRUD
  static const String guardar = 'Guardar';
  static const String cancelar = 'Cancelar';
  static const String eliminar = 'Eliminar';
  static const String editar = 'Editar';
  static const String agregar = 'Agregar';
  static const String buscar = 'Buscar';
  static const String filtrar = 'Filtrar';
  static const String verDetalle = 'Ver detalle';
  static const String confirmarEliminar = '¿Seguro que deseas eliminar este registro?';
  static const String sinRegistros = 'No hay registros aún';
  static const String cargando = 'Cargando...';
  static const String errorGenerico = 'Ocurrió un error. Intenta nuevamente.';
  static const String operacionExitosa = 'Operación realizada con éxito';
  static const String campoRequerido = 'Este campo es requerido';
  static const String correoInvalido = 'Ingresa un correo válido';
  static const String contrasenaCorta = 'La contraseña debe tener al menos 6 caracteres';
  static const String contrasenasNoCoinciden = 'Las contraseñas no coinciden';
}
