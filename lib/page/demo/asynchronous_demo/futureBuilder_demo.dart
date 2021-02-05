/// Copyright (C), 2020-2021, flutter_demo
/// FileName: futureBuilder_demo
/// Author: Jack
/// Date: 2021/2/4
/// Description:
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/util/custom_widget.dart';

class FutureBuilderDemo extends StatefulWidget {
  @override
  _FutureBuilderDemoState createState() => _FutureBuilderDemoState();
}

class _FutureBuilderDemoState extends State<FutureBuilderDemo> {
  Future<bool> fetchData() => Future.delayed(Duration(seconds: 1), () {
        debugPrint('Step 2, fetch data');
        return true;
      });
  Future fetchData2() => Future.delayed(Duration(seconds: 1), () {
    throw Exception();
   return Error();
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      //future: fetchData2() ,
      initialData: false,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.none){
          return Scaffold(
            body: Center(
                child: Container(child: Text('none: ${snapshot.data}'))),
          );
        }
        if(snapshot.hasError){
          return Scaffold(
            body: Center(
                child: Container(child: Text('hasError: ${snapshot.data}'))),
          );
        }
        if (snapshot.hasData) {
          debugPrint('Step 3, build widget: ${snapshot.data}');
          // Build the widget with data.
          return Scaffold(
            body: Center(
                child: Container(child: Text('hasData: ${snapshot.data}'))),
          );
        } else {
          // We can show the loading view until the data comes back.
          debugPrint('Step 1, build loading widget');
          return CircularProgressIndicator();
        }
      },
    );
  }
}
