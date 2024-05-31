
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:newcompiled/Infrastructure/providers/providers.dart';
import 'package:newcompiled/domain/entitites/medicine_form.dart';
import 'package:newcompiled/presentation/widget/KendilAppBar.dart';
class AddMedicineScreen extends ConsumerStatefulWidget {
  final String user_id;
  AddMedicineScreen({required this.user_id});
  @override
  _AddMedicineScreenState createState() => _AddMedicineScreenState();

}

class _AddMedicineScreenState extends ConsumerState<AddMedicineScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController manufacturerController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    typeController.dispose();
    manufacturerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final medicineFormState = ref.watch(addMedicineProvider);


    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              context.go('/main_pharma_page', extra: {'isPharmacist': true, 'user_id': widget.user_id});// Use context.pop() instead of Navigator.pop
            },
          ),
          title: Text('Add Medicine')
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

                final form = Medicine(
                  id: widget.user_id,
                  title: nameController.text,
                  description: descriptionController.text,
                  price: priceController.text,
                  category: typeController.text,
                );

                try {
                  await ref.read(addMedicineProvider).call(form);
                  ref.refresh(medicinesFutureProvider);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Medicine added successfully')),
                  );
                  context.go('/main_pharma_page', extra: {'isPharmacist': true, 'user_id': widget.user_id});
                } catch (e) {
                  print(e);
                  ScaffoldMessenger.of(context).showSnackBar(

                    SnackBar(content: Text('Failed to add medicine')),
                  );
                }
              },
              child: Text(
                'Add Medicine',
                style: TextStyle(color: Colors.lightGreen),
              ),
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                  BorderSide(color: Colors.lightGreen, width: 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
