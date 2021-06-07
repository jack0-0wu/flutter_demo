/**
 * @author wu chao
 * @project flutter_demo
 * @date 2021/6/7
 */
import 'dart:math';

import 'package:flutter/material.dart';

double randomBorderRadius() {
  return Random().nextDouble() * 64;
}

double randomMargin() {
  return Random().nextDouble() * 64;
}

Color randomColor() {
  return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
}

class AnimatedContainerDemo extends StatefulWidget {
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  Color color;
  double borderRadius;
  double margin;

  @override
  initState() {
    super.initState();
    color = randomColor();
    borderRadius = randomBorderRadius();
    margin = randomMargin();
  }

  void change() {
    setState(() {
      color = randomColor();
      borderRadius = randomBorderRadius();
      margin = randomMargin();
    });
  }

  var _duration = Duration(milliseconds: 400);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(height: 100,),
            SizedBox(
              width: 128,
              height: 128,
              //当属性的新旧值发生变化时，AnimatedContainer 会自动在新旧值之间产生动画效果
              child: AnimatedContainer(
                duration: _duration,
                //curve在 duration 时长内控制动画的速率变化
                curve: Curves.bounceIn,

                margin: EdgeInsets.all(margin),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
            ),

            ElevatedButton(
              child: Text('change'),
              onPressed: () => change(),
            ),
          ],
        ),
      ),
    );
  }
}
