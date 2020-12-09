import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/util/custom_widget.dart';

/// Copyright (C), 2020-2020, flutter_demo
/// FileName: future_demo
/// Author: Jack
/// Date: 2020/12/9
/// Description:
class FutureDemo extends StatefulWidget {
  @override
  _FutureDemoState createState() => _FutureDemoState();
}

class _FutureDemoState extends State<FutureDemo> {
  test() {
    print('main #1 of 2');
    scheduleMicrotask(() => print('microtask #1 of 2'));
    new Future.delayed(
        new Duration(seconds: 1), () => print('future #1 (delayed)'));
    new Future(() => print('future #2 of 3'));
    new Future(() => print('future #3 of 3'));
    scheduleMicrotask(() => print('microtask #2 of 2'));
    print('main #2 of 2');
  }

  @override
  Widget build(BuildContext context) {
    test();
    return Scaffold(
      appBar: CustomAppBar(title: "future demo"),
    );
  }
}
