import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_demo/util/util.dart';

/**
 * @author wu chao
 * @project flutter_demo
 * @date 2021/6/5
 */
class WidgetToImageDemo extends StatefulWidget {
  const WidgetToImageDemo({Key key}) : super(key: key);

  @override
  _WidgetToImageDemoState createState() => _WidgetToImageDemoState();
}

class _WidgetToImageDemoState extends State<WidgetToImageDemo> {
  GlobalKey _globalKey = new GlobalKey();
  var img = Uint8List(10);

  Future<Uint8List> _capturePng() async {
    try {
      print('inside');
      RenderRepaintBoundary boundary =
          _globalKey.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);

      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      var pngBytes = byteData.buffer.asUint8List();
      var bs64 = base64Encode(pngBytes);
      print(pngBytes);
      print(bs64);
      img = pngBytes;
      setState(() {});
      return pngBytes;
    } catch (e) {
      print(e);
    }
  }

  pop() async {
    await showDialog(
        context: context,
        builder: (context) => Scaffold(
              body: Container(
                padding: EdgeInsets.zero,
                color: Colors.white,
                child: Column(
                  children: [
                    Text("要分享的内容"),
                    Image.memory(
                      img,
                    ),
                  ],
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget To Image demo'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: RepaintBoundary(
                key: _globalKey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100.s,
                      height: 100.s,
                      color: Colors.amber,
                      child: Text('some widget'),
                    ),
                    Container(
                      width: 100.s,
                      height: 100.s,
                      color: Colors.brown,
                      child: Text('some widget'),
                    ),
                    Container(
                      width: 100.s,
                      height: 100.s,
                      color: Colors.lightBlueAccent,
                      child: Text('some widget'),
                    ),
                    Container(
                      width: 100.s,
                      height: 100.s,
                      color: Colors.lightGreenAccent,
                      child: Text('some widget'),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                width: 100.s,
                height: 100.s,
                color: Colors.amber,
                child: Text('share'),
              ),
              onTap: () async {
                await _capturePng();
                pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
