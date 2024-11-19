import 'dart:convert';
import 'dart:developer';
import 'package:app_mobile_iot/features/devices/presentation/pages/devices_page.dart';
import 'package:app_mobile_iot/features/login/screens/auth_service.dart';
import 'package:flutter/material.dart';

class AreasPage extends StatefulWidget {
  final String propertyName;
  final int propertyId;

  const AreasPage({
    super.key,
    required this.propertyName,
    required this.propertyId,
  });

  @override
  State<AreasPage> createState() => _AreasPageState();
}

class _AreasPageState extends State<AreasPage> {
  final AuthService _authService = AuthService();
  List<Map<String, dynamic>> areas = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchAreas();
  }

  Future<void> _fetchAreas() async {
    try {
      final response = await _authService.authenticatedRequest(
        'areas/all/${widget.propertyId}',
      );

      log('Areas response: ${response.body}');
      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        if (decodedResponse['data'] != null &&
            decodedResponse['data'] is List) {
          setState(() {
            areas = List<Map<String, dynamic>>.from(decodedResponse['data']);
            _isLoading = false;
          });
        } else {
          throw Exception('Unexpected response format');
        }
      } else {
        throw Exception(
            'Failed to load areas. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error fetching areas: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading areas: $e')),
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
        title: Text("${widget.propertyName} - Areas"),
        backgroundColor: Colors.black,
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : areas.isEmpty
              ? const Center(
                  child: Text(
                    "No areas found for this property.",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )
              : ListView.builder(
                  itemCount: areas.length,
                  itemBuilder: (context, index) {
                    final area = areas[index];
                    return Card(
                      color: Colors.grey.shade900,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: ListTile(
                        leading: area["icon"] != null
                            ? Icon(
                                _getIconForArea(area["icon"]),
                                color: Colors.greenAccent,
                              )
                            : const Icon(Icons.home, color: Colors.greenAccent),
                        title: Text(
                          area["name"] ?? "Unknown Area",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        subtitle: Text(
                          "Registered At: ${area["registeredAt"] ?? "N/A"}",
                          style: TextStyle(color: Colors.grey.shade400),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.greenAccent,
                        ),
                        onTap: () {
                          // Navegar a la página de dispositivos, pasando el areaId
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DevicesPage(
                                areaName: area["name"]!,
                                areaId: area["id"], // Se pasa el areaId
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
      backgroundColor: Colors.black,
    );
  }

  IconData _getIconForArea(String? iconId) {
    switch (iconId) {
      case "4":
        return Icons.living;
      case "2":
        return Icons.kitchen;
      case "6":
        return Icons.bedroom_parent;
      default:
        return Icons.home;
    }
  }
}
