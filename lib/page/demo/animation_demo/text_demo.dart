import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/util/custom_widget.dart';

const owl_url =
    'https://raw.githubusercontent.com/flutter/website/master/src/images/owl.jpg';

/**
 * @author wu chao
 * @project flutter_demo
 * @date 2021/6/7
 */
class FadeInDemo extends StatefulWidget {
  _FadeInDemoState createState() => _FadeInDemoState();
}

class _FadeInDemoState extends State<FadeInDemo> {
  double opacity = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "文字渐入动画"),
      body: Column(children: <Widget>[
        Image.network(owl_url),
        TextButton(
          child: Text(
            'Show details',
            style: TextStyle(color: Colors.blueAccent),
          ),
          onPressed: () => setState(() {
            opacity = 1;
          }),
        ),
        //只需要设置 opacity 的开始值和结束值。 AnimatedOpacity widget 会自行处理动画过程。
        AnimatedOpacity(
          duration: Duration(seconds: 2),
          opacity: opacity,
          child: Column(
            children: <Widget>[
              Text('Type: Owl'),
              Text('Age: 39'),
              Text('Employment: None'),
            ],
          ),
        )
      ]),
    );
  }
}
