import 'package:flutter/material.dart';
/**
 * @author wu chao
 * @project flutter_demo
 * @date 2021/6/4
 */

class UIDemo2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Flexible组件
        // BlueBox(),
        // Flexible(
        //   // fit: FlexFit.tight,
        //   fit: FlexFit.loose,
        //   flex: 1,
        //   child: BlueBox(),
        // ),
        // // FlexFit.loose
        // // 使用 widget 的自身作为首选大小。 (默认情况下 )
        // //
        // // FlexFit.tight
        // // 强制 widget 充满所有剩余空间。
        // Flexible(
        //   // fit: FlexFit.tight,
        //   fit: FlexFit.loose,
        //   flex: 1,
        //   child: BlueBox(),
        // ),

        //Expanded组件
        // BlueBox(),
        // Expanded(child: BlueBox()),
        // BlueBox(),

        //SizedBox组件
        // BlueBox(),
        // SizedBox(
        //   width: 100,
        //   child: BlueBox(),
        // ),
        // BlueBox(),

        // BlueBox(),
        // SizedBox(width: 50),
        // BlueBox(),
        // BlueBox(),

        //Spacer组件
        //SizedBox 和 Spacer 有何不同？ 如果你想用 flex 属性创建一段空间，请使用 Spacer。
        // 如果你想创建一个拥有特定逻辑像素值的空间，请使用 SizedBox。
        // BlueBox(),
        // Spacer(flex: 1),
        // BlueBox(),
        // BlueBox(),

        BlueBox(),
        Spacer(flex: 1),
        BlueBox(),
        Spacer(flex: 1),
        BlueBox(),
      ],
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
