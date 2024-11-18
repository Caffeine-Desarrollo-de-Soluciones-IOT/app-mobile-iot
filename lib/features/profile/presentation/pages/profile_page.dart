import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // User Info Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.greenAccent, width: 2),
              ),
              child: Row(
                children: [
                  // Profile Picture
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("lib/assets/images/user.png"),
                  ),
                  const SizedBox(width: 16),
                  // User Details
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Maria",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "maria18@gmail.com",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Change photo >",
                        style: TextStyle(color: Colors.greenAccent),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Account & Preferences Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.greenAccent, width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Account & Preferences",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    leading: Icon(Icons.settings, color: Colors.greenAccent),
                    title: const Text(
                      "Account Setting",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // Navigate to Account Setting
                    },
                  ),
                  ListTile(
                    leading:
                        Icon(Icons.person_outline, color: Colors.greenAccent),
                    title: const Text(
                      "Profile Settings",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // Navigate to Profile Settings
                    },
                  ),
                  ListTile(
                    leading:
                        Icon(Icons.help_outline, color: Colors.greenAccent),
                    title: const Text(
                      "Assistance and Contact",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // Navigate to Assistance and Contact
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Notification & Updates Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.greenAccent, width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Notification & Updates",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  ListTile(
                    leading:
                        Icon(Icons.notifications, color: Colors.greenAccent),
                    title: const Text(
                      "Notification Settings",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // Navigate to Notification Settings
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.update, color: Colors.greenAccent),
                    title: const Text(
                      "Firmware Update",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // Navigate to Firmware Update
                    },
                  ),
                  ListTile(
                    leading:
                        Icon(Icons.announcement, color: Colors.greenAccent),
                    title: const Text(
                      "Announcements & Updates",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // Navigate to Announcements & Updates
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
