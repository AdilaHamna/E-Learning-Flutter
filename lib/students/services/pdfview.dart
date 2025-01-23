//api post

//api post

import 'package:checkk/services/loginAPI.dart';
import 'package:dio/dio.dart';

final dio = Dio();

Future<List<Map<String, dynamic>>> PdfViewPageApi() async {
  try {
    Response response = await dio.get('$baseurl/user', );
    print(response);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print("success");
      List<dynamic> products = response.data;
      List<Map<String, dynamic>> listdata =
          List<Map<String, dynamic>>.from(products);
      return listdata;
    } else {
      return [];
    }
  } catch (e) {
    print(e.toString());
    return [];
  }
}