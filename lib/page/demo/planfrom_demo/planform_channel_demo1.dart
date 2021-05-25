import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TestNative2 extends StatefulWidget {
  @override
  _TestNative2State createState() => _TestNative2State();
}

class _TestNative2State extends State<TestNative2> {
  var planForm = MethodChannel("testMethod");
  Future test() async {
    var user = await planForm.invokeMethod("getUser");
    print(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(100, 200, 0, 0),
        child: GestureDetector(
          child: Icon(Icons.favorite),
          onTap: () {
            test();
          },
        ),
      ),
    );
  }
}
