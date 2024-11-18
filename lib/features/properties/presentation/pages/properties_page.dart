import 'dart:convert';
import 'dart:developer';
import 'package:app_mobile_iot/features/areas/presentation/pages/areas_page.dart';
import 'package:app_mobile_iot/features/login/screens/auth_service.dart';
import 'package:app_mobile_iot/features/login/screens/token_storage.dart';
import 'package:flutter/material.dart';

class PropertiesPage extends StatefulWidget {
  PropertiesPage({super.key});

  @override
  State<PropertiesPage> createState() => _PropertiesPageState();
}

class _PropertiesPageState extends State<PropertiesPage> {
  final AuthService _authService = AuthService();
  final TokenStorage tokenStorage = TokenStorage();
  List<Map<String, dynamic>> properties = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchProperties();
  }

  Future<void> _fetchProperties() async {
    log('access token: ${_authService.accessToken}');

    try {
      final response =
          await _authService.authenticatedRequest('properties/registered');
      log('data: ${response.body}');
      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedResponse = json.decode(response.body);

        if (decodedResponse['data'] != null &&
            decodedResponse['data'] is List) {
          setState(() {
            properties = List<Map<String, dynamic>>.from(
                decodedResponse['data'] as List);
            _isLoading = false;
          });
        } else {
          throw Exception('Formato de respuesta inesperado.');
        }
      } else {
        throw Exception('Error al obtener propiedades: ${response.statusCode}');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al obtener propiedades: $e')),
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
        title: const Text("Properties"),
        backgroundColor: Colors.black,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : properties.isEmpty
              ? const Center(
                  child: Text(
                    "No properties found.",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                )
              : ListView.builder(
                  itemCount: properties.length,
                  itemBuilder: (context, index) {
                    final property = properties[index];
                    return Card(
                      color: Colors.grey.shade900,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: ListTile(
                        title: Text(
                          property['name'] ?? 'Unknown Property',
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          "ID: ${property['id']}",
                          style: TextStyle(color: Colors.grey.shade400),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.greenAccent,
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AreasPage(
                                propertyId: property['id'],
                                propertyName: '',
                              ),
                            ),
                          );
                          // Navegar a detalles de la propiedad si es necesario
                        },
                      ),
                    );
                  },
                ),
      backgroundColor: Colors.black,
    );
  }
}
