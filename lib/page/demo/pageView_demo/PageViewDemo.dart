import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/util/util.dart';

/**
 * @author wu chao
 * @project flutter_demo
 * @date 2021/5/25
 */
class PageViewDemo extends StatefulWidget {
  const PageViewDemo({Key key}) : super(key: key);

  @override
  _PageViewDemoState createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "PageViewDemo"),
      body: Container(
        width: 700.s,
        height: 700.s,
        child: PageView(
          onPageChanged: (index) {
            print(index);
          },
          children: [
            Container(
              height: 500.s,
              color: Colors.amberAccent,
            ),
            Container(
              height: 500.s,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
