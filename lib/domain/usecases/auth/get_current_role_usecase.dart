import '../../../core/constants/app_roles.dart';
import '../../repositories/auth_repository.dart';

class GetCurrentRoleUsecase {
  final AuthRepository _repository;

  GetCurrentRoleUsecase(this._repository);

  Future<AppRole?> call() => _repository.getCurrentUserRole();
}
