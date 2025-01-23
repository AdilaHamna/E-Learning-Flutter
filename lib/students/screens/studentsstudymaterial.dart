import 'package:checkk/students/services/studentsstudymaterial.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:checkk/services/loginAPI.dart';


class StudyMaterialsPage extends StatefulWidget {
  @override
  _StudyMaterialsPageState createState() => _StudyMaterialsPageState();
}

class _StudyMaterialsPageState extends State<StudyMaterialsPage> {
  late Future<List<Map<String, dynamic>>> _studyMaterials;
  
  @override
  void initState() {
    super.initState();
    // Fetch study materials from the API when the page is loaded
    _studyMaterials = fetchStudyMaterials();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Study Materials')),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _studyMaterials,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show loading indicator while fetching data
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Show error message if the API call fails
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // Show message if no data is returned
            return Center(child: Text('No study materials available.'));
          } else {
            // Display the list of study materials
            List<Map<String, dynamic>> materials = snapshot.data!;
            return ListView.builder(
              itemCount: materials.length,
              itemBuilder: (context, index) {
                var material = materials[index];
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16),
                    title: Text(material['Paper'] ?? 'No Title'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Department: ${material['Department'] ?? 'N/A'}'),
                        Text('Semester: ${material['Semester'] ?? 'N/A'}'),
                        // Display the uploadFile image (if it exists)
                        if (material['uploadFile'] != null)
                          Image.network('$baseurl${material['uploadFile']}', width: 100, height: 100, fit: BoxFit.cover),
                        SizedBox(height: 8),
                        // Display the uploadVideo image (if it exists)
                        if (material['uploadvideo'] != null)
                          Image.network('$baseurl${material['uploadvideo']}', width: 100, height: 100, fit: BoxFit.cover),
                      ],
                    ),
                    onTap: () {
                      // Handle navigation or any action on tap
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
