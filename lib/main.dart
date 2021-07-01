// import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/page/demo/index/index.dart';
import 'package:flutter_demo/page/demo/study_demo/favorites.dart';
import 'package:flutter_demo/page/demo/util_demo/theme_provider.dart';
import 'package:flutter_demo/util/router_util.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  // Ensure that plugin services are initialized so that `availableCameras()`
// can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

// Obtain a list of the available cameras on the device.
//   final cameras = await availableCameras();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ChangeNotifierProvider(create: (_) => Favorites()),
  ], child: MyApp())
      //多屏幕展示
      // DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context) => MyApp(), // Wrap your app
      // ),
      );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
        builder: (context, ThemeProvider themeProvider, child) => MaterialApp(
              //路由配置
              navigatorKey: RouterUtil.routerGlobalKey,
              onGenerateRoute: RouterUtil.jumpTo,
              //多屏幕展示
              // locale: DevicePreview.locale(context), // Add the locale here
              // builder: DevicePreview.appBuilder,
              title: 'Flutter Demo',
              theme: themeProvider.themeData,
              darkTheme: themeProvider.darkThemeData,
              home: Index(),
            ));
  }
}
