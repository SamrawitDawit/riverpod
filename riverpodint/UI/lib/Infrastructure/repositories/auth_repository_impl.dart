// infrastructure/auth_repository_impl.dart
import 'package:newcompiled/Infrastructure/data_sources/auth_data_source.dart';
import 'package:newcompiled/domain/entitites/auth.dart';
import 'package:newcompiled/domain/repositories/auth_repository.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _dataSource;

  AuthRepositoryImpl(this._dataSource);

  @override
  Future<Auth> login(String email, String password) async {
    final data = await _dataSource.login(email, password);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', data['token']);
    bool role = data['Role'] == 'Pharmacist';
    String id = data['id'];
    return Auth(token: data['token'], isPharmacist: role, id: id);
  }

  @override
  Future<Auth> signUp(String name, String email, String password, String role) async {
    final data = await _dataSource.signUp(name, email, password, role);
    bool isPharmacist = role == 'Pharmacist';
    String id = data['id'];
    return Auth(token: data['token'], isPharmacist: isPharmacist, id: id);
  }
}
