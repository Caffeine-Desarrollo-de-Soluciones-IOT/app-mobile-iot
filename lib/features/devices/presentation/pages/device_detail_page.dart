import 'package:flutter/material.dart';

class DeviceDetailsPage extends StatefulWidget {
  final String areaName;
  final String deviceName;
  final String deviceType;
  final String deviceDescription;
  final String deviceImage;

  const DeviceDetailsPage({
    super.key,
    required this.areaName,
    required this.deviceName,
    required this.deviceType,
    required this.deviceDescription,
    required this.deviceImage,
  });

  @override
  _DeviceDetailsPageState createState() => _DeviceDetailsPageState();
}

class _DeviceDetailsPageState extends State<DeviceDetailsPage> {
  bool isDeviceOn = true;
  TimeOfDay startTime = TimeOfDay(hour: 0, minute: 0);
  TimeOfDay endTime = TimeOfDay(hour: 18, minute: 0);

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStartTime ? startTime : endTime,
    );
    if (picked != null && picked != (isStartTime ? startTime : endTime)) {
      setState(() {
        if (isStartTime) {
          startTime = picked;
        } else {
          endTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.areaName),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Device name and switch
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.deviceName,
                    style: const TextStyle(color: Colors.white, fontSize: 24),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Switch(
                  value: isDeviceOn,
                  onChanged: (value) {
                    setState(() {
                      isDeviceOn = value;
                    });
                  },
                  activeColor: Colors.greenAccent,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Device image
            Center(
              child: Image.network(
                widget.deviceImage,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),

            // Schedule section
            const Text(
              "Schedule",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () => _selectTime(context, true),
                  child: Text(
                    startTime.format(context),
                    style: const TextStyle(
                        color: Colors.greenAccent, fontSize: 16),
                  ),
                ),
                const Text(
                  " to ",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                TextButton(
                  onPressed: () => _selectTime(context, false),
                  child: Text(
                    endTime.format(context),
                    style: const TextStyle(
                        color: Colors.greenAccent, fontSize: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Device type section
            const Text(
              "Type",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Text(
              widget.deviceType,
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Device description section
            const Text(
              "Description",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Text(
              widget.deviceDescription,
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Save button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Save button logic
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Settings Saved")),
                  );
                },
                child: const Text("Save"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 80,
                    vertical: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
