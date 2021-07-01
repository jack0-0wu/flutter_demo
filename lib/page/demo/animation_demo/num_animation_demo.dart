import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/page/demo/animation_demo/num_animation.dart';
import 'package:flutter_demo/util/custom_widget.dart';

/**
 * @author wu chao
 * @project flutter_demo
 * @date 2021/6/1
 */
class NumAnimationDemo extends StatefulWidget {
  const NumAnimationDemo({Key key}) : super(key: key);

  @override
  _NumAnimationDemoState createState() => _NumAnimationDemoState();
}

class _NumAnimationDemoState extends State<NumAnimationDemo> {
  Key key = UniqueKey();
  Key key2 = UniqueKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "数字变换Demo"),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            AnimText(
              endNumber: 10,
              beginNumber: 0,
              duration: 500,
              key: key,
            ),
            SizedBox(
              height: 100,
            ),
            AnimText(
              endNumber: 190,
              beginNumber: 0,
              duration: 1000,
              key: key2,
            ),
            SizedBox(
              height: 100,
            ),
            GestureDetector(
              onTap: () {
                key = UniqueKey();
                key2 = UniqueKey();
                setState(() {});
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.amber,
                alignment: Alignment.center,
                child: Text("点击播放动画"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
