import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Copyright (C), 2020-2021, flutter_demo
/// FileName: today_food_demo
/// Author: Jack
/// Date: 2021/1/15
/// Description:
import 'package:flutter_demo/util/util.dart';

class TodayFoodDemo extends StatefulWidget {
  @override
  _TodayFoodDemoState createState() => _TodayFoodDemoState();
}

class _TodayFoodDemoState extends State<TodayFoodDemo> {
  List<String> foodNameList = [
    '炸鸡',
    '米粉',
    '黄焖鸡',
    '日式拉面',
    '鸭血粉丝',
    '米线',
    '重庆小面',
    '牛肉面',
    '炸串',
    '卤肉饭',
    '麻辣香锅',
    '麻辣烫',
    '炒菜',
    '粥',
    '汉堡',
    '泡面',
    '饺子 ',
    '鸡胸肉',
    '楼下美食广场',
    '炒面',
    '石锅拌饭',
    '沙拉',
    '西北风',
    '炒饭',
    '汤圆',
  ];
  String foodName = '今天吃什么？';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "今天吃什么？"),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50.s,
              ),
              Font(text: foodName, size: 90),
              SizedBox(
                height: 50.s,
              ),
              Button(
                text: "开始随机",
                onTap: () {
                  foodName =
                      foodNameList[Random().nextInt(foodNameList.length - 1)];
                  setState(() {});
                },
              ),
              SizedBox(
                height: 50.s,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 40.s,
                  ),
                  Font(text: "食物列表：", size: 40),
                ],
              ),
              SizedBox(
                height: 40.s,
              ),
              Container(
                width: 710.s,
                child: Wrap(
                  spacing: 20.s,
                  runSpacing: 20.s,
                  children: [
                    for (String foodName in foodNameList)
                      Stack(
                        overflow: Overflow.visible,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.s),
                              color: Colors.lightGreen,

                            ),
                            padding: EdgeInsets.fromLTRB(30.s, 20.s, 30.s, 20.s),
                            child: Font(text: foodName),
                          ),
                          Positioned(
                            right: -10.s,
                            top: -10.s,
                            child: Icon(Icons.cancel,size: 30.s,),
                          )
                        ],
                      ),
                    Stack(
                      overflow: Overflow.visible,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.s),
                            color: Colors.lightGreen,

                          ),
                          padding: EdgeInsets.fromLTRB(30.s, 20.s, 30.s, 20.s),
                          child: Font(text: "新增"),
                        ),
                        Positioned(
                          right: -10.s,
                          top: -10.s,
                          child: Icon(Icons.cancel,size: 30.s,),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
