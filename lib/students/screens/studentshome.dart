import 'package:checkk/students/screens/studentsassignment.dart';
import 'package:checkk/students/screens/studentsqp.dart';
import 'package:checkk/students/screens/studentsstudymaterial.dart';
import 'package:checkk/students/screens/studentssyllabus.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:checkk/customeWdgets/drawer.dart';



class StudentHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomeDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: Text('E-Learning Platform'),
              centerTitle: true,
              backgroundColor: Colors.blue,
              pinned: true,
            ),
            // Wrapping the Card and Padding with SliverToBoxAdapter
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.all(8),
                height: 200,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 400.0,
                    autoPlay: true,
                    enlargeCenterPage: false,
                    viewportFraction: 1.0,
                  ),
                  items: [
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtYYo5t91q-5NLtEtMwmFqmo2OLqQZRIA0Xw&s',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtYYo5t91q-5NLtEtMwmFqmo2OLqQZRIA0Xw&s',
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtYYo5t91q-5NLtEtMwmFqmo2OLqQZRIA0Xw&s'
                  ].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              i,
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Card(
                  color: Colors.indigo[100],
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Icon(Icons.format_quote, size: 30, color: Colors.indigo),
                        SizedBox(height: 10),
                        Text(
                          '“The beautiful thing about learning is that no one can take it away from you.”',
                          style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo[800],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '- B.B. King',
                            style: TextStyle(fontSize: 14, color: Colors.indigo[600]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: Column(
          children: [
            SizedBox(height: 10),
            // Watching History Button
            SizedBox(height: 10),

            // Main Action Buttons with Expanded GridView
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                padding: EdgeInsets.all(10),
                children: [
                  actionButton('Study Materials', Icons.book, Colors.blue, context, StudyMaterialsPage()),
                  actionButton('Syllabus', Icons.description, Colors.orange, context, SyllabusPage()),
                  actionButton('Question Paper', Icons.video_library, Colors.green, context, QuestionPaperPage()),
                  actionButton('Assignment', Icons.assignment, Colors.red, context, AssignmentPage()),
                ],
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
        ],
      ),
    );
  }

  // Widget for Main Action Buttons
  Widget actionButton(String title, IconData icon, Color color, BuildContext context, Widget nextPage) {
    return GestureDetector(
      onTap: () {
        // Navigate to the appropriate page based on the action
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextPage),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
