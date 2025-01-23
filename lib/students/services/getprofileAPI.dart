//api post

//api post

import 'package:checkk/services/loginAPI.dart';
import 'package:dio/dio.dart';

Map<String, dynamic> profileData = {};

final dio = Dio();

Future<Map<String, dynamic>> getProfileAPI() async {
  try {
    Response response = await dio.get(
      '$baseurl/Viewprofile/$lid',
    );
    print(response);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print("success");
      // List<dynamic> products = response.data;
      // List<Map<String, dynamic>> listdata =
      //     List<Map<String, dynamic>>.from(products);
      profileData = response.data;
      return response.data;
    } else {
      return {};
    }
  } catch (e) {
    print(e.toString());
    return {};
  }
}