import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/util/util.dart';

import 'GradientCircularProgressIndicator.dart';

/// @author wu chao
/// @project flutter_demo
/// @date 2021/6/8

class GesturesDemo extends StatefulWidget {
  const GesturesDemo({Key key}) : super(key: key);

  @override
  _GesturesDemoState createState() => _GesturesDemoState();
}

class _GesturesDemoState extends State<GesturesDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "响应手势的组件"),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: double.infinity,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TimeCircular(
                  total: 10,
                  nowNum: 1,
                  content: "time",
                  icon: Icons.forward,
                  tap: () {
                    debugPrint("tap");
                  },
                  doubleTap: () {
                    debugPrint("doubleTap");
                  },
                  doneColor: Colors.blue,
                  undoneColor: Colors.white,
                  undoneIconColor: Colors.grey,
                  undoneText2Color: Colors.grey,
                  undoneTextColor: Colors.black,
                  doneIconColor: Colors.white,
                  doneText2Color: Colors.white,
                  doneTextColor: Colors.white,
                  doneLineColor: Colors.blue,
                  undoneLineColor: Colors.grey,
                ),
                SkipCircular(
                  total: 10,
                  nowNum: 1,
                  content: "time",
                  icon: Icons.forward,
                  tap: () {
                    debugPrint("tap");
                  },
                  doubleTap: () {
                    debugPrint("doubleTap");
                  },
                  containerColor: Colors.grey,
                  iconColor: Colors.black38,
                  textColor: Colors.black38,
                  text2Color: Colors.black38,
                ),
              ],
            ),
            CountCircular(
              total: 10,
              nowNum: 1,
              content: "time",
              icon: Icons.forward,
              tap: () {
                debugPrint("tap");
              },
              doubleTap: () {
                debugPrint("doubleTap");
              },
              doneColor: Colors.blue,
              undoneColor: Colors.white,
              undoneIconColor: Colors.grey,
              undoneText2Color: Colors.grey,
              undoneTextColor: Colors.black,
              doneIconColor: Colors.white,
              doneText2Color: Colors.white,
              doneTextColor: Colors.white,
              doneLineColor: Colors.blue,
              undoneLineColor: Colors.grey,
            ),
            // SkipHabit(
            //   total: 10,
            //   nowNum: 1,
            //   content: "skip",
            //   icon: Icons.animation,
            //   tap: () {
            //     debugPrint("tap");
            //   },
            //   doubleTap: () {
            //     debugPrint("doubleTap");
            //   },
            //   containerColor: Colors.grey,
            //   iconColor: Colors.black38,
            //   textColor: Colors.black38,
            //   text2Color: Colors.black38,
            // ),
            // TimeHabit(
            //   total: 10,
            //   nowNum: 1,
            //   content: "time",
            //   icon: Icons.forward,
            //   tap: () {
            //     debugPrint("tap");
            //   },
            //   doubleTap: () {
            //     debugPrint("doubleTap");
            //   },
            //   doneColor: Colors.blue,
            //   undoneColor: Colors.white,
            //   undoneIconColor: Colors.grey,
            //   undoneText2Color: Colors.grey,
            //   undoneTextColor: Colors.black,
            //   doneIconColor: Colors.white,
            //   doneText2Color: Colors.white,
            //   doneTextColor: Colors.white,
            //   doneLineColor: Colors.blue,
            //   undoneLineColor: Colors.grey,
            // ),
            // CountHabit(
            //   total: 10,
            //   nowNum: 1,
            //   content: "time",
            //   icon: Icons.forward,
            //   tap: () {
            //     debugPrint("tap");
            //   },
            //   doubleTap: () {
            //     debugPrint("doubleTap");
            //   },
            //   doneColor: Colors.blue,
            //   undoneColor: Colors.white,
            //   undoneIconColor: Colors.grey,
            //   undoneText2Color: Colors.grey,
            //   undoneTextColor: Colors.black,
            //   doneIconColor: Colors.white,
            //   doneText2Color: Colors.white,
            //   doneTextColor: Colors.white,
            //   doneLineColor: Colors.blue,
            //   undoneLineColor: Colors.grey,
            // )
          ],
        ));
  }
}

// ignore: must_be_immutable
class TimeCircular extends StatefulWidget {
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
  _TimeCircularState createState() => _TimeCircularState();

