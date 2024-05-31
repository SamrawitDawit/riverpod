// infrastructure/repositories/order_repository_impl.dart
import 'dart:convert';

import 'package:newcompiled/Infrastructure/data_sources/order_data_source.dart';
import 'package:newcompiled/domain/entitites/order.dart';
import 'package:newcompiled/domain/repositories/order_repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class OrderRepositoryImpl implements OrderRepository {
  final OrderDataSource dataSource;

  OrderRepositoryImpl(this.dataSource);

  @override
  Future<List<Order>> getOrders() async {
    final data = await dataSource.fetchOrders();
    return await _mapOrdersWithMedicineTitles(data);
  }

  @override
  Future<List<Order>> getOrdersByUserId(String userId) async {
    final data = await dataSource.fetchOrdersByUserId(userId);
    return await _mapOrdersWithMedicineTitles(data);
  }
  @override
  Future<void> createOrder(Order order) async {
    await dataSource.createOrder(order);
  }
  @override
  Future<void> editOrder(Order order) async {
    await dataSource.editOrder(order);
  }
  @override
  Future<void> deleteOrder(String orderId) async {
    await dataSource.deleteOrder(orderId);
  }

  Future<List<Order>> _mapOrdersWithMedicineTitles(List<Map<String, dynamic>> data) async {
    List<Order> orders = [];
    for (var item in data) {
      String medicineTitle = await fetchMedicineTitle(item['medicineId']);
      orders.add(Order.fromJson(item, medicineTitle));
    }
    return orders;
  }

  Future<String> fetchMedicineTitle(String medId) async {
    final response = await http.get(Uri.parse('http://10.0.2.2:3000/medicines/$medId'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['title'];
    } else {
      throw Exception('Failed to load medicine');
    }
  }

}

