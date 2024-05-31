import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:newcompiled/Application/usecases/delete_medicine.dart';
import 'package:newcompiled/domain/repositories/medicine_repository.dart';

class MockMedicineRepository extends Mock implements MedicineRepository {}

void main() {
  group('DeleteMedicine', () {
    late DeleteMedicine deleteMedicine;
    late MockMedicineRepository mockMedicineRepository;

    setUp(() {
      mockMedicineRepository = MockMedicineRepository();
      deleteMedicine = DeleteMedicine(mockMedicineRepository);
    });

    test('should call deleteMedicine on the repositories', () async {
      // Arrange
      final medicineId = '1';

      // Act
      await deleteMedicine.call(medicineId);

      // Assert
      verify(mockMedicineRepository.deleteMedicine(medicineId)).called(1);
    });
  });
}
