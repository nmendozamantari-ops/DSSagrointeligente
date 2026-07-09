import '../../../core/constants/app_roles.dart';
import '../../repositories/auth_repository.dart';

class RegisterUsecase {
  final AuthRepository _repository;

  RegisterUsecase(this._repository);

  Future<void> call({
    required String email,
    required String password,
    required String fullName,
    required AppRole role,
  }) {
    return _repository.register(
      email: email,
      password: password,
      fullName: fullName,
      role: role,
    );
  }
}
