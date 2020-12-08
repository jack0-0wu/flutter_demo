import 'dart:io';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

class CustomCameraPage extends StatefulWidget {
  @override
  _CustomCameraPageState createState() => _CustomCameraPageState();
}

class _CustomCameraPageState extends State<CustomCameraPage> {
  CameraController controller;
  bool flag = true;
  List<CameraDescription> cameras;

  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  void _camera() async {
    cameras = await availableCameras();
    if (cameras != null) {
      //在这里修改摄像头前置或后置
      controller =
          CameraController(cameras[flag ? 0 : 1], ResolutionPreset.medium);
      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _camera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cameras == null
          ? Container(
              child: Center(
                child: Text("加載中..."),
              ),
            )
          : Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: <Widget>[_cameraWidget(), _cameraButton()],
              ),
            ),
    );
  }

  Widget _cameraWidget() {
    return Expanded(
      flex: 1,
      child: Stack(
        children: <Widget>[
          _cameraPreviewWidget(),
        ],
      ),
    );
  }

  Widget _cameraPreviewWidget() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CameraPreview(controller),
    );
  }

  Widget _cameraButton() {
    return GestureDetector(
      onTap: onTakePictureButtonPressed,
      child: Container(
        height: 70,
        color: Colors.black,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text("返回", style: TextStyle(color: Colors.white)),
            ),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                  onTap: onTakePictureButtonPressed,
                  child: Icon(Icons.camera_alt, color: Colors.white, size: 50)),
            ),
            GestureDetector(
              onTap: () {
                flag = !flag;
                _camera();
                print(flag);
                setState(() {});
              },
              child: Text("更换摄像头", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void onTakePictureButtonPressed() {
    takePicture().then((String filePath) {
      if (mounted) {
        if (filePath != null) {
          Navigator.of(context).pop(filePath);
          print(filePath);
        }
      }
    });
  }

  Future<String> takePicture() async {
    if (!controller.value.isInitialized) {
      print('Error: select a camera_custom.dart first.');
      return null;
    }
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Pictures/flutter_test';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/${timestamp()}.jpg';

    if (controller.value.isTakingPicture) {
      // A capture is already pending, do nothing.
      return null;
    }
    try {
      await controller.takePicture(filePath);
    } on CameraException catch (e) {
      print("出现异常$e");
      return null;
    }
    return filePath;
  }
}
