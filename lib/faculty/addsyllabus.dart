import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class AddSyllabus extends StatefulWidget {
  const AddSyllabus({super.key});

  @override
  State<AddSyllabus> createState() => _AddSyllabusState();
}

class _AddSyllabusState extends State<AddSyllabus> {
  // Lists for dropdown options
  final List<String> departments = ["Computer Science", "Mathematics", "Physics", "Chemistry"];
  final List<String> semesters = ["Semester 1", "Semester 2", "Semester 3", "Semester 4"];
  final List<String> papers = ["Paper 1", "Paper 2", "Paper 3", "Paper 4"];

  // Selected values for dropdowns
  String? selectedDepartment;
  String? selectedSemester;
  String? selectedPaper;

  // To store the selected file path
  String? selectedFile;

  // Function to pick a file
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any, // Can specify types like FileType.pdf, FileType.video, etc.
      allowMultiple: false, // Set to true if you want to allow multiple files
    );

    if (result != null) {
      setState(() {
        selectedFile = result.files.single.name; // Store the file name
      });
    } else {
      // If the user cancels the file picker
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No file selected')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 240, 232, 161),
        title: const Text(
          "ADD SYLLABUS",
          style: TextStyle(
            color: Color.fromARGB(255, 227, 147, 141),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Department Dropdown
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Select Department",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              value: selectedDepartment,
              items: departments
                  .map((dept) => DropdownMenuItem(
                        value: dept,
                        child: Text(dept),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedDepartment = value;
                });
              },
            ),
            const SizedBox(height: 20), // Space between dropdowns

            // Semester Dropdown
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Select Semester",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              value: selectedSemester,
              items: semesters
                  .map((sem) => DropdownMenuItem(
                        value: sem,
                        child: Text(sem),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedSemester = value;
                });
              },
            ),
            const SizedBox(height: 20), // Space between dropdowns

            // Paper Dropdown
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Select Paper",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              value: selectedPaper,
              items: papers
                  .map((paper) => DropdownMenuItem(
                        value: paper,
                        child: Text(paper),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedPaper = value;
                });
              },
            ),
            const SizedBox(height: 20), // Space before file picker

            // File Picker Button
            ElevatedButton(
              onPressed: _pickFile,
              style: ElevatedButton.styleFrom(
              ),
              child: const Text(
                "choose File",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10), // Space for file name

            // Display selected file name
            if (selectedFile != null)
              Text(
                'Selected File: $selectedFile',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),

            const SizedBox(height: 30), // Space before Submit button

            // Submit Button
            ElevatedButton(
              onPressed: () {
                if (selectedDepartment != null &&
                    selectedSemester != null &&
                    selectedPaper != null &&
                    selectedFile != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          "Selected: $selectedDepartment, $selectedSemester, $selectedPaper, File: $selectedFile"),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please select all fields and a file"),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 227, 147, 141),
              ),
              child: const Text(
                "Submit",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}