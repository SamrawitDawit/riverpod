// application/use_cases/add_medicine.dart
import 'package:newcompiled/domain/entitites/medicine_form.dart';
import 'package:newcompiled/domain/repositories/medicine_repository.dart';


class AddMedicine {
  final MedicineRepository _repository;

  AddMedicine(this._repository);

  Future<void> call(Medicine medicine) async {
    await _repository.addMedicine(medicine);
  }
}
