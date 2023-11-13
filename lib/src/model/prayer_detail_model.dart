// To parse this JSON data, do
//
//     final prayerDetailModel = prayerDetailModelFromMap(jsonString);

import 'dart:convert';

class PrayerDetailModel {
  int? code;
  String? message;
  PrayerDetailModelData? data;

  PrayerDetailModel({
    this.code,
    this.message,
    this.data,
  });

  factory PrayerDetailModel.fromJson(String str) =>
      PrayerDetailModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PrayerDetailModel.fromMap(Map<String, dynamic> json) =>
      PrayerDetailModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? null
            : PrayerDetailModelData.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "data": data?.toMap(),
      };
}

class PrayerDetailModelData {
  DataData? data;
  List<Comment>? comments;

  PrayerDetailModelData({
    this.data,
    this.comments,
  });

  factory PrayerDetailModelData.fromJson(String str) =>
      PrayerDetailModelData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PrayerDetailModelData.fromMap(Map<String, dynamic> json) =>
      PrayerDetailModelData(
        data: json["data"] == null ? null : DataData.fromMap(json["data"]),
        comments: json["comments"] == null
            ? []
            : List<Comment>.from(
                json["comments"]!.map((x) => Comment.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": data?.toMap(),
        "comments": comments == null
            ? []
            : List<dynamic>.from(comments!.map((x) => x.toMap())),
      };
}

class Comment {
  int? prayerRequestId;
  dynamic prayerRequest;
  String? description;
  int? missionariyId;
  Missionaries? missionaries;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  Comment({
    this.prayerRequestId,
    this.prayerRequest,
    this.description,
    this.missionariyId,
    this.missionaries,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  factory Comment.fromJson(String str) => Comment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Comment.fromMap(Map<String, dynamic> json) => Comment(
        prayerRequestId: json["prayerRequestID"],
        prayerRequest: json["prayerRequest"],
        description: json["description"],
        missionariyId: json["missionariy_Id"],
        missionaries: json["missionaries"] == null
            ? null
            : Missionaries.fromMap(json["missionaries"]),
        id: json["id"],
        createdDate: json["createdDate"] == null
            ? null
            : DateTime.parse(json["createdDate"]),
        updatedDate: json["updatedDate"] == null
            ? null
            : DateTime.parse(json["updatedDate"]),
      );

  Map<String, dynamic> toMap() => {
        "prayerRequestID": prayerRequestId,
        "prayerRequest": prayerRequest,
        "description": description,
        "missionariy_Id": missionariyId,
        "missionaries": missionaries?.toMap(),
        "id": id,
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
      };
}

class Missionaries {
  String? name;
  String? emailAddress;
  String? userName;
  String? phoneNumber;
  String? address;
  int? categoryId;
  dynamic missionariesCategory;
  String? password;
  int? noLoginAttempt;
  int? isLocked;
  String? salt;
  String? photo;
  int? stateId;
  dynamic state;
  int? districtId;
  dynamic district;
  int? talukId;
  dynamic taluk;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  Missionaries({
    this.name,
    this.emailAddress,
    this.userName,
    this.phoneNumber,
    this.address,
    this.categoryId,
    this.missionariesCategory,
    this.password,
    this.noLoginAttempt,
    this.isLocked,
    this.salt,
    this.photo,
    this.stateId,
    this.state,
    this.districtId,
    this.district,
    this.talukId,
    this.taluk,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  factory Missionaries.fromJson(String str) =>
      Missionaries.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Missionaries.fromMap(Map<String, dynamic> json) => Missionaries(
        name: json["name"],
        emailAddress: json["emailAddress"],
        userName: json["userName"],
        phoneNumber: json["phoneNumber"],
        address: json["address"],
        categoryId: json["categoryId"],
        missionariesCategory: json["missionariesCategory"],
        password: json["password"],
        noLoginAttempt: json["noLoginAttempt"],
        isLocked: json["isLocked"],
        salt: json["salt"],
        photo: json["photo"],
        stateId: json["state_Id"],
        state: json["state"],
        districtId: json["districtId"],
        district: json["district"],
        talukId: json["talukId"],
        taluk: json["taluk"],
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
        "emailAddress": emailAddress,
        "userName": userName,
        "phoneNumber": phoneNumber,
        "address": address,
        "categoryId": categoryId,
        "missionariesCategory": missionariesCategory,
        "password": password,
        "noLoginAttempt": noLoginAttempt,
        "isLocked": isLocked,
        "salt": salt,
        "photo": photo,
        "state_Id": stateId,
        "state": state,
        "districtId": districtId,
        "district": district,
        "talukId": talukId,
        "taluk": taluk,
        "id": id,
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
      };
}

class DataData {
  String? name;
  String? description;
  int? missionariyId;
  dynamic missionaries;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  DataData({
    this.name,
    this.description,
    this.missionariyId,
    this.missionaries,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  factory DataData.fromJson(String str) => DataData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataData.fromMap(Map<String, dynamic> json) => DataData(
        name: json["name"],
        description: json["description"],
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
        "description": description,
        "missionariy_Id": missionariyId,
        "missionaries": missionaries,
        "id": id,
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
      };
}
