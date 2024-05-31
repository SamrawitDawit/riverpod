// infrastructure/providers.dart
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newcompiled/Application/services/auth_service.dart';
import 'package:newcompiled/Application/state_notifiers.dart';
import 'package:newcompiled/Application/usecases/add_medicine.dart';
import 'package:newcompiled/Application/usecases/create_order.dart';
import 'package:newcompiled/Application/usecases/delete_medicine.dart';
import 'package:newcompiled/Application/usecases/edit_medicine.dart';
import 'package:newcompiled/Application/usecases/get_medicines.dart';
import 'package:newcompiled/Application/usecases/get_orders.dart';
import 'package:newcompiled/Application/usecases/get_user_name.dart';
import 'package:newcompiled/Application/usecases/update_order.dart';
import 'package:newcompiled/Infrastructure/data_sources/auth_data_source.dart';
import 'package:newcompiled/Infrastructure/data_sources/medicine_data_source.dart';
import 'package:newcompiled/Infrastructure/data_sources/order_data_source.dart';
import 'package:newcompiled/Infrastructure/data_sources/user_data_source.dart';
import 'package:newcompiled/Infrastructure/repositories/auth_repository_impl.dart';
import 'package:newcompiled/Infrastructure/repositories/medicine_repository_impl.dart';
import 'package:newcompiled/Infrastructure/repositories/order_repository_impl.dart';
import 'package:newcompiled/Infrastructure/repositories/user_repository_impl.dart';
import 'package:newcompiled/domain/entitites/medicine_form.dart';
import 'package:newcompiled/domain/entitites/order.dart';
import 'package:newcompiled/presentation/screens/providers/providers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


final sharedPreferencesProvider = FutureProvider<SharedPreferences>((ref) async {
  return await SharedPreferences.getInstance();
});

final tokenProvider = FutureProvider<String?>((ref) async {
  final prefs = await ref.watch(sharedPreferencesProvider.future);
  return prefs.getString('token');
});

final medicineDataSourceProvider = Provider((ref) => MedicineDataSource());
final orderDataSourceProvider = Provider((ref) => OrderDataSource());

final medicineRepositoryProvider = Provider((ref) => MedicineRepositoryImpl(ref.watch(medicineDataSourceProvider)));
final orderRepositoryProvider = Provider((ref) => OrderRepositoryImpl(ref.watch(orderDataSourceProvider)));

final getMedicinesProvider = Provider((ref) => GetMedicines(ref.watch(medicineRepositoryProvider)));
final addMedicineProvider = Provider((ref) => AddMedicine(ref.watch(medicineRepositoryProvider)));
// final editMedicineProvider = Provider((ref) => EditMedicine(ref.watch(medicineRepositoryProvider)));
// final deleteMedicineProvider = Provider((ref) => DeleteMedicine(ref.watch(medicineRepositoryProvider)));

final getOrdersProvider = Provider((ref) => GetOrders(ref.watch(orderRepositoryProvider)));
final getOrdersByUserIdProvider = Provider((ref) => GetOrdersByUserId(ref.watch(orderRepositoryProvider)));

final medicineFormProvider = StateNotifierProvider<MedicineFormNotifier, Medicine>((ref) {
  return MedicineFormNotifier();
});

final medicinesFutureProvider = FutureProvider((ref) => ref.watch(getMedicinesProvider).call());
final ordersFutureProvider = FutureProvider((ref) => ref.watch(getOrdersProvider).call());
final ordersByUserIdFutureProvider = FutureProvider.family((ref, String userId) => ref.watch(getOrdersByUserIdProvider).call(userId));


final authDataSourceProvider = Provider((ref) => AuthDataSource());

final authRepositoryProvider = Provider((ref) => AuthRepositoryImpl(ref.read(authDataSourceProvider)));

