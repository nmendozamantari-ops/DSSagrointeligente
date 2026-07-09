import '../../entities/cosecha.dart';
import '../../entities/venta.dart';
import '../../entities/insumo_aplicacion.dart';

class ReporteRentabilidad {
  final double ingresoTotal;
  final double costoTotalInsumos;
  final double costoProduccionCosechas;
  final double costoTotal;
  final double utilidadNeta;
  final double margenPorcentaje;
  final double rentabilidadPorHectarea;
  final double areaHectareas;

  const ReporteRentabilidad({
    required this.ingresoTotal,
    required this.costoTotalInsumos,
    required this.costoProduccionCosechas,
    required this.costoTotal,
    required this.utilidadNeta,
    required this.margenPorcentaje,
    required this.rentabilidadPorHectarea,
    required this.areaHectareas,
  });

  bool get esRentable => utilidadNeta > 0;
}

/// Calcula rentabilidad por cultivo/hectárea: costos (insumos + producción)
/// vs ingresos (ventas). Cálculo determinístico, no heurístico.
class CalcularRentabilidadUsecase {
  ReporteRentabilidad call({
    required List<Venta> ventas,
    required List<Cosecha> cosechas,
    required List<InsumoAplicacion> insumos,
    required double areaHectareas,
  }) {
    final ingresoTotal = ventas.fold<double>(0, (sum, v) => sum + v.total);

    final costoInsumos =
        insumos.fold<double>(0, (sum, i) => sum + i.costoTotal);

    final costoProduccion = cosechas.fold<double>(
      0,
      (sum, c) => sum + (c.costoProduccionTotal ?? 0),
    );

    final costoTotal = costoInsumos + costoProduccion;
    final utilidad = ingresoTotal - costoTotal;
    final margen = ingresoTotal > 0 ? (utilidad / ingresoTotal) * 100 : 0.0;
    final rentabilidadHa = areaHectareas > 0 ? utilidad / areaHectareas : 0.0;

    return ReporteRentabilidad(
      ingresoTotal: ingresoTotal,
      costoTotalInsumos: costoInsumos,
      costoProduccionCosechas: costoProduccion,
      costoTotal: costoTotal,
      utilidadNeta: utilidad,
      margenPorcentaje: margen,
      rentabilidadPorHectarea: rentabilidadHa,
      areaHectareas: areaHectareas,
    );
  }
}
