/// Copyright (C), 2015-2020, flutter_demo
/// FileName: employee_by_group_model
/// Author: Jack
/// Date: 2020/11/26
/// Description:
// To parse this JSON data, do
//
//     final employByGroupModel = employByGroupModelFromJson(jsonString);

import 'dart:convert';

EmployByGroupModel employByGroupModelFromJson(String str) =>
    EmployByGroupModel.fromJson(json.decode(str));

String employByGroupModelToJson(EmployByGroupModel data) =>
    json.encode(data.toJson());

class EmployByGroupModel {
  EmployByGroupModel({
    this.groupName,
    this.groupId,
    this.personGroupList,
  });

  String groupName;
  String groupId;
  List<PersonGroupList> personGroupList;

  factory EmployByGroupModel.fromJson(Map<String, dynamic> json) =>
      EmployByGroupModel(
        groupName: json["groupName"],
        groupId: json["groupId"],
        personGroupList: List<PersonGroupList>.from(
            json["personGroupList"].map((x) => PersonGroupList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "groupName": groupName,
        "groupId": groupId,
        "personGroupList":
            List<dynamic>.from(personGroupList.map((x) => x.toJson())),
      };
}

class PersonGroupList {
  PersonGroupList({
    this.userName,
    this.userId,
  });

  String userName;
  String userId;

  factory PersonGroupList.fromJson(Map<String, dynamic> json) =>
      PersonGroupList(
        userName: json["userName"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "userId": userId,
      };
}
