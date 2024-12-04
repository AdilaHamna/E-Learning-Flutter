import 'package:flutter/material.dart';

class Tree extends StatelessWidget {
  const Tree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Text("data"),
            SizedBox(width: 10),Text("structure"),
            SizedBox(width: 15),Text("python",style:TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic) ,),
          ],
        ),
      )





    );
  }
}