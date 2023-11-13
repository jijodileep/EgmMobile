// To parse this JSON data, do
//
//     final talukModel = talukModelFromMap(jsonString);

import 'dart:convert';

class TalukModel {
  TalukModel({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  List<TalukData>? data;

  factory TalukModel.fromJson(String str) =>
      TalukModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TalukModel.fromMap(Map<String, dynamic> json) => TalukModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<TalukData>.from(
                json["data"]!.map((x) => TalukData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class TalukData {
  TalukData({
    this.stateId,
    this.state,
    this.districtId,
    this.district,
    this.name,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  int? stateId;
  dynamic state;
  int? districtId;
  dynamic district;
  String? name;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  factory TalukData.fromJson(String str) => TalukData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TalukData.fromMap(Map<String, dynamic> json) => TalukData(
        stateId: json["stateId"],
        state: json["state"],
        districtId: json["districtId"],
        district: json["district"],
        name: json["name"],
        id: json["id"],
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
        updatedDate: json["updatedDate"] == null
            ? null
            : DateTime.parse(json["updatedDate"]),
      );

  Map<String, dynamic> toMap() => {
        "stateId": stateId,
        "state": state,
        "districtId": districtId,
        "district": district,
        "name": name,
        "id": id,
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
      };
}
