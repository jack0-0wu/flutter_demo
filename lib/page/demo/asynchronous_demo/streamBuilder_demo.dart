import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/util/util.dart';

/// Copyright (C), 2020-2020, flutter_demo
/// FileName: streamBuilder_demo
/// Author: Jack
/// Date: 2020/12/27
/// Description:
class StreamBuilderDemo extends StatelessWidget {
  //创建流
  Stream<int> _stream() {
    Duration interval = Duration(seconds: 1);
    Stream<int> stream = Stream<int>.periodic(interval, (num) {
      return num;
    });
    stream = stream.take(59);
    return stream;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamBuilder Demo'),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _stream(),
          builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Text(
                '1 Minute Completed',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Text(
                'Waiting For Stream',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              );
            }
            return Text(
              '00:${snapshot.data.toString().padLeft(2, '0')}',
              style: TextStyle(
                fontSize: 30.0,
              ),
            );
          },
        ),
      ),
    );
  }
}
