import 'package:checkk/services/loginAPI.dart';
import 'package:checkk/students/screens/studentregistration.dart';
import 'package:flutter/material.dart';

class Login1 extends StatefulWidget {
  const Login1({super.key});

  @override
  State<Login1> createState() => _Login1State();
}

class _Login1State extends State<Login1> {
  final TextEditingController _emailController = TextEditingController(text: "");
  final TextEditingController _passwordController = TextEditingController(text: "");
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Validate Email and Password before login
  void _validateAndLogin() {
    if (formKey.currentState!.validate()) {
      // Call the login API
      loginApi(_emailController.text, _passwordController.text, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color.fromARGB(255, 200, 195, 250),
          ),
          width: 400,
          height: 400,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Login Title
                  Text(
                    "LOGIN",
                    style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 47, 45, 74),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Email Field
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.7),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      // Simple email validation
                      if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$").hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),

                  // Password Field
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.lock),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.black),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.7),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),

                  // Forgot Password Link (currently no functionality)
                  TextButton(
                    onPressed: () {
                      // You can implement Forgot Password functionality here
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),

                  // Login Button
                  ElevatedButton(
                    onPressed: _validateAndLogin,
                    child: Text('Login', style: TextStyle(color: Colors.black)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 31, 91, 195),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  // Register Link (Navigates to Registration Page)
                  SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegistrationPage()),
                      );
                    },
                    child: Text('Don’t have an account? Register here'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
