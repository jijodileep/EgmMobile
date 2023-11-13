// To parse this JSON data, do
//
//     final leaveModel = leaveModelFromMap(jsonString);

import 'dart:convert';

class LeaveModel {
  int? code;
  String? message;
  List<Datum>? data;

  LeaveModel({
    this.code,
    this.message,
    this.data,
  });

  factory LeaveModel.fromJson(String str) =>
      LeaveModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LeaveModel.fromMap(Map<String, dynamic> json) => LeaveModel(
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
  DateTime? date;
  int? missionaryId;
  dynamic missionaries;
  String? description;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  Datum({
    this.date,
    this.missionaryId,
    this.missionaries,
    this.description,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        missionaryId: json["missionary_Id"],
        missionaries: json["missionaries"],
        description: json["description"],
        id: json["id"],
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
        updatedDate: json["updatedDate"] == null
            ? null
            : DateTime.parse(json["updatedDate"]),
      );

  Map<String, dynamic> toMap() => {
        "date": date?.toIso8601String(),
        "missionary_Id": missionaryId,
        "missionaries": missionaries,
        "description": description,
        "id": id,
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
      };
}
