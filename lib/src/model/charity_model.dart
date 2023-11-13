// To parse this JSON data, do
//
//     final CharityModel = CharityModelFromMap(jsonString);

import 'dart:convert';

class CharityModel {
  CharityModel({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  List<Datum>? data;

  factory CharityModel.fromJson(String str) =>
      CharityModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CharityModel.fromMap(Map<String, dynamic> json) => CharityModel(
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
    this.tractDistribution,
    this.bibleDistribution,
    this.prayerMeetings,
    this.bibleStudy,
    this.baptism,
    this.fastingPrayer,
    this.youthFellowship,
    this.womensFellowship,
    this.cottageMeeting,
    this.sundaySchool,
    this.churchCommittee,
    this.christmasGiftsDistribution,
    this.missionaryId,
    this.missionaries,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  DateTime? dateTday;
  String? reason;
  int? tractDistribution;
  int? bibleDistribution;
  int? prayerMeetings;
  int? bibleStudy;
  int? baptism;
  bool? fastingPrayer;
  bool? youthFellowship;
  bool? womensFellowship;
  bool? cottageMeeting;
  bool? sundaySchool;
  bool? churchCommittee;
  bool? christmasGiftsDistribution;
  int? missionaryId;
  dynamic missionaries;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        dateTday:
            json["dateTday"] == null ? null : DateTime.parse(json["dateTday"]),
        reason: json["reason"],
        tractDistribution: json["tractDistribution"],
        bibleDistribution: json["bibleDistribution"],
        prayerMeetings: json["prayerMeetings"],
        bibleStudy: json["bibleStudy"],
        baptism: json["baptism"],
        fastingPrayer: json["fastingPrayer"],
        youthFellowship: json["youthFellowship"],
        womensFellowship: json["womensFellowship"],
        cottageMeeting: json["cottageMeeting"],
        sundaySchool: json["sundaySchool"],
        churchCommittee: json["churchCommittee"],
        christmasGiftsDistribution: json["christmasGiftsDistribution"],
        missionaryId: json["missionary_Id"],
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
        "tractDistribution": tractDistribution,
        "bibleDistribution": bibleDistribution,
        "prayerMeetings": prayerMeetings,
        "bibleStudy": bibleStudy,
        "baptism": baptism,
        "fastingPrayer": fastingPrayer,
        "youthFellowship": youthFellowship,
        "womensFellowship": womensFellowship,
        "cottageMeeting": cottageMeeting,
        "sundaySchool": sundaySchool,
        "churchCommittee": churchCommittee,
        "christmasGiftsDistribution": christmasGiftsDistribution,
        "missionary_Id": missionaryId,
        "missionaries": missionaries,
        "id": id,
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
      };
}
