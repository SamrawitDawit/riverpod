// domain/auth_repository.dart
import 'package:newcompiled/domain/entitites/auth.dart';

abstract class AuthRepository {
  Future<Auth> login(String email, String password);
  Future<Auth> signUp(String name, String email, String password, String role);
}
