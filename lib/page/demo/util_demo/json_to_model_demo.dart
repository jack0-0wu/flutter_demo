import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/util/util.dart';

import 'employee_by_group_model.dart';

/// Copyright (C), 2015-2020, flutter_demo
/// FileName: json_to_model_demo
/// Author: Jack
/// Date: 2020/11/26
/// Description:
class JsonToModelDemo extends StatefulWidget {
  @override
  _JsonToModelDemoState createState() => _JsonToModelDemoState();
}

class _JsonToModelDemoState extends State<JsonToModelDemo> {
  String jsonStr =
      '{"groupName": "钣金组","groupId": "dc7189d645cd4983ae31699cf300f47e","personGroupList": [{"userName": "于佳馨", "userId": "82ae337f5a8941a1b40496e984b4bf6e"},{"userName": "杨戬", "userId": "ece657fd18a044be873f9c241b9855e3"},{"userName": "郭", "userId": "812d73c03ee94863b5ed60469ef97408"},{"userName": "xiao", "userId": "3548c6df149e40deb28d01fa6d3bf7e5"}]}';
  var employByGroupModel;

  // Map jsonCodec = json.decode(jsonStr);

  toModel() {
    employByGroupModel = employByGroupModelFromJson(jsonStr);
    print(employByGroupModel.runtimeType);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "JsonToModelDemo"),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(20.s),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Font(text: "Json体"),
                Text('''
    {
      "groupName": "钣金组",
      "groupId": "dc7189d645cd4983ae31699cf300f47e",
      "personGroupList": [
        {
          "userName": "于佳馨",
          "userId": "82ae337f5a8941a1b40496e984b4bf6e"
        },
        {
          "userName": "杨戬",
          "userId": "ece657fd18a044be873f9c241b9855e3"
        },
        {
          "userName": "郭",
          "userId": "812d73c03ee94863b5ed60469ef97408"
        },
        {
          "userName": "xiao",
          "userId": "3548c6df149e40deb28d01fa6d3bf7e5"
        }
      ]
    }
                '''),
                Button(
                    text: "JsonToModel",
                    onTap: () {
                      toModel();
                      setState(() {});
                    }),
                Font(text: "转换后的类型：${employByGroupModel.runtimeType}")
              ],
            ),
          )
        ],
      ),
    );
  }
}
