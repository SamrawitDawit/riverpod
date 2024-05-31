// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:newcompiled/presentation/screens/providers/providers.dart';
// import '../widget/KendilAppBar.dart';
//
// class EditMedicineScreen extends ConsumerWidget {
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController typeController = TextEditingController();
//   final TextEditingController manufacturerController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // Retrieve the medicineId from the provider
//     final medicineId = ref.watch(medicineIdProvider);
//
//     return Scaffold(
//       appBar: KendilAppBar(title: Text('Edit Medicine')),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextFormField(
//               controller: nameController,
//               decoration: InputDecoration(labelText: 'Name'),
//             ),
//             SizedBox(height: 16.0),
//             TextFormField(
//               controller: descriptionController,
//               decoration: InputDecoration(labelText: 'Description'),
//               maxLines: 3,
//             ),
//             SizedBox(height: 16.0),
//             TextFormField(
//               controller: priceController,
//               decoration: InputDecoration(labelText: 'Price'),
//               keyboardType: TextInputType.number,
//             ),
//             SizedBox(height: 16.0),
//             TextFormField(
//               controller: typeController,
//               decoration: InputDecoration(labelText: 'Type'),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: () async {
//                 if (medicineId == null) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Medicine ID is missing')),
//                   );
//                   return;
//                 }
//
//                 final form = MedicineForm(
//                   id: medicineId, // Use the ID from the provider
//                   title: nameController.text,
//                   description: descriptionController.text,
//                   price: priceController.text,
//                   category: typeController.text,
//                 );
//                 try {
//                   await ref.read(editMedicineProvider(form).future);
//                   ref.refresh(medicinesProvider);
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Medicine edited successfully')),
//                   );
//                 } catch (e) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Failed to edit medicine')),
//                   );
//                 }
//               },
//               child: Text(
//                 'Edit Medicine',
//                 style: TextStyle(color: Colors.lightGreen),
//               ),
//               style: ButtonStyle(
//                 side: MaterialStateProperty.all(
//                   BorderSide(color: Colors.lightGreen, width: 2),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20,),
//             ElevatedButton(
//               onPressed: () async {
//                 if (medicineId == null) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Medicine ID is missing')),
//                   );
//                   return;
//                 }
//
//                 try {
//                   await ref.read(deleteMedicineProvider(medicineId).future);
//                   ref.refresh(medicinesProvider);
//
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Medicine deleted successfully')),
//                   );
//                 } catch (e) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(content: Text('Failed to delete medicine')),
//                   );
//                 }
//               },
//               child: Text(
//                 'Delete Medicine',
//                 style: TextStyle(color: Colors.redAccent),
//               ),
//               style: ButtonStyle(
//                 side: MaterialStateProperty.all(
//                   BorderSide(color: Colors.redAccent, width: 2),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
