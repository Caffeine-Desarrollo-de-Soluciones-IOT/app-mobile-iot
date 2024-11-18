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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.deviceName,
                  style: const TextStyle(color: Colors.white, fontSize: 24),
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
            Center(
              child: Image.asset(
                widget.deviceImage,
                height: 150,
              ),
            ),
            const SizedBox(height: 20),
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
            const Text(
              "Type",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Text(
              widget.deviceType,
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              "Description",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Text(
              widget.deviceDescription,
              style: const TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Guardar los cambios realizados
                },
                child: const Text("Save"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  foregroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
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
