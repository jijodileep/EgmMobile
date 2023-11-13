// To parse this JSON data, do
//
//     final loginModel = loginModelFromMap(jsonString);

import 'dart:convert';

class LoginModel {
  LoginModel({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  Data? data;

  factory LoginModel.fromJson(String str) =>
      LoginModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
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
  Data({
    this.loguser,
    this.famliy,
  });

  Loguser? loguser;
  List<Famliy>? famliy;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        loguser:
            json["loguser"] == null ? null : Loguser.fromMap(json["loguser"]),
        famliy: json["famliy"] == null
            ? []
            : List<Famliy>.from(json["famliy"]!.map((x) => Famliy.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "loguser": loguser?.toMap(),
        "famliy": famliy == null
            ? []
            : List<dynamic>.from(famliy!.map((x) => x.toMap())),
      };
}

class Famliy {
  Famliy({
    this.name,
    this.relation,
    this.id,
    this.missionariyId,
  });

  String? name;
  String? relation;
  int? id;
  int? missionariyId;

  factory Famliy.fromJson(String str) => Famliy.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Famliy.fromMap(Map<String, dynamic> json) => Famliy(
        name: json["name"],
        relation: json["relation"],
        id: json["id"],
        missionariyId: json["missionariy_Id"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "relation": relation,
        "id": id,
        "missionariy_Id": missionariyId,
      };
}

class Loguser {
  Loguser({
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

  factory Loguser.fromJson(String str) => Loguser.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Loguser.fromMap(Map<String, dynamic> json) => Loguser(
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
