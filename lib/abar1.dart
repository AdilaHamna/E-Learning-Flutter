import 'package:flutter/material.dart';

class Abc extends StatelessWidget {
  const Abc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,backgroundColor: Colors.yellow,
        title: Text(
          "Welcome!",
          style: TextStyle(
              color: Colors.red,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ),
      body: Column(
        children: [
          Center(child: Text("Login")),
          SizedBox(height: 15,),Text("Password")
        ],
      ),
    
    );
  }
}