import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'dart:async';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  Timer? _timer;

  // Function to show delayed notifications periodically
  void showDelayedNotification() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      AwesomeNotifications().createNotification(
        content: NotificationContent(
          channelKey: 'basic_channel',  // Ensure channel key matches
          color: Color(0xFF42A5F5),  // Light blue color for the notification background
          id: DateTime.now().millisecondsSinceEpoch.remainder(100000),
          title: '🔔 Temperature Alert',
          body: 'Your temperature has exceeded the limit!',
          autoDismissible: false,
          notificationLayout: NotificationLayout.Default,
          wakeUpScreen: true,
        ),
      );
    });
  }

  // Function to stop the periodic notifications
  void stopNotifications() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
      print("Notifications stopped.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Delayed Notification Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: showDelayedNotification,
              child: Text("Start Notifications"),
            ),
            ElevatedButton(
              onPressed: stopNotifications,
              child: Text("Stop Notifications"),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  AwesomeNotifications().initialize(
    'asset://assets/images/logo.png',
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for basic alerts',
        defaultColor: Color(0xFF42A5F5), // Default background color for this channel
        ledColor: Colors.white, // LED color
      ),
    ],
  );

  runApp(MaterialApp(home: NotificationPage()));
}