  TimeCircular(
      {this.content,
      this.nowNum,
      this.total,
      this.icon,
      this.undoneColor,
      this.doneColor,
      this.undoneTextColor,
      this.doneTextColor,
      this.undoneIconColor,
      this.doneIconColor,
      this.undoneText2Color,
      this.doneText2Color,
      this.undoneLineColor,
      this.doneLineColor,
      this.forwardTime = 1000,
      this.reverseTime = 400,
      this.tap,
      this.doubleTap,
      this.pressEnd,
      this.width,
      this.stockWidth});
}

class _TimeCircularState extends State<TimeCircular>
    with TickerProviderStateMixin {
  //进度条动画控制器
  AnimationController progressBarController;

  //任务是否完成
  bool doneFlag;

  //过渡标志
  bool transitionFlag = false;

  Animation<double> curve;

  @override
  void initState() {
    super.initState();
    doneFlag = (widget.nowNum >= widget.total);
    progressBarController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.forwardTime - 100),
      value: doneFlag ? 1 : 0,
    );
    curve = CurvedAnimation(parent: progressBarController, curve: Curves.ease);
    progressBarController.addListener(() {
      if (progressBarController.value == 1 && !doneFlag) {
        widget.nowNum = widget.total;
        doneFlag = true;
        transitionFlag = true;
        Timer(Duration(milliseconds: 700), () {
          transitionFlag = false;
          setState(() {});
        });
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    doneFlag = (widget.nowNum >= widget.total);
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
      child: Stack(
        children: [
          GradientCircularProgressIndicator(
            colors: [widget.doneLineColor, widget.doneLineColor],
            radius: 160.s,
            backgroundColor: widget.undoneLineColor,
            strokeWidth: 20.s,
            strokeCapRound: true,
            value: curve.value,
          ),
          Positioned(
              left: 20.s,
              top: 20.s,
              child: Container(
                width: 280.s,
                height: 280.s,
                alignment: Alignment.center,
                child: transitionFlag
                    ? Icon(Icons.done_rounded,
                        size: 170.s, color: widget.doneIconColor)
                    : Column(
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
                  borderRadius: BorderRadius.circular(180.s),
                ),
              ))
        ],
      ),
    );
  }
}

class CountCircular extends StatefulWidget {
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

  CountCircular(
      {@required this.content,
      @required this.nowNum,
      @required this.total,
      @required this.icon,
      this.undoneColor,
      this.doneColor,
      this.undoneTextColor,
      this.doneTextColor,
      this.undoneIconColor,
      this.doneIconColor,
      this.undoneText2Color,
      this.doneText2Color,
      this.undoneLineColor,
      this.doneLineColor,
      this.forwardTime = 1000,
      this.reverseTime = 400,
      this.tap,
      this.doubleTap,
      this.pressEnd});

  @override
  _CountCircularState createState() => _CountCircularState();
}

