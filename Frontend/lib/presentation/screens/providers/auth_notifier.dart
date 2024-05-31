// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class AuthState {
//   final bool isLoading;
//   final String? errorMessage;
//
//   AuthState({this.isLoading = false, this.errorMessage});
// }
//
// class AuthNotifier extends StateNotifier<AuthState> {
//   AuthNotifier() : super(AuthState());
//
//   Future<void> login(String email, String password, Function(String, bool, String) onSuccess) async {
//     state = AuthState(isLoading: true);
//     try {
//       final response = await http.post(
//         Uri.parse('http://10.0.2.2:3000/auth/login'),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: jsonEncode(<String, String>{
//           'email': email,
//           'password': password,
//         }),
//       );
//
//       if (response.statusCode == 201) {
//         final Map<String, dynamic> data = jsonDecode(response.body);
//
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         await prefs.setString('auth_token', data['token']);
//         bool role = data['Role'] == 'Pharmacist';
//         String id = data['id'];
//
//         onSuccess(data['token'], role, id);
//       } else {
//         state = AuthState(errorMessage: 'Invalid email or password.');
//       }
//     } catch (e) {
//       state = AuthState(errorMessage: e.toString());
//     } finally {
//       state = AuthState(isLoading: false);
//     }
//   }
//
//   Future<void> signUp(String name, String email, String password, String role, Function(String, bool, String) onSuccess) async {
//     state = AuthState(isLoading: true);
//     try {
//       final response = await http.post(
//         Uri.parse('http://10.0.2.2:3000/auth/signup'),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: jsonEncode(<String, String>{
//           'name': name,
//           'email': email,
//           'password': password,
//           'role': role,
//         }),
//       );
//
//       if (response.statusCode == 201) {
//         final Map<String, dynamic> data = jsonDecode(response.body);
//         bool isPharmacist = role == 'Pharmacist';
//         String id = data['id'];
//         onSuccess(data['token'], isPharmacist, id);
//       } else {
//         state = AuthState(errorMessage: 'Signup failed.');
//       }
//     } catch (e) {
//       state = AuthState(errorMessage: e.toString());
//     } finally {
//       state = AuthState(isLoading: false);
//     }
//   }
// }
//
// final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
//   return AuthNotifier();
// });
