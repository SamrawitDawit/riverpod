abstract class AuthServiceInterface {
  Future<String> login(String email, String password);
  Future<void> signUp(String name, String email, String password, String role);
}
