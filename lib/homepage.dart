import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'dart:async';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  Timer? _timer;

  void showDelayedNotification() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      AwesomeNotifications().createNotification(
        content: NotificationContent(
          channelKey: 'basic_channel',
          color: Color(0xFF42A5F5),  
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

  void stopNotifications() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
      print("Notifications stopped.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delayed Notification Example",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Temperature Alert",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black.withOpacity(0.7),
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: showDelayedNotification,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF42A5F5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                    elevation: 8,
                  ),
                  child: Text(
                    "Start Notifications",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: stopNotifications,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                    elevation: 8,
                  ),
                  child: Text(
                    "Stop Notifications",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
