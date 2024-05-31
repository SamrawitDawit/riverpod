// Application/usecases/get_user_name.dart
import 'package:newcompiled/Infrastructure/repositories/user_repository_impl.dart';

class GetUserName {
  final UserRepositoryImpl userRepository;

  GetUserName(this.userRepository);

  Future<String> call(String userId) async {
    return await userRepository.getUserName(userId);
  }
}
