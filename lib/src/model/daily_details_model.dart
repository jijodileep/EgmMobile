// To parse this JSON data, do
//
//     final dailyDetailsModel = dailyDetailsModelFromMap(jsonString);

import 'dart:convert';

class DailyDetailsModel {
  int? code;
  String? message;
  Data? data;

  DailyDetailsModel({
    this.code,
    this.message,
    this.data,
  });

  factory DailyDetailsModel.fromJson(String str) =>
      DailyDetailsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DailyDetailsModel.fromMap(Map<String, dynamic> json) =>
      DailyDetailsModel(
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
  List<House>? houses;
  List<VillageElement>? villages;

  Data({
    this.data,
    this.details,
    this.houses,
    this.villages,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
        details: json["details"] == null
            ? []
            : List<Detail>.from(json["details"]!.map((x) => Detail.fromMap(x))),
        houses: json["houses"] == null
            ? []
            : List<House>.from(json["houses"]!.map((x) => House.fromMap(x))),
        villages: json["villages"] == null
            ? []
            : List<VillageElement>.from(
                json["villages"]!.map((x) => VillageElement.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "details": details == null
            ? []
            : List<dynamic>.from(details!.map((x) => x.toMap())),
        "houses": houses == null
            ? []
            : List<dynamic>.from(houses!.map((x) => x.toMap())),
        "villages": villages == null
            ? []
            : List<dynamic>.from(villages!.map((x) => x.toMap())),
      };
}

class Datum {
  bool? isLeave;
  DateTime? dateTday;
  String? reason;
  int? stateId;
  dynamic state;
  int? missionaryId;
  dynamic missionaries;
  int? visitedVillages;
  int? visitedHoueses;
  int? distanceTravelled;
  int? center;
  dynamic centerDetails;
  int? fastingPrayer;
  int? youthFellowship;
  int? womensFellowship;
  int? cottageMeeting;
  int? sundaySchool;
  int? churchCommittee;
  int? trackDistribution;
  int? bibleDistribution;
  int? prayerMeetings;
  int? bibleStudy;
  int? baptisam;
  dynamic receipts;
  dynamic payments;
  dynamic dailyVisitedVillages;
  dynamic dailyVisitedHouse;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  Datum({
    this.isLeave,
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
    this.centerDetails,
    this.fastingPrayer,
    this.youthFellowship,
    this.womensFellowship,
    this.cottageMeeting,
    this.sundaySchool,
    this.churchCommittee,
    this.trackDistribution,
    this.bibleDistribution,
    this.prayerMeetings,
    this.bibleStudy,
    this.baptisam,
    this.receipts,
    this.payments,
    this.dailyVisitedVillages,
    this.dailyVisitedHouse,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        isLeave: json["isLeave"],
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
        centerDetails: json["centerDetails"],
        fastingPrayer: json["fastingPrayer"],
        youthFellowship: json["youthFellowship"],
        womensFellowship: json["womensFellowship"],
        cottageMeeting: json["cottageMeeting"],
        sundaySchool: json["sundaySchool"],
        churchCommittee: json["churchCommittee"],
        trackDistribution: json["trackDistribution"],
        bibleDistribution: json["bibleDistribution"],
        prayerMeetings: json["prayerMeetings"],
        bibleStudy: json["bibleStudy"],
        baptisam: json["baptisam"],
        receipts: json["receipts"],
        payments: json["payments"],
        dailyVisitedVillages: json["dailyVisitedVillages"],
        dailyVisitedHouse: json["dailyVisitedHouse"],
        id: json["id"],
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
        updatedDate: json["updatedDate"] == null
            ? null
            : DateTime.parse(json["updatedDate"]),
      );

  Map<String, dynamic> toMap() => {
        "isLeave": isLeave,
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
        "centerDetails": centerDetails,
        "fastingPrayer": fastingPrayer,
        "youthFellowship": youthFellowship,
        "womensFellowship": womensFellowship,
        "cottageMeeting": cottageMeeting,
        "sundaySchool": sundaySchool,
        "churchCommittee": churchCommittee,
        "trackDistribution": trackDistribution,
        "bibleDistribution": bibleDistribution,
        "prayerMeetings": prayerMeetings,
        "bibleStudy": bibleStudy,
        "baptisam": baptisam,
        "receipts": receipts,
        "payments": payments,
        "dailyVisitedVillages": dailyVisitedVillages,
        "dailyVisitedHouse": dailyVisitedHouse,
        "id": id,
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
      };
}

class Detail {
  int? memberId;
  FamilyMember? familyMember;
  String? description;
  String? type;
  int? dailyEntryId;
  dynamic dailyEntry;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  Detail({
    this.memberId,
    this.familyMember,
    this.description,
    this.type,
    this.dailyEntryId,
    this.dailyEntry,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  factory Detail.fromJson(String str) => Detail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Detail.fromMap(Map<String, dynamic> json) => Detail(
        memberId: json["memberId"],
        familyMember: json["familyMember"] == null
            ? null
            : FamilyMember.fromMap(json["familyMember"]),
        description: json["description"],
        type: json["type"],
        dailyEntryId: json["dailyEntryId"],
        dailyEntry: json["dailyEntry"],
        id: json["id"],
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
        updatedDate: json["updatedDate"] == null
            ? null
            : DateTime.parse(json["updatedDate"]),
      );

  Map<String, dynamic> toMap() => {
        "memberId": memberId,
        "familyMember": familyMember?.toMap(),
        "description": description,
        "type": type,
        "dailyEntryId": dailyEntryId,
        "dailyEntry": dailyEntry,
        "id": id,
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
      };
}

class FamilyMember {
  String? name;
  int? age;
  int? gender;
  DateTime? dateOfBirth;
  dynamic education;
  bool? isBaptism;
  String? baptismChurch;
  String? occupation;
  DateTime? dateOfBaptism;
  DateTime? dateOfMembership;
  bool? isMarried;
  int? familyId;
  dynamic family;
  String? photo;
  String? phoneNumber;
  bool? isHeadOfFamily;
  int? memberStatus;
  dynamic relationId;
  dynamic relations;
  int? missionariyId;
  dynamic missionaries;
  bool? isDead;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  FamilyMember({
    this.name,
    this.age,
    this.gender,
    this.dateOfBirth,
    this.education,
    this.isBaptism,
    this.baptismChurch,
    this.occupation,
    this.dateOfBaptism,
    this.dateOfMembership,
    this.isMarried,
    this.familyId,
    this.family,
    this.photo,
    this.phoneNumber,
    this.isHeadOfFamily,
    this.memberStatus,
    this.relationId,
    this.relations,
    this.missionariyId,
    this.missionaries,
    this.isDead,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  factory FamilyMember.fromJson(String str) =>
      FamilyMember.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FamilyMember.fromMap(Map<String, dynamic> json) => FamilyMember(
        name: json["name"],
        age: json["age"],
        gender: json["gender"],
        dateOfBirth: json["dateOfBirth"] == null
            ? null
            : DateTime.parse(json["dateOfBirth"]),
        education: json["education"],
        isBaptism: json["isBaptism"],
        baptismChurch: json["baptismChurch"],
        occupation: json["occupation"],
        dateOfBaptism: json["dateOfBaptism"] == null
            ? null
            : DateTime.parse(json["dateOfBaptism"]),
        dateOfMembership: json["dateOfMembership"] == null
            ? null
            : DateTime.parse(json["dateOfMembership"]),
        isMarried: json["isMarried"],
        familyId: json["familyId"],
        family: json["family"],
        photo: json["photo"],
        phoneNumber: json["phoneNumber"],
        isHeadOfFamily: json["isHeadOfFamily"],
        memberStatus: json["memberStatus"],
        relationId: json["relationId"],
        relations: json["relations"],
        missionariyId: json["missionariy_Id"],
        missionaries: json["missionaries"],
        isDead: json["isDead"],
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
        "age": age,
        "gender": gender,
        "dateOfBirth": dateOfBirth?.toIso8601String(),
        "education": education,
        "isBaptism": isBaptism,
        "baptismChurch": baptismChurch,
        "occupation": occupation,
        "dateOfBaptism": dateOfBaptism?.toIso8601String(),
        "dateOfMembership": dateOfMembership?.toIso8601String(),
        "isMarried": isMarried,
        "familyId": familyId,
        "family": family,
        "photo": photo,
        "phoneNumber": phoneNumber,
        "isHeadOfFamily": isHeadOfFamily,
        "memberStatus": memberStatus,
        "relationId": relationId,
        "relations": relations,
        "missionariy_Id": missionariyId,
        "missionaries": missionaries,
        "isDead": isDead,
        "id": id,
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
      };
}

class House {
  int? familyId;
  Family? family;
  int? dailyEntryId;
  dynamic dailyEntry;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  House({
    this.familyId,
    this.family,
    this.dailyEntryId,
    this.dailyEntry,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  factory House.fromJson(String str) => House.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory House.fromMap(Map<String, dynamic> json) => House(
        familyId: json["familyId"],
        family: json["family"] == null ? null : Family.fromMap(json["family"]),
        dailyEntryId: json["dailyEntryId"],
        dailyEntry: json["dailyEntry"],
        id: json["id"],
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
        updatedDate: json["updatedDate"] == null
            ? null
            : DateTime.parse(json["updatedDate"]),
      );

  Map<String, dynamic> toMap() => {
        "familyId": familyId,
        "family": family?.toMap(),
        "dailyEntryId": dailyEntryId,
        "dailyEntry": dailyEntry,
        "id": id,
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
      };
}

class Family {
  String? name;
  String? phoneNumber;
  int? stateId;
  dynamic state;
  int? districtId;
  dynamic district;
  int? talukId;
  dynamic taluk;
  int? religionId;
  dynamic religion;
  int? casteId;
  dynamic caste;
  int? villageId;
  dynamic village;
  bool? isInChruch;
  int? churchId;
  dynamic church;
  String? pinCode;
  String? address;
  int? intrestId;
  dynamic intrestStatus;
  int? missionariyId;
  dynamic missionaries;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  Family({
    this.name,
    this.phoneNumber,
    this.stateId,
    this.state,
    this.districtId,
    this.district,
    this.talukId,
    this.taluk,
    this.religionId,
    this.religion,
    this.casteId,
    this.caste,
    this.villageId,
    this.village,
    this.isInChruch,
    this.churchId,
    this.church,
    this.pinCode,
    this.address,
    this.intrestId,
    this.intrestStatus,
    this.missionariyId,
    this.missionaries,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  factory Family.fromJson(String str) => Family.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Family.fromMap(Map<String, dynamic> json) => Family(
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        stateId: json["stateId"],
        state: json["state"],
        districtId: json["districtId"],
        district: json["district"],
        talukId: json["talukId"],
        taluk: json["taluk"],
        religionId: json["religionId"],
        religion: json["religion"],
        casteId: json["casteId"],
        caste: json["caste"],
        villageId: json["villageId"],
        village: json["village"],
        isInChruch: json["isInChruch"],
        churchId: json["churchId"],
        church: json["church"],
        pinCode: json["pinCode"],
        address: json["address"],
        intrestId: json["intrest_Id"],
        intrestStatus: json["intrestStatus"],
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
        "phoneNumber": phoneNumber,
        "stateId": stateId,
        "state": state,
        "districtId": districtId,
        "district": district,
        "talukId": talukId,
        "taluk": taluk,
        "religionId": religionId,
        "religion": religion,
        "casteId": casteId,
        "caste": caste,
        "villageId": villageId,
        "village": village,
        "isInChruch": isInChruch,
        "churchId": churchId,
        "church": church,
        "pinCode": pinCode,
        "address": address,
        "intrest_Id": intrestId,
        "intrestStatus": intrestStatus,
        "missionariy_Id": missionariyId,
        "missionaries": missionaries,
        "id": id,
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
      };
}

class VillageElement {
  int? villageId;
  VillageVillage? village;
  int? dailyEntryId;
  dynamic dailyEntry;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  VillageElement({
    this.villageId,
    this.village,
    this.dailyEntryId,
    this.dailyEntry,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  factory VillageElement.fromJson(String str) =>
      VillageElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VillageElement.fromMap(Map<String, dynamic> json) => VillageElement(
        villageId: json["villageId"],
        village: json["village"] == null
            ? null
            : VillageVillage.fromMap(json["village"]),
        dailyEntryId: json["dailyEntryId"],
        dailyEntry: json["dailyEntry"],
        id: json["id"],
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
        updatedDate: json["updatedDate"] == null
            ? null
            : DateTime.parse(json["updatedDate"]),
      );

  Map<String, dynamic> toMap() => {
        "villageId": villageId,
        "village": village?.toMap(),
        "dailyEntryId": dailyEntryId,
        "dailyEntry": dailyEntry,
        "id": id,
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
      };
}

class VillageVillage {
  int? stateId;
  dynamic state;
  int? districtId;
  dynamic district;
  int? talukId;
  dynamic taluk;
  String? name;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  VillageVillage({
    this.stateId,
    this.state,
    this.districtId,
    this.district,
    this.talukId,
    this.taluk,
    this.name,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  factory VillageVillage.fromJson(String str) =>
      VillageVillage.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory VillageVillage.fromMap(Map<String, dynamic> json) => VillageVillage(
        stateId: json["stateId"],
        state: json["state"],
        districtId: json["districtId"],
        district: json["district"],
        talukId: json["talukId"],
        taluk: json["taluk"],
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
        "stateId": stateId,
        "state": state,
        "districtId": districtId,
        "district": district,
        "talukId": talukId,
        "taluk": taluk,
        "name": name,
        "id": id,
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
      };
}
