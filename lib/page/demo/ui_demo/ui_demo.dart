/**
 * @author wu chao
 * @project flutter_demo
 * @date 2021/6/4
 */

import 'package:flutter/material.dart';

class UIDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            //均匀分配空间，不过第一个元素的前面和最后一个元素的后面只有正常剩余空间的一半
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlueBox(),
              // BiggerBlueBox(),
              BlueBox(),
              BlueBox(),
              BlueBox(),
              BlueBox(),
            ],
          ),
          Row(
            //均匀分配空间
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlueBox(),
              // BiggerBlueBox(),
              BlueBox(),
              BlueBox(),
              BlueBox(),
              BlueBox(),
            ],
          ),
          Row(
            //均匀分配空间 不过第一个元素的前面和最后一个元素的后面没有空间
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlueBox(),
              // BiggerBlueBox(),
              BlueBox(),
              BlueBox(),
              BlueBox(),
              BlueBox(),
            ],
          ),
        ],
      ),
    );
  }
}

class BlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(),
      ),
    );
  }
}

class BiggerBlueBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(),
      ),
    );
  }
}
