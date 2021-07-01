import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/util/util.dart';

/// Copyright (C), 2015-2020, flutter_demo
/// FileName: richText_demo
/// Author: Jack
/// Date: 2020/11/20
/// Description:

class RichTextDemo extends StatefulWidget {
  @override
  _RichTextDemoState createState() => _RichTextDemoState();
}

class _RichTextDemoState extends State<RichTextDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "RichTextDemo"),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                width: 200.s,
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "图标在文字末尾换行显示",
                        style: TextStyle(color: Colors.black)),
                    WidgetSpan(child: Icon(Icons.camera))
                  ]),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
