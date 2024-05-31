import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:go_router/go_router.dart';

class UserAccountEditPage extends StatefulWidget {
  final String userId;
  const UserAccountEditPage({Key? key, required this.userId}) : super(key: key);

  @override
  _UserAccountEditPageState createState() => _UserAccountEditPageState();
}

class _UserAccountEditPageState extends State<UserAccountEditPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _roleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _roleController,
              decoration: InputDecoration(
                labelText: 'Role',
              ),
            ),
            SizedBox(height: 32.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _updateAccount();
                },
                child: Text('Save Changes', style: TextStyle(color: Colors.lightGreen)),
                style: ButtonStyle(
                  side: MaterialStateProperty.all(
                    BorderSide(color: Colors.lightGreen, width: 2),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0), // Added space between buttons
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _deleteAccount();
                },
                child: Text('Delete Account', style: TextStyle(color: Colors.red)),
                style: ButtonStyle(
                  side: MaterialStateProperty.all(
                    BorderSide(color: Colors.red, width: 2),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _updateAccount() async {
    final String userId = widget.userId;
    final String name = _nameController.text;
    final String email = _emailController.text;
    final String role = _roleController.text;

    final Uri uri = Uri.parse('http://10.0.2.2:3000/account/$userId');

    final response = await http.put(
      uri,
      body: {
        'name': name,
        'email': email,
        'role': role,
      },
    );

    if (response.statusCode == 200) {
      GoRouter.of(context).pop();
    } else {
    print('Some thing went Wrong');
        }
  }

  Future<void> _deleteAccount() async {
    final String userId = widget.userId;
    final Uri uri = Uri.parse('http://10.0.2.2:3000/account/$userId');

    final response = await http.delete(uri);

    if (response.statusCode == 200) {
      // Successful deletion
      GoRouter.of(context).pop();
    } else {
      // Handle error
      // You can display an error message or handle it as per your requirement
    }
  }
}