final authServiceProvider = Provider((ref) => AuthService(ref.read(authRepositoryProvider)));
final userDataSourceProvider = Provider((ref) => UserDataSource());
final userRepositoryProvider = Provider((ref) => UserRepositoryImpl(ref.watch(userDataSourceProvider)));
final getUserNameProvider = Provider((ref) => GetUserName(ref.watch(userRepositoryProvider)));

final orderFormProvider = StateNotifierProvider<OrderFormNotifier, Order>((ref) {
  return OrderFormNotifier();
});

final createOrderProvider = FutureProvider.family<void, Order>((ref, order) async {
  final repository = ref.read(orderRepositoryProvider);
  await repository.createOrder(order);
});

final editOrderProvider = FutureProvider.family<void, Order>((ref, order) async {
  final repository = ref.read(orderRepositoryProvider);
  await repository.editOrder(order);
});

final medicineIdProvider = StateProvider<String?>((ref) => null);
final orderIdProvider = StateProvider<String?>((ref) => null);
final userIdProvider = StateProvider<String?>((ref)=> null);

Future<String> fetchMedicineTitle(String medId) async {
  final response = await http.get(Uri.parse('http://10.0.2.2:3000/medicines/$medId'));
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data['title'];
  } else {
    print('Failed to load medicine: ${response.statusCode} ${response.body}');
    throw Exception('Failed to load medicine');
  }
}

final ordersProvider = FutureProvider.family<List<Order>, String>((ref, userId) async {

  final response = await http.get(Uri.parse('http://10.0.2.2:3000/orders/all'));
  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    List<Order> orders = [];

    for (var item in data) {
      if (item['userId'] == userId) {
        String medicineTitle = await fetchMedicineTitle(item['medicineId']);
        orders.add(Order.fromJson(item, medicineTitle));
      }
    }

    return orders;
  } else {
    throw Exception('Failed to load orders');
  }
});
Future<String> getUserName(user_id) async{
  final response = await http.get(Uri.parse('http://10.0.2.2:3000/users/${user_id}'));
  print(user_id);
  if (response.statusCode == 200) {
    final dynamic data = jsonDecode(response.body);
    final String userName = data['name'].toString();
    return userName;
  }
  else{
    throw Exception("Failed to load User: ${response.statusCode}");
  }
}
final allOrdersProvider = FutureProvider<List<Order>>((ref) async {
  final response = await http.get(Uri.parse('http://10.0.2.2:3000/orders/all'));
  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    List<Order> orders = [];
    for (var item in data) {
      try {
        String medicineTitle = await fetchMedicineTitle(item['medicineId']);
        orders.add(Order.fromJson(item, medicineTitle));
      } catch (e) {
        print('Error fetching medicine title: $e');
        orders.add(Order.fromJson(item, 'Unknown')); // Handle missing title
      }
    }
    return orders;
  } else {
    throw Exception('Failed to load orders');
  }
});

final editMedicineProvider = FutureProvider.family<void, Medicine>((ref, form) async {
  final response = await http.put(
    Uri.parse('http://10.0.2.2:3000/medicines/${form.id}'),  // Assuming PUT request for editing
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': form.title,
      'detail': form.description,
      'price': form.price,
      'category': form.category,
    }),
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to edit medicine');
  }
  else{
    ref.refresh(medicinesProvider);
  }
});

final deleteMedicineProvider = FutureProvider.family<void, String>((ref, medicineId) async {
  final response = await http.delete(
    Uri.parse('http://10.0.2.2:3000/medicines/$medicineId'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode != 200) {
    throw Exception('Failed to delete medicine');
  }
  else{
    ref.refresh(medicinesProvider);
  }
});
final medicinesProvider = FutureProvider<List<Medicine>>((ref) async {
  final response = await http.get(Uri.parse('http://10.0.2.2:3000/medicines/all'));
  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((item) => Medicine.fromJson(item)).toList();
  } else {
    print(response.body);
    throw Exception('Failed to load medicines');

  }
});

