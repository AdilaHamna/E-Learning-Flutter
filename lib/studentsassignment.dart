import 'package:checkk/pdfview.dart';
import 'package:flutter/material.dart';

void main() => runApp(ElearningApp());

class ElearningApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AssignmentPage(),
    );
  }
}

class AssignmentPage extends StatefulWidget {
  @override
  _AssignmentPageState createState() => _AssignmentPageState();
}

class _AssignmentPageState extends State<AssignmentPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String uploadedFile = "No file selected";

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
            // Page Header
          
            // Description Input
         
         
            

            // Submit Button
            // Center(
            //   child: ElevatedButton(
            //     onPressed: () {
            //       // Submit assignment logic goes here
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         SnackBar(content: Text("Assignment Submitted Successfully")),
            //       );
            //     },
                // style: ElevatedButton.styleFrom(
                //   backgroundColor: Colors.green,
                //   padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                // ),
            //     child: Text(
            //       "Submit Assignment",
            //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            //     ),
            //   ),
            // ),
            

            // Submission History Section
           
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3, // Example: Replace with actual data count
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PdfViewPage(pdfPath: 'https://www.africau.edu/images/default/sample.pdf'),));
                    },
                    leading: Icon(Icons.assignment, color: Colors.blue),
                    title: Text("Assignment ${index + 1}"),
                    subtitle: Text("Submitted on: 2024-12-10"),
                    trailing: IconButton(
                      icon: Icon(Icons.upload, color: Colors.green),
                      onPressed: () {
                        // Download assignment logic
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}