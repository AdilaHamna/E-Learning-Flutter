import 'package:checkk/abar.dart';
import 'package:checkk/abar1.dart';
import 'package:checkk/faculty/addassignment.dart';
import 'package:checkk/faculty/addqp.dart';
import 'package:checkk/faculty/addstudymaterial.dart';
import 'package:checkk/faculty/addsyllabus.dart';
import 'package:checkk/faculty/editstudymaterial.dart';
import 'package:checkk/faculty/uploadicon.dart';
import 'package:checkk/students/bottomnavbar.dart';
import 'package:checkk/students/notificationview.dart';
import 'package:checkk/students/pdfview.dart';
import 'package:checkk/students/chatbot.dart';
import 'package:checkk/container.dart';
import 'package:checkk/faculty/home.dart';
import 'package:checkk/faculty/login.dart';
import 'package:checkk/row.dart';
import 'package:checkk/students/studdentslogin.dart';
import 'package:checkk/students/screens/studentregistration.dart';
import 'package:checkk/students/screens/studentsassignment.dart';
import 'package:checkk/students/screens/studentshome.dart';
import 'package:checkk/students/screens/studentsqp.dart';
import 'package:checkk/students/screens/studentsstudymaterial.dart';
import 'package:checkk/students/screens/studentssyllabus.dart';
import 'package:checkk/studentverification.dart';
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
    FacultyHomeScreen()
    // RegistrationPage(),
    // HomePage(),
    // StudyMaterialsPage(),
    // QuestionPaperPage(),
    // SyllabusPage(),
    // AssignmentPage(),
    // BottomNavBarScreen()
    // NotificationPage(),
    // ChatbotPage(userName: 'Adila',),
    // PdfViewPage(pdfPath: '',),


    // Login(),
    // HomeScreen(),
    // StudentTableScreen(),
    // UploadAssignment(),
    // QuestionPaperView(),
    // AddStudyMaterial(),
    // AddSyllabus(),
    // BottomNavBarScreen(),
    // EditStudyMaterial(),
    // ViewScreen(),

    



     
  
    
    
    );
  }
}

