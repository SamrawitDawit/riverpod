import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:newcompiled/Application/usecases/get_orders.dart';
import 'package:newcompiled/domain/entitites/order.dart';
import 'package:newcompiled/domain/repositories/order_repository.dart';

class MockOrderRepository extends Mock implements OrderRepository {}

void main() {
  group('GetOrders', () {
    late GetOrders getOrders;
    late MockOrderRepository mockOrderRepository;

    setUp(() {
      mockOrderRepository = MockOrderRepository();
      getOrders = GetOrders(mockOrderRepository);
    });

    test('should call getOrders on the repositories', () async {
      // Arrange
      final orders = [Order(id: '1', userId: '123', medId: '456', date: '2023-05-31', quantity: '2', medicineTitle: 'Test')];
      when(mockOrderRepository.getOrders()).thenAnswer((_) async => orders);

      // Act
      final result = await getOrders.call();

      // Assert
      expect(result, orders);
      verify(mockOrderRepository.getOrders()).called(1);
    });
  });
}
