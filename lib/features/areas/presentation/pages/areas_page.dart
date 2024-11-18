// import 'package:app_mobile_iot/features/devices/presentation/pages/devices_page.dart';
// import 'package:flutter/material.dart';

// class AreasPage extends StatefulWidget {
//   final String propertyName;

//   const AreasPage({super.key, required this.propertyName, required propertyId});

//   @override
//   State<AreasPage> createState() => _AreasPageState();
// }

// class _AreasPageState extends State<AreasPage> {
//   final List<Map<String, dynamic>> areas = [];

//   final TextEditingController areaNameController = TextEditingController();

//   final List<String> images = [
//     'lib/assets/images/living_room.jpeg',
//     'lib/assets/images/bedroom.jpg',
//     'lib/assets/images/kitchen.jpg',
//     'lib/assets/images/office.jpg',
//   ];

//   void _showAddAreaModal() {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.grey.shade900,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (BuildContext context) {
//         return Padding(
//           padding: EdgeInsets.only(
//             bottom: MediaQuery.of(context).viewInsets.bottom,
//             top: 20,
//             left: 20,
//             right: 20,
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Text(
//                 "Area Name",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 controller: areaNameController,
//                 decoration: InputDecoration(
//                   hintText: "Enter area name",
//                   hintStyle: TextStyle(color: Colors.grey),
//                   filled: true,
//                   fillColor: Colors.grey.shade800,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide.none,
//                   ),
//                 ),
//                 style: const TextStyle(color: Colors.white),
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                     child: const Text("Back"),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.grey,
//                       foregroundColor: Colors.white,
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       //_addArea();
//                       Navigator.of(context).pop();
//                       _showSelectImageModal();
//                     },
//                     child: const Text("Continue"),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.greenAccent,
//                       foregroundColor: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   void _showSelectImageModal() {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.grey.shade900,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//       ),
//       builder: (BuildContext context) {
//         return Padding(
//           padding: EdgeInsets.only(
//             bottom: MediaQuery.of(context).viewInsets.bottom,
//             top: 20,
//             left: 20,
//             right: 20,
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Text(
//                 "Select Area Image",
//                 style: TextStyle(color: Colors.white, fontSize: 20),
//               ),
//               const SizedBox(height: 20),
//               GridView.builder(
//                 shrinkWrap: true,
//                 itemCount: images.length,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 10,
//                   mainAxisSpacing: 10,
//                 ),
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       Navigator.of(context).pop();
//                       _addArea(images[index]);
//                     },
//                     child: Image.asset(
//                       images[index],
//                       fit: BoxFit.cover,
//                     ),
//                   );
//                 },
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: const Text("Back"),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.grey,
//                   foregroundColor: Colors.white,
//                 ),
//               ),
//               const SizedBox(height: 20),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   void _addArea(String imagePath) {
//     setState(() {
//       areas.add({
//         "name": areaNameController.text,
//         "devices": "0",
//         "image": imagePath,
//       });
//     });
//     areaNameController.clear();
//     _showConfirmationDialog();
//   }

//   void _showConfirmationDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           backgroundColor: Colors.grey.shade900,
//           title: const Text(
//             "Area Added",
//             style: TextStyle(color: Colors.white),
//           ),
//           content: Text(
//             "${areaNameController.text} has been added successfully!",
//             style: const TextStyle(color: Colors.white),
//           ),
//           actions: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text("Done"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.greenAccent,
//                 foregroundColor: Colors.black,
//               ),
//             )
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("${widget.propertyName} - Areas"),
//         backgroundColor: Colors.black,
//       ),
//       body: areas.isEmpty
//           ? Center(
//               child: Text(
//                 "No areas added yet.",
//                 style: TextStyle(color: Colors.white, fontSize: 18),
//               ),
//             )
//           : ListView.builder(
//               itemCount: areas.length,
//               itemBuilder: (context, index) {
//                 final area = areas[index];
//                 return Card(
//                   color: Colors.grey.shade900,
//                   margin:
//                       const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                   child: ListTile(
//                     leading: Image.asset(
//                       area["image"]!,
//                       fit: BoxFit.cover,
//                       width: 50,
//                       height: 50,
//                     ),
//                     title: Text(
//                       area["name"]!,
//                       style: const TextStyle(color: Colors.white, fontSize: 18),
//                     ),
//                     subtitle: Text(
//                       "${area["devices"]} Devices",
//                       style: TextStyle(color: Colors.grey.shade400),
//                     ),
//                     trailing: Icon(
//                       Icons.arrow_forward_ios,
//                       color: Colors.greenAccent,
//                     ),
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => DevicesPage(
//                             areaName: area["name"]!,
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 );
//               },
//             ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _showAddAreaModal,
//         backgroundColor: Colors.greenAccent,
//         child: const Icon(
//           Icons.add,
//           color: Colors.black,
//         ),
//       ),
//       backgroundColor: Colors.black,
//     );
//   }
// }
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
