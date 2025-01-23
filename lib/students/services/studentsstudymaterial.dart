
import 'package:checkk/services/loginAPI.dart';
import 'package:dio/dio.dart';

final dio = Dio();

Future<List<Map<String, dynamic>>> fetchStudyMaterials() async {
  try {
    Response response = await dio.get('$baseurl/viewstudymaterials');
    print(response);
    if (response.statusCode == 200) {
      print("success");
      List<dynamic> products = response.data;
      return List<Map<String, dynamic>>.from(products);
    } else {
      return [];
    }
  } catch (e) {
    print("Error fetching data: $e");
    return [];
  }
}