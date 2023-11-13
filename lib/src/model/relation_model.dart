// To parse this JSON data, do
//
//     final relationModel = relationModelFromMap(jsonString);

import 'dart:convert';

class RelationModel {
  RelationModel({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  List<RelationData>? data;

  factory RelationModel.fromJson(String str) =>
      RelationModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RelationModel.fromMap(Map<String, dynamic> json) => RelationModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<RelationData>.from(
                json["data"]!.map((x) => RelationData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class RelationData {
  RelationData({
    this.name,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  String? name;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  factory RelationData.fromJson(String str) =>
      RelationData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RelationData.fromMap(Map<String, dynamic> json) => RelationData(
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
