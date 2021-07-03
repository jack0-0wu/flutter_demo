import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

class BottomAnimNavPage extends StatefulWidget {
  @override
  _BottomAnimNavPageState createState() => _BottomAnimNavPageState();
}

class _BottomAnimNavPageState extends State<BottomAnimNavPage>
    with SingleTickerProviderStateMixin {
  int index = 0;
  SwiperController swiperController = SwiperController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: AppBar(
        title:  Text("圆形选择器组件"),
      ),
      body: Container(
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.only(bottom: 50),
        child: new Container(
          height: 300,
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Stack(
            children: <Widget>[
              Swiper(
                onIndexChanged: (index) {
                  setState(() {
                    this.index = index;
                    print("index+$index");
                  });
                },
                onTap: (index) {
                  print("##### $index");
                  this.index = index;
                  swiperController.move(index);
                  setState(() {});
                },
                controller: swiperController,
                pagination: SwiperPagination(),
                itemBuilder: (BuildContext context, int index) {
                  return new Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white)),
                    margin: EdgeInsets.symmetric(
                        horizontal: (index == this.index) ? 5 : 10),
                    child: InkWell(
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      child: new Center(
                        child: new Text(
                          "$index",
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
                transformer: AngleTransformer(),
                itemCount: 15,
                viewportFraction: 0.2,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AngleTransformer extends PageTransformer {
  final double _fade;
  final double _radius;
  final double _horizontalOffset = 45;

  AngleTransformer({double fade: 1, double radius = 100})
      : _fade = fade,
        _radius = radius;

  @override
  Widget transform(Widget item, TransformInfo info) {
    double position = info.position;
    Widget child = item;

    var dx = _horizontalOffset * (position.abs() * 10);
    var dy;
    if (dx <= _radius) {
      dy = _radius - math.sqrt((_radius * _radius) - (dx * dx));
    } else {
      dy = _radius;
    }

    dx = 0;

    if (_fade != null) {
      double fadeFactor = (1 - position.abs()) * (1 - _fade);
      double opacity = _fade + fadeFactor;
      child = new Opacity(
        opacity: opacity,
        child: child,
      );
    }

    child = new Transform.translate(
      offset: Offset(position.isNegative ? -dx : dx, dy),
      child: child,
    );

    return child;
  }
}
