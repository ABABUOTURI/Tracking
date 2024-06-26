import 'package:flutter/material.dart';
import '../models/notification.dart';

class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final List<NotificationModel> _notifications = [
    NotificationModel(
      title: 'Budget Limit Reached',
      description: 'You have exceeded your monthly budget limit.',
      time: DateTime.now().subtract(Duration(hours: 1)),
    ),
    NotificationModel(
      title: 'Expense Summary',
      description: 'Your total expenses for this month are Ksh.50000.',
      time: DateTime.now().subtract(Duration(days: 1)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          final notification = _notifications[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: ListTile(
              title: Text(notification.title),
              subtitle: Text(notification.description),
              trailing: Text(_formatTime(notification.time)),
            ),
          );
        },
      ),
    );
  }

  String _formatTime(DateTime time) {
    return '${time.day}/${time.month}/${time.year} ${time.hour}:${time.minute}';
  }
}
