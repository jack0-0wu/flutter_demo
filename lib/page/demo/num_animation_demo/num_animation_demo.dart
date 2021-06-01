

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/page/demo/num_animation_demo/widget.dart';
import 'package:flutter_demo/util/custom_widget.dart';

/**
 * @author wu chao
 * @project flutter_demo
 * @date 2021/6/1
 */
class NumAnimationDemo extends StatefulWidget {
  const NumAnimationDemo({Key key}) : super(key: key);

  @override
  _NumAnimationDemoState createState() => _NumAnimationDemoState();
}

class _NumAnimationDemoState extends State<NumAnimationDemo> {
  UniqueKey key = UniqueKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(title: "数字变换Demo"),
      body: Column(
        children: [
          SizedBox(height: 100,),
          AnimText(number: 10,duration:1000,key: key,),
          GestureDetector(
            onTap: (){
              key =  UniqueKey();
              setState(() {

              });
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.amber,
            ),
          )
        ],
      ),
    );
  }
}
