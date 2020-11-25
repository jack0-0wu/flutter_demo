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
      body: Padding(
        padding: EdgeInsets.all(20.s),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
              crossAxisSpacing: 10.s,
              mainAxisSpacing: 10.s),
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
                text: "image_crop开源软件包Demo",
                onTap: () {
                  RouterUtil.push(context, routerName: "cropDemo");
                }),
            Button(
                text: "跳转剪裁demo",
                onTap: () {
                  RouterUtil.push(context, routerName: "clippingDemo");
                }),
            Button(
                text: "图标在文字末尾换行显示demo",
                onTap: () {
                  RouterUtil.push(context, routerName: "richTextDemo");
                }),
            Button(
                text: "Logger开源软件包demo",
                onTap: () {
                  RouterUtil.push(context, routerName: "loggerDemo");
                }),
            Button(
                text: "Faker开源软件包demo",
                onTap: () {
                  RouterUtil.push(context, routerName: "fakerDemo");
                }),
          ],
        ),
      ),
    );
  }
}
