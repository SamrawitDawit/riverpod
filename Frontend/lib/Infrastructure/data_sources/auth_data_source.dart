// infrastructure/auth_data_source.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthDataSource {
  Future<Map<String, dynamic>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:3000/auth/login'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<Map<String, dynamic>> signUp(String name, String email, String password, String role) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:3000/auth/signup'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode({'name': name, 'email': email, 'password': password, 'role': role}),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to sign up');
    }
  }
}
