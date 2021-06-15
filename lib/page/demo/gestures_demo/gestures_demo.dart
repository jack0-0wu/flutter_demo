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
        body: Column(
          children: [
            Gestures(
              total: 10,
              nowNum: 0,
              content: "zhen bu cuo",
              icon: Icons.ac_unit_outlined,
              tap: () {
                print("1");
              },
              doubleTap: () {
                print("2");
              },
              pressEnd: (i) {
                print(i);
              },
            ),
            Gestures2(
              content: "zhen bu cuo",
              icon: Icons.ac_unit_outlined,
            ),
            Gestures3(
              total: 1,
              nowNum: 0,
              content: "zhen bu cuo",
              icon: Icons.ac_unit_outlined,
              tap: () {
                print("1");
              },
              doubleTap: () {
                print("2");
              },
              pressEnd: (i) {
                print(i);
              },
            ),
          ],
        ));
  }
}
//普通类型组件
// ignore: must_be_immutable
class Gestures extends StatefulWidget {
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

  @override
  _GesturesState createState() => _GesturesState();

  Gestures(
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
class _GesturesState extends State<Gestures> with TickerProviderStateMixin {
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
        widget.tap != null ? widget.tap() : print("tap");
      },
      onDoubleTap: () {
        widget.doubleTap != null ? widget.doubleTap() : print("doubleTap");
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
            : print("pressEnd");
      },
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
                      percent:
                          (widget.nowNum - 1 + progressBarController.value) /
                              widget.total,
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
                      percent: (animationController != null
                          ? animationController.value
                          : 0),
                      conSize: 260,
                      strokeWidth: 6,
                      containerColor:
                          doneFlag ? widget.doneColor : widget.undoneColor,
                      lineColor: doneFlag
                          ? widget.doneLineColor
                          : widget.undoneLineColor),
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

//不吸烟类型组件
// ignore: must_be_immutable
class Gestures2 extends StatefulWidget {
  //文字内容
  String content;

  //图标
  IconData icon;

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

  //线完成颜色
  Color doneLineColor;

  //正向动画时间
  num forwardTime;

  //反向动画时间
  num reverseTime;

  @override
  _Gestures2State createState() => _Gestures2State();

  Gestures2({
    @required this.content,
    @required this.icon,
    this.doneColor = Colors.blueAccent,
    this.undoneTextColor = Colors.black,
    this.doneTextColor = Colors.white,
    this.undoneIconColor = Colors.black38,
    this.doneIconColor = Colors.white,
    this.doneLineColor = Colors.white,
    this.forwardTime = 1000,
    this.reverseTime = 400,
  });
}

//必要的属性暴露出来，在父级组件中定义,剩余属性自己内部管理
class _Gestures2State extends State<Gestures2> with TickerProviderStateMixin {
  //动画执行控制器
  AnimationController animationController;

  //任务是否完成
  bool doneFlag;

  @override
  void initState() {
    super.initState();
    doneFlag = true;
    //初始化动画控制器
    animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.forwardTime),
        reverseDuration: Duration(milliseconds: widget.reverseTime));
    //添加监听
    animationController.addListener(() {
      //动画走完一圈
      if (doneFlag && animationController.value == 1) {
        //取消完成状态
        doneFlag = false;
        animationController.value = 0;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    //switch类型
    return GestureDetector(
        onTap: () {
          // if (doneFlag) return;
          setState(() {
            widget.content = "单击";
          });
        },
        onDoubleTap: () {
          // if (doneFlag) return;
          setState(() {
            widget.content = "双击";
          });
        },
        onLongPressStart: (detail) {
          animationController.forward();
        },
        onLongPressEnd: (detail) async {
          if (animationController.value != 0 &&
              animationController.value != 1) {
            await animationController.reverse();
          }
        },
        child: doneFlag
            ? Container(
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
                              percent: 1, conSize: 315, strokeWidth: 18),
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
                              percent: (animationController != null
                                  ? animationController.value
                                  : 0),
                              conSize: 260,
                              strokeWidth: 6,
                              containerColor: widget.doneColor,
                              lineColor: widget.doneLineColor),
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
                              widget.icon,
                              size: 90.s,
                              color: widget.doneIconColor,
                            ),
                            SizedBox(height: 35.s),
                            Text(
                              widget.content,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30.s,
                                  color: widget.doneTextColor),
                            ),
                            SizedBox(height: 15.s),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: widget.doneColor,
                          borderRadius: BorderRadius.circular(52.s),
                        ),
                      ),
                    )
                  ],
                ),
              )
            : Container(
                width: 300.s,
                height: 300.s,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60.s),
                    color: Colors.black12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.close,
                      size: 140.s,
                      color: widget.undoneIconColor,
                    ),
                    SizedBox(height: 35.s),
                    Text(
                      widget.content,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.s,
                          color: widget.undoneTextColor),
                    ),
                  ],
                ),
              ));
  }
}

//普通类型组件
// ignore: must_be_immutable
class Gestures3 extends StatefulWidget {
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

  @override
  _Gestures3State createState() => _Gestures3State();

  Gestures3(
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
class _Gestures3State extends State<Gestures3> with TickerProviderStateMixin {
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
      if (progressBarController.value == 1){
        widget.nowNum+=1;
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
        widget.tap != null ? widget.tap() : print("tap");
      },
      onDoubleTap: () {
        widget.doubleTap != null ? widget.doubleTap() : print("doubleTap");
      },
      onLongPressStart: (detail) {
        if (doneFlag) return;
        progressBarController.forward();
      },
      onLongPressEnd: (detail) async {
        if (progressBarController.value != 0 &&
            progressBarController.value != 1) {
          await progressBarController.reverse();
        }
        widget.pressEnd != null
            ? widget.pressEnd(widget.nowNum)
            : print("pressEnd");
      },
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
                      percent: progressBarController.value,
                      conSize: 315,
                      strokeWidth: 18),
                ),
              ),
            ),
            Positioned(
              left: 25.s,
              top: 25.s,
              child: Container(
                width: (315 - 50).s,
                height: (315 - 50).s,
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
    return RRect.fromLTRBR(myOffset.s, myOffset.s, (conSize + 1.5 + myOffset).s,
        (conSize + 1.5 + myOffset).s, Radius.circular(55.s));
  }

  @override
  bool shouldReclip(CustomClipper<RRect> oldClipper) => false;
}
