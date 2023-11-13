// To parse this JSON data, do
//
//     final allMemberModel = allMemberModelFromMap(jsonString);

import 'dart:convert';

class AllMemberModel {
  int? code;
  String? message;
  List<MemberData>? data;

  AllMemberModel({
    this.code,
    this.message,
    this.data,
  });

  factory AllMemberModel.fromJson(String str) =>
      AllMemberModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AllMemberModel.fromMap(Map<String, dynamic> json) => AllMemberModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<MemberData>.from(
                json["data"]!.map((x) => MemberData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class MemberData {
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
  int? relationId;
  dynamic relations;
  int? missionariyId;
  dynamic missionaries;
  bool? isDead;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  MemberData({
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

  factory MemberData.fromJson(String str) =>
      MemberData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MemberData.fromMap(Map<String, dynamic> json) => MemberData(
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
