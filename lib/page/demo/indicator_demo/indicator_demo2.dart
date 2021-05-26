import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/util/custom_widget.dart';
import 'package:flutter_demo/util/util.dart';
import 'dart:math' as math;

/**
 * @author wu chao
 * @project flutter_demo
 * @date 2021/5/25
 */
class IndicatorDemo2 extends StatefulWidget {
  const IndicatorDemo2({Key key}) : super(key: key);

  @override
  _IndicatorDemo2State createState() => _IndicatorDemo2State();
}

class _IndicatorDemo2State extends State<IndicatorDemo2> {
  List<String> iconList = ["a", 'b', "c", "d", 'f', 'e'];
  List<Color> colorList = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];

  num width = 50.s;

  int lastIndex = -1;

  int _getIndex(double offset) {
    int index = offset ~/ width;
    return math.min(index, iconList.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "横向滑动选择器demo"),
      body: Column(
        children: [
          SizedBox(
            height: 90.s,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onHorizontalDragDown: (DragDownDetails details) {
                  print("onHorizontalDragDown");
                  int index = _getIndex(details.localPosition.dx);
                  if (index >= 0) {
                    if (lastIndex != -1) colorList[lastIndex] = Colors.white;

                    lastIndex = index;
                    colorList[index] = Colors.blue;

                    setState(() {});
                    print(index);
                    HapticFeedback.mediumImpact();
                  }
                },
                onHorizontalDragUpdate: (DragUpdateDetails details) {
                  // print("onHorizontalDragUpdate");
                  int index = _getIndex(details.localPosition.dx);
                  if (index >= 0 && lastIndex != index) {
                    colorList[lastIndex] = Colors.white;
                    lastIndex = index;
                    colorList[index] = Colors.blue;
                    setState(() {});
                    print(index);
                    HapticFeedback.mediumImpact();
                  }
                },
                onHorizontalDragEnd: (DragEndDetails details) {
                  print("onHorizontalDragEnd");
                },
                onHorizontalDragCancel: () {
                  print("onHorizontalDragCancel");
                },
                onTapUp: (TapUpDetails details) {
                  print("onTapUp");
                },
                behavior: HitTestBehavior.translucent,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < iconList.length; i++)
                      Container(
                        width: width,
                        height: 50.s,
                        padding: EdgeInsets.fromLTRB(10.s, 0, 10.s, 0),
                        alignment: Alignment.center,
                        child: Container(
                            color: colorList[i], child: Text(iconList[i])),
                      ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
