import 'package:flutter/material.dart';

class Cup extends StatelessWidget {
  const Cup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
            
        width: 500,
        height:500,color: Colors.pink,
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Abc"),
          SizedBox(height: 10),Text("data")
          ],
        )),
      )),
    );
  }
}
