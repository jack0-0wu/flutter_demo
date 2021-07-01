
import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/util/util.dart';

/// @author wu chao
/// @project flutter_demo
/// @date 2021/6/11
/// Flutter code sample for FadeTransition

// The following code implements the [FadeTransition] using
// the Flutter logo:

/// This is the stateful widget that the main application instantiates.
class FadeDemo extends StatefulWidget {
  const FadeDemo({Key key}) : super(key: key);

  @override
  State<FadeDemo> createState() => _FadeDemoState();
}

/// This is the private State class that goes with MyStatefulWidget.
/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _FadeDemoState extends State<FadeDemo> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "图片透明度渐变demo"),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100.s,
            ),
            Container(
              color: Colors.white,
              width: 150.s,
              height: 150.s,
              child: FadeTransition(
                opacity: _animation,
                child: const Padding(
                    padding: EdgeInsets.all(8), child: FlutterLogo()),
              ),
            ),
            SizedBox(
              height: 100.s,
            ),
            // color: Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF)),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeThroughTransition(
                        fillColor: Theme.of(context).scaffoldBackgroundColor,
                        animation: animation,
                        secondaryAnimation: secondaryAnimation,
                        child: child,
                      );
                    }, pageBuilder: (context, animation, secondaryAnimation) {
                      return FadeDemo2();
                    }));
              },
              child: Container(
                width: 100.s,
                height: 100.s,
                alignment: Alignment.center,
                child: Text("跳转"),
                color: Colors.blueAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FadeDemo2 extends StatefulWidget {
  const FadeDemo2({Key key}) : super(key: key);

  @override
  _FadeDemo2State createState() => _FadeDemo2State();
}

class _FadeDemo2State extends State<FadeDemo2> {
  static final fabKey = UniqueKey();
  static final fabKey2 = UniqueKey();
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "文字容器颜色渐变动画"),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200.s,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  flag = !flag;
                });
              },
              child: Container(
                color: Colors.lightGreen,
                child: _FadeThroughTransitionSwitcher(
                  fillColor: Colors.transparent,
                  child: flag
                      ? Icon(
                          Icons.reply_all,
                          key: fabKey,
                          color: Colors.black,
                        )
                      : const Icon(
                          Icons.create,
                          color: Colors.black,
                        ),
                ),
              ),
            ),
            SizedBox(
              height: 200.s,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  flag = !flag;
                });
              },
              child: Container(
                color: Colors.lightGreen,
                child: _FadeThroughTransitionSwitcher(
                  fillColor: Colors.transparent,
                  child: flag
                      ? Container(
                          width: 100.s,
                          height: 100.s,
                          key: fabKey2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.s),
                            color: Colors.lightGreen,
                          ),
                        )
                      : Container(
                          width: 150.s,
                          height: 150.s,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.s),
                            color: Colors.blue,
                          ),
                        ),
                ),
              ),
            ),
            SizedBox(
              height: 200.s,
            ),
            Text("点击按钮颜色渐变")
          ],
        ),
      ),
    );
  }
}

//每当子项使用 transitionBuilder 指定的动画发生变化时，
// 该微件会从一个旧子项转场为新的子项。
class _FadeThroughTransitionSwitcher extends StatelessWidget {
  const _FadeThroughTransitionSwitcher({
    @required this.fillColor,
    @required this.child,
  })  : assert(fillColor != null),
        assert(child != null);

  final Widget child;
  final Color fillColor;

  //AnimatedSwitcher
  //ScaleTransition 过渡动画组件

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      transitionBuilder: (child, animation, secondaryAnimation) {
        return FadeThroughTransition(
          fillColor: fillColor,
          child: child,
          animation: animation,
          secondaryAnimation: secondaryAnimation,
        );
      },
      duration: Duration(seconds: 1),
      child: child,
    );
  }
}
