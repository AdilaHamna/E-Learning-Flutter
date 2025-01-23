import 'package:checkk/services/loginAPI.dart';
import 'package:dio/dio.dart';

final dio = Dio();

// API function to fetch assignments
Future<List<Map<String, dynamic>>> AssignmentPageApi() async {
  try {
    Response response = await dio.get('$baseurl/viewassignment');
    print(response);
    if (response.statusCode == 200) {
      print("success");
      List<dynamic> products = response.data;
      return List<Map<String, dynamic>>.from(products);
    } else {
      return [];
    }
  } catch (e) {
    print(e.toString());
    return [];
  }
}