import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newcompiled/Application/state_notifiers.dart';
import 'package:newcompiled/domain/entitites/medicine_form.dart';

void main() {
  group('MedicineFormNotifier', () {
    test('initial state should be an empty Medicine object', () {
      final container = ProviderContainer();
      final state = container.read(medicineFormProvider);

      expect(state, Medicine(id: '', title: '', description: '', price: '', category: ''));
    });

    test('setId updates the id of the state', () {
      final container = ProviderContainer();
      final notifier = container.read(medicineFormProvider.notifier);

      notifier.setId('test_id');
      final state = container.read(medicineFormProvider);

      expect(state.id, 'test_id');
    });

    test('setTitle updates the title of the state', () {
      final container = ProviderContainer();
      final notifier = container.read(medicineFormProvider.notifier);

      notifier.setTitle('test_title');
      final state = container.read(medicineFormProvider);

      expect(state.title, 'test_title');
    });

    test('setDescription updates the description of the state', () {
      final container = ProviderContainer();
      final notifier = container.read(medicineFormProvider.notifier);

      notifier.setDescription('test_description');
      final state = container.read(medicineFormProvider);

      expect(state.description, 'test_description');
    });

    test('setPrice updates the price of the state', () {
      final container = ProviderContainer();
      final notifier = container.read(medicineFormProvider.notifier);

      notifier.setPrice('test_price');
      final state = container.read(medicineFormProvider);

      expect(state.price, 'test_price');
    });

    test('setCategory updates the category of the state', () {
      final container = ProviderContainer();
      final notifier = container.read(medicineFormProvider.notifier);

      notifier.setCategory('test_category');
      final state = container.read(medicineFormProvider);

      expect(state.category, 'test_category');
    });
  });
}
