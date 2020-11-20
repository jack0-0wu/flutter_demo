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
                  text: "跳转路由工具类测试",
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
                  text: "image_crop开源软件使用Demo",
                  onTap: () {
                    RouterUtil.push(context, routerName: "cropDemo");
                  }),
              Button(
                  text: "跳转剪裁demo",
                  onTap: () {
                    RouterUtil.push(context, routerName: "clippingDemo");
                  }),
              Button(
                  text: "文字图标一行显示demo",
                  onTap: () {
                    RouterUtil.push(context, routerName: "richTextDemo");
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
