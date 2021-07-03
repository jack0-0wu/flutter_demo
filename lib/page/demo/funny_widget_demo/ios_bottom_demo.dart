import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/util/util.dart';

/**
 * @author wu chao
 * @project flutter_demo
 * @date 2021/5/20
 */

class IosBottomDemo extends StatefulWidget {
  const IosBottomDemo({Key key}) : super(key: key);

  @override
  _IosBottomDemoState createState() => _IosBottomDemoState();
}

class _IosBottomDemoState extends State<IosBottomDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "IOS风格的底部选择器"),
      body: Center(
          child: GestureDetector(
        child: Container(
          width: 200.s,
          height: 200.s,
          child: Text("弹出"),
        ),
        onTap: () {
          showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent, //重点
              builder: (context) {
                return Container(
                  height: 450.s,
                  padding: EdgeInsets.fromLTRB(0, 40.s, 0, 0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.s),
                          topRight: Radius.circular(40.s))),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Cancel",
                          ),
                          Text(
                            "Done",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 80.s,
                      ),
                      Container(
                        height: 230.s,
                        child: CupertinoPicker(
                          useMagnifier: true,
                          itemExtent: 100.s,
                          scrollController:
                              FixedExtentScrollController(initialItem: 1),
                          onSelectedItemChanged: (int index) {
                            print(index);
                          },
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                "time",
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                "count",
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              });
        },
      )),
    );
  }
}
