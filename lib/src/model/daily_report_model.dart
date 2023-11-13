// To parse this JSON data, do
//
//     final dailyReportModel = dailyReportModelFromMap(jsonString);

import 'dart:convert';

class DailyReportModel {
  DailyReportModel({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  List<DailyReportData>? data;

  factory DailyReportModel.fromJson(String str) =>
      DailyReportModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DailyReportModel.fromMap(Map<String, dynamic> json) =>
      DailyReportModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<DailyReportData>.from(
                json["data"]!.map((x) => DailyReportData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class DailyReportData {
  DailyReportData({
    this.dateTday,
    this.reason,
    this.stateId,
    this.state,
    this.missionaryId,
    this.missionaries,
    this.visitedVillages,
    this.visitedHoueses,
    this.distanceTravelled,
    this.center,
    this.fastingPrayer,
    this.youthFellowship,
    this.womensFellowship,
    this.cottageMeeting,
    this.sundaySchool,
    this.churchCommittee,
    this.receipts,
    this.payments,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  DateTime? dateTday;
  String? reason;
  int? stateId;
  dynamic state;
  int? missionaryId;
  dynamic missionaries;
  int? visitedVillages;
  int? visitedHoueses;
  dynamic distanceTravelled;
  dynamic center;
  int? fastingPrayer;
  int? youthFellowship;
  int? womensFellowship;
  int? cottageMeeting;
  int? sundaySchool;
  int? churchCommittee;
  dynamic receipts;
  dynamic payments;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  factory DailyReportData.fromJson(String str) =>
      DailyReportData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DailyReportData.fromMap(Map<String, dynamic> json) => DailyReportData(
        dateTday:
            json["dateTday"] == null ? null : DateTime.parse(json["dateTday"]),
        reason: json["reason"],
        stateId: json["state_Id"],
        state: json["state"],
        missionaryId: json["missionary_Id"],
        missionaries: json["missionaries"],
        visitedVillages: json["visitedVillages"],
        visitedHoueses: json["visitedHoueses"],
        distanceTravelled: json["distanceTravelled"],
        center: json["center"],
        fastingPrayer: json["fastingPrayer"],
        youthFellowship: json["youthFellowship"],
        womensFellowship: json["womensFellowship"],
        cottageMeeting: json["cottageMeeting"],
        sundaySchool: json["sundaySchool"],
        churchCommittee: json["churchCommittee"],
        receipts: json["receipts"],
        payments: json["payments"],
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
        "state_Id": stateId,
        "state": state,
        "missionary_Id": missionaryId,
        "missionaries": missionaries,
        "visitedVillages": visitedVillages,
        "visitedHoueses": visitedHoueses,
        "distanceTravelled": distanceTravelled,
        "center": center,
        "fastingPrayer": fastingPrayer,
        "youthFellowship": youthFellowship,
        "womensFellowship": womensFellowship,
        "cottageMeeting": cottageMeeting,
        "sundaySchool": sundaySchool,
        "churchCommittee": churchCommittee,
        "receipts": receipts,
        "payments": payments,
        "id": id,
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
      };
}
