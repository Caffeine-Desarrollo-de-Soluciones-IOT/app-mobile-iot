import 'package:app_mobile_iot/core/widgets/bottom_nav_bar.dart';
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
    Center(
        child: Text('Home Page',
            style: TextStyle(color: Colors.white))), // Placeholder for Home
    PropertiesPage(), // Properties page
    Center(
        child: Text('Notifications Page',
            style: TextStyle(
                color: Colors.white))), // Placeholder for Notifications
    Center(
        child: Text('Profile Page',
            style: TextStyle(color: Colors.white))), // Placeholder for Profile
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

  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: Text(
  //         "Selected tab: $_selectedIndex",
  //         style: const TextStyle(fontSize: 24),
  //       ),
  //     ),
  //     bottomNavigationBar: BottomNavBar(onTabChange: _onTabChanged),
  //   );
  // }
}
