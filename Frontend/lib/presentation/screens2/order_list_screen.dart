import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:newcompiled/Infrastructure/providers/providers.dart';
import 'package:newcompiled/domain/entitites/order.dart';
import 'package:newcompiled/presentation/screens/providers/providers.dart';
import 'package:newcompiled/presentation/screens2/order_page_screen.dart';
import 'package:newcompiled/presentation/widget/KendilAppBar.dart';
import 'package:http/http.dart' as http;
import 'package:newcompiled/presentation/screens/create_or_edit_order.dart';


class OrderScreen extends ConsumerWidget {
  final bool is_user;
  final String user_id;

  const OrderScreen({
    Key? key,
    required this.is_user,
    required this.user_id,
  }) : super(key: key);

  Future<void> deleteOrder(WidgetRef ref, String orderId) async {
    final response = await http.delete(Uri.parse('http://10.0.2.2:3000/orders/$orderId'));
    if (response.statusCode == 200) {
      ref.refresh(ordersProvider(user_id));
    } else {
      throw Exception('Failed to delete order');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordersAsyncValue = is_user
        ? ref.watch(ordersProvider(user_id))
        : ref.watch(allOrdersProvider);

    return ordersAsyncValue.when(
      data: (orders) {
        if (orders.isEmpty) {
          return Scaffold(
            appBar: KendilAppBar(title: Text('My Orders')),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No orders found.',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(title: Text('My Orders'),
              leading: IconButton(
              icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/main_pharma_page', extra: {'isPharmacist': !is_user, 'user_id': user_id}); // Use context.pop() instead of Navigator.pop
          },
        ),),
          body: Padding(
            padding: EdgeInsets.all(12.0),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: orders.length,
              separatorBuilder: (_, __) => SizedBox(height: 10),
              itemBuilder: (_, index) => OrderCard(
                order: orders[index],
                isUser: is_user,


                onDelete: () => deleteOrder(ref, orders[index].id),
              ),
            ),
          ),
        );
      },
      loading: () => Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }
}

class OrderCard extends StatelessWidget {
  final Order order;
  final bool isUser;
  final VoidCallback onDelete;

  const OrderCard({
    required this.order,
    required this.isUser,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 130,
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          order.medicineTitle,
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Icon(Icons.shopping_cart),
                        SizedBox(width: 20),
                        Text(order.date),
                        SizedBox(width: 20),
                        Text('amount: ${order.quantity}'),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  if (isUser)
                    Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            context.go('/orderPage?isEditing=true&medicineId=${order.medId}&user_id=${order.userId}');
                          },
                          child: Text('Edit'),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey,
                            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                          ),
                          onPressed: onDelete,
                          child: Text('Delete', style: TextStyle(color: Colors.blue[900])),
                        ),
                      ],
                    )
                  else
                    FutureBuilder<String>(
                      future: getUserName(order.userId),
                      builder: (context, snapshot) => snapshot.hasData
                          ? Text(snapshot.data!)
                          : snapshot.hasError
                          ? Text('Error: ${snapshot.error}')
                          : CircularProgressIndicator(),
                    ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}