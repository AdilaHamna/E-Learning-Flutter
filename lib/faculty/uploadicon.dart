import 'package:checkk/faculty/addassignment.dart';
import 'package:checkk/faculty/addqp.dart';
import 'package:checkk/faculty/addstudymaterial.dart';
import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData icon;

  const CircularButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            width: 80, // Fixed width for the circular button
            height: 80, // Fixed height for the circular button
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 119, 191, 249), // Button color
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(2, 2),
                  blurRadius: 4,
                ),
              ],
            ),
            alignment: Alignment.center,
            child: Icon(icon),
          ),
          Center(
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white, // Text color
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ViewScreen extends StatefulWidget {
  const ViewScreen({super.key});

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  // List of button labels
  final List<String> buttonLabels = [
    "Study Materials",
    "Question Papers",
    "Assignment",
    "Syllabus",
    "MCQ"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 238, 189, 244),
        centerTitle: true,
        title: const Text(
          "UPLOADS",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Color.fromARGB(255, 163, 202, 233),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // First Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircularButton(
                      icon: Icons.home,
                      label: buttonLabels[0],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddStudyMaterial(),
                          ),
                        );
                      },
                    ),
                    CircularButton(
                      icon: Icons.question_mark_rounded,
                      label: buttonLabels[1],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QuestionPaperView(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20), // Spacing between rows
                CircularButton(
                  icon: Icons.home,
                  label: buttonLabels[4],
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => MCQScreen(),
                    //   ),
                    // );
                  },
                ),
                const SizedBox(height: 20), // Spacing between rows
                // Second Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircularButton(
                      icon: Icons.assignment,
                      label: buttonLabels[2],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UploadAssignment(),
                          ),
                        );
                      },
                    ),
                    CircularButton(
                      icon: Icons.file_copy,
                      label: buttonLabels[3],
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UploadAssignment(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Example Screens to Navigate to

class StudyMaterialsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Study Materials'),
      ),
      body: Center(
        child: Text('Study Materials Screen'),
      ),
    );
  }
}

