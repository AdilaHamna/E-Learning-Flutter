import 'package:flutter/material.dart';

class ElearningApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudyMaterialsPage(),
    );
  }
}

class StudyMaterialsPage extends StatefulWidget {
  @override
  _StudyMaterialsPageState createState() => _StudyMaterialsPageState();
}

class _StudyMaterialsPageState extends State<StudyMaterialsPage> {
  String selectedSemester = 'All';
  String selectedPaper = 'All';
  String selectedType = 'All';

  List<String> semesters = [
    'All',
    'Semester 1',
    'Semester 2',
    'Semester 3',
    'Semester 4'
  ];
  List<String> semester1papers = ['All','Paper 111', 'Paper 2', 'Paper 3'];
  List<String> semester2papers = ['All', 'Paper 1', 'Paper 2', 'Paper 3'];
  List<String> semester3papers = ['All', 'Paper 1', 'Paper 2', 'Paper 3'];
  List<String> semester4papers = ['All', 'Paper 1', 'Paper 2', 'Paper 3'];
  List<String> semester5papers = ['All', 'Paper 1', 'Paper 2', 'Paper 3'];
  List<String> semester6papers = ['All', 'Paper 1', 'Paper 2', 'Paper 3'];
  List<String> selectedPaperList = [];

  List<String> types = ['All', 'Video', 'File'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('STUDY MATERIALS')),
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
                            } else if (value == 'Semester 2') {
                              selectedPaperList = semester2papers;
                            } else if (value == 'Semester 3') {
                              selectedPaperList = semester3papers;
                            } else if (value == 'Semester 4') {
                              selectedPaperList = semester4papers;
                            } else if (value == 'Semester 5') {
                              selectedPaperList = semester5papers;
                            } else {
                              selectedPaperList = semester6papers;
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
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: selectedType,
                  items: types.map((type) {
                    return DropdownMenuItem(value: type, child: Text(type));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedType = value!;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Material Type',
                    border: OutlineInputBorder(),
                  ),
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
                    title: Text('Material ${index + 1}'),
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
