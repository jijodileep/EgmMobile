// To parse this JSON data, do
//
//     final allFamilyModel = allFamilyModelFromMap(jsonString);

import 'dart:convert';

class AllFamilyModel {
  int? code;
  String? message;
  List<FamilyData>? data;

  AllFamilyModel({
    this.code,
    this.message,
    this.data,
  });

  factory AllFamilyModel.fromJson(String str) =>
      AllFamilyModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AllFamilyModel.fromMap(Map<String, dynamic> json) => AllFamilyModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<FamilyData>.from(
                json["data"]!.map((x) => FamilyData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class FamilyData {
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

  FamilyData({
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

  factory FamilyData.fromJson(String str) =>
      FamilyData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FamilyData.fromMap(Map<String, dynamic> json) => FamilyData(
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
