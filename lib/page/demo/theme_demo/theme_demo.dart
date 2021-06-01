import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/page/demo/theme_demo/theme.dart';
import 'package:flutter_demo/page/demo/theme_demo/theme_provider.dart';
import 'package:flutter_demo/util/custom_widget.dart';
import 'package:flutter_demo/util/util.dart';
import 'package:provider/provider.dart';

/**
 * @author wu chao
 * @project flutter_demo
 * @date 2021/5/26
 */
class ThemeDemo extends StatefulWidget {
  const ThemeDemo({Key key}) : super(key: key);

  @override
  _ThemeDemoState createState() => _ThemeDemoState();
}

class _ThemeDemoState extends State<ThemeDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Font(
          text: "主题demo",
        ),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: 150.s,
            height: 150.s,
            color: Theme.of(context).primaryColor,
            child: Font(text: "11"),
          ),
          SizedBox(
            height: 20.s,
          ),
          Container(
            width: 150.s,
            height: 150.s,
            color: Theme.of(RouterUtil.routerGlobalKey.currentContext)
                .primaryColor,
            child: Font(text: "22"),
          ),
          SizedBox(
            height: 20.s,
          ),
          Container(
            width: 150.s,
            height: 150.s,
            color: getPrimaryColor(),
            child: Font(text: "22"),
          ),
          SizedBox(
            height: 20.s,
          ),
          Consumer<ThemeProvider>(
            builder: (context, ThemeProvider themeProvider, child) =>
                GestureDetector(
              onTap: () {
                themeProvider.changeTheme(Theme2());
              },
              child: Container(
                width: 150.s,
                height: 150.s,
                color: Theme.of(context).primaryColor,
                child: Font(text: "33"),
              ),
            ),
          ),
          Consumer<ThemeProvider>(
            builder: (context, ThemeProvider themeProvider, child) =>
                GestureDetector(
              onTap: () {
                themeProvider.changeTheme(Theme3());
              },
              child: Container(
                width: 150.s,
                height: 150.s,
                color: Theme.of(context).primaryColor,
                child: Font(text: "33"),
              ),
            ),
          ),
          Consumer<ThemeProvider>(
            builder: (context, ThemeProvider themeProvider, child) =>
                GestureDetector(
                  onTap: () {
                    themeProvider.changeTheme(Theme1());
                  },
                  child: Container(
                    width: 150.s,
                    height: 150.s,
                    color: Theme.of(context).primaryColor,
                    child: Font(text: "33"),
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