class _CountCircularState extends State<CountCircular>
    with TickerProviderStateMixin {
  //动画执行控制器
  AnimationController animationController;

  //进度条动画控制器
  AnimationController progressBarController;

  //任务是否完成
  bool doneFlag;

  //过渡标志
  bool transitionFlag = false;

  @override
  void initState() {
    super.initState();
    doneFlag = (widget.nowNum >= widget.total);
    //初始化动画控制器
    animationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.forwardTime),
        reverseDuration: Duration(milliseconds: widget.reverseTime));
    progressBarController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.forwardTime - 100),
    );
    //添加监听
    animationController.addListener(() {
      //动画走完一圈
      if (!doneFlag && animationController.value == 1) {
        widget.nowNum += 1;
        progressBarController.value = 0;
        progressBarController.forward();
        //已经全部完成
        if (widget.nowNum >= widget.total) {
          doneFlag = true;
          animationController.value = 0;
          transitionFlag = true;
          Timer(Duration(milliseconds: 700), () {
            transitionFlag = false;
            setState(() {});
          });
        } else {
          //还没全部完成，动画继续循环
          animationController.reset();
          animationController.forward();
        }
      }
      setState(() {});
    });
    progressBarController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    doneFlag = (widget.nowNum >= widget.total);
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
        if ((widget.nowNum) / widget.total == 1) {
          await Future.delayed(Duration(milliseconds: 700));
        }
        widget.pressEnd != null
            ? widget.pressEnd(widget.nowNum)
            : debugPrint("pressEnd");
      },
      child: Stack(
        children: [
          GradientCircularProgressIndicator(
            colors: [widget.doneLineColor, widget.doneLineColor],
            radius: 160.s,
            backgroundColor: widget.undoneLineColor,
            strokeWidth: 20.s,
            strokeCapRound: true,
            value: (widget.nowNum - 1 + progressBarController.value) /
                widget.total,
          ),
          Positioned(
              left: 20.s,
              top: 20.s,
              child: Container(
                width: 280.s,
                height: 280.s,
                alignment: Alignment.center,
                child: transitionFlag
                    ? Icon(Icons.done_rounded,
                        size: 170.s, color: widget.doneIconColor)
                    : Column(
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
                  borderRadius: BorderRadius.circular(180.s),
                ),
              )),
          Positioned(
            left: 25.s,
            top: 25.s,
            child: GradientCircularProgressIndicator(
              colors: [widget.doneLineColor, widget.doneLineColor],
              radius: 135.s,
              backgroundColor: Colors.transparent,
              strokeWidth: 3.s,
              strokeCapRound: true,
              value: animationController.value,
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class SkipCircular extends StatefulWidget {
  //文字内容
  String content;

  //当前任务数
  num nowNum;

  //总任务数
  num total;

  //图标
  IconData icon;

  //容器颜色
  Color containerColor;

  //文字颜色
  Color textColor;

  //Icon颜色
  Color iconColor;

  //次级文字颜色
  Color text2Color;

  //单击事件
  Function tap;

  //双击事件
  Function doubleTap;

  //长按结束
  Function pressEnd;

  //组件长度
  num width = 320;

  SkipCircular({
    @required this.content,
    @required this.nowNum,
    @required this.total,
    @required this.icon,
    this.containerColor,
    this.textColor,
    this.iconColor,
    this.text2Color,
    this.tap,
    this.doubleTap,
    this.pressEnd,
  });

  @override
  _SkipCircularState createState() => _SkipCircularState();
}

class _SkipCircularState extends State<SkipCircular> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.tap != null ? widget.tap() : debugPrint("tap");
      },
      onDoubleTap: () {
        widget.doubleTap != null ? widget.doubleTap() : debugPrint("doubleTap");
      },
      onLongPressEnd: (detail) async {
        widget.pressEnd != null
            ? widget.pressEnd(widget.nowNum)
            : debugPrint("pressEnd");
      },
      child: Container(
        width: widget.width.s,
        height: widget.width.s,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              size: 90.s,
              color: widget.iconColor,
            ),
            SizedBox(height: 35.s),
            Text(
              widget.content,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.s,
                  color: widget.textColor),
            ),
            SizedBox(height: 15.s),
            Text(
              "${widget.nowNum}/${widget.total}",
              style: TextStyle(color: widget.text2Color, fontSize: 24.s),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: widget.containerColor,
          borderRadius: BorderRadius.circular(180.s),
        ),
      ),
    );
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
      this.undoneColor,
      this.doneColor,
      this.undoneTextColor,
      this.doneTextColor,
      this.undoneIconColor,
      this.doneIconColor,
      this.undoneText2Color,
      this.doneText2Color,
      this.undoneLineColor,
      this.doneLineColor,
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

  //过渡标志
  bool transitionFlag = false;

  @override
  void initState() {
    super.initState();
    doneFlag = (widget.nowNum >= widget.total);
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
        if (widget.nowNum >= widget.total) {
          doneFlag = true;
          animationController.value = 0;
          transitionFlag = true;
          Timer(Duration(milliseconds: 700), () {
            transitionFlag = false;
            setState(() {});
          });
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
    doneFlag = (widget.nowNum >= widget.total);
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
        if ((widget.nowNum) / widget.total == 1) {
          await Future.delayed(Duration(milliseconds: 700));
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
                    strokeWidth: widget.stockWidth,
                    doneLineColor: widget.doneLineColor,
                    undoneLineColor: widget.undoneLineColor),
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
                    lineColor: widget.doneLineColor),
              ),
            ),
            Positioned(
              left: 23.s,
              top: 23.s,
              child: Container(
                width: (widget.width - 23 * 2 - 1).s,
                height: (widget.width - 23 * 2 - 1).s,
                alignment: Alignment.center,
                child: transitionFlag
                    ? Icon(Icons.done_rounded,
                        size: 170.s, color: widget.doneIconColor)
                    : Column(
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

  @override
  void dispose() {
    animationController.dispose();
    progressBarController.dispose();
    super.dispose();
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
      this.undoneColor,
      this.doneColor,
      this.undoneTextColor,
      this.doneTextColor,
      this.undoneIconColor,
      this.doneIconColor,
      this.undoneText2Color,
      this.doneText2Color,
      this.undoneLineColor,
      this.doneLineColor,
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
    doneFlag = (widget.nowNum >= widget.total);
    progressBarController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.forwardTime - 100),
        value: doneFlag ? 1 : 0);
    progressBarController.addListener(() {
      if (progressBarController.value == 1 && !doneFlag) {
        widget.nowNum += widget.total;
        doneFlag = true;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    doneFlag = (widget.nowNum >= widget.total);
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
                    strokeWidth: widget.stockWidth,
                    doneLineColor: widget.doneLineColor,
                    undoneLineColor: widget.undoneLineColor),
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

  @override
  void dispose() {
    progressBarController.dispose();
    super.dispose();
  }
}

// ignore: must_be_immutable
class SkipHabit extends StatefulWidget {
  //文字内容
  String content;

  //当前任务数
  num nowNum;

  //总任务数
  num total;

  //图标
  IconData icon;

  //容器颜色
  Color containerColor;

  //文字颜色
  Color textColor;

  //Icon颜色
  Color iconColor;

  //次级文字颜色
  Color text2Color;

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
  _SkipHabitState createState() => _SkipHabitState();

  SkipHabit({
    @required this.content,
    @required this.nowNum,
    @required this.total,
    @required this.icon,
    this.containerColor,
    this.textColor,
    this.iconColor,
    this.text2Color,
    this.tap,
    this.doubleTap,
    this.pressEnd,
  });
}

class _SkipHabitState extends State<SkipHabit> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.tap != null ? widget.tap() : debugPrint("tap");
      },
      onDoubleTap: () {
        widget.doubleTap != null ? widget.doubleTap() : debugPrint("doubleTap");
      },
      onLongPressEnd: (detail) async {
        widget.pressEnd != null
            ? widget.pressEnd(widget.nowNum)
            : debugPrint("pressEnd");
      },
      child: Container(
        width: widget.width.s,
        height: widget.width.s,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              size: 90.s,
              color: widget.iconColor,
            ),
            SizedBox(height: 35.s),
            Text(
              widget.content,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.s,
                  color: widget.textColor),
            ),
            SizedBox(height: 15.s),
            Text(
              "${widget.nowNum}/${widget.total}",
              style: TextStyle(color: widget.text2Color, fontSize: 24.s),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: widget.containerColor,
          borderRadius: BorderRadius.circular(60.s),
        ),
      ),
    );
  }
}

