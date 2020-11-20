import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/util/custom_widget.dart';

import 'choose_pirture.dart';

class ClippingDemo extends StatefulWidget {
  @override
  _ClippingDemoState createState() => _ClippingDemoState();
}

class _ClippingDemoState extends State<ClippingDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "图片选择+剪裁"),
      body: Column(
        children: [
          Button(
              text: "剪裁",
              onTap: () {
                showModalBottomSheet(
                  isDismissible: true,
                  enableDrag: false,
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext context) {
                    return new Container(
                      height: 160.0,
                      child: ChoosePicture(push: (value) {
                        //此处的value为剪裁后的图片文件路径
                        debugPrint(value);
                      }),
                    );
                  },
                );
              })
        ],
      ),
    );
  }
}
