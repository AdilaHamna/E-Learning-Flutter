import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting date and time

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotificationPage(),
    );
  }
}

class NotificationPage extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'Meeting Reminder',
      'dateTime': DateTime.now().subtract(const Duration(hours: 2)),
      'description': 'You have a meeting with the team at 3:00 PM.'
    },
    {
      'title': 'System Update',
      'dateTime': DateTime.now().subtract(const Duration(days: 1, hours: 4)),
      'description': 'System update scheduled for tonight at 11:00 PM.'
    },
    {
      'title': 'New Message',
      'dateTime': DateTime.now().subtract(const Duration(minutes: 30)),
      'description': 'You have received a new message from John.'
    },
    {
      'title': 'Task Deadline',
      'dateTime': DateTime.now().subtract(const Duration(days: 3)),
      'description': 'Your task submission deadline is today at 5:00 PM.'
    },
  ];

  NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Notifications')),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: ListTile(
              leading: const Icon(Icons.notifications, color: Colors.blue),
              title: Text(
                notification['title'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '${DateFormat('yyyy-MM-dd – hh:mm a').format(notification['dateTime'])}\n${notification['description']}',
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}
