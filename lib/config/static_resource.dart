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
    "圆形菜单": "circularMenuDemo",
    "自定义动画": "builderDemo",
    "自定义动画": "builderDemo",
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
