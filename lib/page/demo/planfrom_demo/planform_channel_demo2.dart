import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/util/custom_widget.dart';


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
    return  Material(
      child:  Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Button(
              text:'Get Battery Level',
              onTap: (){
                _getBatteryLevel();
              }
            ),
             Text(_batteryLevel),
          ],
        ),
      ),
    );
  }
}
