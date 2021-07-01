import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/util/util.dart';

class RouterTest extends StatefulWidget {
  @override
  _RouterTestState createState() => _RouterTestState();
}

class _RouterTestState extends State<RouterTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Font(text: "路由测试页一", size: 40, color: Colors.white),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Button(
                text: 'Go!',
                onTap: () {
                  RouterUtil.push(routerName: "routerTest2", data: "66666");
                })
          ],
        ),
      ),
    );
  }
}
