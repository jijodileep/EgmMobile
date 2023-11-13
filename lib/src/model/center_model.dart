// To parse this JSON data, do
//
//     final centerModel = centerModelFromMap(jsonString);

import 'dart:convert';

class CenterModel {
  int? code;
  String? message;
  List<CenterData>? data;

  CenterModel({
    this.code,
    this.message,
    this.data,
  });

  factory CenterModel.fromJson(String str) =>
      CenterModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CenterModel.fromMap(Map<String, dynamic> json) => CenterModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<CenterData>.from(
                json["data"]!.map((x) => CenterData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class CenterData {
  String? name;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  CenterData({
    this.name,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  factory CenterData.fromJson(String str) =>
      CenterData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CenterData.fromMap(Map<String, dynamic> json) => CenterData(
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
        "name": name,
        "id": id,
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
      };
}
