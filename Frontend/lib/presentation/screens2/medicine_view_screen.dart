import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:newcompiled/Infrastructure/providers/providers.dart';
import 'package:newcompiled/domain/entitites/medicine_form.dart';
import 'package:newcompiled/presentation/screens2/edit_medicine_screen.dart';
import 'package:newcompiled/presentation/screens2/list_medicine_screen.dart';
import 'package:newcompiled/presentation/screens2/order_list_screen.dart';
import 'package:newcompiled/presentation/screens2/order_page_screen.dart';
import 'package:newcompiled/presentation/screens2/user_account._screen.dart';
import '../widget/bottomnav.dart';


class MedicineViewPage extends ConsumerWidget {
  final Medicine medicineItem;
  final bool isPharmacist;
  final String user_id;

  MedicineViewPage({
    required this.medicineItem,
    required this.isPharmacist,
    required this.user_id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicine Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
                color: Colors.lightGreen,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    medicineItem.title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    medicineItem.description,
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 5),
                  child: Text(
                    medicineItem.category,
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 5),
                  child: Text(
                    medicineItem.price,
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 20),
                Expanded(
                  child: isPharmacist
                      ? ElevatedButton(
                    onPressed: () {
                      // Set the medicineId in the provider
                      ref.read(medicineIdProvider.notifier).state = medicineItem.id;

                      // Navigate to the Edit Medicine page
                      context.go('/edit_medicine?userId=${user_id}');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Edit',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  )
                      : ElevatedButton(
                    onPressed: () {
                      // Navigate to the Order page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OrderPage(
                              isEditing: false,
                              medicineId: medicineItem.id,
                              user_id: user_id,
                            )),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Order',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
      persistentFooterButtons: [
        BottomNavigationBarWidget(
          currentIndex: 0,
          onTap: (index) {
            if (index == 0) {
              context.go('/main_pharma_page', extra: {'isPharmacist': isPharmacist, 'user_id': user_id});
            } else if (index == 1) {
              context.go('/order', extra: {'is_user': !isPharmacist, 'user_id': user_id});
            } else if (index == 2) {
              context.go('/user_account', extra: user_id);
            }
          },
        ),
      ],
    );
  }
}
