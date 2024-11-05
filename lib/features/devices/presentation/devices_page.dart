import 'package:flutter/material.dart';

class DevicesPage extends StatefulWidget {
  final String areaName;
  const DevicesPage({super.key, required this.areaName});

  @override
  State<DevicesPage> createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  final List<Map<String, String>> devices = [];

  void _showAddDeviceModal() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.areaName} - Devices"),
        backgroundColor: Colors.black,
      ),
      body: devices.isEmpty
          ? Center(
              child: Text(
                "No devices connected yet.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            )
          : ListView.builder(
              itemCount: devices.length,
              itemBuilder: (context, index) {
                final device = devices[index];
                return Card(
                  color: Colors.grey.shade900,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.device_hub,
                      color: Colors.greenAccent,
                    ),
                    title: Text(
                      device["name"]!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      device["type"]!,
                      style: TextStyle(color: Colors.grey.shade400),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.greenAccent,
                    ),
                    onTap: () {},
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddDeviceModal,
        backgroundColor: Colors.greenAccent,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
