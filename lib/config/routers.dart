import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/config/static_resource.dart';
import 'package:flutter_demo/page/demo/asynchronous_demo/futureBuilder_demo.dart';
import 'package:flutter_demo/page/demo/asynchronous_demo/future_demo.dart';
import 'package:flutter_demo/page/demo/asynchronous_demo/streamBuilder_demo.dart';
import 'package:flutter_demo/page/demo/asynchronous_demo/stream_demo.dart';
import 'package:flutter_demo/page/demo/camera_demo/camera_demo.dart';
import 'package:flutter_demo/page/demo/clean_cache_demo/clean_cache_demo.dart';
import 'package:flutter_demo/page/demo/clipping_picture_demo/clipping_demo.dart';
import 'package:flutter_demo/page/demo/clipping_picture_demo/clipping_picture.dart';
import 'package:flutter_demo/page/demo/clipping_picture_demo/crop_demo.dart';
import 'package:flutter_demo/page/demo/faker_demo/faker_demo.dart';
import 'package:flutter_demo/page/demo/globalKey_demo/globalKey_demo.dart';
import 'package:flutter_demo/page/demo/index/index.dart';
import 'package:flutter_demo/page/demo/indicator_demo/indicator_demo.dart';
import 'package:flutter_demo/page/demo/indicator_demo/indicator_demo2.dart';
import 'package:flutter_demo/page/demo/ios_bottom_demo/ios_bottom_demo.dart';
import 'package:flutter_demo/page/demo/json_to_model_demo/json_to_model_demo.dart';
import 'package:flutter_demo/page/demo/logger_demo/logger_demo.dart';
import 'package:flutter_demo/page/demo/num_animation_demo/num_animation_demo.dart';
import 'package:flutter_demo/page/demo/pageView_demo/PageViewDemo.dart';
import 'package:flutter_demo/page/demo/page_demo/PageDemo.dart';
import 'package:flutter_demo/page/demo/planfrom_demo/planform_channel_demo2.dart';
import 'package:flutter_demo/page/demo/responsiveness_demo/aspectRatio_demo.dart';
import 'package:flutter_demo/page/demo/responsiveness_demo/expanded_flexible_demo.dart';
import 'package:flutter_demo/page/demo/responsiveness_demo/fractionallySized_demo.dart';
import 'package:flutter_demo/page/demo/responsiveness_demo/layoutBuilder_demo.dart';
import 'package:flutter_demo/page/demo/responsiveness_demo/mediaQuery_demo.dart';
import 'package:flutter_demo/page/demo/responsiveness_demo/orientationBuilder_demo.dart';
import 'package:flutter_demo/page/demo/richtext_demo/richText_demo.dart';
import 'package:flutter_demo/page/demo/router_demo/router_test.dart';
import 'package:flutter_demo/page/demo/router_demo/router_test2.dart';
import 'package:flutter_demo/page/demo/selector_demo/bottom_anim_nav_page.dart';
import 'package:flutter_demo/page/demo/theme_demo/theme_demo.dart';
import 'package:flutter_demo/page/demo/today_food_demo/today_food_demo.dart';

class Routers {
  //路由表
  static final Map<String, Widget> routerMap = {
    'routerTest': RouterTest(),
    'todayFoodDemo': TodayFoodDemo(),
    'planFromTest': PlanFromTest(),
    'routerTest2': RouterTest2(),
    'index': Index(),
    'cropDemo': CropDemo(),
    'clippingDemo': ClippingDemo(),
    'clippingPicture': ClippingPicture(),
    'richTextDemo': RichTextDemo(),
    'loggerDemo': LoggerDemo(),
    'fakerDemo': FakerDemo(),
    'jsonToModelDemo': JsonToModelDemo(),
    'cleanCacheDemo': CleanCacheDemo(),
    'mediaQueryDemo': MediaQueryDemo(),
    'layoutBuilderDemo': LayoutBuilderDemo(),
    'orientationBuilderDemo': OrientationBuilderDemo(),
    'expandedFlexibleDemo': ExpandedFlexibleDemo(),
    'fractionallySizedDemo': FractionallySizedDemo(),
    'aspectRatioDemo': AspectRatioDemo(),
    'cameraDemo': CameraDemo(),
    'futureDemo': FutureDemo(),
    'streamDemo': StreamDemo(),
    'streamBuilderDemo': StreamBuilderDemo(),
    'futureBuilderDemo': FutureBuilderDemo(),
    'bottomAnimNavPage': BottomAnimNavPage(),
    'iosBottomDemo': IosBottomDemo(),
    'globalKeyDemo': GlobalKeyDemo(key: StaticResource.testKey),
    'pageDemo': PageDemo(),
    'pageViewDemo': PageViewDemo(),
    'indicatorDemo': IndicatorDemo(),
    'indicatorDemo2': IndicatorDemo2(),
    'themeDemo': ThemeDemo(),
    'numAnimationDemo': NumAnimationDemo(),
  };
}
