import 'package:checkk/services/loginAPI.dart';
import 'package:checkk/services/verifyApi.dart';
import 'package:flutter/material.dart';
import 'package:checkk/services/studentgetApi.dart'; // Import your API service

class StudentTableScreen extends StatefulWidget {
  @override
  _StudentTableScreenState createState() => _StudentTableScreenState();
}

class _StudentTableScreenState extends State<StudentTableScreen> {
  late Future<List<dynamic>> studentData;

  @override
  void initState() {
    super.initState();
    // Initialize the API call when the screen is first loaded
    studentData = getstudentProfileAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'STUDENTS INFORMATION',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: studentData, // Fetch the student data from API
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator()); // Loading indicator
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Error: ${snapshot.error}')); // Error state
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
                child: Text(
                    'No student data available')); // No data available state
          } else {
            var students =
                snapshot.data!; // Get the student data from the snapshot
            return SingleChildScrollView(
              child: Column(
                children: students.map((student) {
                  return Card(
                    margin: EdgeInsets.all(8),
                    elevation: 20,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Student Profile Photo
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                                '$baseurl${student['studentImage']}'), // Profile image
                          ),
                          SizedBox(
                              width: 16), // Space between photo and details

                          // Student Details Column
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Admission No: ${student['id']}'),
                                SizedBox(height: 8),
                                Text('Name: ${student['Name']}'),
                                SizedBox(height: 8),
                                Text('Department: ${student['Department']}'),
                                SizedBox(height: 8),
                                Text('Year: ${student['Year']}'),
                                SizedBox(height: 8),
                                Text('E-mail: ${student['emailid']}'),
                              ],
                            ),
                          ),

                          // Verify and Reject Buttons
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  acceptRejectStudentAPI(student["id"].toString());
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors
                                      .green, // Green color for Verify button
                                ),
                                child: Text('Verify'),
                              ),
                              SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () {
                                  acceptRejectStudentAPI(student["id"]);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.red, // Red color for Reject button
                                ),
                                child: Text('Reject'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          }
        },
      ),
    );
  }
}



// import 'package:checkk/services/getprofileAPI.dart';
// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:checkk/services/loginAPI.dart';  // Import the API service

// class StudentTableScreen extends StatefulWidget {
//   @override
//   _StudentTableScreenState createState() => _StudentTableScreenState();
// }

// class _StudentTableScreenState extends State<StudentTableScreen> {
//   late Future<List<dynamic>> students;

//   // Call the API to get student data
//   @override
//   void initState() {
//     super.initState();
//     students = getProfileAPI();  // Fetch the data from the API
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Center(
//           child: Text(
//             'STUDENTS INFORMATION',
//             style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//       body: FutureBuilder<List<dynamic>>(
//         future: students,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No students available.'));
//           } else {
//             List<dynamic> studentData = snapshot.data!;
//             return SingleChildScrollView(
//               child: Column(
//                 children: studentData.map((student) {
//                   // Map the API data to the UI fields
//                   return Card(
//                     margin: EdgeInsets.all(8),
//                     elevation: 20,
//                     child: Padding(
//                       padding: EdgeInsets.all(16),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           // Student Profile Photo
//                           CircleAvatar(
//                             radius: 40,
//                             backgroundImage: NetworkImage(student['profile'] ?? 'https://www.w3schools.com/w3images/avatar2.png'),  // Fallback to default image if no profile picture
//                           ),
//                           SizedBox(width: 16), // Space between photo and details

//                           // Student Details Column
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text('Admission No: ${student['admissionNo']}'),
//                                 SizedBox(height: 8),
//                                 Text('Name: ${student['name']}'),
//                                 SizedBox(height: 8),
//                                 Text('Department: ${student['department']}'),
//                                 SizedBox(height: 8),
//                                 Text('Batch: ${student['batch']}'),
//                                 SizedBox(height: 8),
//                                 Text('E-mail: ${student['email']}'),
//                               ],
//                             ),
//                           ),

//                           // Verify and Reject Buttons
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               ElevatedButton(
//                                 onPressed: () {
//                                   // Add your verification logic here
//                                   print('Verify button clicked for ${student['name']}');
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.green, // Green color for Verify button
//                                 ),
//                                 child: Text('Verify'),
//                               ),
//                               SizedBox(height: 8),
//                               ElevatedButton(
//                                 onPressed: () {
//                                   // Add your reject logic here
//                                   print('Reject button clicked for ${student['name']}');
//                                 },
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.red, // Red color for Reject button
//                                 ),
//                                 child: Text('Reject'),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
