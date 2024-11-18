// lib/core/widgets/bottom_nav_bar.dart
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  final Function(int) onTabChange;

  const BottomNavBar({Key? key, required this.onTabChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: GNav(
          backgroundColor: Colors.black,
          color: Colors.white,
          activeColor: Colors.greenAccent.shade400,
          tabBackgroundColor: Colors.grey.shade800,
          gap: 2, // Reduce el espacio entre icono y texto
          padding: const EdgeInsets.symmetric(
              horizontal: 12, vertical: 8), // Ajusta el padding interno
          onTabChange: onTabChange,
          tabs: const [
            GButton(
              icon: Icons.grid_view,
              text: 'Home',
              textSize: 12, // Ajusta el tamaño del texto
            ),
            GButton(
              icon: Icons.meeting_room,
              text: 'Properties',
              textSize: 12,
            ),
            GButton(
              icon: Icons.notifications,
              text: 'Notifications',
              textSize: 12,
            ),
            GButton(
              icon: Icons.person,
              text: 'Profile',
              textSize: 12,
            ),
          ],
        ),
      ),
    );
  }
}
