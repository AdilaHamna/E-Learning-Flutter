import 'package:checkk/students/services/studentsassignment.dart';
import 'package:flutter/material.dart';
import 'package:checkk/services/loginAPI.dart';
import 'package:dio/dio.dart';
import 'package:checkk/students/pdfview.dart';



class AssignmentPage extends StatefulWidget {
  @override
  _AssignmentPageState createState() => _AssignmentPageState();
}

class _AssignmentPageState extends State<AssignmentPage> {
  late Future<List<Map<String, dynamic>>> _assignments;

  @override
  void initState() {
    super.initState();
    // Fetch assignments from the API when the page is loaded
    _assignments = AssignmentPageApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('ASSIGNMENT')),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Navigate to profile page
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Assignment List Section
            SizedBox(height: 10),
            FutureBuilder<List<Map<String, dynamic>>>(
              future: _assignments,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No assignments available.'));
                } else {
                  List<Map<String, dynamic>> assignments = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: assignments.length,
                    itemBuilder: (context, index) {
                      var assignment = assignments[index];
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: ListTile(
                          onTap: () {
                            // Navigate to PdfViewPage to view the assignment's PDF
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PdfViewPage(
                                  pdfPath: assignment['uploadFile'] ?? '',
                                ),
                              ),
                            );
                          },
                          leading: Icon(Icons.assignment, color: Colors.blue),
                          title: Text("Assignment ${index + 1}"),
                          subtitle: Text("Submitted on: ${assignment['submittedOn'] ?? 'Unknown'}"),
                          trailing: IconButton(
                            icon: Icon(Icons.upload, color: Colors.green),
                            onPressed: () {
                              // Implement download assignment logic here
                            },
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
