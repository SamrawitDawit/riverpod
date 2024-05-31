// infrastructure/repositories/medicine_repository_impl.dart
import 'package:newcompiled/Infrastructure/data_sources/medicine_data_source.dart';
import 'package:newcompiled/domain/entitites/medicine_form.dart';
import 'package:newcompiled/domain/repositories/medicine_repository.dart';


class MedicineRepositoryImpl implements MedicineRepository {
  final MedicineDataSource dataSource;

  MedicineRepositoryImpl(this.dataSource);

  @override
  Future<List<Medicine>> getMedicines() async {
    final data = await dataSource.fetchMedicines();
    return data.map((item) => Medicine.fromJson(item)).toList();
  }

  @override
  Future<void> addMedicine(Medicine medicine) async {
    await dataSource.addMedicine({
      'title': medicine.title,
      'detail': medicine.description,
      'price': medicine.price,
      'category': medicine.category,
    });
  }

  @override
  Future<void> editMedicine(Medicine medicine) async {
    await dataSource.editMedicine(medicine.id, {
      'title': medicine.title,
      'detail': medicine.description,
      'price': medicine.price,
      'category': medicine.category,
    });
  }

  @override
  Future<void> deleteMedicine(String medicineId) async {
    await dataSource.deleteMedicine(medicineId);
  }
}
