// test/application/usecases/update_order_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:newcompiled/domain/entitites/order.dart';
import 'package:newcompiled/domain/repositories/order_repository.dart';
import 'package:newcompiled/application/usecases/update_order.dart';

class MockOrderRepository extends Mock implements OrderRepository {}

void main() {
  late MockOrderRepository mockOrderRepository;
  late UpdateOrder updateOrder;

  setUp(() {
    mockOrderRepository = MockOrderRepository();
    updateOrder = UpdateOrder(mockOrderRepository);
  });

  test('should update order in the repositories', () async {
    // Arrange
    final order = Order(id: '123', medicineTitle: 'some-medicine', date: '4-5-2023', medId: '123', userId: '123', quantity: '3');
    when(mockOrderRepository.editOrder(order))
        .thenAnswer((_) async => Future.value());

    // Act
    await updateOrder(order);

    // Assert
    verify(mockOrderRepository.editOrder(order)).called(1);
    verifyNoMoreInteractions(mockOrderRepository);
  });
}
