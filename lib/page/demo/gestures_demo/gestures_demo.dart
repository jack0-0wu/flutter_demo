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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200.s,
              width: double.maxFinite,
            ),
            TimeHabit(
              total: 50,
              nowNum: 0,
              content: "zhen bu cuo",
              icon: Icons.ac_unit_outlined,
              tap: () {
                debugPrint("1");
              },
              doubleTap: () {
                debugPrint("2");
              },
              pressEnd: (i) {
                debugPrint(i.toString());
              },
            ),
          ],
        ));
  }
}


//计数类型组件
// ignore: must_be_immutable
class CountHabit extends StatefulWidget {
  //文字内容
  String content;

  //当前任务数
  num nowNum;

  //总任务数
  num total;

  //图标
  IconData icon;

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

  //线未完成颜色
  Color undoneLineColor;

  //线完成颜色
  Color doneLineColor;

  //正向动画时间
  num forwardTime;

  //反向动画时间
  num reverseTime;

  //单击事件
  Function tap;

  //双击事件
  Function doubleTap;

  //长按结束
  Function pressEnd;

  //组件长度
  num width = 315;

  //边缘宽度
  num stockWidth = 18;

  @override
  _CountHabitState createState() => _CountHabitState();

  CountHabit(
      {@required this.content,
        @required this.nowNum,
        @required this.total,
        @required this.icon,
        this.undoneColor = Colors.white,
        this.doneColor = Colors.blueAccent,
        this.undoneTextColor = Colors.black,
        this.doneTextColor = Colors.white,
        this.undoneIconColor = Colors.black38,
        this.doneIconColor = Colors.white,
        this.undoneText2Color = Colors.black26,
        this.doneText2Color = Colors.white,
        this.undoneLineColor = Colors.blueAccent,
        this.doneLineColor = Colors.white,
        this.forwardTime = 1000,
        this.reverseTime = 400,
        this.tap,
        this.doubleTap,
        this.pressEnd});
}

//必要的属性暴露出来，在父级组件中定义,剩余属性自己内部管理
class _CountHabitState extends State<CountHabit> with TickerProviderStateMixin {
  //动画执行控制器
  AnimationController animationController;

  //进度条动画控制器
  AnimationController progressBarController;

  //任务是否完成
  bool doneFlag;

