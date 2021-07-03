import 'dart:math';

import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// @author wu chao
/// @project flutter_demo
/// @date 2021/7/1
class CircularMenuDemo extends StatefulWidget {
  const CircularMenuDemo({Key key}) : super(key: key);

  @override
  _CircularMenuDemoState createState() => _CircularMenuDemoState();
}

class _CircularMenuDemoState extends State<CircularMenuDemo> {
  String _colorName = 'No';
  Color _color = Colors.black;

  // GlobalKey<CircularMenuState> key = GlobalKey<CircularMenuState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '圆形菜单栏',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          CircularMenu(
              toggleButtonColor: Colors.pink,
              alignment: Alignment.bottomRight,
              startingAngleInRadian: 1.0 * pi,
              endingAngleInRadian: 1.5 * pi,
              items: [
                CircularMenuItem(
                  onTap: () {
                    print('tapped');
                  },
                  icon: Icons.search,
                  color: Colors.blue,
                ),
                CircularMenuItem(
                  onTap: () {
                    print('tapped');
                  },
                  icon: Icons.home,
                  color: Colors.grey,
                ),
                CircularMenuItem(
                  onTap: () {
                    print('tapped');
                  },
                  icon: Icons.settings,
                  color: Colors.green,
                ),
              ]),
        ],
      ),
    );
  }
}
