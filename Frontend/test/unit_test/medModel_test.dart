import 'package:flutter_test/flutter_test.dart';
import 'package:newcompiled/domain/entitites/medicine_form.dart';

void main() {
  group('Medicine', () {
    test('copyWith creates a copy with the updated values', () {
      final medicine = Medicine(id: '1', title: 'Aspirin', description: 'Pain reliever', price: '10', category: 'OTC');
      final updatedMedicine = medicine.copyWith(title: 'Ibuprofen');

      expect(updatedMedicine.title, 'Ibuprofen');
      expect(updatedMedicine.id, '1');
    });

    test('fromJson creates an instance from JSON', () {
      final json = {
        '_id': '1',
        'title': 'Aspirin',
        'detail': 'Pain reliever',
        'price': '10',
        'category': 'OTC'
      };
      final medicine = Medicine.fromJson(json);

      expect(medicine.id, '1');
      expect(medicine.title, 'Aspirin');
      expect(medicine.description, 'Pain reliever');
      expect(medicine.price, '10');
      expect(medicine.category, 'OTC');
    });
  });
}
