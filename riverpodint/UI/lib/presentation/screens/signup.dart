// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:newcompiled/presentation/screens/login.dart';
// import 'package:newcompiled/presentation/screens/providers/auth_notifier.dart';
// import 'mainpharmapage.dart';
// import 'welcome.dart';
//
//
// class SignupPage extends ConsumerWidget {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _roleController = TextEditingController();
//   String _selectedRole  = 'Role';
//
//   void updateSelectedRole(String role) {
//     _selectedRole = role;
//   }
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final authState = ref.watch(authProvider);
//     final authNotifier = ref.read(authProvider.notifier);
//
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.push(context, MaterialPageRoute(
//                 builder: (context) => WelcomePage())); // Navigates back to the previous page
//           },
//         ),
//       ),
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           Image.asset(
//             'assets2/front.jpg', // Replace with your own background image path
//             fit: BoxFit.cover,
//           ),
//           SingleChildScrollView(
//             padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: MediaQuery.of(context).viewInsets.bottom + 20),
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(height: 20),
//                   Text(
//                     'Signup',
//                     style: TextStyle(
//                       fontSize: 40,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.green[900],
//                     ),
//                   ),
//                   SizedBox(height: 20),
//
//                   TextFormField(
//                     controller: _nameController,
//                     style: TextStyle(color: Colors.green), // Set text color
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.white.withOpacity(1),
//                       hintText: 'Name',
//                       prefixIcon: Icon(Icons.person, color: Colors.green),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(color: const Color.fromRGBO(27, 94, 32, 1), width: 10.0),
//                       ),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your name';
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: 20),
//                   TextFormField(
//                     controller: _emailController,
//                     style: TextStyle(color: Colors.green), // Set text color
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.white.withOpacity(1),
//                       hintText: 'Email',
//                       prefixIcon: Icon(Icons.email, color: Colors.green),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(color: const Color.fromRGBO(27, 94, 32, 1), width: 10.0),
//                       ),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your email';
//                       }
//                       // Add more complex email validation if needed
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: 20),
//                   TextFormField(
//                     controller: _passwordController,
//                     obscureText: true,
//                     style: TextStyle(color: Colors.green), // Set text color
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.white.withOpacity(1),
//                       hintText: 'Password',
//                       prefixIcon: Icon(Icons.lock, color: Colors.green),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(color: const Color.fromRGBO(27, 94, 32, 1), width: 10.0),
//                       ),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter your password';
//                       }
//                       // Add more complex password validation if needed
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: 20),
//                   MyDropdownButtonFormField(
//                     controller: _roleController,
//                     onRoleChanged: updateSelectedRole,
//                   ),
//                   SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: authState.isLoading
//                         ? null
//                         : () {
//                       authNotifier.signUp(
//                         _nameController.text,
//                         _emailController.text,
//                         _passwordController.text,
//                         _selectedRole,
//                             (token, role, id) {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => MainPharmaPage(isPharmacist: role, user_id: id),
//                             ),
//                           );
//                         },
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
//                       backgroundColor: Colors.green[900],
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     child: authState.isLoading
//                         ? CircularProgressIndicator(color: Colors.white)
//                         : Text('Signup', style: TextStyle(fontSize: 18, color: Colors.white)),
//                   ),
//                   SizedBox(height: 20),
//                   if (authState.errorMessage != null)
//                     Text(authState.errorMessage!, style: TextStyle(color: Colors.red)),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => LoginPage()),
//                       );
//                     },
//                     child: Text(
//                       'Already have an account? Login',
//                       style: TextStyle(fontSize: 16, color: Colors.green[900], fontWeight: FontWeight.w900),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class MyDropdownButtonFormField extends StatefulWidget {
//   final TextEditingController controller;
//   final Function(String) onRoleChanged;
//
//   MyDropdownButtonFormField({required this.controller, required this.onRoleChanged});
//
//   @override
//   _MyDropdownButtonFormFieldState createState() =>
//       _MyDropdownButtonFormFieldState();
// }
//
// class _MyDropdownButtonFormFieldState extends State<MyDropdownButtonFormField> {
//   String? _selectedRole;
//
//   @override
//   void initState() {
//     super.initState();
//     _selectedRole = widget.controller.text.isEmpty ? null : widget.controller.text;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonFormField<String>(
//       value: _selectedRole,
//       onChanged: (String? newValue) {
//         if (newValue != null) {
//           setState(() {
//             _selectedRole = newValue;
//           });
//           widget.controller.text = newValue; // Update the controller's text
//           widget.onRoleChanged(newValue); // Notify the parent about the role change
//         }
//       },
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: Colors.white.withOpacity(1),
//         hintText: 'Role',
//         prefixIcon: Icon(Icons.work, color: Colors.green),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(color: const Color.fromRGBO(27, 94, 32, 1), width: 10.0),
//         ),
//       ),
//       items: <String>['Pharmacist', 'Client']
//           .map((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//   }
// }
