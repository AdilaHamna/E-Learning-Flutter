import 'package:flutter/material.dart';

class ElearningApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuestionPaperPage(),
    );
  }
}

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
  List<String> semester1papers = ['Paper 111', 'Paper 2', 'Paper 3'];
  List<String> semester2papers = ['Paper 1', 'Paper 2', 'Paper 3'];
  List<String> semester3papers = ['Paper 1', 'Paper 2', 'Paper 3'];
  List<String> semester4papers = ['Paper 1', 'Paper 2', 'Paper 3'];
  List<String> semester5papers = ['Paper 1', 'Paper 2', 'Paper 3'];
  List<String> semester6papers = ['Paper 1', 'Paper 2', 'Paper 3'];
  List<String> selectedPaperList = [];

  List<String> types = ['Video', 'File'];

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
                            if (value == 'Semester 1') {
                              selectedPaperList = semester1papers;
                              selectedPaper = semester1papers[0]; // Default Paper
                            } else if (value == 'Semester 2') {
                              selectedPaperList = semester2papers;
                              selectedPaper = semester2papers[0]; // Default Paper
                            } else if (value == 'Semester 3') {
                              selectedPaperList = semester3papers;
                              selectedPaper = semester3papers[0]; // Default Paper
                            } else if (value == 'Semester 4') {
                              selectedPaperList = semester4papers;
                              selectedPaper = semester4papers[0]; // Default Paper
                            } else if (value == 'Semester 5') {
                              selectedPaperList = semester5papers;
                              selectedPaper = semester5papers[0]; // Default Paper
                            } else if (value == 'Semester 6') {
                              selectedPaperList = semester6papers;
                              selectedPaper = semester6papers[0]; // Default Paper
                            }
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

          // Study Materials List
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Example: Replace with dynamic data count
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: ListTile(
                    leading: Icon(Icons.folder, color: Colors.blue),
                    title: Text('Question Paper ${index + 1}'),
                    subtitle: Text(
                        'Semester: $selectedSemester, Paper: $selectedPaper'),
                    trailing: Icon(Icons.download),
                    onTap: () {
                      // Open or download material
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
        ],
      ),
    );
  }
}
