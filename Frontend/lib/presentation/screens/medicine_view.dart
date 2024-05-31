// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:newcompiled/presentation/screens/providers/providers.dart';
// import '../widget/bottomnav.dart';
// import 'create_or_edit_order.dart';
// import 'editmed.dart';
// import 'listmedicince.dart';
// import 'mainpharmapage.dart';
// import 'order_list.dart';
// import 'useraccount.dart';
//
// class MedicineViewPage extends ConsumerWidget {
//   final MedicineForm medicineItem;
//   final bool isPharmacist;
//   final String user_id;
//
//   MedicineViewPage({
//     required this.medicineItem,
//     required this.isPharmacist,
//     required this.user_id,
//   });
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Medicine Details'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: double.infinity,
//               margin: EdgeInsets.only(bottom: 20),
//               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(5),
//                   bottomRight: Radius.circular(5),
//                 ),
//                 color: Colors.lightGreen,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     medicineItem.title,
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
//                   ),
//                   SizedBox(height: 10),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 20),
//                   child: Text(
//                     medicineItem.description,
//                     style: TextStyle(fontSize: 16, color: Colors.grey[600]),
//                   ),
//                 ),
//                 SizedBox(height: 15),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 5),
//                   child: Text(
//                     medicineItem.category,
//                     style: TextStyle(fontSize: 16, color: Colors.black),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Padding(
//                   padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 5),
//                   child: Text(
//                     medicineItem.price,
//                     style: TextStyle(fontSize: 16, color: Colors.black),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 SizedBox(width: 20),
//                 Expanded(
//                   child: isPharmacist
//                       ? ElevatedButton(
//                     onPressed: () {
//                       // Set the medicineId in the provider
//                       ref.read(medicineIdProvider.notifier).state = medicineItem.id;
//
//                       // Navigate to the Edit Medicine page
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => EditMedicineScreen()),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.lightGreen,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     child: Text(
//                       'Edit',
//                       style: TextStyle(fontSize: 16, color: Colors.white),
//                     ),
//                   )
//                       : ElevatedButton(
//                     onPressed: () {
//                       // Navigate to the Order page
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => OrderPage(
//                               isEditing: false,
//                               medicineId: medicineItem.id,
//                               user_id: user_id,
//                             )),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.lightGreen,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                     ),
//                     child: Text(
//                       'Order',
//                       style: TextStyle(fontSize: 16, color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 20),
//               ],
//             ),
//             SizedBox(height: 20),
//           ],
//         ),
//       ),
//       persistentFooterButtons: [
//         BottomNavigationBarWidget(
//           currentIndex: 0,
//           onTap: (index) {
//             if (index == 0) {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => MedicineListScreen(
//                       isPharmacist: isPharmacist,
//                       userId: user_id,
//                     )),
//               );
//             } else if (index == 1) {
//               bool user;
//               if (isPharmacist)
//                 user = false;
//               else
//                 user = true;
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => OrderScreen(
//                       is_user: user,
//                       user_id: user_id,
//                     )),
//               );
//             } else if (index == 2) {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => UserAccount(
//                       user_id: user_id,
//                     )),
//               );
//             }
//           },
//         ),
//       ],
//     );
//   }
// }
