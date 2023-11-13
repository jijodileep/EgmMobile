// To parse this JSON data, do
//
//     final religionModel = religionModelFromMap(jsonString);

import 'dart:convert';

class ReligionModel {
  ReligionModel({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  List<ReligionData>? data;

  factory ReligionModel.fromJson(String str) =>
      ReligionModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReligionModel.fromMap(Map<String, dynamic> json) => ReligionModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<ReligionData>.from(
                json["data"]!.map((x) => ReligionData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class ReligionData {
  ReligionData({
    this.name,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  String? name;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  factory ReligionData.fromJson(String str) =>
      ReligionData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ReligionData.fromMap(Map<String, dynamic> json) => ReligionData(
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
