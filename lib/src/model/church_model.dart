// To parse this JSON data, do
//
//     final churchModel = churchModelFromMap(jsonString);

import 'dart:convert';

class ChurchModel {
  ChurchModel({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  List<ChurchData>? data;

  factory ChurchModel.fromJson(String str) =>
      ChurchModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChurchModel.fromMap(Map<String, dynamic> json) => ChurchModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<ChurchData>.from(
                json["data"]!.map((x) => ChurchData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class ChurchData {
  ChurchData({
    this.name,
    this.address,
    this.phone,
    this.description,
    this.userId,
    this.user,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  String? name;
  String? address;
  String? phone;
  String? description;
  int? userId;
  dynamic user;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  factory ChurchData.fromJson(String str) =>
      ChurchData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChurchData.fromMap(Map<String, dynamic> json) => ChurchData(
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
        description: json["description"],
        userId: json["userId"],
        user: json["user"],
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
        "address": address,
        "phone": phone,
        "description": description,
        "userId": userId,
        "user": user,
        "id": id,
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
      };
}
