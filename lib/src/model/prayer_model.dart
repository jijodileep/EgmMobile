// To parse this JSON data, do
//
//     final prayerModel = prayerModelFromMap(jsonString);

import 'dart:convert';

class PrayerModel {
  PrayerModel({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  List<Datum>? data;

  factory PrayerModel.fromJson(String str) =>
      PrayerModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PrayerModel.fromMap(Map<String, dynamic> json) => PrayerModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Datum {
  Datum({
    this.name,
    this.description,
    this.type,
    this.missionaryId,
    this.missionaries,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  String? name;
  String? description;
  String? type;
  int? missionaryId;
  dynamic missionaries;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        name: json["name"],
        description: json["description"],
        type: json["type"],
        missionaryId: json["missionariy_Id"],
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
        "type": type,
        "missionary_Id": missionaryId,
        "missionaries": missionaries,
        "id": id,
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
      };
}
