import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/util/custom_widget.dart';

/// @author wu chao
/// @project flutter_demo
/// @date 2021/6/28
class TransFormDemo extends StatefulWidget {
  const TransFormDemo({Key key}) : super(key: key);

  @override
  _TransFormDemoState createState() => _TransFormDemoState();
}

class _TransFormDemoState extends State<TransFormDemo>
    with TickerProviderStateMixin {
  String text = "123";
  AnimationController animationController;
  AnimationController secondAnimationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    secondAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    animationController.addListener(() {
      setState(() {});
    });
    secondAnimationController.addListener(() {
      setState(() {});
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onHorizontalDragEnd: (details) async {
          if (details.primaryVelocity > 0) {
            debugPrint("右");
            animationController.reset();
            animationController.forward();
          } else if (details.primaryVelocity < 0) {
            debugPrint("左");
            animationController.reset();
            animationController.forward();
          }
        },
        child: Scaffold(
          appBar: CustomAppBar(title: "卡片左右滑切换动画"),
          body: Center(
            child: SharedAxisTransition(
              child: Container(
                width: 300,
                height: 300,
                color: Colors.greenAccent,
                alignment: Alignment.center,
                child: Text(text),
              ),
              animation: animationController,
              secondaryAnimation: secondAnimationController,
              transitionType: SharedAxisTransitionType.scaled,
            ),
          ),
        ));
  }
}
