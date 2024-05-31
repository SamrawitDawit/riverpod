// application/use_cases/edit_medicine_screen.dart
import 'package:newcompiled/domain/entitites/medicine_form.dart';
import 'package:newcompiled/domain/repositories/medicine_repository.dart';


class EditMedicine {
  final MedicineRepository repository;

  EditMedicine(this.repository);

  Future<void> call(Medicine medicine) {
    return repository.editMedicine(medicine);
  }
}
