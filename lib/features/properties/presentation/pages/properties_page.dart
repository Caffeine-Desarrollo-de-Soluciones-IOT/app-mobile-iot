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
  final TextEditingController areasController = TextEditingController();

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
              TextField(
                controller: areasController,
                decoration: InputDecoration(
                  labelText: "Number of Areas",
                  labelStyle: TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.grey.shade800,
                ),
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _addProperty();
                  Navigator.of(context).pop();
                },
                child: Text("Add Property"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  foregroundColor: Colors.black,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  void _addProperty() {
    setState(() {
      properties.add({
        'name': nameController.text,
        'areas': areasController.text,
      });
    });

    // limpiar campos
    nameController.clear();
    areasController.clear();
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
              onTap: () {},
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
