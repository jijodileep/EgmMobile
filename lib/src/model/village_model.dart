// To parse this JSON data, do
//
//     final villageModel = villageModelFromMap(jsonString);

import 'dart:convert';

class VillageModel {
  VillageModel({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  List<VillageData>? data;

  factory VillageModel.fromJson(String str) =>
      VillageModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VillageModel.fromMap(Map<String, dynamic> json) => VillageModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<VillageData>.from(
                json["data"]!.map((x) => VillageData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class VillageData {
  VillageData({
    this.stateId,
    this.state,
    this.districtId,
    this.district,
    this.talukId,
    this.taluk,
    this.name,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  int? stateId;
  dynamic state;
  int? districtId;
  dynamic district;
  int? talukId;
  dynamic taluk;
  String? name;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  factory VillageData.fromJson(String str) =>
      VillageData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VillageData.fromMap(Map<String, dynamic> json) => VillageData(
        stateId: json["stateId"],
        state: json["state"],
        districtId: json["districtId"],
        district: json["district"],
        talukId: json["talukId"],
        taluk: json["taluk"],
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
        "talukId": talukId,
        "taluk": taluk,
        "name": name,
        "id": id,
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
      };
}
