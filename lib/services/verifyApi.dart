import 'package:checkk/services/loginAPI.dart';
import 'package:dio/dio.dart';

final dio = Dio();

Future<Map<String, dynamic>> acceptRejectStudentAPI(String studentId) async {
  try {
    Response response = await dio.post(
      '$baseurl/acceptstudent_api',
      data: {
        'studentId': studentId,
      },
    );

    print(response);
    if (response.statusCode == 200) {
      // Handle successful response
      return response.data;
    } else {
      // Handle failure
      return {'status': 'error', 'message': 'Failed to update student status'};
    }
  } catch (e) {
    print(e.toString());
    return {'status': 'error', 'message': e.toString()};
  }
}
