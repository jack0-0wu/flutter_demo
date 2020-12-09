import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/config/static_resource.dart';
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
            for (String demoName in StaticResource.demoMap.keys.toList())
              Button(
                  text: demoName,
                  onTap: () {
                    RouterUtil.push(
                        routerName: StaticResource.demoMap[demoName]);
                  }),
            //需要更新
            // Button(
            //     text: "跳转ChannelTest",
            //     onTap: () {
            //       RouterUtil.push(context, routerName: "planFromTest");
            //     }),

            // Button(
            //     text: "日历控件Demo",
            //     onTap: () {
            //       RouterUtil.push(context, routerName: "calendarDemo");
            //     }),

          ],
        ),
      ),
    );
  }
}
