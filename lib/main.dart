import 'package:app/homepage.dart';
import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

void main() {
  AwesomeNotifications().initialize(
    'asset://assets/images/logo.png',
    [
      NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic notifications',
        channelDescription: 'Notification channel for basic alerts',
        defaultColor: Color(0xFF42A5F5), 
        ledColor: Colors.white, 
      ),
    ],
  );

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: NotificationPage()));
}
