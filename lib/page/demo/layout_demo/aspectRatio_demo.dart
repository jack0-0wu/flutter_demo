import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/util/custom_widget.dart';

/// Copyright (C), 2020-2020, flutter_demo
/// FileName: aspectRatio_demo
/// Author: Jack
/// Date: 2020/12/6
/// Description:
class AspectRatioDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "响应式 demo"),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          AspectRatioWidget(ratio: 2),
          AspectRatioWidget(ratio: 0.5),
        ],
      ),
    );
  }
}

class AspectRatioWidget extends StatelessWidget {
  final double ratio;

  AspectRatioWidget({@required this.ratio});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: ratio,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          border: Border.all(color: Colors.white),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Text(
              'AspectRatio - $ratio',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
