import 'package:flutter/material.dart';

class AnimText extends StatefulWidget {
  final int beginNumber;
  final int endNumber;
  final int duration;
  final Color fontColor;
  final double fontSize;

  const AnimText({
    Key key,
    this.beginNumber,
    this.endNumber,
    this.duration,
    this.fontColor,
    this.fontSize,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AnimState();
  }
}

class AnimState extends State<AnimText> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.duration));
    final Animation curve =
        CurvedAnimation(parent: controller, curve: Curves.linear);
    animation = IntTween(begin: widget.beginNumber, end: widget.endNumber)
        .animate(curve)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
//         controller.reverse();
            }
          });
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          child: Text(animation.value.toString(),
              style: TextStyle(
                  fontSize: widget.fontSize,
                  color: widget.fontColor,
                  fontWeight: FontWeight.bold)),
        );
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
