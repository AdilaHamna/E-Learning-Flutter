// import 'package:flutter/material.dart';



// class StudentTableScreen extends StatelessWidget {
//   final List<Map<String, String>> students = [
//     {
//       'no': '1',
//       'profile': 'https://www.w3schools.com/w3images/avatar2.png',
//       'admissionNo': 'A001',
//       'name': 'John Doe',
//       'department': 'CS',
//       'batch': '2022-2025',
//       'email': 'john.doe@example.com',
//     },
//     {
//       'no': '2',
//       'profile': 'https://www.w3schools.com/w3images/avatar6.png',
//       'admissionNo': 'A002',
//       'name': 'Jane Smith',
//       'department': 'IT',
//       'batch': '2O22-2025',
//       'email': 'jane.smith@example.com',
//     },
//     {
//       'no': '3',
//       'profile': 'https://www.w3schools.com/w3images/avatar3.png',
//       'admissionNo': 'A003',
//       'name': 'Alex Johnson',
//       'department': 'SE',
//       'batch': '2022-2025',
//       'email': 'alex.johnson@example.com',
//     },
//     // Add more students as needed
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Center(child: Text('STUDENTS INFORMATION' ,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),))),
//       body: SingleChildScrollView(
//         child: Column(
//           children: students.map((student) {
//             return Card(
//               margin: EdgeInsets.all(8),
//               elevation: 20,
//               child: Padding(
//                 padding: EdgeInsets.all(16),
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     // Student Profile Photo
//                     CircleAvatar(
//                       radius: 40,
//                       backgroundImage: NetworkImage(student['profile']!),
//                     ),
//                     SizedBox(width: 16), // Space between photo and details

//                     // Student Details Column
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Admission No: ${student['admissionNo']}'),
//                           SizedBox(height: 8),
//                           Text('Name: ${student['name']}'),
//                           SizedBox(height: 8),
//                           Text('Department: ${student['department']}'),
//                           SizedBox(height: 8),
//                           Text('Batch: ${student['batch']}'),
//                           SizedBox(height: 8),
//                           Text('E-mail: ${student['email']}'),
//                         ],
//                       ),
//                     ),

//                     // Verify and Reject Buttons
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         ElevatedButton(
//                           onPressed: () {
//                             // Add your verification logic here
//                             print('Verify button clicked for ${student['name']}');
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.green, // Green color for Verify button
//                           ),
//                           child: Text('Verify'),
//                         ),
//                         SizedBox(height: 8),
//                         ElevatedButton(
//                           onPressed: () {
//                             // Add your reject logic here
//                             print('Reject button clicked for ${student['name']}');
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.red, // Red color for Reject button
//                           ),
//                           child: Text('Reject'),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }