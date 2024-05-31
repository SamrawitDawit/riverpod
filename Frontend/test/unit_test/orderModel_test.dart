import 'package:flutter_test/flutter_test.dart';
import 'package:newcompiled/domain/entitites/order.dart';

void main() {
  group('Order', () {
    test('copyWith creates a copy with the updated values', () {
      final order = Order(id: '1', medicineTitle: 'Aspirin', date: '2022-01-01', userId: 'user1', medId: 'med1', quantity: '2');
      final updatedOrder = order.copyWith(quantity: '3');

      expect(updatedOrder.quantity, '3');
      expect(updatedOrder.id, '1');
    });

    test('fromJson creates an instance from JSON', () {
      final json = {
        '_id': '1',
        'date': '2022-01-01',
        'userId': 'user1',
        'medicineId': 'med1',
        'quantity': '2'
      };
      final order = Order.fromJson(json, 'Aspirin');

      expect(order.id, '1');
      expect(order.medicineTitle, 'Aspirin');
      expect(order.date, '2022-01-01');
      expect(order.userId, 'user1');
      expect(order.medId, 'med1');
      expect(order.quantity, '2');
    });
  });
}
