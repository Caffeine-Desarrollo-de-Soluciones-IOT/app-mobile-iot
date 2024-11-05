import 'package:flutter/material.dart';

class AreasPage extends StatefulWidget {
  final String propertyName;

  const AreasPage({super.key, required this.propertyName});

  @override
  State<AreasPage> createState() => _AreasPageState();
}

class _AreasPageState extends State<AreasPage> {
  final List<Map<String, String>> areas = [];

  final TextEditingController areaNameController = TextEditingController();

  void _showAddAreaModal() {
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
                "Area Name",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: areaNameController,
                decoration: InputDecoration(
                  hintText: "Enter area name",
                  hintStyle: TextStyle(color: Colors.grey),
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
                      _addArea();
                      Navigator.of(context).pop();
                    },
                    child: const Text("Continue"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                      foregroundColor: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  void _addArea() {
    setState(() {
      areas.add({
        "name": areaNameController.text,
        "devices": "0",
      });
    });
    areaNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.propertyName} - Areas"),
        backgroundColor: Colors.black,
      ),
      body: areas.isEmpty
          ? Center(
              child: Text(
                "No areas added yet.",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: areas.length,
              itemBuilder: (context, index) {
                final area = areas[index];
                return Card(
                  color: Colors.grey.shade900,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Colors.greenAccent,
                    ),
                    title: Text(
                      area["name"]!,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    subtitle: Text(
                      "${area["devices"]} Devices",
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
        onPressed: _showAddAreaModal,
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
