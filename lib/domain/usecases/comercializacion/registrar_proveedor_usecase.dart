import '../../entities/proveedor.dart';
import '../../repositories/proveedor_repository.dart';

class RegistrarProveedorUsecase {
  final ProveedorRepository _repository;

  RegistrarProveedorUsecase(this._repository);

  Future<String> call(Proveedor proveedor) {
    if (proveedor.nombre.trim().isEmpty) {
      throw ArgumentError('El nombre del proveedor es requerido');
    }
    return _repository.create(proveedor);
  }
}

class ObtenerProveedoresUsecase {
  final ProveedorRepository _repository;

  ObtenerProveedoresUsecase(this._repository);

  Stream<List<Proveedor>> call() => _repository.watchAll();
}
