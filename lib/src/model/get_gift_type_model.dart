// To parse this JSON data, do
//
//     final getGiftTypeModel = getGiftTypeModelFromMap(jsonString);

import 'dart:convert';

class GetGiftTypeModel {
  int? code;
  String? message;
  List<GetGiftType>? data;

  GetGiftTypeModel({
    this.code,
    this.message,
    this.data,
  });

  factory GetGiftTypeModel.fromJson(String str) =>
      GetGiftTypeModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetGiftTypeModel.fromMap(Map<String, dynamic> json) =>
      GetGiftTypeModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<GetGiftType>.from(
                json["data"]!.map((x) => GetGiftType.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class GetGiftType {
  String? name;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  GetGiftType({
    this.name,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  factory GetGiftType.fromJson(String str) =>
      GetGiftType.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetGiftType.fromMap(Map<String, dynamic> json) => GetGiftType(
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
