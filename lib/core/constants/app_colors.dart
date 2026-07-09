import 'package:flutter/material.dart';

/// Paleta de colores de AgroInteligente 4.0
/// Basada en tonos rosa + blanco, moderada y sin sobrecargar.
class AppColors {
  AppColors._();

  // Rosa principal
  static const Color primary = Color(0xFFF48FB1);
  static const Color primaryDark = Color(0xFFC2185B);
  static const Color primaryLight = Color(0xFFFCE4EC);

  // Acentos
  static const Color accent = Color(0xFFEC407A);
  static const Color accentSoft = Color(0xFFF8BBD0);

  // Fondos
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFFFF5F8);
  static const Color surfaceGrey = Color(0xFFF7F7F7);

  // Texto
  static const Color textPrimary = Color(0xFF2D2D2D);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // Estados / semánticos
  static const Color success = Color(0xFF66BB6A);
  static const Color warning = Color(0xFFFFA726);
  static const Color error = Color(0xFFE53935);
  static const Color info = Color(0xFF42A5F5);

  // Bordes / divisores
  static const Color border = Color(0xFFF0D9E1);
  static const Color divider = Color(0xFFEDEDED);

  // Sombra suave para cards
  static const Color shadow = Color(0x1AF48FB1);

  // Colores por módulo (para íconos/tiles del dashboard tipo Bento Grid)
  static const Color moduloCultivos = Color(0xFFF48FB1);
  static const Color moduloClima = Color(0xFF90CAF9);
  static const Color moduloSuelos = Color(0xFFA1887F);
  static const Color moduloPlagas = Color(0xFFEF9A9A);
  static const Color moduloRiego = Color(0xFF80DEEA);
  static const Color moduloCosecha = Color(0xFFA5D6A7);
  static const Color moduloComercializacion = Color(0xFFFFCC80);
  static const Color moduloAuditoria = Color(0xFFCE93D8);

  static const Color moduloAlertas = Color(0xFFEF5350);
  static const Color moduloPrediccion = Color(0xFFF06292);
  static const Color moduloRecomendaciones = Color(0xFFBA68C8);
  static const Color moduloOptimizacion = Color(0xFF4DB6AC);
  static const Color moduloRentabilidad = Color(0xFF81C784);
  static const Color moduloReportes = Color(0xFF7986CB);

  /// Gradiente suave para headers/cards destacadas
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, accent],
  );
}
