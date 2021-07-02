import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Copyright (C), 2020-2020, flutter_demo
/// FileName: static_resource
/// Author: Jack
/// Date: 2020/12/5
/// Description:
class StaticResource {
  //首页demoMap
  static final Map<String, String> demoMap = {
    "圆形菜单栏": "circularMenuDemo",
    "灯光渐变动画": "animationBuilderDemo",
    "容器外观变换动画": "animationContainerDemo",
    "文字容器颜色渐变": "fadeDemo",
    "数字变换动画": "numAnimationDemo",
    "物理卡片拖动动画": "physicsCardDragDemo",
  };

  //测试用key
  static final GlobalKey testKey = GlobalKey();

  //
  static ThemeData customThemeData = ThemeData(
    primaryColor: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
  static ThemeData customDarkThemeData = ThemeData(
    primaryColor: Colors.black,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static getSuccess() {
    return Color(0xFF28a745);
  }
}

extension CustomColorScheme on ThemeData {
  Color get success => StaticResource.getSuccess();

  Color get info => const Color(0xFF17a2b8);

  Color get warning => const Color(0xFFffc107);

  Color get danger => const Color(0xFFdc3545);
}
