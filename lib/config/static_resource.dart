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
    "补间动画": "tweenDemo",
    "卡片左右滑切换动画": "transFormDemo",
    "圆形选择器组件": "bottomAnimNavPage",
    "纵向选择器组件": "indicatorDemo",
    "横向选择器组件": "indicatorDemo2",
    "IOS风格的底部选择器": "iosBottomDemo",
    "响应不同手势的组件": "gesturesDemo",
    "sliver滑动列表": "sliverDemo",
    "复杂的sliver滑动列表": "collapsingList",
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
