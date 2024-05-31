// application/auth_service.dart
import 'package:newcompiled/domain/entitites/auth.dart';
import 'package:newcompiled/domain/repositories/auth_repository.dart';


class AuthService {
  final AuthRepository _authRepository;

  AuthService(this._authRepository);

  Future<Auth> login(String email, String password) {
    return _authRepository.login(email, password);
  }

  Future<Auth> signUp(String name, String email, String password, String role) {
    return _authRepository.signUp(name, email, password, role);
  }
}
