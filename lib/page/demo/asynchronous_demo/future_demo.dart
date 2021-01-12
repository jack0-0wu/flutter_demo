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
    //下面是一个耗时三秒的任务
    // return Future.delayed(Duration(seconds: 3), () => print('异步方法'));
    return Future(() {});
  }

  Future<void> testFutureVoid() {
    //下面是一个耗时三秒的任务
    Timer(Duration(seconds: 3), () => print('异步方法'));
    return null;
  }

  Future<String> testFutureString() {
    return Future(() => "String类型数据");
  }

  testFuture3() {
    Future.delayed(Duration(seconds: 3), () => print('异步方法1'));
    Future(() {
      print('异步方法2');
    });
    Future.microtask(() => print('异步方法3'));
    Future.sync(() => print('异步方法4'));
  }

  testFuture4() {
    print("普通方法1");

    Future(() {
      print('异步方法');
    });
  }

  testFuture2() {
    print("普通方法2");
  }

  testFuture5() async {
    await Future.delayed(Duration(seconds: 3), () => print('异步方法1'));
  }

  test1() async {
    await testFuture5();
    testFuture2();
  }
  void testA(){
    return null;
  }
  @override
  Widget build(BuildContext context) {
    // testFuture();
    // testFuture();
    // testFuture2();
    // testFuture3();
    // testFuture2();
    // testFuture();
    testFutureVoid();
    testFuture2();

    //test1();
    return Scaffold(
      appBar: CustomAppBar(title: "future demo"),
    );
  }
}
