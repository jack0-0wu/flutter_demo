import 'package:flutter_study/page/demo/clipping_picture/clipping_picture_demo.dart';
import 'package:flutter_study/page/demo/index/index.dart';
import 'package:flutter_study/page/demo/planfrom_test/planform_channel_demo2.dart';
import 'package:flutter_study/page/demo/router_test/router_test.dart';
import 'package:flutter_study/page/demo/router_test/router_test2.dart';

class Routers {
  static List routerList = [
    {
      'routerTest': RouterTest(),
      'planFromTest': PlanFromTest(),
      'routerTest2': RouterTest2(),
      'index': Index(),
      'clippingPictureDemo':ClippingPictureDemo()
    }
  ];
}
