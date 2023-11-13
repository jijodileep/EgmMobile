// To parse this JSON data, do
//
//     final getFamilyMemberModel = getFamilyMemberModelFromMap(jsonString);

import 'dart:convert';

class GetFamilyMemberModel {
  GetFamilyMemberModel({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  List<FamilyMemberData>? data;

  factory GetFamilyMemberModel.fromJson(String str) =>
      GetFamilyMemberModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetFamilyMemberModel.fromMap(Map<String, dynamic> json) =>
      GetFamilyMemberModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<FamilyMemberData>.from(
                json["data"]!.map((x) => FamilyMemberData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class FamilyMemberData {
  FamilyMemberData({
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
    this.id,
    this.isDead,
    this.createdDate,
    this.updatedDate,
  });

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
  int? isMarried;
  int? familyId;
  Family? family;
  String? photo;
  String? phoneNumber;
  bool? isHeadOfFamily;
  int? memberStatus;
  int? relationId;
  dynamic relations;
  int? missionariyId;
  dynamic missionaries;
  bool? isDead;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  factory FamilyMemberData.fromJson(String str) =>
      FamilyMemberData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FamilyMemberData.fromMap(Map<String, dynamic> json) =>
      FamilyMemberData(
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
        family: json["family"] == null ? null : Family.fromMap(json["family"]),
        photo: json["photo"],
        phoneNumber: json["phoneNumber"],
        isHeadOfFamily: json["isHeadOfFamily"],
        memberStatus: json["memberStatus"],
        relationId: json["relationId"],
        relations: json["relations"],
        missionariyId: json["missionariy_Id"],
        missionaries: json["missionaries"],
        id: json["id"],
        isDead: json["isDead"],
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
        "family": family?.toMap(),
        "photo": photo,
        "phoneNumber": phoneNumber,
        "isHeadOfFamily": isHeadOfFamily,
        "memberStatus": memberStatus,
        "missionariy_Id": missionariyId,
        "missionaries": missionaries,
        "id": id,
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
      };
}

class Family {
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

  dynamic name;
  dynamic phoneNumber;
  dynamic stateId;
  dynamic state;
  dynamic districtId;
  dynamic district;
  dynamic talukId;
  dynamic taluk;
  dynamic religionId;
  dynamic religion;
  dynamic casteId;
  dynamic caste;
  dynamic villageId;
  dynamic village;
  dynamic isInChruch;
  dynamic churchId;
  dynamic church;
  dynamic pinCode;
  dynamic address;
  dynamic intrestId;
  dynamic intrestStatus;
  dynamic missionariyId;
  dynamic missionaries;
  dynamic id;
  DateTime? createdDate;
  DateTime? updatedDate;

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