class ProgressBar extends CustomPainter {
  num conSize;

  num strokeWidth;

  num percent;

  Color doneLineColor;

  Color undoneLineColor;

  ProgressBar(
      {this.percent,
      this.conSize,
      this.strokeWidth,
      this.doneLineColor,
      this.undoneLineColor});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = doneLineColor;
    var paint2 = Paint()
      ..style = PaintingStyle.fill
      ..color = undoneLineColor;
    if (percent > 1) percent = 1;
    canvas.drawRRect(
      RRect.fromLTRBR(0.s, 0.s, conSize.s, conSize.s, Radius.circular(60.s)),
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

class ProgressBarClipper extends CustomClipper<RRect> {
  num conSize;

  ProgressBarClipper({@required this.conSize});

  @override
  RRect getClip(Size size) {
    return RRect.fromLTRBR(0, 0, conSize.s, conSize.s, Radius.circular(60.s));
  }

  @override
  bool shouldReclip(CustomClipper<RRect> oldClipper) => false;
}

class AnimationProgressBar extends CustomPainter {
  num percent;
  Color containerColor;
  Color lineColor;

  AnimationProgressBar({this.percent, this.containerColor, this.lineColor});

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
        18.s, 18.s, (279 + 18).s, (279 + 18).s, Radius.circular(42.s));
  }

  @override
  bool shouldReclip(CustomClipper<RRect> oldClipper) => false;
}
