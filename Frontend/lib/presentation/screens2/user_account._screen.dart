import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newcompiled/presentation/widget/KendilAppBar.dart';

class UserAccount extends StatefulWidget {
  final String user_id;
  const UserAccount({Key? key, required this.user_id});

  @override
  State<UserAccount> createState() => _UserAccount();
}

class _UserAccount extends State<UserAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            GoRouter.of(context).pop();// Use context.pop() instead of Navigator.pop
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/user_account_edit');
        },
        child: Icon(Icons.edit, color: Colors.white),
        backgroundColor: Colors.green[900],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Divider(
              height: 90.0,
              color: Colors.green[900],
            ),
            SizedBox(height: 20.0),
            Text(
              'Name',
              style: TextStyle(
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Samrawit',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.green[900],
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Age',
              style: TextStyle(
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              '20',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: Colors.green[900],
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Email',
              style: TextStyle(
                letterSpacing: 2.0,
              ),
            ),
            SizedBox(height: 10.0),
            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.green[900],
                ),
                SizedBox(width: 10.0),
                Text(
                  'samrikdawit@gmail.com',
                  style: TextStyle(
                    color: Colors.green[900],
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
