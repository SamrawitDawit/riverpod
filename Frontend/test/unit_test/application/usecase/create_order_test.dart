import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:newcompiled/Application/usecases/create_order.dart';
import 'package:newcompiled/domain/entitites/order.dart';
import 'package:newcompiled/domain/repositories/order_repository.dart';

class MockOrderRepository extends Mock implements OrderRepository {}

void main() {
  group('CreateOrder', () {
    late CreateOrder createOrder;
    late MockOrderRepository mockOrderRepository;

    setUp(() {
      mockOrderRepository = MockOrderRepository();
      createOrder = CreateOrder(mockOrderRepository);
    });

    test('should call createOrder on the repositories', () async {
      // Arrange
      final order = Order(id: '1', userId: '123', medId: '456', date: '2023-05-31', quantity: '2', medicineTitle: 'Test');

      // Act
      await createOrder.call(order);

      // Assert
      verify(mockOrderRepository.createOrder(order)).called(1);
    });
  });
}
