import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/util/util.dart';

class RouterTest2 extends StatelessWidget {
  String data = "";

  setData(data) {
    this.data = data;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Font(text: "路由测试页二", size: 40, color: Colors.white),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20.s,
            ),
            Text(data),
            Button(
                text: "返回",
                onTap: () {
                  RouterUtil.pop();
                })
          ],
        ),
      ),
    );
  }
}
