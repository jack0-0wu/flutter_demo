import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/page/demo/util_demo/theme.dart';
import 'package:flutter_demo/page/demo/util_demo/theme_provider.dart';
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
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20.s,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 150.s,
                height: 150.s,
                color: Theme.of(context).primaryColor,
                child: Font(text: "主题色容器"),
              ),
              Container(
                width: 150.s,
                height: 150.s,
                color: Theme.of(RouterUtil.routerGlobalKey.currentContext)
                    .primaryColor,
                child: Font(text: "主题色容器"),
              ),
              Container(
                width: 150.s,
                height: 150.s,
                color: getPrimaryColor(),
                child: Font(text: "主题色容器"),
              ),
            ],
          ),
          SizedBox(
            height: 20.s,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Consumer<ThemeProvider>(
                builder: (context, ThemeProvider themeProvider, child) =>
                    GestureDetector(
                  onTap: () {
                    themeProvider.changeTheme(Theme1());
                  },
                  child: Container(
                    width: 150.s,
                    height: 150.s,
                    color: Theme1().primaryColor,
                    child: Font(text: "更换主题Theme1"),
                  ),
                ),
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
                    color: Theme2().primaryColor,
                    child: Font(text: "更换主题Theme2"),
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
                    color: Theme3().primaryColor,
                    child: Font(text: "更换主题Theme3"),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
