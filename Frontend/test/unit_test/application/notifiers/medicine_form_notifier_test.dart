import 'package:flutter_test/flutter_test.dart';
import 'package:newcompiled/Application/state_notifiers.dart';

import 'package:newcompiled/domain/entitites/medicine_form.dart';

void main() {
  late MedicineFormNotifier medicineFormNotifier;

  setUp(() {
    medicineFormNotifier = MedicineFormNotifier();
  });

  test('initial state should be an empty Medicine object', () {
    expect(medicineFormNotifier.state, Medicine(id: '', title: '', description: '', price: '', category: ''));
  });

  test('setId should update the id of the state', () {
    const id = '123';
    medicineFormNotifier.setId(id);
    expect(medicineFormNotifier.state.id, id);
  });

  test('setTitle should update the title of the state', () {
    const title = 'Aspirin';
    medicineFormNotifier.setTitle(title);
    expect(medicineFormNotifier.state.title, title);
  });

  test('setDescription should update the description of the state', () {
    const description = 'Pain reliever';
    medicineFormNotifier.setDescription(description);
    expect(medicineFormNotifier.state.description, description);
  });

  test('setPrice should update the price of the state', () {
    const price = '10.99';
    medicineFormNotifier.setPrice(price);
    expect(medicineFormNotifier.state.price, price);
  });

  test('setCategory should update the category of the state', () {
    const category = 'Pharmacy';
    medicineFormNotifier.setCategory(category);
    expect(medicineFormNotifier.state.category, category);
  });
}
