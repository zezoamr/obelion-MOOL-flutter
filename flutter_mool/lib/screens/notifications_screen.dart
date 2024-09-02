import 'package:flutter/material.dart';

import '../data/notification.dart';

class NotificationScreen extends StatelessWidget {
  final List<customNotification> notifications = [
    customNotification(
        "We thought you'd like a new winter collections", "3 days Ago"),
    customNotification(
        "We thought you'd like a new winter collections", "23 days Ago"),
    customNotification(
        "We thought you'd like a new winter collections", "3 Months Ago"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 231, 231),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 46, 46, 51),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Notifications',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.separated(
        itemCount: notifications.length,
        separatorBuilder: (context, index) =>
            Divider(height: 1, color: Colors.grey),
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child:
                  Icon(Icons.notifications_outlined, color: Colors.grey[600]),
            ),
            title: Text(
              notifications[index].message,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              notifications[index].time,
              style: TextStyle(color: Colors.grey),
            ),
          );
        },
      ),
    );
  }
}
