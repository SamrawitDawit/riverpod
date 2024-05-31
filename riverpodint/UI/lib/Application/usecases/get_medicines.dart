// application/use_cases/get_medicines.dart
import 'package:newcompiled/domain/entitites/medicine_form.dart';
import 'package:newcompiled/domain/repositories/medicine_repository.dart';


class GetMedicines {
  final MedicineRepository repository;

  GetMedicines(this.repository);

  Future<List<Medicine>> call() {
    return repository.getMedicines();
  }
}
