import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../config/routers.dart';

class RouterUtil {
  //路由key
  static final GlobalKey<NavigatorState> routerGlobalKey =
      GlobalKey<NavigatorState>();

  static push({String routerName, dynamic data, Function pushThen}) {
    routerGlobalKey.currentState
        .pushNamed(routerName, arguments: data != null ? data : null)
        .then((value) {
      if (pushThen != null) pushThen(value);
    });
  }

  static pushReplacementNamed(
      {String routerName, Map data, Function pushThen}) {
    routerGlobalKey.currentState
      ..pushReplacementNamed(routerName, arguments: data != null ? data : null)
          .then((value) {
        if (pushThen != null) pushThen(value);
      });
  }

  static _matchRouter(String routerName) {
    if (Routers.routerMap[routerName] != null) {
      return Routers.routerMap[routerName];
    }
  }

  static Route<dynamic> jumpTo(RouteSettings settings) {
    if (settings.arguments != null)
      _matchRouter(settings.name).setData(settings.arguments);
    return MaterialPageRoute(
      builder: (context) => _matchRouter(settings.name),
      settings: settings,
    );
  }
}
