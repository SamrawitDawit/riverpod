import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:newcompiled/Application/usecases/edit_medicine.dart';
import 'package:newcompiled/domain/entitites/medicine_form.dart';
import 'package:newcompiled/domain/repositories/medicine_repository.dart';

class MockMedicineRepository extends Mock implements MedicineRepository {}

void main() {
  group('EditMedicine', () {
    late EditMedicine editMedicine;
    late MockMedicineRepository mockMedicineRepository;

    setUp(() {
      mockMedicineRepository = MockMedicineRepository();
      editMedicine = EditMedicine(mockMedicineRepository);
    });

    test('should call editMedicine on the repositories', () async {
      // Arrange
      final medicine = Medicine(id: '1', title: 'Test', description: 'Test description', price: '10', category: 'Test');

      // Act
      await editMedicine.call(medicine);

      // Assert
      verify(mockMedicineRepository.editMedicine(medicine)).called(1);
    });
  });
}
