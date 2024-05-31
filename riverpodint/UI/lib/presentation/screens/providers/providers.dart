// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:newcompiled/presentation/screens/listmedicince.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// // State to manage the text fields
// class MedicineForm {
//   final String id;  // Add this line
//   final String title;
//   final String description;
//   final String price;
//   final String category;
//
//   MedicineForm({
//     required this.id,  // Add this line
//     required this.title,
//     required this.description,
//     required this.price,
//     required this.category,
//   });
//   factory MedicineForm.fromJson(Map<String, dynamic> json) {
//     return MedicineForm(
//       id: json['_id'],
//       title: json['title'],
//       description: json['detail'],
//       price: json['price'],
//       category: json['category'],
//     );
//   }
// }
//
// final medicinesProvider = FutureProvider<List<MedicineForm>>((ref) async {
//   final response = await http.get(Uri.parse('http://10.0.2.2:3000/medicines/all'));
//   if (response.statusCode == 200) {
//     final List<dynamic> data = jsonDecode(response.body);
//     return data.map((item) => MedicineForm.fromJson(item)).toList();
//   } else {
//     print(response.body);
//     throw Exception('Failed to load medicines');
//
//   }
// });
//
//
// class MedicineFormNotifier extends StateNotifier<MedicineForm> {
//   MedicineFormNotifier() : super(MedicineForm(id: '', title: '', description: '', price: '', category: ''));
//
//   void setId(String id) {
//     state = MedicineForm(
//       id: id,
//       title: state.title,
//       description: state.description,
//       price: state.price,
//       category: state.category,
//     );
//   }
//
//   void setTitle(String title) {
//     state = MedicineForm(
//       id: state.id,
//       title: title,
//       description: state.description,
//       price: state.price,
//       category: state.category,
//     );
//   }
//
//   void setDescription(String description) {
//     state = MedicineForm(
//       id: state.id,
//       title: state.title,
//       description: description,
//       price: state.price,
//       category: state.category,
//     );
//   }
//
//   void setPrice(String price) {
//     state = MedicineForm(
//       id: state.id,
//       title: state.title,
//       description: state.description,
//       price: price,
//       category: state.category,
//     );
//   }
//
//   void setCategory(String category) {
//     state = MedicineForm(
//       id: state.id,
//       title: state.title,
//       description: state.description,
//       price: state.price,
//       category: category,
//     );
//   }
// }
//
//
// final medicineFormProvider = StateNotifierProvider<MedicineFormNotifier, MedicineForm>((ref) {
//   return MedicineFormNotifier();
// });
//
// final addMedicineProvider = FutureProvider.family<void, MedicineForm>((ref, form) async {
//   final response = await http.post(
//     Uri.parse('http://10.0.2.2:3000/medicines/new'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'title': form.title,
//       'detail': form.description,
//       'price': form.price,
//       'category': form.category,
//     }),
//   );
//
//   if (response.statusCode != 201) {
//     throw Exception('Failed to add medicine');
//   }
// });
//
// final editMedicineProvider = FutureProvider.family<void, MedicineForm>((ref, form) async {
//   final response = await http.put(
//     Uri.parse('http://10.0.2.2:3000/medicines/${form.id}'),  // Assuming PUT request for editing
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'title': form.title,
//       'detail': form.description,
//       'price': form.price,
//       'category': form.category,
//     }),
//   );
//
//   if (response.statusCode != 200) {
//     throw Exception('Failed to edit medicine');
//   }
// });
//
// final deleteMedicineProvider = FutureProvider.family<void, String>((ref, medicineId) async {
//   final response = await http.delete(
//     Uri.parse('http://10.0.2.2:3000/medicines/$medicineId'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//   );
//
//   if (response.statusCode != 200) {
//     throw Exception('Failed to delete medicine');
//   }
// });
//
//
// final sharedPreferencesProvider = FutureProvider<SharedPreferences>((ref) async {
//   return await SharedPreferences.getInstance();
// });
//
// // Define a FutureProvider for the token
// final tokenProvider = FutureProvider<String?>((ref) async {
//   final prefs = await ref.watch(sharedPreferencesProvider.future);
//   return prefs.getString('token');
// });
// final medicineIdProvider = StateProvider<String?>((ref) => null);
// final orderIdProvider = StateProvider<String?>((ref) => null);
//
// final allOrdersProvider = FutureProvider<List<Order>>((ref) async {
//   final response = await http.get(Uri.parse('http://10.0.2.2:3000/orders/all'));
//   if (response.statusCode == 200) {
//     final List<dynamic> data = jsonDecode(response.body);
//     List<Order> orders = [];
//     for (var item in data) {
//       String medicineTitle = await fetchMedicineTitle(item['medicineId']);
//       orders.add(Order.fromJson(item, medicineTitle));
//     }
//     return orders;
//   } else {
//     throw Exception('Failed to load orders');
//   }
// });
//
// final ordersProvider = FutureProvider.family<List<Order>, String>((ref, userId) async {
//
//   final response = await http.get(Uri.parse('http://10.0.2.2:3000/orders/all'));
//   if (response.statusCode == 200) {
//     final List<dynamic> data = jsonDecode(response.body);
//     List<Order> orders = [];
//
//     for (var item in data) {
//       if (item['userId'] == userId) {
//         String medicineTitle = await fetchMedicineTitle(item['medicineId']);
//         orders.add(Order.fromJson(item, medicineTitle));
//       }
//     }
//
//     return orders;
//   } else {
//     throw Exception('Failed to load orders');
//   }
// });
//
// Future<String> fetchMedicineTitle(String medId) async {
//   final response = await http.get(Uri.parse('http://10.0.2.2:3000/medicines/$medId'));
//   if (response.statusCode == 200) {
//     final data = jsonDecode(response.body);
//     return data['title'];
//   } else {
//     throw Exception('Failed to load medicine');
//   }
// }
// Future<String> getUserName(user_id) async{
//   final response = await http.get(Uri.parse('http://10.0.2.2:3000/users/${user_id}'));
//   print(user_id);
//   if (response.statusCode == 200) {
//     final dynamic data = jsonDecode(response.body);
//     final String userName = data['name'].toString();
//     return userName;
//   }
//   else{
//     throw Exception("Failed to load User: ${response.statusCode}");
//   }
// }
//
//
// class Order {
//   final String id;
//   final String medicineTitle;
//   final String date;
//   final String userId;
//   final String medId;
//   final String quantity;
//
//   Order(this.id, this.medicineTitle, this.date, this.userId, this.medId, this.quantity);
//
//   factory Order.fromJson(Map<String, dynamic> json, String medicineTitle) {
//     return Order(
//       json['_id'],
//       medicineTitle,
//       json['date'],
//       json['userId'],
//       json['medicineId'],
//       json['quantity'],
//     );
//   }
// }