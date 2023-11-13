// To parse this JSON data, do
//
//     final sundayModel = sundayModelFromMap(jsonString);

import 'dart:convert';

class SundayModel {
  SundayModel({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  List<Datum>? data;

  factory SundayModel.fromJson(String str) =>
      SundayModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SundayModel.fromMap(Map<String, dynamic> json) => SundayModel(
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
    this.dateTday,
    this.reason,
    this.masterSundayWorship,
    this.baptizedBelievers,
    this.nonbaptizedBelievers,
    this.evangelists,
    this.guests,
    this.startTime,
    this.endTime,
    this.offertoryAmount,
    this.worshipExpenseAmount,
    this.missionaryId,
    this.missionaries,
    this.id,
    this.createdDate,
    this.updatedDate,
    this.payment,
    this.receipts,
  });

  DateTime? dateTday;
  String? reason;
  dynamic masterSundayWorship;
  int? baptizedBelievers;
  int? nonbaptizedBelievers;
  int? evangelists;
  int? guests;
  dynamic startTime;
  dynamic endTime;
  int? offertoryAmount;
  int? worshipExpenseAmount;
  int? missionaryId;
  dynamic missionaries;
  int? id;
  dynamic payment;
  dynamic receipts;
  DateTime? createdDate;
  DateTime? updatedDate;

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        dateTday:
            json["dateTday"] == null ? null : DateTime.parse(json["dateTday"]),
        reason: json["reason"],
        masterSundayWorship: json["masterSundayWorship"],
        baptizedBelievers: json["baptizedBelievers"],
        nonbaptizedBelievers: json["nonbaptizedBelievers"],
        evangelists: json["evangelists"],
        guests: json["guests"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        offertoryAmount: json["offertoryAmount"],
        worshipExpenseAmount: json["worshipExpenseAmount"],
        missionaryId: json["missionary_Id"],
        payment: json["payment"],
        receipts: json["receipts"],
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
        "dateTday": dateTday?.toIso8601String(),
        "reason": reason,
        "baptizedBelievers": baptizedBelievers,
        "nonbaptizedBelievers": nonbaptizedBelievers,
        "evangelists": evangelists,
        "guests": guests,
        "startTime": startTime,
        "endTime": endTime,
        "offertoryAmount": offertoryAmount,
        "worshipExpenseAmount": worshipExpenseAmount,
        "missionary_Id": missionaryId,
        "missionaries": missionaries,
        "id": id,
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
      };
}
