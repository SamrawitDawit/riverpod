// presentation/state/medicine_form_notifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newcompiled/domain/entitites/medicine_form.dart';

class MedicineFormNotifier extends StateNotifier<Medicine> {
  MedicineFormNotifier() : super(Medicine(id: '', title: '', description: '', price: '', category: ''));

  void setId(String id) {
    state = state.copyWith(id: id);
  }

  void setTitle(String title) {
    state = state.copyWith(title: title);
  }

  void setDescription(String description) {
    state = state.copyWith(description: description);
  }

  void setPrice(String price) {
    state = state.copyWith(price: price);
  }

  void setCategory(String category) {
    state = state.copyWith(category: category);
  }
}

final medicineFormProvider = StateNotifierProvider<MedicineFormNotifier, Medicine>((ref) {
  return MedicineFormNotifier();
});
