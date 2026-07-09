import '../../core/constants/app_roles.dart';
import '../entities/usuario.dart';

abstract class AuthRepository {
  Stream<bool> get authStateChanges;
  bool get isLoggedIn;

  Future<void> login({required String email, required String password});

  Future<void> register({
    required String email,
    required String password,
    required String fullName,
    required AppRole role,
  });

  Future<void> resetPassword(String email);

  Future<void> logout();

  Future<AppRole?> getCurrentUserRole();

  Future<Usuario?> getCurrentUser();
}
