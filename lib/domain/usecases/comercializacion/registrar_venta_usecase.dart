import '../../entities/venta.dart';
import '../../repositories/venta_repository.dart';

class RegistrarVentaUsecase {
  final VentaRepository _repository;

  RegistrarVentaUsecase(this._repository);

  Future<String> call(Venta venta) {
    if (venta.cantidadKg <= 0) {
      throw ArgumentError('La cantidad vendida debe ser mayor a 0');
    }
    if (venta.precioUnitario <= 0) {
      throw ArgumentError('El precio unitario debe ser mayor a 0');
    }
    return _repository.create(venta);
  }
}

class ObtenerVentasUsecase {
  final VentaRepository _repository;

  ObtenerVentasUsecase(this._repository);

  Stream<List<Venta>> call() => _repository.watchAll();

  Stream<List<Venta>> porCliente(String clienteId) =>
      _repository.watchByCliente(clienteId);
}
