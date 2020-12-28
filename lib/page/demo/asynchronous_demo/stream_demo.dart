import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/util/util.dart';

/// Copyright (C), 2020-2020, flutter_demo
/// FileName: stream_demo
/// Author: Jack
/// Date: 2020/12/20
/// Description:
class StreamDemo extends StatefulWidget {
  @override
  _StreamDemoState createState() => _StreamDemoState();
}

class _StreamDemoState extends State<StreamDemo> {
  //创建流
  Stream periodicStream = Stream.periodic(Duration(seconds: 1), (num) {
    return num;
  }).map((num) => num * 2);

  //创建流
  Stream<String> timedCounter(Duration interval, [int maxCount]) async* {
    int i = 0;
    while (true) {
      //延迟interval（时间间隔）执行一次
      await Future.delayed(interval);
      yield "stream返回${i++}";
      if (i == maxCount) break;
    }
  }

  // ignore: close_sinks
  static var _controller = StreamController<int>();

  // ignore: close_sinks
  // var _controller = StreamController<int>.broadcast();
  var _count = 1;

  // ignore: cancel_subscriptions

  createStream() {
    Timer.periodic(Duration(seconds: 1), (t) {
      _controller.sink.add(_count);
      _count++;
    });
  }

  Stream broadcastStream = Stream.periodic(Duration(seconds: 5), (num) {
    return num;
  }).asBroadcastStream();

  // ignore: cancel_subscriptions
  // StreamSubscription subscription =
  //     Stream.periodic(Duration(seconds: 1), (num) {
  //   return num;
  // }).listen((num) {
  //   print(num);
  // });
  StreamSubscription subscription2 = _controller.stream.listen((event) {
    print("单订阅流$event");
  });

  start() {
    createStream();
    Future.delayed(Duration(seconds: 3), () {
      print("暂停");
      subscription2.pause();
    });
    Future.delayed(Duration(seconds: 5), () {
      print("继续");
      subscription2.resume();
    });
    Future.delayed(Duration(seconds: 7), () {
      print("取消");
      subscription2.cancel();
    });
    // subscription.pause();
    // subscription.pause();
    // subscription.resume();
    // subscription.cancel();

    // periodicStream.map((num) => num * 2);
    // periodicStream.listen((event) {
    //   print(event);
    // });
    // timedCounter(Duration(seconds: 2), 10).listen((event) {
    //   print(event);
    // });
    // _controller.stream.listen((event) {
    //   print("controllerStream$event");
    // });
    // createStream();
    // Future.delayed(Duration(seconds: 5), () {
    //   subscription = _controller.stream.listen((event) {
    //     print("单订阅流$event");
    //   });
    // });

    // Future.delayed(Duration(seconds: 30), () {
    //   broadcastStream.listen((event) {
    //     print("多订阅流二$event");
    //   });
    // });
    // _controller.stream.asBroadcastStream();
    // createStream();
    // Future.delayed(Duration(seconds: 5), () {
    //   _controller.stream.listen((event) {
    //     print("多订阅流$event");
    //   });
    // });
    // Future.delayed(Duration(seconds: 10), () {
    //   _controller.stream.listen((event) {
    //     print("多订阅流二$event");
    //   });
    // });
    // createStream();
    // Future.delayed(Duration(seconds: 10), () {
    //   _controller.stream.listen((event) {
    //     print("多订阅流二$event");
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    // start();
    // createStream();
    start();
    return Scaffold(
      appBar: CustomAppBar(title: "stream demo"),
    );
  }
}
