import 'package:flutter/material.dart';
import 'package:newcompiled/presentation/screens2/list_medicine_screen.dart';
import 'package:newcompiled/presentation/screens2/order_list_screen.dart';
import 'package:newcompiled/presentation/screens2/pharmacat.dart';
import 'package:newcompiled/presentation/screens2/user_account._screen.dart';
import '../widget/KendilAppBar.dart';
import '../widget/bottomnav.dart';
import 'package:go_router/go_router.dart';

class MainPharmaPage extends StatelessWidget {
  final String user_id;
  final bool isPharmacist;
  const MainPharmaPage({super.key, required this.isPharmacist, required this.user_id});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              context.go('/login'); // Use context.pop() instead of Navigator.pop
            },
          ),
          title: Text('Kendil Products'),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    const PharmaPageBody(),
                    SizedBox(height: 10),
                    ListMedicineScreen(isPharmacist: isPharmacist, userId: user_id),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBarWidget(
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
      ),
    );
  }
}