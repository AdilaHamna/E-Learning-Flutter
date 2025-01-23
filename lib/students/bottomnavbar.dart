import 'package:checkk/faculty/home.dart';
import 'package:checkk/students/screens/studentshome.dart';
import 'package:flutter/material.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  // Current index of the selected bottom navigation item
  int _currentIndex = 0;

  // List of screens corresponding to each bottom navigation item
  final List<Widget> _screens = [
   StudentHomePage(),
    Center(child: Text("Notification Screen", style: TextStyle(fontSize: 24))),
    Center(child: Text("Chat Screen", style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: _screens[_currentIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the current index
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notification",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Chat",
          ),
        ],
        selectedItemColor: const Color.fromARGB(255, 227, 147, 141), // Highlighted color
        unselectedItemColor: Colors.grey, // Default color
      
        type: BottomNavigationBarType.fixed, // Ensures all items are visible
      ),
    );
  }
}
