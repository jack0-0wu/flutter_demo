import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/util/util.dart';


/// Copyright (C), 2015-2020, flutter_demo
/// FileName: calendar_demo
/// Author: Jack
/// Date: 2020/11/25
/// Description:
class CalendarDemo extends StatefulWidget {
  @override
  _CalendarDemoState createState() => _CalendarDemoState();
}

class _CalendarDemoState extends State<CalendarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "CalendarDemo"),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20.s),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              ],
            ),
          )
        ],
      ),
    );
  }
}


 