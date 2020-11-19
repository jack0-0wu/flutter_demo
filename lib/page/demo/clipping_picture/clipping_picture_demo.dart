import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/util/util.dart';
import 'package:image_picker/image_picker.dart';

class ClippingPictureDemo extends StatefulWidget {
  @override
  _ClippingPictureDemoState createState() => _ClippingPictureDemoState();
}

class _ClippingPictureDemoState extends State<ClippingPictureDemo> {

  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final  pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图片剪裁'),
        centerTitle: true,
      ),
      body: Center(
        child: _image == null
            ? Text('No image selected.')
            : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          getImage();
        },
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
