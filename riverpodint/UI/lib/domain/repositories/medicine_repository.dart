// domain/repositories/medicine_repository.dart
import 'package:newcompiled/domain/entitites/medicine_form.dart';


abstract class MedicineRepository {
  Future<List<Medicine>> getMedicines();
  Future<void> addMedicine(Medicine medicine);
  Future<void> editMedicine(Medicine medicine);
  Future<void> deleteMedicine(String medicineId);
}
