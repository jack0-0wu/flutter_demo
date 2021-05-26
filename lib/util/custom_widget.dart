import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'util.dart';

//字体
Widget Font(
        {text = "",
        color = Colors.black,
        size = 30,
        fontWeight = FontWeight.w300,
        textAlign = TextAlign.start,
        decoration: TextDecoration.none,
        number}) =>
    Text(
      text,
      textAlign: textAlign,
      maxLines: number,
      style: TextStyle(
          fontSize: SizeAdaptiveUtil().size(size),
          color: color,
          fontWeight: fontWeight,
          decoration: decoration),
    );
//按钮
Widget Button(
        {width,
        height,
        text = "",
        textColor = Colors.white,
        buttonColor = Colors.lightBlue,
        onTap}) =>
    GestureDetector(
      onTap: () {
        if (onTap != null) onTap();
      },
      child: Container(
        width: width ?? 250.s,
        height: height ?? 250.s,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(150.s)),
        alignment: Alignment.center,
        child: Font(text: text, color: textColor),
      ),
    );

Widget CustomAppBar(
        {String title = "无标题", textColor = Colors.white, titleSize = 100}) =>
    AppBar(
      title: Font(
          text: title,
          size: SizeAdaptiveUtil().size(titleSize),
          color: textColor),
      centerTitle: true,
    );
