import 'package:checkk/students/services/studentsSYLLABUS.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:checkk/services/loginAPI.dart';


class SyllabusPage extends StatefulWidget {
  @override
  _SyllabusPageState createState() => _SyllabusPageState();
}

class _SyllabusPageState extends State<SyllabusPage> {
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
  late Future<List<Map<String, dynamic>>> _syllabusMaterials;

  @override
  void initState() {
    super.initState();
    // Fetch syllabus materials from the API when the page is loaded
    _syllabusMaterials = SyllabusPageApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('SYLLABUS')),
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
                            // Update the selectedPaperList based on the selected semester
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
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: _syllabusMaterials,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No syllabus materials available.'));
                } else {
                  List<Map<String, dynamic>> syllabusMaterials = snapshot.data!;
                  return ListView.builder(
                    itemCount: syllabusMaterials.length,
                    itemBuilder: (context, index) {
                      var material = syllabusMaterials[index];
                      return Card(
                        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: ListTile(
                          leading: Icon(Icons.folder, color: Colors.blue),
                          title: Text(material['Paper'] ?? 'No Title'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Department: ${material['Department'] ?? 'N/A'}'),
                              Text('Semester: ${material['Semester'] ?? 'N/A'}'),
                              // Optionally, display the uploadFile and uploadvideo if they exist
                              if (material['uploadFile'] != null)
                                Image.network('$baseurl${material['uploadFile']}',
                                    width: 100, height: 100, fit: BoxFit.cover),
                              if (material['uploadvideo'] != null)
                                Image.network('$baseurl${material['uploadvideo']}',
                                    width: 100, height: 100, fit: BoxFit.cover),
                            ],
                          ),
                          trailing: Icon(Icons.download),
                          onTap: () {
                            // Handle onTap event to show more details or start download
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
