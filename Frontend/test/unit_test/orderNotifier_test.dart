import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newcompiled/Infrastructure/providers/providers.dart';
import 'package:newcompiled/domain/entitites/order.dart';


void main() {
  group('OrderFormNotifier', () {
    test('initial state should be an empty Order object', () {
      final container = ProviderContainer();
      final state = container.read(orderFormProvider);

      expect(state, Order(id: '', medicineTitle: '', date: '', userId: '', medId: '', quantity: ''));
    });

    test('setId updates the id of the state', () {
      final container = ProviderContainer();
      final notifier = container.read(orderFormProvider.notifier);

      notifier.setId('test_id');
      final state = container.read(orderFormProvider);

      expect(state.id, 'test_id');
    });

    test('setMedicineTitle updates the medicine title of the state', () {
      final container = ProviderContainer();
      final notifier = container.read(orderFormProvider.notifier);

      notifier.setMedicineTitle('test_title');
      final state = container.read(orderFormProvider);

      expect(state.medicineTitle, 'test_title');
    });

    test('setDate updates the date of the state', () {
      final container = ProviderContainer();
      final notifier = container.read(orderFormProvider.notifier);

      notifier.setDate('test_date');
      final state = container.read(orderFormProvider);

      expect(state.date, 'test_date');
    });

    test('setUserId updates the user id of the state', () {
      final container = ProviderContainer();
      final notifier = container.read(orderFormProvider.notifier);

      notifier.setUserId('test_user_id');
      final state = container.read(orderFormProvider);

      expect(state.userId, 'test_user_id');
    });

    test('setMedId updates the medicine id of the state', () {
      final container = ProviderContainer();
      final notifier = container.read(orderFormProvider.notifier);

      notifier.setMedId('test_med_id');
      final state = container.read(orderFormProvider);

      expect(state.medId, 'test_med_id');
    });

    test('setQuantity updates the quantity of the state', () {
      final container = ProviderContainer();
      final notifier = container.read(orderFormProvider.notifier);

      notifier.setQuantity('test_quantity');
      final state = container.read(orderFormProvider);

      expect(state.quantity, 'test_quantity');
    });
  });
}
