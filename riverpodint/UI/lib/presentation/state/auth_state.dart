// presentation/state/auth_state.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newcompiled/Application/services/auth_service.dart';
import 'package:newcompiled/Infrastructure/providers/providers.dart';


class AuthState {
  final bool isLoading;
  final String? errorMessage;

  AuthState({this.isLoading = false, this.errorMessage});
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthService _authService;

  AuthNotifier(this._authService) : super(AuthState());

  Future<void> login(String email, String password, Function(String, bool, String) onSuccess) async {
    state = AuthState(isLoading: true);
    try {
      final auth = await _authService.login(email, password);
      onSuccess(auth.token, auth.isPharmacist, auth.id);
    } catch (e) {
      state = AuthState(errorMessage: e.toString());
    } finally {
      state = AuthState(isLoading: false);
    }
  }

  Future<void> signUp(String name, String email, String password, String role, Function(String, bool, String) onSuccess) async {
    state = AuthState(isLoading: true);
    try {
      final auth = await _authService.signUp(name, email, password, role);
      onSuccess(auth.token, auth.isPharmacist, auth.id);
    } catch (e) {
      state = AuthState(errorMessage: e.toString());
    } finally {
      state = AuthState(isLoading: false);
    }
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref.read(authServiceProvider));
});
