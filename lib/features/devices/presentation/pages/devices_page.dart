import 'dart:convert';
import 'dart:developer';
import 'package:app_mobile_iot/features/devices/presentation/pages/device_detail_page.dart';
import 'package:app_mobile_iot/features/login/screens/auth_service.dart';
import 'package:flutter/material.dart';

class DevicesPage extends StatefulWidget {
  final String areaName;
  final int areaId; // Agregamos el areaId para obtener los dispositivos

  const DevicesPage({
    super.key,
    required this.areaName,
    required this.areaId,
  });

  @override
  State<DevicesPage> createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  final AuthService _authService = AuthService();
  List<Map<String, dynamic>> devices = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchDevices();
  }

  Future<void> _fetchDevices() async {
    try {
      // Realizamos la solicitud al endpoint
      final response = await _authService.authenticatedRequest(
        'devices/registered/${widget.areaId}',
      );

      log('Devices response: ${response.body}');
      if (response.statusCode == 200) {
        final decodedResponse = json.decode(response.body);
        if (decodedResponse['data'] != null &&
            decodedResponse['data'] is List) {
          setState(() {
            devices = List<Map<String, dynamic>>.from(decodedResponse['data']);
            _isLoading = false;
          });
        } else {
          throw Exception('Unexpected response format');
        }
      } else {
        throw Exception(
            'Failed to load devices. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error fetching devices: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading devices: $e')),
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
        title: Text("${widget.areaName} - Devices"),
        backgroundColor: Colors.black,
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : devices.isEmpty
              ? const Center(
                  child: Text(
                    "No devices found in this area.",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )
              : ListView.builder(
                  itemCount: devices.length,
                  itemBuilder: (context, index) {
                    final deviceData = devices[index];
                    final device =
                        deviceData['device']; // Datos del dispositivo

                    return Card(
                      color: Colors.grey.shade900,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: ListTile(
                        leading: Image.network(
                          device['imageUrl'] ?? '',
                          fit: BoxFit.cover,
                          width: 50,
                          height: 50,
                        ),
                        title: Text(
                          device['name'] ?? "Unknown Device",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        subtitle: Text(
                          "Type: ${device['type'] ?? 'N/A'}",
                          style: TextStyle(color: Colors.grey.shade400),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.greenAccent,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DeviceDetailsPage(
                                areaName: widget.areaName,
                                deviceName: device['name']!,
                                deviceType: device['type']!,
                                deviceDescription: device['description'] ?? '',
                                deviceImage: device['imageUrl'] ?? '',
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
}
