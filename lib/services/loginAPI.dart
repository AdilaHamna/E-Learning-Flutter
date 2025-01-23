import 'package:checkk/faculty/home.dart';
import 'package:checkk/services/getprofileAPI.dart';
import 'package:checkk/students/screens/studentshome.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

String baseurl = 'http://192.168.1.29:5000';
int? lid;
String? userType;
String? loginStatus;

Future<void> loginApi(
    String email, String password, BuildContext context) async {
  try {
    Dio dio = Dio();

    // Prepare the form data for the POST request
    FormData formData = FormData.fromMap({
      'Username': email,
      'Password': password,
    });

    // Perform the POST request
    final response = await dio.post('$baseurl/loginapi', data: formData);

    // Check the status code and response data
    print(response.data);
    int statusCode = response.statusCode ?? 0;
    print('Status code: $statusCode');

    // Decode the JSON response
    final data = response.data;

    loginStatus = data['message'] ?? 'failed';

    if (statusCode == 200 && loginStatus == 'success') {
      userType = data['type'];
      lid = data['login_id'];
      await getProfileAPI();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ctxt) =>StudentHomePage()));
      // // Navigate based on userType
      // if (userType == 'admin') {
      //   // Navigator.pushReplacement(
      //   //   context,
      //   //   MaterialPageRoute(builder: (ctx) => AdminHomePage()),
      //   // );
      // } else if (userType == 'user') {
      //   // Navigator.pushReplacement(
      //   //   context,
      //   //   MaterialPageRoute(builder: (ctx) => UserHomePage()),
      //   // );
      // } else if (userType == 'doctor') {
      //   // Navigator.pushReplacement(
      //   //   context,
      //   //   MaterialPageRoute(builder: (ctx) => Doctorhomepage()),
      //   // );
      // } else {
      //   // Handle unknown userType
      //   print('Unknown userType: $userType');
      // }
    } else {
      print('Login failed: $loginStatus');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login failed: $loginStatus'),
        ),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error during login: $e'),
      ),
    );  
    print('Error during login: $e');
  }
}