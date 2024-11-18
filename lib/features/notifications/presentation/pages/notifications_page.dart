import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  final List<Map<String, String>> notifications = const [
    {
      "device": "Camera 1",
      "description":
          "Suspicious activity was detected at the property at 5:07. Check security cameras immediately.",
      "image": "lib/assets/images/camera.png",
    },
    {
      "device": "Sensor 2",
      "description":
          "Unusual movement has been detected at the main entrance. Check the security status.",
      "image": "lib/assets/images/sensor.png",
    },
    {
      "device": "Camera 1",
      "description":
          "Suspicious activity was detected at the property at 11:17. Check security cameras immediately.",
      "image": "lib/assets/images/camera.png",
    },
    {
      "device": "Sensor 2",
      "description":
          "Danger! Smoke was detected at Room at 05:24. Evacuate the area and contact emergency services.",
      "image": "lib/assets/images/sensor.png",
    },
    {
      "device": "Sensor 3",
      "description":
          "The smoke alarm at Kitchen has been deactivated. Check if it was a false alarm or a resolved situation.",
      "image": "lib/assets/images/sensor.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return Card(
            color: Colors.grey.shade900,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Image.asset(
                notification["image"]!,
                width: 50,
                height: 50,
              ),
              title: Text(
                notification["device"]!,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              subtitle: Text(
                notification["description"]!,
                style: TextStyle(color: Colors.grey.shade400),
              ),
            ),
          );
        },
      ),
      backgroundColor: Colors.black,
    );
  }
}
