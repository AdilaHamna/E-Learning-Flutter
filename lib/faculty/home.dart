import 'package:checkk/faculty/studentverification.dart';
import 'package:checkk/faculty/uploadicon.dart';
import 'package:checkk/services/studentgetApi.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class FacultyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("KAHM UNITY WOMEN'S COLLEGE, MANJERI")),
        backgroundColor: Color.fromARGB(255, 238, 189, 244),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // AppBar background
            Container(
              height: 80, // Height of the AppBar background
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 163, 202, 233),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            // Body Content
            Column(
              children: [
                SizedBox(height: 120), // Leave space for the profile section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50),
                      // Carousel/Banner Section
                      CarouselSlider(
                          items: [
                            Image.asset("assets/download1.jfif"),
                            Image.asset("assets/download1.jfif"),
                          ],
                          options: CarouselOptions(
                            height: 200,
                            aspectRatio: 16 / 9,
                            viewportFraction: 0.8,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.3,
                            scrollDirection: Axis.horizontal,
                          )),
                      SizedBox(height: 16),
                      // Student Details Section
                      Container(
                        height: 250,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 239, 223, 189),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomButton(
                                  title: 'STUDENTS VERIFICATION',
                                  color: const Color.fromARGB(255, 252, 193, 213),
                                  onPressed: () {
                                    getstudentProfileAPI();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              StudentTableScreen()),
                                    );
                                  },
                                ),
                                CustomButton(
                                  title: 'UPLOAD AND VIEW',
                                  color: const Color.fromARGB(255, 252, 193, 213),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ViewScreen()),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // Profile Section
            Positioned(
              top: 15, // Adjust the vertical position of the card
              left: 16,
              right: 16,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          'https://via.placeholder.com/150', // Replace with the actual image URL
                        ),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "FATHIMA NIDHA P",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "BSc Computer Science - 2022-25",
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Register No: UTAWCS026",
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Admission No: 8962",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPressed;

  CustomButton({required this.title, required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 200,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
