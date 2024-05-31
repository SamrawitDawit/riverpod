// application/use_cases/get_orders.dart
import 'package:newcompiled/domain/entitites/order.dart';
import 'package:newcompiled/domain/repositories/order_repository.dart';

class GetOrders {
  final OrderRepository repository;

  GetOrders(this.repository);

  Future<List<Order>> call() {
    return repository.getOrders();
  }
}

class GetOrdersByUserId {
  final OrderRepository repository;

  GetOrdersByUserId(this.repository);

  Future<List<Order>> call(String userId) {
    return repository.getOrdersByUserId(userId);
  }
}
