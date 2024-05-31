// application/use_cases/create_order.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newcompiled/domain/entitites/order.dart';
import 'package:newcompiled/domain/repositories/order_repository.dart';

class CreateOrder {
  final OrderRepository _repository;
  CreateOrder(this._repository);

  Future<void> call(Order order) async {
    await _repository.createOrder(order);
  }
}
