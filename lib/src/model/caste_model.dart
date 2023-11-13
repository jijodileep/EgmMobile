// To parse this JSON data, do
//
//     final casteModel = casteModelFromMap(jsonString);

import 'dart:convert';

class CasteModel {
  CasteModel({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  List<CasteData>? data;

  factory CasteModel.fromJson(String str) =>
      CasteModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CasteModel.fromMap(Map<String, dynamic> json) => CasteModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<CasteData>.from(
                json["data"]!.map((x) => CasteData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class CasteData {
  CasteData({
    this.name,
    this.religionId,
    this.religion,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  String? name;
  int? religionId;
  dynamic religion;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  factory CasteData.fromJson(String str) => CasteData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CasteData.fromMap(Map<String, dynamic> json) => CasteData(
        name: json["name"],
        religionId: json["religionId"],
        religion: json["religion"],
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
        "religionId": religionId,
        "religion": religion,
        "id": id,
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
      };
}
