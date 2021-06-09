import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/util/util.dart';

import 'GradientCircularProgressIndicator.dart';

/// @author wu chao
/// @project flutter_demo
/// @date 2021/6/8
// ignore: must_be_immutable

class GesturesDemo extends StatefulWidget {
  const GesturesDemo({Key key}) : super(key: key);

  @override
  _GesturesDemoState createState() => _GesturesDemoState();
}

class _GesturesDemoState extends State<GesturesDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "手势demo"),
        body: Center(
          child: Gestures(
            total: 10,
            nowNum: 1,
            doneFlag: 1 == 10,
            content: "zhen bu cuo",
          ),
        ));
  }
}

// ignore: must_be_immutable
class Gestures extends StatefulWidget {
  //文字内容
  String content;

  //当前任务数
  num nowNum;

  //总任务数
  num total;

  //容器未完成颜色
  Color undoneColor;

  //容器完成颜色
  Color doneColor;

  //文字未完成颜色
  Color undoneTextColor;

  //文字完成颜色
  Color doneTextColor;

  //Icon未完成颜色
  Color undoneIconColor;

  //Icon完成颜色
  Color doneIconColor;

  //次级文字未完成颜色
  Color undoneText2Color;

  //次级文字完成颜色
  Color doneText2Color;

  //任务是否完成
  bool doneFlag;

  //正向动画时间
  num forwardTime;

  //反向动画时间
  num reverseTime;

  //大小
  num size;

  //图标大小
  num iconSize;

  //圆圈颜色
  Color circularColor;

  //圆圈背景颜色
  Color circularBgColor;

  @override
  _GesturesState createState() => _GesturesState();

  Gestures(
      {@required this.content,
      @required this.nowNum,
      @required this.total,
      this.undoneColor = Colors.white,
      this.doneColor = Colors.blueAccent,
      this.undoneTextColor = Colors.black,
      this.doneTextColor = Colors.white,
      this.undoneIconColor = Colors.black38,
      this.doneIconColor = Colors.white,
      this.undoneText2Color = Colors.black26,
      this.doneText2Color = Colors.white,
      @required this.doneFlag,
      this.forwardTime = 1000,
      this.reverseTime = 400,
      this.size = 315,
      this.iconSize = 90,
      this.circularColor = Colors.lightGreen,
      this.circularBgColor = Colors.grey});
}

//必要的属性暴露出来，在父级组件中定义
//部分属性自己内部管理
class _GesturesState extends State<Gestures> with TickerProviderStateMixin {
  AnimationController animationController;
  AnimationController animationDoneController;
  bool showFlag = false;

  @override
  void initState() {
    super.initState();
    //switch类型
    animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.forwardTime),
        reverseDuration: Duration(milliseconds: widget.reverseTime));
    animationDoneController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.forwardTime),
      reverseDuration: Duration(milliseconds: widget.reverseTime),
    );

    animationController.addListener(() {
      //如果已经完成 该Controller不生效
      if (widget.doneFlag) return;
      //如果已经完成一圈
      if (animationController.value == 1) {
        if (widget.nowNum < widget.total) {
          widget.nowNum += 1;
        }
        //如果已经完成
        if (widget.nowNum == widget.total) {
          setState(() {
            widget.doneFlag = true;
            showFlag = false;
            animationController.value = 0;
          });
          return;
        }
        //还没全部完成，动画继续循环
        animationController.reset();
        animationController.forward();
      }
      setState(() {});
    });
    animationDoneController.addListener(() {
      //如果点击一圈
      if (animationDoneController.value == 1) {
        setState(() {
          //取消完成状态
          widget.doneFlag = false;
          widget.nowNum -= 1;
          showFlag = false;
          animationDoneController.value = 0;
        });
        return;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    //switch类型
    return GestureDetector(
      child: Stack(
        children: [
          Container(
            width: widget.size.s,
            height: widget.size.s,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.opacity,
                    size: widget.iconSize.s,
                    color: widget.doneFlag
                        ? widget.doneIconColor
                        : widget.undoneIconColor),
                SizedBox(height: 35.s),
                Text(
                  widget.content,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.s,
                      color: widget.doneFlag
                          ? widget.doneTextColor
                          : widget.undoneTextColor),
                ),
                SizedBox(height: 15.s),
                Text(
                  "${widget.nowNum}/${widget.total}",
                  style: TextStyle(
                      color: widget.doneFlag
                          ? widget.doneText2Color
                          : widget.undoneText2Color,
                      fontSize: 24.s),
                ),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60.s),
              color: widget.doneFlag ? widget.doneColor : widget.undoneColor,
            ),
          ),
          Visibility(
            visible: showFlag,
            child: GradientCircularProgressIndicator(
                colors: [widget.circularColor, widget.circularColor],
                radius: 155.s,
                backgroundColor: widget.circularBgColor,
                // backgroundColor: backgroundColor,
                strokeWidth: 20.s,
                strokeCapRound: true,
                value: widget.doneFlag
                    ? (animationDoneController != null
                        ? animationDoneController.value
                        : 0)
                    : (animationController != null
                        ? animationController.value
                        : 0)),
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
      onLongPressStart: (detail) {
        print("长按开始");
        setState(() {
          showFlag = true;
        });
        if (widget.doneFlag) {
          animationDoneController.forward();
          return;
        }
        animationController.forward();
      },
      onLongPressEnd: (detail) async {
        print("长按结束");
        if (widget.doneFlag) {
          if (animationDoneController.value != 0 &&
              animationDoneController.value != 1) {
            await animationDoneController.reverse();
          }
          setState(() {
            showFlag = false;
          });
          return;
        }
        if (animationController.value != 0 && animationController.value != 1) {
          await animationController.reverse();
        }
        setState(() {
          showFlag = false;
        });
      },
    );
  }
}
