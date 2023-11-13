// To parse this JSON data, do
//
//     final giftDetailModel = giftDetailModelFromMap(jsonString);

import 'dart:convert';

class GiftDetailModel {
  int? code;
  String? message;
  GiftDetailModelData? data;

  GiftDetailModel({
    this.code,
    this.message,
    this.data,
  });

  factory GiftDetailModel.fromJson(String str) =>
      GiftDetailModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GiftDetailModel.fromMap(Map<String, dynamic> json) => GiftDetailModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : GiftDetailModelData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "data": data?.toMap(),
      };
}

class GiftDetailModelData {
  DataData? data;
  List<Detail>? details;

  GiftDetailModelData({
    this.data,
    this.details,
  });

  factory GiftDetailModelData.fromJson(String str) =>
      GiftDetailModelData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GiftDetailModelData.fromMap(Map<String, dynamic> json) =>
      GiftDetailModelData(
        data: json["data"] == null ? null : DataData.fromMap(json["data"]),
        details: json["details"] == null
            ? []
            : List<Detail>.from(json["details"]!.map((x) => Detail.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
        "details": details == null
            ? []
            : List<dynamic>.from(details!.map((x) => x.toMap())),
      };
}

class DataData {
  DateTime? dateTday;
  int? missionaryId;
  dynamic missionaries;
  int? id;
  int? giftTypeID;
  GiftType? giftType;
  DateTime? createdDate;
  DateTime? updatedDate;

  DataData(
      {this.dateTday,
      this.missionaryId,
      this.missionaries,
      this.id,
      this.giftType,
      this.createdDate,
      this.updatedDate,
      this.giftTypeID});

  factory DataData.fromJson(String str) => DataData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataData.fromMap(Map<String, dynamic> json) => DataData(
        dateTday:
            json["dateTday"] == null ? null : DateTime.parse(json["dateTday"]),
        missionaryId: json["missionary_Id"],
        missionaries: json["missionaries"],
        id: json["id"],
        giftTypeID: json["giftTypeID"],
        giftType: json["giftType"] == null
            ? null
            : GiftType.fromMap(json["giftType"]),
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
        updatedDate: json["updatedDate"] == null
            ? null
            : DateTime.parse(json["updatedDate"]),
      );

  Map<String, dynamic> toMap() => {
        "dateTday": dateTday?.toIso8601String(),
        "missionary_Id": missionaryId,
        "missionaries": missionaries,
        "id": id,
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
      };
}

class GiftType {
  dynamic name;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  GiftType({
    this.name,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  factory GiftType.fromMap(Map<String, dynamic> json) => GiftType(
        name: json["name"]!,
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

class Detail {
  int? memberId;
  FamilyMember? familyMember;
  String? description;
  String? type;
  int? christmasGiftId;
  dynamic christmasGifts;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  Detail({
    this.memberId,
    this.familyMember,
    this.description,
    this.type,
    this.christmasGiftId,
    this.christmasGifts,
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
        christmasGiftId: json["christmasGiftId"],
        christmasGifts: json["christmasGifts"],
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
        "christmasGiftId": christmasGiftId,
        "christmasGifts": christmasGifts,
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
  String? education;
  bool? isBaptism;
  String? baptismChurch;
  String? occupation;
  DateTime? dateOfBaptism;
  DateTime? dateOfMembership;
  dynamic isMarried;
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
