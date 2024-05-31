import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:newcompiled/domain/entitites/auth.dart';
import 'package:newcompiled/domain/repositories/auth_repository.dart';

// Create a MockAuthRepository class
class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
  });

  test('should login and return an Auth object', () async {
    final email = 'test@example.com';
    final password = 'password123';
    final auth = Auth(token: 'token123', isPharmacist: true, id: 'user123');

    when(mockAuthRepository.login(email, password)).thenAnswer((_) async => auth);

    final result = await mockAuthRepository.login(email, password);

    expect(result, auth);
    verify(mockAuthRepository.login(email, password)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });

  test('should sign up and return an Auth object', () async {
    final name = 'John Doe';
    final email = 'test@example.com';
    final password = 'password123';
    final role = 'user';
    final auth = Auth(token: 'token123', isPharmacist: true, id: 'user123');

    when(mockAuthRepository.signUp(name, email, password, role)).thenAnswer((_) async => auth);

    final result = await mockAuthRepository.signUp(name, email, password, role);

    expect(result, auth);
    verify(mockAuthRepository.signUp(name, email, password, role)).called(1);
    verifyNoMoreInteractions(mockAuthRepository);
  });
}
