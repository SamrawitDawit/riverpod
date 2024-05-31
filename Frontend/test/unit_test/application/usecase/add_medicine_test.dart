import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:newcompiled/Application/usecases/add_medicine.dart';
import 'package:newcompiled/domain/entitites/medicine_form.dart';

import 'package:newcompiled/domain/repositories/medicine_repository.dart';

// Mock class
class MockMedicineRepository extends Mock implements MedicineRepository {}

void main() {
  group('AddMedicine', () {
    late AddMedicine addMedicine;
    late MockMedicineRepository mockMedicineRepository;

    setUp(() {
      mockMedicineRepository = MockMedicineRepository();
      addMedicine = AddMedicine(mockMedicineRepository);
    });

    test('should call addMedicine on the repositories', () async {
      // Arrange
      final medicine = Medicine(id: '1', title: 'Test', description: 'Test description', price: '10', category: 'Test');

      // Act
      await addMedicine.call(medicine);

      // Assert
      verify(mockMedicineRepository.addMedicine(medicine)).called(1);
    });
  });
}
