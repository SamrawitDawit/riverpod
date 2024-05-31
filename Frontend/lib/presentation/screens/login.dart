// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:newcompiled/presentation/screens/listmedicince.dart';
// import 'package:newcompiled/presentation/screens/providers/auth_notifier.dart';
// import 'package:newcompiled/presentation/screens/signup.dart';
// import 'mainpharmapage.dart';
// import 'welcome.dart';
//
//
// class LoginPage extends ConsumerWidget {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final authState = ref.watch(authProvider);
//     final authNotifier = ref.read(authProvider.notifier);
//
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
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
//                   Text(
//                     'Login',
//                     style: TextStyle(
//                       fontSize: 40,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.green[900],
//                     ),
//                   ),
//                   SizedBox(height: 100),
//                   TextField(
//                     controller: _emailController,
//                     style: TextStyle(color: Colors.green), // Set text color
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.white.withOpacity(1),
//                       hintText: 'Email',
//                       prefixIcon: Icon(Icons.email, color: Colors.green),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide(color: const Color.fromARGB(255, 15, 68, 18), width: 10.0 ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 25),
//                   TextField(
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
//                         borderSide: BorderSide(color: Colors.green, width: 10.0),
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 80),
//                   ElevatedButton(
//                     onPressed: authState.isLoading
//                         ? null
//                         : () {
//                       authNotifier.login(
//                         _emailController.text,
//                         _passwordController.text,
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
//                         : Text('Login', style: TextStyle(fontSize: 18, color: Colors.white)),
//                   ),
//                   SizedBox(height: 10),
//                   if (authState.errorMessage != null)
//                     Text(authState.errorMessage!, style: TextStyle(color: Colors.red)),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => SignupPage()),
//                       );
//                     },
//                     child: Text(
//                       'Create an account',
//                       style: TextStyle(fontSize: 16, color: Colors.green[900], fontWeight: FontWeight.w900),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
