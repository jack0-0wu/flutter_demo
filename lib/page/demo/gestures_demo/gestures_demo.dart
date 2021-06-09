import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/util/util.dart';

import 'GradientCircularProgressIndicator.dart';

/// @author wu chao
/// @project flutter_demo
/// @date 2021/6/8
class GesturesDemo extends StatefulWidget {
  GesturesDemo(
      {this.content = "Book flights",
      this.percent = 0,
      this.total = 10,
      this.undoneColor = Colors.white,
      this.doneColor = Colors.blue,
      this.doneFlag = false});

  String content;
  AnimationController animationController;
  bool showFlag = false;
  num percent;
  num total;
  Color undoneColor;
  Color doneColor;
  bool doneFlag;

  @override
  _GesturesDemoState createState() => _GesturesDemoState();
}

class _GesturesDemoState extends State<GesturesDemo>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    widget.animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    widget.animationController.addListener(() {
      if (widget.doneFlag) return;
      if (widget.animationController.value == 1) {
        if (widget.percent < widget.total) {
          widget.percent += 1;
        }
        if (widget.percent == widget.total) {
          setState(() {
            widget.undoneColor = widget.doneColor;
            widget.doneFlag = true;
            widget.showFlag = false;
          });
          return;
        }
        widget.animationController.reset();
        widget.animationController.forward();
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "手势demo"),
      body: Center(
        child: GestureDetector(
          child: Stack(
            children: [
              Container(
                width: 315.s,
                height: 315.s,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.opacity,
                      size: 90.s,
                    ),
                    SizedBox(height: 35.s),
                    Text(
                      widget.content,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30.s),
                    ),
                    SizedBox(height: 15.s),
                    Text(
                      "${widget.percent}/${widget.total}",
                      style:
                          TextStyle(color: Color(0XFF9DA3B1), fontSize: 24.s),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60.s),
                  color: widget.undoneColor,
                ),
              ),
              Visibility(
                visible: widget.showFlag,
                child: GradientCircularProgressIndicator(
                  colors: [Colors.lightGreen, Colors.lightGreen],
                  radius: 155.s,
                  backgroundColor: Colors.grey,
                  // backgroundColor: backgroundColor,
                  strokeWidth: 20.s,
                  strokeCapRound: true,
                  value: widget.animationController.value,
                ),
              ),
            ],
          ),
          onTap: () {
            if (widget.doneFlag) return;
            setState(() {
              widget.content = "单击";
            });
          },
          onDoubleTap: () {
            if (widget.doneFlag) return;
            setState(() {
              widget.content = "双击";
            });
          },
          onLongPressMoveUpdate: (detail) {
            print("长按拖拽");
          },
          onLongPressStart: (detail) {
            if (widget.doneFlag) return;
            print("长按开始");
            widget.animationController.forward();
            setState(() {
              widget.showFlag = true;
            });
          },
          onLongPressEnd: (detail) async {
            print("长按结束");
            if (widget.doneFlag) {
              widget.showFlag = false;
              return;
            }
            widget.animationController.duration = Duration(milliseconds: 500);
            await widget.animationController.reverse();
            widget.animationController.duration = Duration(seconds: 2);
            setState(() {
              widget.showFlag = false;
            });
          },
        ),
      ),
    );
  }
}
