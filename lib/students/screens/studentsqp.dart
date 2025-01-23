import 'package:checkk/students/services/studentsqp.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:checkk/services/loginAPI.dart';



class QuestionPaperPage extends StatefulWidget {
  @override
  _QuestionPaperPageState createState() => _QuestionPaperPageState();
}

class _QuestionPaperPageState extends State<QuestionPaperPage> {
  String selectedSemester = 'Semester 1';
  String selectedPaper = 'Paper 111';
  List<String> semesters = [
    'Semester 1',
    'Semester 2',
    'Semester 3',
    'Semester 4',
    'Semester 5',
    'Semester 6',
  ];
  
  List<String> selectedPaperList = [];
  late Future<List<Map<String, dynamic>>> _questionPapers;

  @override
  void initState() {
    super.initState();
    // Fetch question papers when the page loads
    _questionPapers = QuestionPaperPageApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('QUESTION PAPERS')),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              // Profile action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Filter Section
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: selectedSemester,
                        items: semesters.map((semester) {
                          return DropdownMenuItem(
                              value: semester, child: Text(semester));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedSemester = value!;
                            // You could set the selectedPaperList here based on the selectedSemester.
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Semester',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: selectedPaper,
                        items: selectedPaperList.map((paper) {
                          return DropdownMenuItem(
                              value: paper, child: Text(paper));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedPaper = value!;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Paper',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Question Papers List
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: _questionPapers,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No question papers available.'));
                } else {
                  List<Map<String, dynamic>> questionPapers = snapshot.data!;
                  return ListView.builder(
                    itemCount: questionPapers.length,
                    itemBuilder: (context, index) {
                      var paper = questionPapers[index];
                      return Card(
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: ListTile(
                          leading: Icon(Icons.folder, color: Colors.blue),
                          title: Text('Question Paper ${index + 1}'),
                          subtitle: Text(
                            'Semester: ${paper['Semester']}, Paper: ${paper['Paper']}',
                          ),
                          trailing: Icon(Icons.download),
                          onTap: () {
                            // You can implement onTap to open/download the question paper
                          },
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
        ],
      ),
    );
  }
}
