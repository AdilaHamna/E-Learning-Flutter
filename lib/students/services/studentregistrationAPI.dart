import 'dart:io';
import 'package:checkk/services/loginAPI.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

final dio = Dio();

Future<void> RegistrationPageApi(Map<String, dynamic> data, File image, BuildContext context) async {
  try {
    // Prepare the FormData with the image and the other data
    FormData formData = FormData.fromMap({
    ...data,// Example form data
      'studentImage': await MultipartFile.fromFile(image.path, filename: 'profile.jpg'), // Add the image as a MultipartFile
    });

    // Send the POST request with FormData
    Response response = await dio.post('$baseurl/StudentReg', data: formData);

    print(response);
    print(response.statusCode);

    if (response.statusCode == 201) {
      print("success");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration Successful'),
          duration: const Duration(seconds: 5),
        ),
      );
      Navigator.pop(context);
    } else {
      throw Exception('failed to get');
    }
  } catch (e) {
    print(e.toString());
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Registration Failed: ${e.toString()}'),
        duration: const Duration(seconds: 5),
      ),
    );
  }
}
