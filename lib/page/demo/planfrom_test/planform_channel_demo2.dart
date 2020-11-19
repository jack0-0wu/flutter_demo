import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class PlanFromTest extends StatefulWidget {
  @override
  _PlanFromTestState createState() => _PlanFromTestState();
}

class _PlanFromTestState extends State<PlanFromTest> {
  // Get battery level.
  String _batteryLevel = 'Unknown battery level.';
  static const platform = const MethodChannel('samples.flutter.io/battery');

  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      print("11111");
      final int result = await platform.invokeMethod('getBatteryLevel');
      print("result");
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            new RaisedButton(
              child: new Text('Get Battery Level'),
              onPressed: _getBatteryLevel,
            ),
            new Text(_batteryLevel),
          ],
        ),
      ),
    );
  }
}
