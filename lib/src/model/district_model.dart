// To parse this JSON data, do
//
//     final districtModel = districtModelFromMap(jsonString);

import 'dart:convert';

class DistrictModel {
  DistrictModel({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  List<DistrictData>? data;

  factory DistrictModel.fromJson(String str) =>
      DistrictModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DistrictModel.fromMap(Map<String, dynamic> json) => DistrictModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<DistrictData>.from(
                json["data"]!.map((x) => DistrictData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class DistrictData {
  DistrictData({
    this.name,
    this.stateId,
    this.state,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  String? name;
  int? stateId;
  dynamic state;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  factory DistrictData.fromJson(String str) =>
      DistrictData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DistrictData.fromMap(Map<String, dynamic> json) => DistrictData(
        name: json["name"],
        stateId: json["stateId"],
        state: json["state"],
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
        "stateId": stateId,
        "state": state,
        "id": id,
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
      };
}
