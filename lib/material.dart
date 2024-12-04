import 'package:flutter/material.dart';

class StudyMaterialScreen extends StatefulWidget {
  const StudyMaterialScreen({super.key});

  @override
  State<StudyMaterialScreen> createState() => _StudyMaterialScreenState();
}

class _StudyMaterialScreenState extends State<StudyMaterialScreen> {
  // Lists for dropdown options
  final List<String> departments = ["Computer Science", "Mathematics", "Physics", "Chemistry"];
  final List<String> semesters = ["Semester 1", "Semester 2", "Semester 3", "Semester 4"];
  final List<String> papers = ["Paper 1", "Paper 2", "Paper 3", "Paper 4"];

  // Selected values for dropdowns
  String? selectedDepartment;
  String? selectedSemester;
  String? selectedPaper;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 240, 232, 161),
        title: const Text(
          "STUDY MATERIALS",
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
            const SizedBox(height: 30), // Space before Submit button

            // Submit Button
            ElevatedButton(
              onPressed: () {
                if (selectedDepartment != null &&
                    selectedSemester != null &&
                    selectedPaper != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          "Selected: $selectedDepartment, $selectedSemester, $selectedPaper"),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Please select all fields"),
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
