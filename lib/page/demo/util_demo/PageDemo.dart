import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/util/util.dart';

/**
 * @author wu chao
 * @project flutter_demo
 * @date 2021/5/25
 */
class PageDemo extends StatefulWidget {
  const PageDemo({Key key}) : super(key: key);

  @override
  _PageDemoState createState() => _PageDemoState();
}

class _PageDemoState extends State<PageDemo> {
  bool scrollFlag = true;
  ScrollController scrollController = ScrollController();
  String pageFlag = "0";

  jump(ScrollNotification scrollNotification) async {
    print(scrollNotification.metrics.maxScrollExtent);
    print(scrollNotification.metrics.pixels);
    print(scrollNotification.metrics.minScrollExtent);
    //不在最大或最小 且 不是用户的手势
    if (!scrollNotification.metrics.atEdge && scrollFlag) {
      scrollFlag = false;

      //偏移量过了一半
      if (scrollNotification.metrics.pixels >
          (scrollNotification.metrics.maxScrollExtent / 2)) {
        print("该往右边跳");
        WidgetsBinding.instance.addPostFrameCallback((_) {
          scrollController.animateTo(scrollNotification.metrics.maxScrollExtent,
              duration: Duration(milliseconds: 400), curve: Curves.ease);
          pageFlag = "1";
        });
      }
      //偏移量没过一半
      if (scrollNotification.metrics.pixels <
          (scrollNotification.metrics.maxScrollExtent / 2)) {
        print("该往左边跳");
        WidgetsBinding.instance.addPostFrameCallback((_) {
          scrollController.animateTo(scrollNotification.metrics.minScrollExtent,
              duration: Duration(milliseconds: 400), curve: Curves.ease);
          pageFlag = "0";
        });
      }
    }
    if (scrollNotification.metrics.atEdge) {
      if (scrollNotification.metrics.pixels ==
          scrollNotification.metrics.maxScrollExtent) pageFlag = "1";
      if (scrollNotification.metrics.pixels ==
          scrollNotification.metrics.minScrollExtent) pageFlag = "0";
    }
    setState(() {});
    print('Scroll End');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "PageDemo"),
      body: Column(
        children: [
          NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollStartNotification) {
                scrollFlag = true;
                print("用户开始滑动");
              }
              if (scrollNotification is ScrollUpdateNotification) {}
              if (scrollNotification is ScrollEndNotification) {
                jump(scrollNotification);
              }
              return false;
            },
            child: Container(
              height: 700.s,
              width: 700.s,
              child: ListView(
                scrollDirection: Axis.horizontal,
                controller: scrollController,
                children: [
                  Container(
                    width: 700.s,
                    height: 500.s,
                    color: Colors.amberAccent,
                  ),
                  Container(
                    width: 700.s,
                    height: 500.s,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 10.s,
                height: 10.s,
                margin: EdgeInsets.fromLTRB(320.s, 0, 0, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90.s),
                    color: pageFlag == "0" ? Colors.blue : Colors.grey),
              ),
              Container(
                width: 10.s,
                height: 10.s,
                margin: EdgeInsets.fromLTRB(5.s, 0, 0, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90.s),
                    color: pageFlag == "1" ? Colors.blue : Colors.grey),
              ),
            ],
          )
        ],
      ),
    );
  }
}
