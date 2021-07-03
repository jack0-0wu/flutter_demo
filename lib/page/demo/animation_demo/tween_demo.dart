import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/util/custom_widget.dart';

import 'animation_container_demo.dart';

/// @author wu chao
/// @project flutter_demo
/// @date 2021/6/30
class TweenDemo extends StatefulWidget {
  const TweenDemo({Key key}) : super(key: key);

  @override
  _TweenDemoState createState() => _TweenDemoState();
}

class _TweenDemoState extends State<TweenDemo>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    animation = Tween<double>(begin: 0, end: 300).animate(animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward();
        }
      })
      ..addStatusListener((status) => print(status));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "补间动画"),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (
                      BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                    ) =>
                        AnimationContainerDemo(),
                    transitionsBuilder: (
                      BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child,
                    ) {
                      final rotationValue = animation.value * pi;
                      final rotationAngle = animation.value > 0.5
                          ? pi - rotationValue
                          : rotationValue;
                      var tilt = (animation.value - 0.5).abs() - 0.5;
                      return Transform(
                        transform: Matrix4.rotationY(rotationAngle),
                        child: child,
                        alignment: Alignment.center,
                      );
                    }

                    //     SlideTransition(
                    //   position: Tween<Offset>(
                    //     begin: const Offset(-1, 0),
                    //     end: Offset.zero,
                    //   ).animate(animation),
                    //   child: child,
                    // ),
                    ));
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            // height: animation.value,
            // width: animation.value,
            height: animation.value,
            width: animation.value,
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
