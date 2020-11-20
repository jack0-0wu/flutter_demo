import 'package:flutter_demo/page/demo/clipping_picture/clipping_demo.dart';
import 'package:flutter_demo/page/demo/clipping_picture/clipping_picture.dart';
import 'package:flutter_demo/page/demo/clipping_picture/choose_pirture.dart';
import 'package:flutter_demo/page/demo/clipping_picture/crop_demo.dart';
import 'package:flutter_demo/page/demo/index/index.dart';
import 'package:flutter_demo/page/demo/planfrom_test/planform_channel_demo2.dart';
import 'package:flutter_demo/page/demo/router_test/router_test.dart';
import 'package:flutter_demo/page/demo/router_test/router_test2.dart';
import 'package:flutter_demo/page/demo/widget_combination/richText_demo.dart';

class Routers {
  static List routerList = [
    {
      'routerTest': RouterTest(),
      'planFromTest': PlanFromTest(),
      'routerTest2': RouterTest2(),
      'index': Index(),
      'cropDemo':CropDemo(),
      'clippingDemo':ClippingDemo(),
      'clippingPicture':ClippingPicture(),
      'richTextDemo':RichTextDemo()
    }
  ];
}
