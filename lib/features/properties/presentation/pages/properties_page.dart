import 'package:app_mobile_iot/features/areas/presentation/pages/areas_pages.dart';
import 'package:flutter/material.dart';

class PropertiesPage extends StatefulWidget {
  PropertiesPage({super.key});

  @override
  State<PropertiesPage> createState() => _PropertiesPageState();
}

class _PropertiesPageState extends State<PropertiesPage> {
  final List<Map<String, String>> properties = [
    {'name': 'House', 'areas': '5 Areas'},
    {'name': 'San Luis Home', 'areas': '4 Areas'},
    {'name': 'Chorrillos Home', 'areas': '3 Areas'},
  ];

  // Controladores de los campos de texto para el formulario de nueva propiedad
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController districtController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();
  final TextEditingController referenceController = TextEditingController();
  //final TextEditingController areasController = TextEditingController();

  void _showAddPropertyModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.grey.shade900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 20,
            left: 20,
            right: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Add New Property",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(height: 20),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Property Name",
                  labelStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey.shade800,
                ),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Back"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      foregroundColor: Colors.white,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _continueToNextStep(context);
                    },
                    child: const Text('Continue'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      foregroundColor: Colors.black,
                    ),
                  ),
                ],
              ),
              // TextField(
              //   controller: areasController,
              //   decoration: InputDecoration(
              //     labelText: "Number of Areas",
              //     labelStyle: TextStyle(color: Colors.grey),
              //     filled: true,
              //     fillColor: Colors.grey.shade800,
              //   ),
              //   keyboardType: TextInputType.number,
              //   style: TextStyle(color: Colors.white),
              // ),
              // SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: () {
              //     _addProperty();
              //     Navigator.of(context).pop();
              //   },
              //   child: Text("Add Property"),
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Colors.greenAccent,
              //     foregroundColor: Colors.black,
              //   ),
              // ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  void _continueToNextStep(BuildContext context) {
    //print("Property Name: ${nameController.text}");
    Navigator.of(context).pop();
    _showAdditionalInfoModal(context);
  }

  // void _addProperty() {
  //   setState(() {
  //     properties.add({
  //       'name': nameController.text,
  //       //'areas': areasController.text,
  //     });
  //   });

  //   // limpiar campos
  //   nameController.clear();
  //   //areasController.clear();
  // }

  void _showAdditionalInfoModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.grey.shade900,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            top: 20,
            left: 20,
            right: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Property Details",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: "Address",
                  labelStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey.shade800,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: cityController,
                decoration: InputDecoration(
                  labelText: "City",
                  labelStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey.shade800,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: districtController,
                decoration: InputDecoration(
                  labelText: 'District',
                  labelStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey.shade800,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: zipCodeController,
                decoration: InputDecoration(
                  labelText: 'ZIP Code',
                  labelStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey.shade800,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: referenceController,
                decoration: InputDecoration(
                  labelText: 'Reference',
                  labelStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey.shade800,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _addProperty();
                  Navigator.of(context).pop();
                },
                child: const Text("Done"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  foregroundColor: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  void _addProperty() {
    setState(() {
      properties.add({
        "name": nameController.text,
        "areas": "Custom Area",
      });
    });
    nameController.clear();
    addressController.clear();
    cityController.clear();
    districtController.clear();
    zipCodeController.clear();
    referenceController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Properties"),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: properties.length,
        itemBuilder: (context, index) {
          final property = properties[index];
          return Card(
            color: Colors.grey.shade900,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Icon(Icons.home, color: Colors.greenAccent),
              title: Text(
                property['name']!,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
              subtitle: Text(
                property['areas']!,
                style: TextStyle(color: Colors.grey.shade400),
              ),
              trailing:
                  Icon(Icons.arrow_forward_ios, color: Colors.greenAccent),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AreasPage(propertyName: property['name']!),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddPropertyModal(context),
        backgroundColor: Colors.greenAccent,
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
