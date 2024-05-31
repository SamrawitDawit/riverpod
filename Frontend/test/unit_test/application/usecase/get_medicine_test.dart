import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:newcompiled/Application/usecases/get_medicines.dart';
import 'package:newcompiled/domain/entitites/medicine_form.dart';
import 'package:newcompiled/domain/repositories/medicine_repository.dart';

class MockMedicineRepository extends Mock implements MedicineRepository {}

void main() {
  group('GetMedicines', () {
    late GetMedicines getMedicines;
    late MockMedicineRepository mockMedicineRepository;

    setUp(() {
      mockMedicineRepository = MockMedicineRepository();
      getMedicines = GetMedicines(mockMedicineRepository);
    });

    test('should call getMedicines on the repositories', () async {
      // Arrange
      final medicines = [Medicine(id: '1', title: 'Test', description: 'Test description', price: '10', category: 'Test')];
      when(mockMedicineRepository.getMedicines()).thenAnswer((_) async => medicines);

      // Act
      final result = await getMedicines.call();

      // Assert
      expect(result, medicines);
      verify(mockMedicineRepository.getMedicines()).called(1);
    });
  });
}
