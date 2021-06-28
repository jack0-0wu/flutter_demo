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
    "过渡动画": "transFormDemo",
    "淡入淡出动画组件": "fadeDemo1",
    "手势组件": "gesturesDemo",
    "形状变换动画": "animatedContainerDemo",
    "文字淡入动画": "fadeInDemo",
    "widget转图片": "widgetToImageDemo",
    "数字变换动画": "numAnimationDemo",
    "更换主题": "themeDemo",
    "图标在文字末尾换行显示demo": "richTextDemo",
    "圆形选择器 Demo": "bottomAnimNavPage",
    "Ios风格的底部选择器 Demo": "iosBottomDemo",
    "官方Tab组件": "pageViewDemo",
    "指示器组件": "indicatorDemo",
    "横向指示器组件": "indicatorDemo2",
    "Logger包demo": "loggerDemo",
    "Faker包demo": "fakerDemo",
    "清除应用缓存 Demo": "cleanCacheDemo",
    "响应式布局相关组件 Demo": "mediaQueryDemo",
    "响应式布局相关组件 Demo2": "layoutBuilderDemo",
    "响应式布局相关组件 Demo3": "orientationBuilderDemo",
    "响应式布局相关组件 Demo4": "expandedFlexibleDemo",
    "响应式布局相关组件 Demo5": "fractionallySizedDemo",
    "响应式布局相关组件 Demo6": "aspectRatioDemo",
    // "屏幕约束": "constraintsPage",
    // "json转model Demo": "jsonToModelDemo",
    // "自定义横向Tab": "pageDemo",
    // "测试Flutter": "homePage",
    // "路由工具类测试": "routerTest",
    // "指定路由key Demo": "globalKeyDemo",
    // "streamBuilder Demo": "streamBuilderDemo",
    // "futureBuilder Demo": "futureBuilderDemo",
    // "今天吃什么？": "todayFoodDemo",
    // "异步future Demo": "futureDemo",
    // "异步stream Demo": "streamDemo",
    // "调试工具测试3": "example3",
    // "调试工具测试2": "example2",
    // "调试工具测试1": "example1",
    // "布局demo3": "UIDemo3",
    // "布局demo2": "UIDemo2",
    // "布局demo": "UIDemo",
    // "image_crop包Demo": "cropDemo",
    // "图片上传剪裁demo": "clippingDemo",
    // "自定义拍照画面Demo": "cameraDemo",
    // "通道测试代码"："planFromTest",
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
