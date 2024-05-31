// Infrastructure/repositories/user_repository_impl.dart
import 'package:newcompiled/Infrastructure/data_sources/user_data_source.dart';

class UserRepositoryImpl {
  final UserDataSource userDataSource;

  UserRepositoryImpl(this.userDataSource);

  Future<String> getUserName(String userId) async {
    return await userDataSource.getUserName(userId);
  }
}
