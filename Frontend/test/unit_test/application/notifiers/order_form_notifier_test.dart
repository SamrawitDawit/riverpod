import 'package:flutter_test/flutter_test.dart';
import 'package:newcompiled/Application/state_notifiers.dart';
import 'package:newcompiled/domain/entitites/order.dart';

void main() {
  late OrderFormNotifier orderFormNotifier;

  setUp(() {
    orderFormNotifier = OrderFormNotifier();
  });

  test('initial state should be an empty Order object', () {
    expect(orderFormNotifier.state, Order(id: '', medicineTitle: '', date: '', userId: '', medId: '', quantity: ''));
  });

  test('setId should update the id of the state', () {
    const id = '123';
    orderFormNotifier.setId(id);
    expect(orderFormNotifier.state.id, id);
  });

  test('setMedicineTitle should update the medicineTitle of the state', () {
    const medicineTitle = 'Aspirin';
    orderFormNotifier.setMedicineTitle(medicineTitle);
    expect(orderFormNotifier.state.medicineTitle, medicineTitle);
  });

  test('setDate should update the date of the state', () {
    const date = '2024-05-31';
    orderFormNotifier.setDate(date);
    expect(orderFormNotifier.state.date, date);
  });

  test('setUserId should update the userId of the state', () {
    const userId = 'user123';
    orderFormNotifier.setUserId(userId);
    expect(orderFormNotifier.state.userId, userId);
  });

  test('setMedId should update the medId of the state', () {
    const medId = 'med123';
    orderFormNotifier.setMedId(medId);
    expect(orderFormNotifier.state.medId, medId);
  });

  test('setQuantity should update the quantity of the state', () {
    const quantity = '2';
    orderFormNotifier.setQuantity(quantity);
    expect(orderFormNotifier.state.quantity, quantity);
  });
}
