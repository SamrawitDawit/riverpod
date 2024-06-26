import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:newcompiled/Infrastructure/providers/providers.dart';
import 'package:newcompiled/domain/entitites/medicine_form.dart';


class EditMedicineScreen extends ConsumerWidget {
  final String user_id;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController manufacturerController = TextEditingController();
  EditMedicineScreen({required this.user_id});
  @override

  Widget build(BuildContext context, WidgetRef ref) {
    // Retrieve the medicineId from the provider
    final medicineId = ref.watch(medicineIdProvider);


    return Scaffold(
      appBar: AppBar(title: Text('Edit Medicine'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/main_pharma_page', extra: {'isPharmacist': true, 'user_id': user_id});// Use context.pop() instead of Navigator.pop
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
              maxLines: 3,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: typeController,
              decoration: InputDecoration(labelText: 'Type'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                if (medicineId == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Medicine ID is missing')),
                  );
                  return;
                }

                final form = Medicine(
                  id: medicineId, // Use the ID from the provider
                  title: nameController.text,
                  description: descriptionController.text,
                  price: priceController.text,
                  category: typeController.text,
                );
                try {
                  await ref.read(editMedicineProvider(form).future);
                  ref.refresh(medicinesProvider);
                  ref.refresh(medicinesFutureProvider);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Medicine edited successfully')),
                  );
                  context.go('/main_pharma_page', extra: {'isPharmacist': true, 'user_id': user_id});

                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to edit medicine')),
                  );
                }
              },
              child: Text(
                'Edit Medicine',
                style: TextStyle(color: Colors.lightGreen),
              ),
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                  BorderSide(color: Colors.lightGreen, width: 2),
                ),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () async {
                if (medicineId == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Medicine ID is missing')),
                  );
                  return;
                }

                try {
                  await ref.read(deleteMedicineProvider(medicineId).future);
                  ref.refresh(medicinesProvider);
                  ref.refresh(medicinesFutureProvider);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Medicine deleted successfully')),

                  );
                  context.go('/main_pharma_page', extra: {'isPharmacist': true, 'user_id': user_id});
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to delete medicine')),
                  );
                }
              },
              child: Text(
                'Delete Medicine',
                style: TextStyle(color: Colors.redAccent),
              ),
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                  BorderSide(color: Colors.redAccent, width: 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
