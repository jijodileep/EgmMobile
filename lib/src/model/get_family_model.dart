// To parse this JSON data, do
//
//     final getFamilyModel = getFamilyModelFromMap(jsonString);

import 'dart:convert';

class GetFamilyModel {
  GetFamilyModel({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  List<FamilyData>? data;

  factory GetFamilyModel.fromJson(String str) =>
      GetFamilyModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory GetFamilyModel.fromMap(Map<String, dynamic> json) => GetFamilyModel(
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
  FamilyData({
    this.family,
    this.nameOfHead,
  });

  Family? family;
  String? nameOfHead;

  factory FamilyData.fromJson(String str) =>
      FamilyData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FamilyData.fromMap(Map<String, dynamic> json) => FamilyData(
        family: json["family"] == null ? null : Family.fromMap(json["family"]),
        nameOfHead: json["nameOfHead"],
      );

  Map<String, dynamic> toMap() => {
        "family": family?.toMap(),
        "nameOfHead": nameOfHead,
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

  String? name;
  String? phoneNumber;
  int? stateId;
  IntrestStatus? state;
  int? districtId;
  District? district;
  int? talukId;
  Taluk? taluk;
  int? religionId;
  dynamic religion;
  int? casteId;
  Caste? caste;
  int? villageId;
  Village? village;
  bool? isInChruch;
  int? churchId;
  Church? church;
  String? pinCode;
  String? address;
  int? intrestId;
  IntrestStatus? intrestStatus;
  int? missionariyId;
  dynamic missionaries;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  factory Family.fromJson(String str) => Family.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Family.fromMap(Map<String, dynamic> json) => Family(
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        stateId: json["stateId"],
        state:
            json["state"] == null ? null : IntrestStatus.fromMap(json["state"]),
        districtId: json["districtId"],
        district: json["district"] == null
            ? null
            : District.fromMap(json["district"]),
        talukId: json["talukId"],
        taluk: json["taluk"] == null ? null : Taluk.fromMap(json["taluk"]),
        religionId: json["religionId"],
        religion: json["religion"],
        casteId: json["casteId"],
        caste: json["caste"] == null ? null : Caste.fromMap(json["caste"]),
        villageId: json["villageId"],
        village:
            json["village"] == null ? null : Village.fromMap(json["village"]),
        isInChruch: json["isInChruch"],
        churchId: json["churchId"],
        church: json["church"] == null ? null : Church.fromMap(json["church"]),
        pinCode: json["pinCode"],
        address: json["address"],
        intrestId: json["intrest_Id"],
        intrestStatus: json["intrestStatus"] == null
            ? null
            : IntrestStatus.fromMap(json["intrestStatus"]),
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
        "state": state?.toMap(),
        "districtId": districtId,
        "district": district?.toMap(),
        "talukId": talukId,
        "taluk": taluk?.toMap(),
        "religionId": religionId,
        "religion": religion,
        "casteId": casteId,
        "caste": caste?.toMap(),
        "villageId": villageId,
        "village": village?.toMap(),
        "isInChruch": isInChruch,
        "churchId": churchId,
        "church": church?.toMap(),
        "pinCode": pinCode,
        "address": address,
        "intrest_Id": intrestId,
        "intrestStatus": intrestStatus?.toMap(),
        "missionariy_Id": missionariyId,
        "missionaries": missionaries,
        "id": id,
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
      };
}

class Caste {
  Caste({
    this.name,
    this.religionId,
    this.religion,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  String? name;
  int? religionId;
  dynamic religion;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  factory Caste.fromJson(String str) => Caste.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Caste.fromMap(Map<String, dynamic> json) => Caste(
        name: json["name"],
        religionId: json["religionId"],
        religion: json["religion"],
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
        "religionId": religionId,
        "religion": religion,
        "id": id,
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
      };
}

class Church {
  Church({
    this.name,
    this.address,
    this.phone,
    this.description,
    this.userId,
    this.user,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  String? name;
  String? address;
  String? phone;
  String? description;
  int? userId;
  dynamic user;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  factory Church.fromJson(String str) => Church.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Church.fromMap(Map<String, dynamic> json) => Church(
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
        description: json["description"],
        userId: json["userId"],
        user: json["user"],
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
        "address": address,
        "phone": phone,
        "description": description,
        "userId": userId,
        "user": user,
        "id": id,
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
      };
}

class District {
  District({
    this.name,
    this.stateId,
    this.state,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  String? name;
  int? stateId;
  IntrestStatus? state;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  factory District.fromJson(String str) => District.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory District.fromMap(Map<String, dynamic> json) => District(
        name: json["name"],
        stateId: json["stateId"],
        state:
            json["state"] == null ? null : IntrestStatus.fromMap(json["state"]),
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
        "stateId": stateId,
        "state": state?.toMap(),
        "id": id,
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
      };
}

class IntrestStatus {
  IntrestStatus({
    this.name,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  String? name;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  factory IntrestStatus.fromJson(String str) =>
      IntrestStatus.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory IntrestStatus.fromMap(Map<String, dynamic> json) => IntrestStatus(
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

class Taluk {
  Taluk({
    this.stateId,
    this.state,
    this.districtId,
    this.district,
    this.name,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  int? stateId;
  IntrestStatus? state;
  int? districtId;
  District? district;
  String? name;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  factory Taluk.fromJson(String str) => Taluk.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Taluk.fromMap(Map<String, dynamic> json) => Taluk(
        stateId: json["stateId"],
        state:
            json["state"] == null ? null : IntrestStatus.fromMap(json["state"]),
        districtId: json["districtId"],
        district: json["district"] == null
            ? null
            : District.fromMap(json["district"]),
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
        "state": state?.toMap(),
        "districtId": districtId,
        "district": district?.toMap(),
        "name": name,
        "id": id,
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
      };
}

class Village {
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

  Village({
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

  factory Village.fromJson(String str) => Village.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Village.fromMap(Map<String, dynamic> json) => Village(
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
