import 'package:app_mobile_iot/core/widgets/bottom_nav_bar.dart';
import 'package:app_mobile_iot/features/notifications/presentation/pages/notifications_page.dart';
import 'package:app_mobile_iot/features/profile/presentation/pages/profile_page.dart';
import 'package:app_mobile_iot/features/properties/presentation/pages/properties_page.dart';
import 'package:flutter/material.dart';

//homepage
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Center(child: Text('Home Page')), // Placeholder for Home
    PropertiesPage(), // Placeholder
    const NotificationsPage(), // Notifications page
    const ProfilePage(), // Placeholder for Profile// Placeholder for Profile
  ];

  void _onTabChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
    print("Selected tab: $_selectedIndex");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(onTabChange: _onTabChanged),
    );
  }
}
