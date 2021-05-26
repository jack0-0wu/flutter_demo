import 'package:flutter/material.dart';
import 'package:flutter_demo/util/util.dart';

/**
 * @author wu chao
 * @project LetsKeep
 * @date 2021/5/26
 */
ThemeData customThemeData = ThemeData(
    //背景色
    backgroundColor: Color(0xFFF2F5FA),
    //主色 白色
    primaryColor:  Colors.white,
    //选中颜色  蓝色
    focusColor: Color(0xFF4E7BFE),
    //提示颜色 红色
    toggleableActiveColor: Colors.red,
    //灰色文字 颜色
    hintColor: Color(0xFF9DA3B1),
    fontFamily: "EnglishFont",
    //目前APP内只有这两种字体
    textTheme: TextTheme(
      //一级标题样式 固定黑色
      headline1: TextStyle(
        fontSize: 42.s,
        fontWeight: FontWeight.bold,
        color: Color(0xFF06112D),
      ),
      //正常文字样式 颜色不固定
      bodyText1: TextStyle(
        fontSize: 36.s,
        fontWeight: FontWeight.bold,
      ),
    ));

ThemeData customDarkThemeData = ThemeData(
    //背景色
    backgroundColor: Color(0xFFF2F5FA),
    //主色 白色
    primaryColor: Colors.black,
    //选中颜色  蓝色
    focusColor: Color(0xFFFFE621),
    //提示颜色 红色
    toggleableActiveColor: Colors.red,
    //灰色文字 颜色
    hintColor: Color(0xFF838383),
    fontFamily: "EnglishFont",
    //目前APP内只有这两种字体
    textTheme: TextTheme(
      //一级标题样式 固定黑色
      headline1: TextStyle(
        fontSize: 42.s,
        fontWeight: FontWeight.bold,
        color: Color(0xFFFFFFFF),
      ),
      //正常文字样式 颜色不固定
      bodyText1: TextStyle(
        fontSize: 36.s,
        fontWeight: FontWeight.bold,
      ),
    ));

Map themeMap = {
  "customThemeData": customThemeData,
  "customDarkThemeData": customDarkThemeData,
  // "customThemeData2": customThemeData2
};
