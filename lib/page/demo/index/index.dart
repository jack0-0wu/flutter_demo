import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/util/util.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Font(text: "首页", size: 40, color: Colors.white),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Button(
                  text: "跳转RouterTest",
                  onTap: () {
                    RouterUtil.push(context, routerName: "routerTest");
                  }),

              //需要更新
              // Button(
              //     text: "跳转ChannelTest",
              //     onTap: () {
              //       RouterUtil.push(context, routerName: "planFromTest");
              //     }),
              Button(
                  text: "跳转ClippingDemo",
                  onTap: () {
                    RouterUtil.push(context, routerName: "clippingPictureDemo");
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
