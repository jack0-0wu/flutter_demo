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
    // "image_crop包Demo": "cropDemo",
    // "图片上传剪裁demo": "clippingDemo",
    // "自定义拍照画面Demo": "cameraDemo",
    // "通道测试代码"："planFromTest",
    "更换主题": "themeDemo",
    "今天吃什么？": "todayFoodDemo",
    "路由工具类测试": "routerTest",
    "图标在文字末尾换行显示demo": "richTextDemo",
    "Logger包demo": "loggerDemo",
    "Faker包demo": "fakerDemo",
    "json转model Demo": "jsonToModelDemo",
    "清除应用缓存 Demo": "cleanCacheDemo",
    "响应式布局相关组件 Demo": "mediaQueryDemo",
    "响应式布局相关组件 Demo2": "layoutBuilderDemo",
    "响应式布局相关组件 Demo3": "orientationBuilderDemo",
    "响应式布局相关组件 Demo4": "expandedFlexibleDemo",
    "响应式布局相关组件 Demo5": "fractionallySizedDemo",
    "响应式布局相关组件 Demo6": "aspectRatioDemo",
    "指定路由key Demo": "globalKeyDemo",
    "异步future Demo": "futureDemo",
    "异步stream Demo": "streamDemo",
    "streamBuilder Demo": "streamBuilderDemo",
    "futureBuilder Demo": "futureBuilderDemo",
    "圆形选择器 Demo": "bottomAnimNavPage",
    "Ios风格的底部选择器 Demo": "iosBottomDemo",
    "自定义横向分页": "pageDemo",
    "官方分页组件": "pageViewDemo",
    "指示器组件": "indicatorDemo",
    "横向指示器组件": "indicatorDemo2",
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
  static getSuccess(){
    return Color(0xFF28a745);
  }

}
extension CustomColorScheme on ThemeData {
  Color get success => StaticResource.getSuccess();
  Color get info => const Color(0xFF17a2b8);
  Color get warning => const Color(0xFFffc107);
  Color get danger => const Color(0xFFdc3545);
}
