// To parse this JSON data, do
//
//     final getMasterSundayWorshipsModel = getMasterSundayWorshipsModelFromMap(jsonString);

import 'dart:convert';

class GetMasterSundayWorshipsModel {
  int? code;
  String? message;
  List<GetMasterSundayWorships>? data;

  GetMasterSundayWorshipsModel({
    this.code,
    this.message,
    this.data,
  });

  factory GetMasterSundayWorshipsModel.fromJson(String str) =>
      GetMasterSundayWorshipsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetMasterSundayWorshipsModel.fromMap(Map<String, dynamic> json) =>
      GetMasterSundayWorshipsModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<GetMasterSundayWorships>.from(
                json["data"]!.map((x) => GetMasterSundayWorships.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class GetMasterSundayWorships {
  String? name;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  GetMasterSundayWorships({
    this.name,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  factory GetMasterSundayWorships.fromJson(String str) =>
      GetMasterSundayWorships.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetMasterSundayWorships.fromMap(Map<String, dynamic> json) =>
      GetMasterSundayWorships(
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
