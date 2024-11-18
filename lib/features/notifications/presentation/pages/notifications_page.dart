import 'dart:convert';
import 'dart:developer';

import 'package:app_mobile_iot/features/login/screens/auth_service.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final AuthService _authService = AuthService();
  List<Map<String, dynamic>> notifications = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchNotifications();
  }

  Future<void> _fetchNotifications() async {
    try {
      // Realiza la solicitud al endpoint
      final response = await _authService.authenticatedRequest('events/all');
      log('Notifications response: ${response.body}');

      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        if (decodedResponse['data'] != null &&
            decodedResponse['data'] is List) {
          setState(() {
            notifications =
                List<Map<String, dynamic>>.from(decodedResponse['data']);
            _isLoading = false;
          });
        } else {
          throw Exception('Unexpected response format');
        }
      } else {
        throw Exception(
            'Failed to load notifications. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error fetching notifications: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading notifications: $e')),
      );
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        backgroundColor: Colors.black,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : notifications.isEmpty
              ? const Center(
                  child: Text(
                    "No notifications found.",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )
              : ListView.builder(
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    final notification = notifications[index];
                    return Card(
                      color: Colors.grey.shade900,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: ListTile(
                        leading: _getNotificationIcon(notification["type"]),
                        title: Text(
                          notification["title"] ?? "Unknown Notification",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                        ),
                        subtitle: Text(
                          notification["description"] ?? "",
                          style: TextStyle(color: Colors.grey.shade400),
                        ),
                        trailing: Text(
                          _formatTimestamp(notification["timestamp"]),
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ),
                    );
                  },
                ),
      backgroundColor: Colors.black,
    );
  }

  Widget _getNotificationIcon(String? type) {
    switch (type) {
      case "ALERT":
        return const Icon(Icons.warning, color: Colors.redAccent, size: 40);
      case "OFFLINE":
        return const Icon(Icons.wifi_off, color: Colors.orangeAccent, size: 40);
      default:
        return const Icon(Icons.info, color: Colors.blueAccent, size: 40);
    }
  }

  String _formatTimestamp(String? timestamp) {
    if (timestamp == null) return "N/A";
    final dateTime = DateTime.tryParse(timestamp);
    if (dateTime == null) return "Invalid date";
    return "${dateTime.toLocal().hour}:${dateTime.toLocal().minute} - ${dateTime.toLocal().day}/${dateTime.toLocal().month}/${dateTime.toLocal().year}";
  }
}
