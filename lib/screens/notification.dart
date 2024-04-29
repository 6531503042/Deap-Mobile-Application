import 'package:flutter/material.dart';

List<NotificationModel> notifications = [
  NotificationModel(
      title: 'Ashwin Bose',
      body: 'is requesting access to Design File - Final Project',
      time: '2m'),
  // Add more notifications here...
];

class NotificationModel {
  final String title;
  final String body;
  final String time;

  NotificationModel(
      {required this.title, required this.body, required this.time});
}

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notifications[index].title),
            subtitle: Text(notifications[index].body),
            trailing: Text(notifications[index].time),
          );
        },
      ),
    );
  }
}
