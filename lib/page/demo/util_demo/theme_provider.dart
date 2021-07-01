import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/util/util.dart';

/**
 * @author wu chao
 * @project LetsKeep
 * @date 2021/5/26
 */
class ThemeProvider with ChangeNotifier {
  ThemeData themeData = ThemeData(
      backgroundColor: DefaultTheme().backgroundColor,
      primaryColor: DefaultTheme().primaryColor,
      textTheme: TextTheme(
          headline1: DefaultTheme().titleStyle,
          bodyText1: DefaultTheme().fontStyle));
  ThemeData darkThemeData = ThemeData(
      backgroundColor: DefaultTheme().backgroundColor,
      primaryColor: DefaultTheme().primaryColor,
      textTheme: TextTheme(
          headline1: DefaultTheme().titleStyle,
          bodyText1: DefaultTheme().fontStyle));

  changeTheme(AppTheme theme) {
    this.themeData = ThemeData(
        backgroundColor: theme.backgroundColor,
        primaryColor: theme.primaryColor,
        textTheme:
            TextTheme(headline1: theme.titleStyle, bodyText1: theme.fontStyle));
    this.darkThemeData = this.themeData;
    notifyListeners();
  }
}

//context可选参数
Color getPrimaryColor() =>
    Theme.of(RouterUtil.routerGlobalKey.currentContext).primaryColor;

Color getBackgroundColor() =>
    Theme.of(RouterUtil.routerGlobalKey.currentContext).backgroundColor;

TextStyle getTitleStyle() =>
    Theme.of(RouterUtil.routerGlobalKey.currentContext).textTheme.headline1;

TextStyle getFontStyle() =>
    Theme.of(RouterUtil.routerGlobalKey.currentContext).textTheme.bodyText1;

abstract class AppTheme {
  Color backgroundColor;
  Color primaryColor;
  TextStyle titleStyle;
  TextStyle fontStyle;
}

class DefaultTheme extends AppTheme {
  final Color backgroundColor = Colors.black;
  final Color primaryColor = Colors.lightGreen;
  final TextStyle titleStyle = TextStyle(
    fontSize: 42.s,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  final TextStyle fontStyle = TextStyle(
    fontSize: 36.s,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}
