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
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: GNav(
          backgroundColor: Colors.black,
          color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.grey.shade800,
          gap: 4,
          onTabChange: onTabChange,
          tabs: const [
            GButton(icon: Icons.grid_view, text: 'Home'),
            GButton(icon: Icons.meeting_room, text: 'Properties'),
            GButton(icon: Icons.notifications, text: 'Notifications'),
            GButton(icon: Icons.person, text: 'Profile'),
          ],
        ),
      ),
    );
  }

  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     bottomNavigationBar: Container(
  //       color: Colors.black,
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
  //         child: GNav(
  //           backgroundColor: Colors.black,
  //           color: Colors.white,
  //           activeColor: Colors.white,
  //           tabBackgroundColor: Colors.grey.shade800,
  //           gap: 4,
  //           onTabChange: onTabChange,
  //           tabs: const [
  //             GButton(icon: Icons.grid_view, text: 'Home'),
  //             GButton(icon: Icons.meeting_room, text: 'Properties'),
  //             GButton(icon: Icons.notifications, text: 'Notifications'),
  //             GButton(icon: Icons.person, text: 'Profile'),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
