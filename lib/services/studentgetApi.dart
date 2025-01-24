//api post

//api post

import 'package:checkk/services/loginAPI.dart';
import 'package:dio/dio.dart';

Map<String, dynamic> profileData = {};

final dio = Dio();

Future<List<dynamic>> getstudentProfileAPI() async {
  try {
    Response response = await dio.get(
      '$baseurl/viewstudent_api',
    );
    print(response);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print("success");
      List<dynamic> listdata = response.data;
      return listdata;
    } else {
      return [];
    }
  } catch (e) {
    print(e.toString());
    return [];
  }
}
