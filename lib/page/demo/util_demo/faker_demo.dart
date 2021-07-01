import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/util/util.dart';
import 'package:logger/logger.dart';

/// Copyright (C), 2015-2020, flutter_demo
/// FileName: faker_demo
/// Author: Jack
/// Date: 2020/11/24
/// Description:

class FakerDemo extends StatefulWidget {
  @override
  _FakerDemoState createState() => _FakerDemoState();
}

class _FakerDemoState extends State<FakerDemo> {
  static final faker = new Faker();
  List<dynamic> fakeList = [
    <dynamic>["faker.internet.email()", faker.internet.email()],
    <dynamic>["faker.internet.ipv6Address()", faker.internet.ipv6Address()],
    <dynamic>["faker.internet.userName()", faker.internet.userName()],
    <dynamic>["faker.person.name()", faker.person.name()],
    <dynamic>["faker.person.prefix()", faker.person.prefix()],
    <dynamic>["faker.person.suffix()", faker.person.suffix()],
    <dynamic>["faker.lorem.sentence()", faker.lorem.sentence()],
    <dynamic>["faker.internet.email()", faker.internet.email()],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "FakerDemo"),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20.s),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var item in fakeList)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Font(text: "代码：${item[0]}"),
                      Font(text: "输出：${item[1]}"),
                      SizedBox(
                        height: 20.s,
                      )
                    ],
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
