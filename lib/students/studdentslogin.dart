// import 'package:flutter/material.dart';

// class LoginStudent extends StatefulWidget {
//   const LoginStudent({super.key});

//   @override
//   State<LoginStudent> createState() => _LoginState();
// }

// class _LoginState extends State<LoginStudent> {
//   final TextEditingController _emailController = TextEditingController(text: "");
//   final TextEditingController _passwordController = TextEditingController(text: "");
//   final TextEditingController _usernameController = TextEditingController();
//   var formkey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             color: Color.fromARGB(255, 200, 195, 250),
//           ),
//           width: 400,
//           height: 450, // Adjusted height for new layout
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "LOGIN",
//                   style: TextStyle(
//                     fontSize: 30,
//                     color: Color.fromARGB(255, 47, 45, 74),
//                     fontWeight: FontWeight.bold,
//                     fontStyle: FontStyle.normal,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 TextFormField(
//                   controller: _usernameController,
//                   decoration: InputDecoration(
//                     prefixIcon: Icon(Icons.person),
//                     labelText: 'USERNAME',
//                     labelStyle: TextStyle(color: Colors.black),
//                     filled: true,
//                     fillColor: Colors.white.withOpacity(0.7),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20.0),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 TextFormField(
//                   controller: _passwordController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     suffixIcon: Icon(Icons.lock),
//                     labelText: 'Password',
//                     labelStyle: TextStyle(color: Colors.black),
//                     filled: true,
//                     fillColor: Colors.white.withOpacity(0.7),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20.0),
//                       borderSide: BorderSide.none,
//                     ),
//                   ),
//                 ),
//                 // "Forgot Password" Button moved under the Password field
//                 SizedBox(height: 5),
//                 TextButton(
//                   onPressed: () {
//                     // Navigate to the Forgot Password page
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
//                     );
//                   },
//                   child: Text(
//                     'Forgot Password?',
//                     style: TextStyle(color: Colors.blue),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Add login functionality here
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text('Logging in...')),
//                     );
//                   },
//                   child: Text(
//                     'Login',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.white, // Button color
//                     disabledBackgroundColor: Colors.black, // Text color
//                   ),
//                 ),
//                 SizedBox(height: 15),
//                 TextButton(
//                   onPressed: () {
//                     // Navigate to the Sign Up page
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => SignUpPage()),
//                     );
//                   },
//                   child: Text(
//                     'Create a new account',
//                     style: TextStyle(color: Colors.blue),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Forgot Password Page (Just a placeholder)
// class ForgotPasswordPage extends StatelessWidget {
//   const ForgotPasswordPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Forgot Password'),
//       ),
//       body: Center(
//         child: Text(
//           'Password Reset Page',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }

// // Sign Up Page (Just a placeholder)
// class SignUpPage extends StatelessWidget {
//   const SignUpPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign Up'),
//       ),
//       body: Center(
//         child: Text(
//           'Sign Up Page',
//           style: TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }