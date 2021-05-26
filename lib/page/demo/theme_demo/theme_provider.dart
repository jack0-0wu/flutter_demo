import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/page/demo/theme_demo/theme.dart';

/**
 * @author wu chao
 * @project LetsKeep
 * @date 2021/5/26
 */
class ThemeProvider with ChangeNotifier {
  ThemeData themeData = customThemeData;
  ThemeData darkThemeData = customDarkThemeData;

  changeTheme(String name) {
    this.themeData = themeMap[name];
    this.darkThemeData = themeMap[name];
    notifyListeners();
  }
}
