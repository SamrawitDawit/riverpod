// domain/repositories/order_repository.dart
import 'package:newcompiled/domain/entitites/order.dart';


abstract class OrderRepository {
  Future<List<Order>> getOrders();
  Future<List<Order>> getOrdersByUserId(String userId);
  Future<void> createOrder(Order order);
  Future<void> editOrder(Order order);
  Future<void> deleteOrder(String orderId);
}
