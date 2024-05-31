import 'package:flutter/material.dart';
import '../widget/KendilAppBar.dart';
import 'package:go_router/go_router.dart';

class UserAccountEditPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).pop(); // Use context.pop() instead of Navigator.pop
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Age',
              ),
            ),
            SizedBox(height: 32.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Save changes
                },
                child: Text('Save Changes', style: TextStyle(color: Colors.lightGreen)),
                style: ButtonStyle(
                  side: MaterialStateProperty.all(
                    BorderSide(color: Colors.lightGreen, width: 2),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
