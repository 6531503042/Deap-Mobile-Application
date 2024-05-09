import 'package:flutter/material.dart';

List<NotificationModel> notifications = [
  NotificationModel(
    title: 'Ashwin Bose',
    body: 'is requesting access to Design File - Final Project',
    time: '2m',
  ),
  // Add more notifications here...
];

class NotificationModel {
  final String title;
  final String body;
  final String time;

  NotificationModel({
    required this.title,
    required this.body,
    required this.time,
  });
}

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return _buildNotificationItem(context, notifications[index]);
        },
      ),
    );
  }

  Widget _buildNotificationItem(
      BuildContext context, NotificationModel notification) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        leading: const CircleAvatar(
          // Placeholder image, replace with actual image source
          backgroundImage: AssetImage('assets/default.jpeg'),
        ),
        title: Text(
          notification.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(notification.body),
            const SizedBox(height: 8.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
          ],
        ),
        onTap: () {
          // Handle notification tap
        },
      ),
    );
  }
}
