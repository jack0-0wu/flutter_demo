import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/util/util.dart';
import 'package:logger/logger.dart';

/// Copyright (C), 2015-2020, flutter_demo
/// FileName: LoggerDemo
/// Author: Jack
/// Date: 2020/11/24
/// Description:
class LoggerDemo extends StatefulWidget {
  @override
  _LoggerDemoState createState() => _LoggerDemoState();
}

class _LoggerDemoState extends State<LoggerDemo> {
  var logger = Logger(
    printer: PrettyPrinter(),
  );

  printLog() {
    logger.d('Log message with 2 methods');

    logger.i('Info message');

    logger.w('Just a warning!');

    logger.e('Error! Something bad happened', 'Test Error');

    logger.v({'key': 5, 'value': 'something'});
    logger.wtf("wtf");
    Logger(printer: SimplePrinter(colors: true)).v('boom');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "LoggerDemo"),
      body: ListView(
        children: [
          Column(
            children: [
              Button(
                  width: 200.s,
                  height: 100.s,
                  text: "打印log",
                  onTap: () {
                    printLog();
                  })
            ],
          )
        ],
      ),
    );
  }
}
