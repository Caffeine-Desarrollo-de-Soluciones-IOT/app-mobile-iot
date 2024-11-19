import 'package:app_mobile_iot/core/widgets/bottom_nav_bar.dart';
import 'package:app_mobile_iot/features/notifications/presentation/pages/notifications_page.dart';
import 'package:app_mobile_iot/features/profile/presentation/pages/profile_page.dart';
import 'package:app_mobile_iot/features/properties/presentation/pages/properties_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Center(child: Text('Home Page')), // Placeholder for Home
    PropertiesPage(),
    const NotificationsPage(),
    const ProfilePage(),
  ];

  void _onTabChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedIndex == 0 ? _buildHomeContent() : _pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(onTabChange: _onTabChanged),
      backgroundColor: Colors.black,
    );
  }

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with user info and notification icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://i.postimg.cc/Jh0GftMF/user-profile.jpg'),
                      radius: 30,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'María Pérez',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.notifications,
                      color: Colors.greenAccent),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            // My Devices Section
            _buildSectionHeader(
              title: 'My Devices',
              onAdd: () {
                print('Add Device pressed');
              },
            ),
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.3,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return _buildDeviceCard(
                  name: 'Device $index',
                  devices: index + 1,
                  onTap: () {
                    print('Device $index selected');
                  },
                );
              },
            ),
            const SizedBox(height: 20),

            // My Rooms Section
            _buildSectionHeader(
              title: 'My Rooms',
              onAdd: () {
                print('Add Room pressed');
              },
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) {
                return _buildRoomCard(
                  name: 'Room $index',
                  devices: index + 2,
                  imageUrl: 'https://via.placeholder.com/150',
                  onTap: () {
                    print('Room $index selected');
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(
      {required String title, required VoidCallback onAdd}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        GestureDetector(
          onTap: onAdd,
          child: Row(
            children: const [
              Icon(Icons.add_circle, color: Colors.greenAccent),
              SizedBox(width: 5),
              Text('Add', style: TextStyle(color: Colors.greenAccent)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDeviceCard(
      {required String name,
      required int devices,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$devices Device',
                    style: TextStyle(color: Colors.grey.shade400)),
                const Icon(Icons.arrow_forward_ios,
                    color: Colors.greenAccent, size: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoomCard(
      {required String name,
      required int devices,
      required String imageUrl,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        height: 150,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  const Spacer(),
                  Text('$devices Device',
                      style: TextStyle(color: Colors.grey.shade400)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
