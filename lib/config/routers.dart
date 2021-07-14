import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/page/demo/animation_demo/aimation_builder_demo.dart';
import 'package:flutter_demo/page/demo/animation_demo/animation_container_demo.dart';
import 'package:flutter_demo/page/demo/animation_demo/fade_animation_demo.dart';
import 'package:flutter_demo/page/demo/animation_demo/num_animation_demo.dart';
import 'package:flutter_demo/page/demo/animation_demo/physics_demo.dart';
import 'package:flutter_demo/page/demo/animation_demo/transform_demo.dart';
import 'package:flutter_demo/page/demo/animation_demo/tween_demo.dart';
import 'package:flutter_demo/page/demo/funny_widget_demo/bottom_anim_nav_page.dart';
import 'package:flutter_demo/page/demo/funny_widget_demo/circular_menu.dart';
import 'package:flutter_demo/page/demo/funny_widget_demo/gestures_demo.dart';
import 'package:flutter_demo/page/demo/funny_widget_demo/indicator_demo.dart';
import 'package:flutter_demo/page/demo/funny_widget_demo/indicator_demo2.dart';
import 'package:flutter_demo/page/demo/funny_widget_demo/ios_bottom_demo.dart';
import 'package:flutter_demo/page/demo/funny_widget_demo/sliver_demo.dart';

class Routers {
  //路由表
  static final Map<String, Widget> routerMap = {
    'circularMenuDemo': CircularMenuDemo(),
    'animationBuilderDemo': AnimationBuilderDemo(),
    'animationContainerDemo': AnimationContainerDemo(),
    'fadeDemo': FadeDemo(),
    'numAnimationDemo': NumAnimationDemo(),
    'physicsCardDragDemo': PhysicsCardDragDemo(),
    'tweenDemo': TweenDemo(),
    'transFormDemo': TransFormDemo(),
    'bottomAnimNavPage': BottomAnimNavPage(),
    'indicatorDemo': IndicatorDemo(),
    'indicatorDemo2': IndicatorDemo2(),
    'iosBottomDemo': IosBottomDemo(),
    'gesturesDemo': GesturesDemo(),
    'sliverDemo': SliverDemo(),
    'collapsingList': CollapsingList(),
  };
}
