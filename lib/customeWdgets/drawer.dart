import 'package:checkk/faculty/Login.dart';
import 'package:checkk/services/getprofileAPI.dart';
import 'package:checkk/services/loginAPI.dart';
import 'package:checkk/students/screens/editprofile.dart';
import 'package:flutter/material.dart';

class CustomeDrawer extends StatefulWidget {
  const CustomeDrawer({super.key});

  @override
  _CustomeDrawerState createState() => _CustomeDrawerState();
}

class _CustomeDrawerState extends State<CustomeDrawer> {
  Map<String, dynamic> profileData = {};

  @override
  void initState() {
    super.initState();
    // Fetch the profile data
    _fetchProfileData();
  }

  // Function to fetch profile data from API
  Future<void> _fetchProfileData() async {
    var data = await getProfileAPI();  // Assuming getProfileAPI is implemented properly
    if (data.isNotEmpty) {
      setState(() {
        profileData = data[0]; // Assuming it's a list and we want the first item
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // User Profile Section
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.blue),
            accountName: Text(
              profileData["Name"] ?? "No name", // Display name from API response
              style: TextStyle(fontSize: 18),
            ),
            accountEmail: Text(
              'Department: ${profileData["Department"] ?? "No Department"}\nAdmission No: ${profileData["id"] ?? "N/A"}', // Display department and id
              style: TextStyle(fontSize: 14),
            ),
            currentAccountPicture: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  '$baseurl${profileData["studentImage"] ?? "/default_image.jpg"}', // Display student image (fallback if not available)
                ),
              ),
            ),
          ),

          // Edit Profile Option in Card
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: const Icon(Icons.edit, color: Colors.blue),
              title: const Text('Edit Profile'),
              onTap: () {
                // Navigate to edit profile screen
                Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage(),));
              },
            ),
          ),

          // College Information Option in Card
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: const Icon(Icons.school, color: Colors.blue),
              title: const Text('College Information'),
              onTap: () {
                // Navigate to college information screen
                Navigator.pop(context);
              },
            ),
          ),

          // History Option in Card
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: const Icon(Icons.history, color: Colors.blue),
              title: const Text('History'),
              onTap: () {
                // Navigate to history screen
                Navigator.pop(context);
              },
            ),
          ),

          // Logout Option in Card
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Log Out'),
              onTap: () {
                // Handle logout functionality
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login1(),));
              },
            ),
          ),
        ],
      ),
    );
  }
}
