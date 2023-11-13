// To parse this JSON data, do
//
//     final yearDetailsModel = yearDetailsModelFromMap(jsonString);

import 'dart:convert';

CharityDetailsModel charityDetailsModelFromMap(String str) =>
    CharityDetailsModel.fromMap(json.decode(str));

String charityDetailsModelToMap(CharityDetailsModel data) =>
    json.encode(data.toMap());

class CharityDetailsModel {
  int? code;
  String? message;
  Data? data;

  CharityDetailsModel({
    this.code,
    this.message,
    this.data,
  });

  factory CharityDetailsModel.fromMap(Map<String, dynamic> json) =>
      CharityDetailsModel(
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
  List<Datum>? data;
  List<Detail>? details;
  List<dynamic>? memdetails;

  Data({
    this.data,
    this.details,
    this.memdetails,
  });

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
        details: json["details"] == null
            ? []
            : List<Detail>.from(json["details"]!.map((x) => Detail.fromMap(x))),
        memdetails: json["memdetails"] == null
            ? []
            : List<dynamic>.from(json["memdetails"]!.map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "details": details == null
            ? []
            : List<dynamic>.from(details!.map((x) => x.toMap())),
        "memdetails": memdetails == null
            ? []
            : List<dynamic>.from(memdetails!.map((x) => x)),
      };
}

class Datum {
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
  int? educationAid;
  int? educationKits;
  int? marriageAid;
  int? widowAid;
  int? aidrDifferentlyAbled;
  int? medicalAid;
  int? houseConstructionAid;
  int? otherAid;
  bool? isCottageNoofCharityWorks;
  int? cottageNoofCharityWorks;
  bool? isCottageNoofnewVillages;
  int? cottageNoofnewVillages;
  bool? isCottageNoofnewEvangelists;
  int? cottageNoofnewEvangelists;
  bool? isCottageTotalReceiptsExpenses;
  int? cottageTotalReceiptsExpenses;
  bool? isCottagePrayerRequests;
  int? cottagePrayerRequests;
  String? remarks;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

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
    this.educationAid,
    this.educationKits,
    this.marriageAid,
    this.widowAid,
    this.aidrDifferentlyAbled,
    this.medicalAid,
    this.houseConstructionAid,
    this.otherAid,
    this.isCottageNoofCharityWorks,
    this.cottageNoofCharityWorks,
    this.isCottageNoofnewVillages,
    this.cottageNoofnewVillages,
    this.isCottageNoofnewEvangelists,
    this.cottageNoofnewEvangelists,
    this.isCottageTotalReceiptsExpenses,
    this.cottageTotalReceiptsExpenses,
    this.isCottagePrayerRequests,
    this.cottagePrayerRequests,
    this.remarks,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

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
        educationAid: json["educationAid"],
        educationKits: json["educationKits"],
        marriageAid: json["marriageAid"],
        widowAid: json["widowAid"],
        aidrDifferentlyAbled: json["aidrDifferentlyAbled"],
        medicalAid: json["medicalAid"],
        houseConstructionAid: json["houseConstructionAid"],
        otherAid: json["otherAid"],
        isCottageNoofCharityWorks: json["isCottageNoofCharityWorks"],
        cottageNoofCharityWorks: json["cottageNoofCharityWorks"],
        isCottageNoofnewVillages: json["isCottageNoofnewVillages"],
        cottageNoofnewVillages: json["cottageNoofnewVillages"],
        isCottageNoofnewEvangelists: json["isCottageNoofnewEvangelists"],
        cottageNoofnewEvangelists: json["cottageNoofnewEvangelists"],
        isCottageTotalReceiptsExpenses: json["isCottageTotalReceiptsExpenses"],
        cottageTotalReceiptsExpenses: json["cottageTotalReceiptsExpenses"],
        isCottagePrayerRequests: json["isCottagePrayerRequests"],
        cottagePrayerRequests: json["cottagePrayerRequests"],
        remarks: json["remarks"],
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
        "educationAid": educationAid,
        "educationKits": educationKits,
        "marriageAid": marriageAid,
        "widowAid": widowAid,
        "aidrDifferentlyAbled": aidrDifferentlyAbled,
        "medicalAid": medicalAid,
        "houseConstructionAid": houseConstructionAid,
        "otherAid": otherAid,
        "isCottageNoofCharityWorks": isCottageNoofCharityWorks,
        "cottageNoofCharityWorks": cottageNoofCharityWorks,
        "isCottageNoofnewVillages": isCottageNoofnewVillages,
        "cottageNoofnewVillages": cottageNoofnewVillages,
        "isCottageNoofnewEvangelists": isCottageNoofnewEvangelists,
        "cottageNoofnewEvangelists": cottageNoofnewEvangelists,
        "isCottageTotalReceiptsExpenses": isCottageTotalReceiptsExpenses,
        "cottageTotalReceiptsExpenses": cottageTotalReceiptsExpenses,
        "isCottagePrayerRequests": isCottagePrayerRequests,
        "cottagePrayerRequests": cottagePrayerRequests,
        "remarks": remarks,
        "id": id,
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
      };
}

class Detail {
  String? name;
  String? description;
  String? type;
  int? programsEntryId;
  dynamic programsEntry;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  Detail({
    this.name,
    this.description,
    this.type,
    this.programsEntryId,
    this.programsEntry,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  factory Detail.fromMap(Map<String, dynamic> json) => Detail(
        name: json["name"],
        description: json["description"],
        type: json["type"],
        programsEntryId: json["programsEntryId"],
        programsEntry: json["programsEntry"],
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
        "programsEntryId": programsEntryId,
        "programsEntry": programsEntry,
        "id": id,
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
      };
}
