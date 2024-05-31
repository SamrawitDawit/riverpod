// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:newcompiled/presentation/screens/mainpharmapage.dart';
// import 'package:newcompiled/presentation/screens/providers/providers.dart';
// import '../widget/KendilAppBar.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
//
//
// class AddMedicineScreen extends ConsumerWidget {
//   final String user_id;
//   AddMedicineScreen({required this.user_id});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final formState = ref.watch(medicineFormProvider);
//     final formNotifier = ref.read(medicineFormProvider.notifier);
//
//     return Scaffold(
//       appBar: KendilAppBar(title: Text('Add Medicine')),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextFormField(
//               onChanged: (value) => formNotifier.setTitle(value),
//               decoration: InputDecoration(labelText: 'Title'),
//             ),
//             SizedBox(height: 16.0),
//             TextFormField(
//               onChanged: (value) => formNotifier.setDescription(value),
//               decoration: InputDecoration(labelText: 'Description'),
//               maxLines: 3,
//             ),
//             SizedBox(height: 16.0),
//             TextFormField(
//               onChanged: (value) => formNotifier.setPrice(value),
//               decoration: InputDecoration(labelText: 'Price'),
//               keyboardType: TextInputType.number,
//             ),
//             SizedBox(height: 16.0),
//             TextFormField(
//               onChanged: (value) => formNotifier.setCategory(value),
//               decoration: InputDecoration(labelText: 'Category'),
//               keyboardType: TextInputType.number,
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () {
//                 ref.read(addMedicineProvider(formState).future).then((_) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => MainPharmaPage(isPharmacist: true, user_id: user_id),
//                     ),
//                   );
//                 }).catchError((error) {
//                   print(error);
//                 });
//               },
//               child: Text(
//                 'Add Medicine',
//                 style: TextStyle(color: Colors.lightGreen),
//               ),
//               style: ButtonStyle(
//                 side: MaterialStateProperty.all(
//                   BorderSide(color: Colors.lightGreen, width: 2),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
