
// To parse this JSON data, do
//
//     final allVillageModel = allVillageModelFromMap(jsonString);

import 'dart:convert';

class AllVillageModel {
  int? code;
  String? message;
  List<VillageData>? data;

  AllVillageModel({
    this.code,
    this.message,
    this.data,
  });

  factory AllVillageModel.fromJson(String str) =>
      AllVillageModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AllVillageModel.fromMap(Map<String, dynamic> json) => AllVillageModel(
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
