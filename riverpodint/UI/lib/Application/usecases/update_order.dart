// application/use_cases/update_order.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newcompiled/domain/entitites/order.dart';
import 'package:newcompiled/domain/repositories/order_repository.dart';

class UpdateOrder {
  final OrderRepository orderRepository;

  UpdateOrder(this.orderRepository);

  Future<void> call(Order order) async {
    await orderRepository.editOrder(order);
  }
}