// // import 'package:flutter/material.dart';
// // import 'package:flutter_riverpod/flutter_riverpod.dart';
// // import 'package:newcompiled/presentation/screens/order_list.dart';
// // import 'package:newcompiled/presentation/screens/providers/providers.dart';
// // import 'package:newcompiled/presentation/widget/KendilAppBar.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:http/http.dart' as http;
// // import 'package:flutter/scheduler.dart';
// // import 'dart:convert';
// //
// class OrderPage extends ConsumerStatefulWidget {
//   final bool isEditing;
//   final String? medicineId;
//   final int? amount;
//   final DateTime? date;
//   final String user_id;
//   final String? order_id;
//
//   OrderPage({
//     required this.isEditing,
//     required this.medicineId,
//     this.amount,
//     this.date,
//     required this.user_id,
//     this.order_id,
//   });
//
//   @override
//   _OrderPageState createState() => _OrderPageState();
// }
//
// class _OrderPageState extends ConsumerState<OrderPage> {
//   late TextEditingController _amountController;
//   late TextEditingController _dateController;
//
//   @override
//   void initState() {
//     super.initState();
//     _amountController = TextEditingController(text: widget.amount?.toString() ?? '');
//     _dateController = TextEditingController(text: widget.date?.toIso8601String() ?? '');
//
//     SchedulerBinding.instance.addPostFrameCallback((_) {
//       if (widget.order_id != null) {
//         ref.read(orderIdProvider.notifier).state = widget.order_id;
//       } else {
//         _loadOrderIdFromPrefs();
//       }
//     });
//   }
//
//   Future<void> _loadOrderIdFromPrefs() async {
//     final prefs = await SharedPreferences.getInstance();
//     ref.read(orderIdProvider.notifier).state = prefs.getString('orderId');
//   }
//
//   @override
//   void dispose() {
//     _amountController.dispose();
//     _dateController.dispose();
//     super.dispose();
//   }
//
//   Future<String?> getToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString('token');
//   }
//
//   Future<void> createOrder(String quantity, String date) async {
//     final String medicineId = widget.medicineId!;
//     final token = await getToken();
//     final response = await http.post(
//       Uri.parse('http://10.0.2.2:3000/orders/create'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         // 'Authorization': 'Bearer $token'
//       },
//       body: jsonEncode(<String, String>{
//         'medicineId': medicineId,
//         'quantity': quantity,
//         'date': date,
//         'userId': widget.user_id,
//       }),
//     );
//
//     if (response.statusCode == 201) {
//       final data = jsonDecode(response.body);
//       ref.read(orderIdProvider.notifier).state = data['_id'];
//
//       // Store orderId in SharedPreferences
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.setString('orderId', ref.read(orderIdProvider.notifier).state!);
//       ref.refresh(ordersProvider(widget.user_id));
//       print('Created Order ID: ${ref.read(orderIdProvider.notifier).state}');
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => OrderScreen(is_user: true, user_id: widget.user_id)),
//       );
//     } else {
//       print('Error creating order: ${response.body}');
//     }
//
//
//   }
//
//   Future<void> updateOrder(String quantity, String date) async {
//     final orderId = ref.read(orderIdProvider) ;
//     if (orderId == null) {
//       print("Order ID is null");
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Order ID is null')),
//       );
//       return;
//     }
//
//     final token = await getToken();
//     final response = await http.put(
//       Uri.parse('http://10.0.2.2:3000/orders/$orderId'),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         // 'Authorization': 'Bearer $token'
//       },
//       body: jsonEncode(<String, String>{
//         'quantity': quantity,
//         'date': date,
//       }),
//     );
//
//     if (response.statusCode == 200) {
//       ref.refresh(ordersProvider(widget.user_id));
//       print('Updated Order ID: $orderId');
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => OrderScreen(is_user: true, user_id: widget.user_id)),
//       );
//     } else {
//       print('Error updating order: ${response.body}');
//     }
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: KendilAppBar(
//         title: Text(widget.isEditing ? 'Edit Order' : 'Create Order'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             SizedBox(height: 40.0),
//             TextField(
//               controller: _amountController,
//               decoration: InputDecoration(labelText: 'Amount'),
//               keyboardType: TextInputType.number,
//             ),
//             SizedBox(height: 30.0),
//             TextField(
//               controller: _dateController,
//               decoration: InputDecoration(labelText: 'Date'),
//               onTap: () async {
//                 DateTime? pickedDate = await showDatePicker(
//                   context: context,
//                   initialDate: DateTime.now(),
//                   firstDate: DateTime.now().subtract(Duration(days: 365)),
//                   lastDate: DateTime.now().add(Duration(days: 365)),
//                 );
//                 if (pickedDate != null) {
//                   String formattedDate = "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
//                   _dateController.text = formattedDate;
//                 }
//               },
//             ),
//             SizedBox(height: 35.0),
//             ElevatedButton(
//               onPressed: () {
//                 String quantity = _amountController.text.trim();
//                 String date = _dateController.text.trim();
//
//                 if (quantity.isEmpty || date.isEmpty) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Please fill all fields')),
//                   );
//                 } else {
//                   if (widget.isEditing) {
//                     updateOrder(quantity, date);
//                   } else {
//                     createOrder(quantity, date);
//                   }
//                 }
//               },
//               child: Text(widget.isEditing ? 'Edit' : 'Create',
//                   style: TextStyle(color: Colors.lightGreen)),
//               style: ButtonStyle(
//                 side: MaterialStateProperty.all(
//                   BorderSide(color: Colors.lightGreen, width: 2),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
