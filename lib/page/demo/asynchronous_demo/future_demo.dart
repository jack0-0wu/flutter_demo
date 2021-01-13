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

  Future testFuture() {
    return Future(() {
      //此处写入需要异步执行的代码
    });
  }

  Future<String> testFutureString() {
    return Future(() => "String类型数据");
  }

  Future future = Future.delayed(Duration(seconds: 3), () => print('异步方法变量'));

  testFutureConstruction() {
    // Future.error("error异步方法");
    // Future.value("value异步方法");

    Future(() => print('Future异步方法'));
    Future.delayed(Duration(seconds: 0), () => print('delayed异步方法'));

    Future.microtask(() => print('future microtask异步方法'));

    Future.sync(() => print('sync异步方法'));
  }

  testSimple() {
    print("普通方法");
  }

  Future<void> testFutureVoid() {
    return Future(() {
      for (int i = 0; i < 1000000000; i++) {}
      print("test");
    });
  }

  @override
  Widget build(BuildContext context) {
    testFutureConstruction();
    return Scaffold(
      appBar: CustomAppBar(title: "future demo"),
    );
  }
}
