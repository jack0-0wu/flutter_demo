import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/util/util.dart';
import 'package:permission_handler/permission_handler.dart';

import 'camera_custom.dart';

/// Copyright (C), 2020-2020, flutter_demo
/// FileName: camera_demo
/// Author: Jack
/// Date: 2020/12/8
/// Description:
// A screen that allows users to take a picture using a given camera_custom.dart.
class CameraDemo extends StatefulWidget {
  @override
  _CameraDemoState createState() => _CameraDemoState();
}

class _CameraDemoState extends State<CameraDemo> {
  String imagePath;

  Future requestPermission(context) async {
    // 申请权限
    Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler().requestPermissions(
            [PermissionGroup.camera, PermissionGroup.storage]);
    // 申请结果
    PermissionStatus permission =
        await PermissionHandler().checkPermissionStatus(PermissionGroup.camera);

    if (permission == PermissionStatus.granted) {
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => CustomCameraPage()),
      ).then((v) {
        if (v != null) {
          setState(() {
            imagePath = v;
          });
        }
      });
    } else {
      //权限申请被拒绝,自行处理

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Take a picture')),
      // Wait until the controller is initialized before displaying the
      // camera_custom.dart preview. Use a FutureBuilder to display a loading spinner
      // until the controller has finished initializing.
      body: Column(
        children: [
          Button(
              text: "跳转画面",
              onTap: () {
                requestPermission(context);
              }),
          Visibility(
              visible: imagePath != null,
              child: Image.asset(imagePath ?? "assets/image/shuji.png")),
        ],
      ),
    );
  }
}
