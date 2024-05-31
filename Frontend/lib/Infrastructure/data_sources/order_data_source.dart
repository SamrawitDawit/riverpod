// infrastructure/data_sources/order_data_source.dart
import 'package:http/http.dart' as http;
import 'package:newcompiled/domain/entitites/order.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class OrderDataSource {
  final String baseUrl = 'http://10.0.2.2:3000';

  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }


  Future<void> createOrder(Order order) async {
    final response = await http.post(
      Uri.parse('$baseUrl/new'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(order.toJson()),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create order');
    }
  }

  Future<void> editOrder(Order order) async {
    final response = await http.put(
      Uri.parse('$baseUrl/${order.id}'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(order.toJson()),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to edit order');
    }
  }
  Future<List<Map<String, dynamic>>> fetchOrders() async {
    final response = await http.get(Uri.parse('$baseUrl/orders/all'));
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load orders');
    }
  }

  Future<List<Map<String, dynamic>>> fetchOrdersByUserId(String userId) async {
    final response = await http.get(Uri.parse('$baseUrl/orders/user/$userId'));
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load orders');
    }
  }
  Future<void> deleteOrder(String id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/orders/$id'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete order');
    }
  }
}

