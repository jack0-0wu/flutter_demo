import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/config/static_resource.dart';
import 'package:flutter_demo/util/util.dart';

/// Copyright (C), 2020-2020, flutter_demo
/// FileName: globalKey_demo.dart
/// Author: Jack
/// Date: 2020/12/9
/// Description:
class GlobalKeyDemo extends StatefulWidget {
  const GlobalKeyDemo({
    Key key,
  }) : super(key: key);

  @override
  _GlobalKeyDemoState createState() => _GlobalKeyDemoState();
}

class _GlobalKeyDemoState extends State<GlobalKeyDemo> {
  GlobalKey globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "GlobalKeyDemo"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Font(text: "代码：StaticResource.testKey.currentContext == context"),
          Font(text: "输出：${StaticResource.testKey.currentContext == context}"),
          SizedBox(height: 5.s),
          Font(text: "代码：StaticResource.testKey.currentWidget"),
          Font(text: "输出：${StaticResource.testKey.currentWidget}"),
          SizedBox(height: 5.s),
          Font(text: "代码：widget.key"),
          Font(text: "输出：${widget.key}"),
          SizedBox(height: 5.s),
          ColorBlock(
            key: globalKey,
          ),
          SizedBox(
            height: 10.s,
          ),
          Container(
            width: 50.s,
            height: 50.s,
            color: Color.fromRGBO(Random().nextInt(256), Random().nextInt(256),
                Random().nextInt(256), 1),
          ),
          Button(
              text: "无context跳转",
              onTap: () {
                print("${RouterUtil.routerGlobalKey}");
                RouterUtil.routerGlobalKey.currentState.pushNamed("routerTest");
              }),
          Button(
              text: "使用key局部刷新",
              onTap: () {
                globalKey.currentState.setState(() {});
              }),
        ],
      ),
    );
  }
}

class ColorBlock extends StatefulWidget {
  ColorBlock({Key key}) : super(key: key);

  @override
  _ColorBlockState createState() => _ColorBlockState();
}

class _ColorBlockState extends State<ColorBlock> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.s,
      height: 50.s,
      color: Color.fromRGBO(Random().nextInt(256), Random().nextInt(256),
          Random().nextInt(256), 1),
    );
  }
}
