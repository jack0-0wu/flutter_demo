import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/util/custom_widget.dart';

import 'index_bar.dart';

/**
 * @author wu chao
 * @project flutter_demo
 * @date 2021/5/25
 */
class IndicatorDemo extends StatefulWidget {
  const IndicatorDemo({Key key}) : super(key: key);

  @override
  _IndicatorDemoState createState() => _IndicatorDemoState();
}

class _IndicatorDemoState extends State<IndicatorDemo> {
  IndexBarDragListener dragListener = IndexBarDragListener.create();
  IndexBarController indexBarController = IndexBarController();
  IndexBarOptions indexBarOptions = IndexBarOptions(
    needRebuild: true,
    ignoreDragCancel: true,
    downTextStyle: TextStyle(fontSize: 12, color: Colors.white),
    downItemDecoration:
        BoxDecoration(shape: BoxShape.circle, color: Colors.green),
    indexHintWidth: 120 / 2,
    indexHintHeight: 100 / 2,
    indexHintDecoration: BoxDecoration(color: Colors.blue),
    indexHintAlignment: Alignment.centerRight,
    indexHintChildAlignment: Alignment(-0.25, 0.0),
    indexHintOffset: Offset(-20, 0),
  );
  String selectTag = '';

  @override
  void initState() {
    super.initState();
    dragListener.dragDetails.addListener(_valueChanged);
  }

  void _valueChanged() {
    IndexBarDragDetails details = dragListener.dragDetails.value;
    print(details.index);
    // print(details.action);
    // print(details.globalPositionY);
    // print(details.localPositionY);
    // print(details.tag);
    String tag = details.tag;
    if (details.action == IndexBarDragDetails.actionDown ||
        details.action == IndexBarDragDetails.actionUpdate) {
      selectTag = tag;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "纵向滑动选择器组件"),
        body: Column(
          children: [
            IndexBar(
              data: ['a', 'b', "c", "d", "e", "f"],
              width: 90,
              height: 100,
              itemHeight: 16,
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              indexBarDragListener: dragListener,
              options: IndexBarOptions(
                needRebuild: true,
                ignoreDragCancel: true,
                downTextStyle: TextStyle(fontSize: 12, color: Colors.white),
                downItemDecoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.green),
                indexHintWidth: 120 / 2,
                indexHintHeight: 100 / 2,
                indexHintDecoration: BoxDecoration(color: Colors.blue),
                indexHintAlignment: Alignment.centerRight,
                indexHintChildAlignment: Alignment(-0.25, 0.0),
                indexHintOffset: Offset(-20, 0),
              ),
              controller: indexBarController,
            )
          ],
        ));
  }
}
