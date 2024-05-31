// application/use_cases/delete_medicine.dart


import 'package:newcompiled/domain/repositories/medicine_repository.dart';

class DeleteMedicine {
  final MedicineRepository repository;

  DeleteMedicine(this.repository);

  Future<void> call(String medicineId) {
    return repository.deleteMedicine(medicineId);
  }
}
