import 'package:checkk/abar.dart';
import 'package:checkk/abar1.dart';
import 'package:checkk/bottomnavbar.dart';
import 'package:checkk/chatbot.dart';
import 'package:checkk/container.dart';
import 'package:checkk/home.dart';
import 'package:checkk/login.dart';
import 'package:checkk/material.dart';
import 'package:checkk/row.dart';
import 'package:checkk/studentsassignment.dart';
import 'package:checkk/studentshome.dart';
import 'package:checkk/studentsqp.dart';
import 'package:checkk/studentsstudymaterial.dart';
import 'package:checkk/studentssyllabus.dart';
import 'package:checkk/studentverification.dart';
import 'package:checkk/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
     
      home: 
    // Login(),
    // CustomProfileScreen(),
    // ViewScreen(),
    // StudyMaterialScreen(),
    // BottomNavBarScreen()
    // StudentTableScreen(),
    HomePage(),
    // StudyMaterialsPage(),
    // QuestionPaperPage(),
    // SyllabusPage(),
    // AssignmentPage(),
    // NotificationPage(),
    // ChatbotPage(userName: 'Adila',),
    
    );
  }
}

