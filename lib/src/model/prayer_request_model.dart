// To parse this JSON data, do
//
//     final prayerRequestModel = prayerRequestModelFromMap(jsonString);

import 'dart:convert';

class PrayerRequestModel {
  int? code;
  String? message;
  List<RequestData>? data;

  PrayerRequestModel({
    this.code,
    this.message,
    this.data,
  });

  factory PrayerRequestModel.fromJson(String str) =>
      PrayerRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PrayerRequestModel.fromMap(Map<String, dynamic> json) =>
      PrayerRequestModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<RequestData>.from(
                json["data"]!.map((x) => RequestData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class RequestData {
  String? name;
  String? description;
  int? missionariyId;
  dynamic missionaries;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  RequestData({
    this.name,
    this.description,
    this.missionariyId,
    this.missionaries,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  factory RequestData.fromJson(String str) =>
      RequestData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RequestData.fromMap(Map<String, dynamic> json) => RequestData(
        name: json["name"],
        description: json["description"],
        missionariyId: json["missionariy_Id"],
        missionaries: json["missionaries"],
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
        "description": description,
        "missionariy_Id": missionariyId,
        "missionaries": missionaries,
        "id": id,
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
      };
}
