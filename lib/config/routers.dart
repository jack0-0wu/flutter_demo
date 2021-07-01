import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/page/demo/animation_demo/aimation_builder_demo.dart';
import 'package:flutter_demo/page/demo/animation_demo/animation_container_demo.dart';
import 'package:flutter_demo/page/demo/animation_demo/fade_animation_demo.dart';
import 'package:flutter_demo/page/demo/animation_demo/num_animation_demo.dart';
import 'package:flutter_demo/page/demo/funny_widget_demo/circular_menu.dart';

class Routers {
  //路由表
  static final Map<String, Widget> routerMap = {
    'circularMenuDemo': CircularMenuDemo(),
    'animationBuilderDemo': AnimationBuilderDemo(),
    'animationContainerDemo': AnimationContainerDemo(),
    'fadeDemo': FadeDemo(),
    'numAnimationDemo': NumAnimationDemo(),
  };
}
