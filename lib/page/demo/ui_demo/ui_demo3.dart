import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * @author wu chao
 * @project flutter_demo
 * @date 2021/6/4
 */
class UIDemo3 extends StatefulWidget {
  const UIDemo3({Key key}) : super(key: key);

  @override
  _UIDemo3State createState() => _UIDemo3State();
}

class _UIDemo3State extends State<UIDemo3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/image/shuji.png",
                width: 50,
              ),
              Column(
                children: [
                  Text(
                    "Flutter McFlutter",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    "Experienced App Developer",
                    style: TextStyle(fontSize: 15),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "123 main street",
                style: TextStyle(fontSize: 15),
              ),
              Text(
                "415 555 0198",
                style: TextStyle(fontSize: 15),
              )
            ],
          )
        ],
      ),
    );
  }
}
