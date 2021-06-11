import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/util/util.dart';

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
        backgroundColor: Colors.white,
        appBar: CustomAppBar(title: "手势demo"),
        body: Center(
          child: Gestures(
            total: 5,
            nowNum: 0,
            doneFlag: 0 == 5,
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
      this.size = 280,
      this.iconSize = 90,
      this.circularColor = Colors.blueAccent,
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
      child: Container(
        width: 315.s,
        height: 315.s,
        child: Stack(
          children: [
            Positioned(
              left: -25.s,
              top: -25.s,
              child: ClipRRect(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                clipper: MyClipper(conSize: 315, strokeWidth: 18),
                child: CustomPaint(
                  size: Size(315.s, 315.s),
                  painter: ProgressBar(
                      percent: widget.nowNum / widget.total,
                      conSize: 315,
                      strokeWidth: 18),
                ),
              ),
            ),
            Positioned(
              left: -5.s,
              top: -5.s,
              child: ClipRRect(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                clipper: AnimationClipper(conSize: 260),
                child: CustomPaint(
                  size: Size(260.s, 260.s),
                  painter: AnimationProgressBar(
                      percent: widget.doneFlag
                          ? (animationDoneController != null
                              ? animationDoneController.value
                              : 0)
                          : (animationController != null
                              ? animationController.value
                              : 0),
                      conSize: 260,
                      strokeWidth: 6,
                      containerColor:
                          widget.doneFlag ? Colors.blueAccent : Colors.white,
                      lineColor:
                          widget.doneFlag ? Colors.white : Colors.blueAccent),
                ),
              ),
            ),

            Positioned(
              left: 40.s,
              top: 40.s,
              child: Container(
                width: (315 - 80).s,
                height: (315 - 80).s,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.opacity,
                      size: widget.iconSize.s,
                      color: widget.doneFlag
                          ? widget.doneIconColor
                          : widget.undoneIconColor,
                    ),
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
                  color:
                      widget.doneFlag ? widget.doneColor : widget.undoneColor,
                  borderRadius: BorderRadius.circular(52.s),
                ),
              ),
            ),
            // Positioned(
            //   left: 25.s,
            //   top: 22.s,
            //   child: Visibility(
            //     visible: showFlag,
            //     child: GradientCircularProgressIndicator(
            //         colors: [widget.circularColor, widget.circularColor],
            //         radius: 130.s,
            //         backgroundColor: Colors.white,
            //         // backgroundColor: backgroundColor,
            //         strokeWidth: 10.s,
            //         strokeCapRound: true,
            //         value: widget.doneFlag
            //             ? (animationDoneController != null
            //                 ? animationDoneController.value
            //                 : 0)
            //             : (animationController != null
            //                 ? animationController.value
            //                 : 0)),
            //   ),
            // ),
          ],
        ),
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

class ProgressBar extends CustomPainter {
  num conSize;

  num strokeWidth;

  num percent;

  ProgressBar({this.percent, this.conSize, this.strokeWidth});

  @override
  void paint(Canvas canvas, Size size) {
    //大小变化时参数需要调整
    num myOffset = strokeWidth * 2.4;
    //大小变化时参数需要调整
    num cir = conSize + myOffset * 1.2;
    num con = conSize + myOffset - (strokeWidth * 2);

    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth.s
      ..color = Colors.blueAccent;
    var paint2 = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = strokeWidth.s
      ..color = Color(0XFFF2F5FA);
    canvas.drawRRect(
      RRect.fromLTRBR(
          myOffset.s, myOffset.s, con.s, con.s, Radius.circular(63.s)),
      paint,
    );
    canvas.drawArc(
      Rect.fromLTRB(0, 0, cir.s, cir.s),
      3.14 * (1.5 + (percent * 2)),
      3.14 * (2 - (percent * 2)),
      true,
      paint2,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class MyClipper extends CustomClipper<RRect> {
  num conSize;
  num strokeWidth;

  MyClipper({this.conSize, this.strokeWidth});

  @override
  RRect getClip(Size size) {
    num myOffset = strokeWidth * 2.4;
    num con = conSize + myOffset - (strokeWidth * 2);
    return RRect.fromLTRBR(
        myOffset.s - strokeWidth / 4.2,
        myOffset.s - strokeWidth / 4.2,
        con.s + strokeWidth / 4.2,
        con.s + strokeWidth / 4.2,
        Radius.circular(60.s));
  }

  @override
  bool shouldReclip(CustomClipper<RRect> oldClipper) => false;
}

class AnimationProgressBar extends CustomPainter {
  num conSize;

  num strokeWidth;

  num percent;

  Color containerColor;
  Color lineColor;

  AnimationProgressBar(
      {this.percent,
      this.conSize,
      this.strokeWidth,
      this.containerColor,
      this.lineColor});

  @override
  void paint(Canvas canvas, Size size) {
    //偏移量 大小变化时参数需要调整
    num myOffset = strokeWidth * 6.4;
    //圆大小 大小变化时参数需要调整
    num cir = conSize + myOffset * 1.7;
    //方块大小
    num con = conSize + myOffset - (strokeWidth * 2);
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth.s
      ..color = lineColor;
    var paint2 = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = strokeWidth.s
      ..color = containerColor;
    canvas.drawRRect(
      RRect.fromLTRBR(
          myOffset.s, myOffset.s, con.s, con.s, Radius.circular(55.s)),
      paint,
    );
    canvas.drawArc(
      Rect.fromLTRB(0, 0, cir.s, cir.s),
      3.14 * (1.5 + (percent * 2)),
      3.14 * (2 - (percent * 2)),
      true,
      paint2,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class AnimationClipper extends CustomClipper<RRect> {
  num conSize;

  AnimationClipper({this.conSize});

  @override
  RRect getClip(Size size) {
    num myOffset = 32;
    return RRect.fromLTRBR(
        myOffset.s,
        myOffset.s ,
        (conSize + 1.5 + myOffset).s,
        (conSize + 1.5 + myOffset).s,
        Radius.circular(55.s));
  }

  @override
  bool shouldReclip(CustomClipper<RRect> oldClipper) => false;
}
