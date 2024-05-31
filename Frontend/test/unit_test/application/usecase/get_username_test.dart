

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:newcompiled/Infrastructure/repositories/user_repository_impl.dart';
import 'package:newcompiled/application/usecases/get_user_name.dart';

class MockUserRepository extends Mock implements UserRepositoryImpl {}

void main() {
  late MockUserRepository mockUserRepository;
  late GetUserName getUserName;

  setUp(() {
    mockUserRepository = MockUserRepository();
    getUserName = GetUserName(mockUserRepository);
  });

  test('should get user name from the repositories', () async {
    // Arrange
    const userId = '123';
    const userName = 'John Doe';
    when(mockUserRepository.getUserName(userId))
        .thenAnswer((_) async => userName);

    // Act
    final result = await getUserName(userId);

    // Assert
    expect(result, userName);
    verify(mockUserRepository.getUserName(userId)).called(1);
    verifyNoMoreInteractions(mockUserRepository);
  });
}