  @override
  void initState() {
    super.initState();
    doneFlag = (widget.total == widget.nowNum);
    //初始化动画控制器
    animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.forwardTime),
        reverseDuration: Duration(milliseconds: widget.reverseTime));
    progressBarController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.forwardTime - 100),
        value: 1);
    //添加监听
    animationController.addListener(() {
      //动画走完一圈
      if (!doneFlag && animationController.value == 1) {
        widget.nowNum += 1;
        progressBarController.value = 0;
        progressBarController.forward();
        //已经全部完成
        if (widget.nowNum == widget.total) {
          doneFlag = true;
          animationController.value = 0;
        } else {
          //还没全部完成，动画继续循环
          animationController.reset();
          animationController.forward();
        }
      }
      setState(() {});
    });
    //
    progressBarController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    doneFlag = (widget.total == widget.nowNum);
    return GestureDetector(
      onTap: () {
        widget.tap != null ? widget.tap() : debugPrint("tap");
      },
      onDoubleTap: () {
        widget.doubleTap != null ? widget.doubleTap() : debugPrint("doubleTap");
      },
      onLongPressStart: (detail) {
        if (doneFlag) return;
        animationController.forward();
      },
      onLongPressEnd: (detail) async {
        if (animationController.value != 0 && animationController.value != 1) {
          await animationController.reverse();
        }
        widget.pressEnd != null
            ? widget.pressEnd(widget.nowNum)
            : debugPrint("pressEnd");
      },
      child: Container(
        width: widget.width.s,
        height: widget.width.s,
        child: Stack(
          children: [
            ClipRRect(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              clipper: ProgressBarClipper(conSize: widget.width),
              child: CustomPaint(
                size: Size(widget.width.s, widget.width.s),
                painter: ProgressBar(
                    percent: (widget.nowNum - 1 + progressBarController.value) /
                        widget.total,
                    conSize: widget.width,
                    strokeWidth: widget.stockWidth),
              ),
            ),
            ClipRRect(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              clipper: AnimationClipper(),
              child: CustomPaint(
                size: Size(widget.width.s, widget.width.s),
                painter: AnimationProgressBar(
                    percent: (animationController != null
                        ? animationController.value
                        : 0),
                    containerColor:
                    doneFlag ? widget.doneColor : widget.undoneColor,
                    lineColor: doneFlag
                        ? widget.doneLineColor
                        : widget.undoneLineColor),
              ),
            ),
            Positioned(
              left: 23.s,
              top: 23.s,
              child: Container(
                width: (widget.width - 23 * 2 - 1).s,
                height: (widget.width - 23 * 2 - 1).s,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      widget.icon,
                      size: 90.s,
                      color: doneFlag
                          ? widget.doneIconColor
                          : widget.undoneIconColor,
                    ),
                    SizedBox(height: 35.s),
                    Text(
                      widget.content,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.s,
                          color: doneFlag
                              ? widget.doneTextColor
                              : widget.undoneTextColor),
                    ),
                    SizedBox(height: 15.s),
                    Text(
                      "${widget.nowNum}/${widget.total}",
                      style: TextStyle(
                          color: doneFlag
                              ? widget.doneText2Color
                              : widget.undoneText2Color,
                          fontSize: 24.s),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: doneFlag ? widget.doneColor : widget.undoneColor,
                  borderRadius: BorderRadius.circular(40.s),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//时间类型组件
// ignore: must_be_immutable
class TimeHabit extends StatefulWidget {
  //文字内容
  String content;

  //当前任务数
  num nowNum;

  //总任务数
  num total;

  //图标
  IconData icon;

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

  //线未完成颜色
  Color undoneLineColor;

  //线完成颜色
  Color doneLineColor;

  //正向动画时间
  num forwardTime;

  //反向动画时间
  num reverseTime;

  //单击事件
  Function tap;

  //双击事件
  Function doubleTap;

  //长按结束
  Function pressEnd;

  //组件长度
  num width = 315;

  //边缘宽度
  num stockWidth = 18;

  @override
  _TimeHabitState createState() => _TimeHabitState();

  TimeHabit(
      {@required this.content,
        @required this.nowNum,
        @required this.total,
        @required this.icon,
        this.undoneColor = Colors.white,
        this.doneColor = Colors.blueAccent,
        this.undoneTextColor = Colors.black,
        this.doneTextColor = Colors.white,
        this.undoneIconColor = Colors.black38,
        this.doneIconColor = Colors.white,
        this.undoneText2Color = Colors.black26,
        this.doneText2Color = Colors.white,
        this.undoneLineColor = Colors.blueAccent,
        this.doneLineColor = Colors.white,
        this.forwardTime = 1000,
        this.reverseTime = 400,
        this.tap,
        this.doubleTap,
        this.pressEnd});
}

//必要的属性暴露出来，在父级组件中定义,剩余属性自己内部管理
class _TimeHabitState extends State<TimeHabit> with TickerProviderStateMixin {
  //进度条动画控制器
  AnimationController progressBarController;

  //任务是否完成
  bool doneFlag;

  @override
  void initState() {
    super.initState();
    doneFlag = (widget.total == widget.nowNum);
    progressBarController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.forwardTime - 100),
        value: 0);
    progressBarController.addListener(() {
      if (progressBarController.value == 1) {
        widget.nowNum += widget.total;
        doneFlag = true;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    doneFlag = (widget.total == widget.nowNum);
    return GestureDetector(
      onTap: () {
        widget.tap != null ? widget.tap() : debugPrint("tap");
      },
      onDoubleTap: () {
        widget.doubleTap != null ? widget.doubleTap() : debugPrint("doubleTap");
      },
      onLongPressStart: (detail) {
        if (doneFlag) return;
        progressBarController.forward();
      },
      onLongPressEnd: (detail) async {
        if (progressBarController.value != 0 &&
            progressBarController.value != 1) {
          await progressBarController.reverse();
          widget.nowNum = 0;
        }
        widget.pressEnd != null
            ? widget.pressEnd(widget.nowNum * 60000)
            : debugPrint("pressEnd");
      },
      child: Container(
        width: widget.width.s,
        height: widget.width.s,
        child: Stack(
          children: [
            ClipRRect(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              clipper: ProgressBarClipper(conSize: widget.width),
              child: CustomPaint(
                size: Size(widget.width.s, widget.width.s),
                painter: ProgressBar(
                    percent: progressBarController.value,
                    conSize: widget.width,
                    strokeWidth: widget.stockWidth),
              ),
            ),
            Positioned(
              left: 18.s,
              top: 18.s,
              child: Container(
                width: (widget.width - widget.stockWidth * 2).s,
                height: (widget.width - widget.stockWidth * 2).s,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      widget.icon,
                      size: 90.s,
                      color: doneFlag
                          ? widget.doneIconColor
                          : widget.undoneIconColor,
                    ),
                    SizedBox(height: 35.s),
                    Text(
                      widget.content,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.s,
                          color: doneFlag
                              ? widget.doneTextColor
                              : widget.undoneTextColor),
                    ),
                    SizedBox(height: 15.s),
                    Text(
                      "${widget.nowNum}/${widget.total}",
                      style: TextStyle(
                          color: doneFlag
                              ? widget.doneText2Color
                              : widget.undoneText2Color,
                          fontSize: 24.s),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: doneFlag ? widget.doneColor : widget.undoneColor,
                  borderRadius: BorderRadius.circular(52.s),
                ),
              ),
            )
          ],
        ),
      ),
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
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.blueAccent;
    var paint2 = Paint()
      ..style = PaintingStyle.fill
      ..color = Color(0XFFF2F5FA);

    canvas.drawRRect(
      RRect.fromLTRBR(
          0.s, 0.s, conSize.s, conSize.s, Radius.circular(60.s)),
      paint,
    );
    canvas.drawArc(
      //调这个
      Rect.fromLTRB(-50.s, -50.s, 365.s, 365.s),
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

class ProgressBarClipper  extends CustomClipper<RRect> {
  num conSize;

  ProgressBarClipper ({this.conSize});

  @override
  RRect getClip(Size size) {
    return RRect.fromLTRBR(
        0, 0, conSize.s, conSize.s, Radius.circular(60.s));
  }

  @override
  bool shouldReclip(CustomClipper<RRect> oldClipper) => false;
}

class AnimationProgressBar extends CustomPainter {
  num percent;
  Color containerColor;
  Color lineColor;

  AnimationProgressBar(
      {this.percent,
        this.containerColor,
        this.lineColor});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = lineColor;

    var paint2 = Paint()
      ..style = PaintingStyle.fill
      ..color = containerColor;
    canvas.drawRRect(
      RRect.fromLTRBR(
          18.s, 18.s, (277 + 18).s, (277 + 18).s, Radius.circular(41.s)),
      paint2,
    );
    canvas.drawRRect(
      RRect.fromLTRBR((18 + 1).s, (18 + 1).s, (277 + 18 - 1).s,
          (277 + 18 - 1).s, Radius.circular(41.s)),
      paint,
    );
    canvas.drawArc(
      //调这个
      Rect.fromLTRB(-30.s, -30.s, 345.s, 345.s),
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

  AnimationClipper();

  @override
  RRect getClip(Size size) {
    return RRect.fromLTRBR(
        18.s,
        18.s,
        (279+18).s,
        (279+18).s,
        Radius.circular(42.s));
  }

  @override
  bool shouldReclip(CustomClipper<RRect> oldClipper) => false;
}
