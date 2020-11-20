import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/util/custom_widget.dart';

import 'clipping_picture_demo.dart';

class ClippingDemo extends StatefulWidget {
  @override
  _ClippingDemoState createState() => _ClippingDemoState();
}

class _ClippingDemoState extends State<ClippingDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图片剪裁'),
        centerTitle: true,
      ),
      body: Column(children: [
    Button(
      text:"剪裁",
      onTap: (){
        showModalBottomSheet(
          isDismissible: true,
          enableDrag: false,
          context: context,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            return new Container(
              height: 160.0,
              child: ClippingPictureDemo(
                  push:(value){
                    print(value);
                    print(111);
                  }

              ),
            );
          },
        );
      }
    )
      ],),
    );
  }
}
