// To parse this JSON data, do
//
//     final meetingDetailModel = meetingDetailModelFromMap(jsonString);

import 'dart:convert';

class MeetingDetailModel {
  int? code;
  String? message;
  Data? data;

  MeetingDetailModel({
    this.code,
    this.message,
    this.data,
  });

  factory MeetingDetailModel.fromJson(String str) =>
      MeetingDetailModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MeetingDetailModel.fromMap(Map<String, dynamic> json) =>
      MeetingDetailModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "data": data?.toMap(),
      };
}

class Data {
  DateTime? dateTday;
  String? reason;
  int? masterSundayWorshipId;
  MasterSundayWorship? masterSundayWorship;
  int? baptizedBelievers;
  int? nonbaptizedBelievers;
  int? evangelists;
  int? guests;
  int? payment;
  dynamic memberID;
  int? children;
  int? receipts;
  dynamic startTime;
  dynamic endTime;
  int? offertoryAmount;
  int? worshipExpenseAmount;
  int? missionaryId;
  dynamic missionaries;
  bool? isAttendance;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  Data({
    this.dateTday,
    this.reason,
    this.masterSundayWorshipId,
    this.masterSundayWorship,
    this.baptizedBelievers,
    this.nonbaptizedBelievers,
    this.evangelists,
    this.guests,
    this.payment,
    this.memberID,
    this.children,
    this.receipts,
    this.startTime,
    this.endTime,
    this.offertoryAmount,
    this.worshipExpenseAmount,
    this.missionaryId,
    this.missionaries,
    this.isAttendance,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        dateTday:
            json["dateTday"] == null ? null : DateTime.parse(json["dateTday"]),
        reason: json["reason"],
        masterSundayWorshipId: json["masterSundayWorshipID"],
        masterSundayWorship: json["masterSundayWorship"] == null
            ? null
            : MasterSundayWorship.fromMap(json["masterSundayWorship"]),
        baptizedBelievers: json["baptizedBelievers"],
        nonbaptizedBelievers: json["nonbaptizedBelievers"],
        evangelists: json["evangelists"],
        guests: json["guests"],
        payment: json["payment"],
        memberID: json["memberID"],
        children: json["children"],
        receipts: json["receipts"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        offertoryAmount: json["offertoryAmount"],
        worshipExpenseAmount: json["worshipExpenseAmount"],
        missionaryId: json["missionary_Id"],
        missionaries: json["missionaries"],
        isAttendance: json["isAttendance"],
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
        "masterSundayWorshipID": masterSundayWorshipId,
        "masterSundayWorship": masterSundayWorship?.toMap(),
        "baptizedBelievers": baptizedBelievers,
        "nonbaptizedBelievers": nonbaptizedBelievers,
        "evangelists": evangelists,
        "guests": guests,
        "payment": payment,
        "receipts": receipts,
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

class MasterSundayWorship {
  String? name;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  MasterSundayWorship({
    this.name,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  factory MasterSundayWorship.fromJson(String str) =>
      MasterSundayWorship.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MasterSundayWorship.fromMap(Map<String, dynamic> json) =>
      MasterSundayWorship(
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
