import 'package:flutter/material.dart';

class CustomeDrawer extends StatelessWidget {
  const CustomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // User Profile Section
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.blue),
            accountName: const Text(
              'Adila Hamna',
              style: TextStyle(fontSize: 18),
            ),
            accountEmail: const Text(
              'Computer Science Department\nAdmission No: 123456',
              style: TextStyle(fontSize: 14),
            ),
            currentAccountPicture: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://via.placeholder.com/150'), // Placeholder image
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
                Navigator.pop(context);
                // Example navigation (replace with actual navigation code)
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
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

