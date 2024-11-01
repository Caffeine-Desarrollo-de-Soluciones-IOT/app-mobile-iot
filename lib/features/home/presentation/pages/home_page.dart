import 'package:app_mobile_iot/core/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onTabChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
    print("Selected tab: $_selectedIndex");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Selected tab: $_selectedIndex",
          style: const TextStyle(fontSize: 24),
        ),
      ),
      bottomNavigationBar: BottomNavBar(onTabChange: _onTabChanged),
    );
  }
}
