import '../../repositories/auth_repository.dart';

class ResetPasswordUsecase {
  final AuthRepository _repository;

  ResetPasswordUsecase(this._repository);

  Future<void> call(String email) => _repository.resetPassword(email);
}
