import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/config/routers.dart';

class RouterUtil {
  static push(context, {String routerName, Map data, pushThen}) {
    Navigator.pushNamed(context, routerName,
            arguments: data != null ? data : null)
        .then((value) {
      if (pushThen != null) pushThen(value);
    });
  }

  static pushReplacementNamed(context,
      {String routerName, Map data, pushThen}) {
    Navigator.pushReplacementNamed(context, routerName,
            arguments: data != null ? data : null)
        .then((value) {
      if (pushThen != null) pushThen(value);
    });
  }

  static _matchRouter(String routerName) {
    for (int i = 0; i < Routers.routerList.length; i++) {
      if (Routers.routerList[i].containsKey(routerName))
        return Routers.routerList[i][routerName];
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
