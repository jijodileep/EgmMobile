// To parse this JSON data, do
//
//     final getCharityTypeModel = getCharityTypeModelFromMap(jsonString);

import 'dart:convert';

class GetCharityTypeModel {
  int? code;
  String? message;
  List<GetCharityType>? data;

  GetCharityTypeModel({
    this.code,
    this.message,
    this.data,
  });

  factory GetCharityTypeModel.fromJson(String str) =>
      GetCharityTypeModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetCharityTypeModel.fromMap(Map<String, dynamic> json) =>
      GetCharityTypeModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<GetCharityType>.from(
                json["data"]!.map((x) => GetCharityType.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class GetCharityType {
  String? name;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  GetCharityType({
    this.name,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  factory GetCharityType.fromJson(String str) =>
      GetCharityType.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetCharityType.fromMap(Map<String, dynamic> json) => GetCharityType(
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
