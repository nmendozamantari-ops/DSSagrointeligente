import '../../entities/cliente.dart';
import '../../repositories/cliente_repository.dart';

class RegistrarClienteUsecase {
  final ClienteRepository _repository;

  RegistrarClienteUsecase(this._repository);

  Future<String> call(Cliente cliente) {
    if (cliente.nombre.trim().isEmpty) {
      throw ArgumentError('El nombre del cliente es requerido');
    }
    return _repository.create(cliente);
  }
}

class ObtenerClientesUsecase {
  final ClienteRepository _repository;

  ObtenerClientesUsecase(this._repository);

  Stream<List<Cliente>> call() => _repository.watchAll();
}
