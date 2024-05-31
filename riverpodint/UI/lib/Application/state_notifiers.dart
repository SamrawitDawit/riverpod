// application/notifiers/medicine_form_notifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:newcompiled/domain/entitites/medicine_form.dart';
import 'package:newcompiled/domain/entitites/order.dart';

class MedicineFormNotifier extends StateNotifier<Medicine> {
  MedicineFormNotifier() : super(Medicine(id: '', title: '', description: '', price: '', category: ''));

  void setId(String id) {
    state = Medicine(id: id, title: state.title, description: state.description, price: state.price, category: state.category);
  }

  void setTitle(String title) {
    state = Medicine(id: state.id, title: title, description: state.description, price: state.price, category: state.category);
  }

  void setDescription(String description) {
    state = Medicine(id: state.id, title: state.title, description: description, price: state.price, category: state.category);
  }

  void setPrice(String price) {
    state = Medicine(id: state.id, title: state.title, description: state.description, price: price, category: state.category);
  }

  void setCategory(String category) {
    state = Medicine(id: state.id, title: state.title, description: state.description, price: state.price, category: category);
  }
}

final medicineFormProvider = StateNotifierProvider<MedicineFormNotifier, Medicine>((ref) {
  return MedicineFormNotifier();
});


class OrderFormNotifier extends StateNotifier<Order> {
  OrderFormNotifier()
      : super(Order(
    id: '',
    medicineTitle: '',
    date: '',
    userId: '',
    medId: '',
    quantity: '',
  ));

  void setId(String id) {
    state = state.copyWith(id: id);
  }

  void setMedicineTitle(String medicineTitle) {
    state = state.copyWith(medicineTitle: medicineTitle);
  }

  void setDate(String date) {
    state = state.copyWith(date: date);
  }

  void setUserId(String userId) {
    state = state.copyWith(userId: userId);
  }

  void setMedId(String medId) {
    state = state.copyWith(medId: medId);
  }

  void setQuantity(String quantity) {
    state = state.copyWith(quantity: quantity);
  }
}
