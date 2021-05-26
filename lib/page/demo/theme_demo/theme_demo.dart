

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/config/static_resource.dart';
import 'package:flutter_demo/page/demo/theme_demo/theme_provider.dart';
import 'package:flutter_demo/util/custom_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_demo/util/util.dart';

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
            width: 100.s,
            height: 100.s,
            color: Theme.of(context).primaryColor,
          ),
          Consumer<ThemeProvider>(
            builder: (context, ThemeProvider themeProvider, child) =>
                GestureDetector(
              onTap: () {
                themeProvider.changeTheme("customThemeData2");
              },
              child: Container(
                width: 100.s,
                height: 100.s,
                color: Theme.of(context).primaryColor,
              ),
            ),
          )
        ],
      ),

    );
  }
}
