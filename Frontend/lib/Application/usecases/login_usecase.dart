// lib/application/usecases/login_usecase.dart
import 'package:newcompiled/domain/repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  Future<void> login(String email, String password) {
    return authRepository.login(email, password);
  }
}
