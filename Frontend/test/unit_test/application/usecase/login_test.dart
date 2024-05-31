// test/application/usecases/login_usecase_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:newcompiled/domain/repositories/auth_repository.dart';
import 'package:newcompiled/application/usecases/login_usecase.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository mockAuthRepository;
  late LoginUseCase loginUseCase;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    loginUseCase = LoginUseCase(mockAuthRepository);
  });

  test('should login with the given email and password', () async {
    // Arrange
    const email = 'test@example.com';
    const password = 'password123';
    when(mockAuthRepository.login(email, password))
        .thenAnswer((_) async => Future.value());

    // Act
    await loginUseCase.login(email, password);

    // Assert
    verify(mockAuthRepository.login(email, password)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });
}
