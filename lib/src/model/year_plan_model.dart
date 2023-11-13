// To parse this JSON data, do
//
//     final yearPlanModel = yearPlanModelFromMap(jsonString);

import 'dart:convert';

YearPlanModel yearPlanModelFromMap(String str) =>
    YearPlanModel.fromMap(json.decode(str));

String yearPlanModelToMap(YearPlanModel data) => json.encode(data.toMap());

class YearPlanModel {
  int? code;
  String? message;
  List<Datum>? data;

  YearPlanModel({
    this.code,
    this.message,
    this.data,
  });

  factory YearPlanModel.fromMap(Map<String, dynamic> json) => YearPlanModel(
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
  int? charityTypeId;
  CharityType? charityType;
  DateTime? dateTday;
  int? trackDistribution;
  int? bibleDistribution;
  int? prayerMeetings;
  int? bibleStudy;
  int? baptisam;
  int? missionaryId;
  dynamic missionaries;
  int? fastingPrayer;
  int? youthFellowship;
  int? womensFellowship;
  int? sundaySchool;
  int? churchCommittee;
  dynamic receipts;
  dynamic payments;
  int? charityWorks;
  int? villages;
  int? evangelists;
  int? educationAid;
  int? educationKit;
  int? marriageAid;
  int? widowAid;
  int? aidForDifferentlyAbled;
  int? medicalAid;
  int? houseConstructionAid;
  int? otherAid;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;
  String? remarks;

  Datum(
      {this.charityTypeId,
      this.charityType,
      this.dateTday,
      this.trackDistribution,
      this.bibleDistribution,
      this.prayerMeetings,
      this.bibleStudy,
      this.baptisam,
      this.missionaryId,
      this.missionaries,
      this.fastingPrayer,
      this.youthFellowship,
      this.womensFellowship,
      this.sundaySchool,
      this.churchCommittee,
      this.receipts,
      this.payments,
      this.charityWorks,
      this.villages,
      this.evangelists,
      this.educationAid,
      this.educationKit,
      this.marriageAid,
      this.widowAid,
      this.aidForDifferentlyAbled,
      this.medicalAid,
      this.houseConstructionAid,
      this.otherAid,
      this.id,
      this.createdDate,
      this.updatedDate,
      this.remarks});

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        charityTypeId: json["charityTypeID"],
        charityType: json["charityType"] == null
            ? null
            : CharityType.fromMap(json["charityType"]),
        dateTday:
            json["dateTday"] == null ? null : DateTime.parse(json["dateTday"]),
        trackDistribution: json["trackDistribution"],
        bibleDistribution: json["bibleDistribution"],
        prayerMeetings: json["prayerMeetings"],
        bibleStudy: json["bibleStudy"],
        baptisam: json["baptisam"],
        missionaryId: json["missionary_Id"],
        missionaries: json["missionaries"],
        fastingPrayer: json["fastingPrayer"],
        youthFellowship: json["youthFellowship"],
        womensFellowship: json["womensFellowship"],
        sundaySchool: json["sundaySchool"],
        churchCommittee: json["churchCommittee"],
        receipts: json["receipts"],
        payments: json["payments"],
        charityWorks: json["charityWorks"],
        villages: json["villages"],
        evangelists: json["evangelists"],
        educationAid: json["educationAid"],
        educationKit: json["educationKit"],
        marriageAid: json["marriageAid"],
        widowAid: json["widowAid"],
        aidForDifferentlyAbled: json["aidForDifferentlyAbled"],
        medicalAid: json["medicalAid"],
        houseConstructionAid: json["houseConstructionAid"],
        otherAid: json["otherAid"],
        id: json["id"],
        remarks: json["remarks"],
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
        updatedDate: json["updatedDate"] == null
            ? null
            : DateTime.parse(json["updatedDate"]),
      );

  Map<String, dynamic> toMap() => {
        "charityTypeID": charityTypeId,
        "charityType": charityType?.toMap(),
        "dateTday": dateTday?.toIso8601String(),
        "trackDistribution": trackDistribution,
        "bibleDistribution": bibleDistribution,
        "prayerMeetings": prayerMeetings,
        "bibleStudy": bibleStudy,
        "baptisam": baptisam,
        "missionary_Id": missionaryId,
        "missionaries": missionaries,
        "fastingPrayer": fastingPrayer,
        "youthFellowship": youthFellowship,
        "womensFellowship": womensFellowship,
        "sundaySchool": sundaySchool,
        "churchCommittee": churchCommittee,
        "receipts": receipts,
        "payments": payments,
        "charityWorks": charityWorks,
        "villages": villages,
        "evangelists": evangelists,
        "educationAid": educationAid,
        "educationKit": educationKit,
        "marriageAid": marriageAid,
        "widowAid": widowAid,
        "aidForDifferentlyAbled": aidForDifferentlyAbled,
        "medicalAid": medicalAid,
        "houseConstructionAid": houseConstructionAid,
        "otherAid": otherAid,
        "id": id,
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
      };
}

class CharityType {
  String? name;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  CharityType({
    this.name,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  factory CharityType.fromMap(Map<String, dynamic> json) => CharityType(
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
