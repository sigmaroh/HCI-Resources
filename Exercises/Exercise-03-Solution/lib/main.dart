import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

void main() {
  runApp(ThrowHeightApp());
}

class ThrowHeightApp extends StatefulWidget {
  @override
  _ThrowHeightAppState createState() => _ThrowHeightAppState();
}

class _ThrowHeightAppState extends State<ThrowHeightApp> {
  final double g = 9.81;

  bool inFreeFall = false;
  DateTime? freeFallStart;
  DateTime? freeFallEnd;

  double? height;
  String status = "Hold phone still, then throw upwards (carefully!)";

  @override
  void initState() {
    super.initState();

    accelerometerEvents.listen((AccelerometerEvent event) {
      double magnitude = sqrt(event.x * event.x +
          event.y * event.y +
          event.z * event.z);

      // Free fall detection threshold
      bool isFreeFall = magnitude < 0.5;

      // Start of free fall
      if (!inFreeFall && isFreeFall) {
        inFreeFall = true;
        freeFallStart = DateTime.now();
        setState(() => status = "Phone is in free fall…");
      }

      // End of free fall
      if (inFreeFall && !isFreeFall) {
        inFreeFall = false;
        freeFallEnd = DateTime.now();
        computeHeight();
      }
    });
  }

  void computeHeight() {
    if (freeFallStart == null || freeFallEnd == null) return;

    double totalTime =
        freeFallEnd!.difference(freeFallStart!).inMilliseconds / 1000.0;

    //time to reach free fal T/2
    // Height formula: h = g * T² / 8
    double h = g * pow(totalTime, 2) / 8;

    setState(() {
      height = h;
      status = "Result ready!";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Throw Height Meter"),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  status,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 40),
                height == null
                    ? Text(
                        "No measurement yet",
                        style:
                            TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      )
                    : Text(
                        "${height!.toStringAsFixed(2)} meters",
                        style:
                            TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      height = null;
                      status = "Ready for next throw!";
                    });
                  },
                  child: Text("Reset"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
