import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/util/custom_widget.dart';

/**
 * @author wu chao
 * @project flutter_demo
 * @date 2021/6/5
 */
class MenuItem extends StatelessWidget {
  const MenuItem(this.icon, this.itemText);
  final String icon;
  final String itemText;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        icon,
        style: TextStyle(
          fontSize: 30.0,
        ),
      ),
      title: Text(itemText),
    );
  }
}

// Problem 1: Overflow error
class Example1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "调试工具测试"),
      body: Padding(
        padding: EdgeInsets.only(top: 70.0),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: Text(
                'Explore the restaurant\'s delicious menu items below!',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Problem 2: Viewport was given unbounded height error
class Example2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "调试工具测试"),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                MenuItem('🍔', 'Burger'),
                MenuItem('🌭', 'Hot Dog'),
                MenuItem('🍟', 'Fries'),
                MenuItem('🥤', 'Soda'),
                MenuItem('🍦', 'Ice Cream'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Problem 3: Invisible VerticalDivider
class Example3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "调试工具测试"),
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {
                    print('Pickup button pressed.');
                  },
                  child: Text(
                    'Pickup',
                  ),
                ),
                // This widget is not shown on screen initially.
                VerticalDivider(
                  width: 20.0,
                  thickness: 5.0,
                ),
                RaisedButton(
                  onPressed: () {
                    print('Delivery button pressed.');
                  },
                  child: Text(
                    'Delivery',
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
