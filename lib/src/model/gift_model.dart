// To parse this JSON data, do
//
//     final giftModel = giftModelFromMap(jsonString);

import 'dart:convert';

GiftModel giftModelFromMap(String str) => GiftModel.fromMap(json.decode(str));

String giftModelToMap(GiftModel data) => json.encode(data.toMap());

class GiftModel {
  int? code;
  String? message;
  List<Datum>? data;

  GiftModel({
    this.code,
    this.message,
    this.data,
  });

  factory GiftModel.fromMap(Map<String, dynamic> json) => GiftModel(
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
  DateTime? dateTday;
  int? missionaryId;
  dynamic missionaries;
  dynamic type;
  int? giftTypeId;
  GiftType? giftType;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  Datum({
    this.dateTday,
    this.missionaryId,
    this.missionaries,
    this.type,
    this.giftTypeId,
    this.giftType,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        dateTday:
            json["dateTday"] == null ? null : DateTime.parse(json["dateTday"]),
        missionaryId: json["missionary_Id"],
        missionaries: json["missionaries"],
        type: json["type"]!,
        giftTypeId: json["giftTypeID"],
        giftType: json["giftType"] == null
            ? null
            : GiftType.fromMap(json["giftType"]),
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
        "missionary_Id": missionaryId,
        "missionaries": missionaries,
        "type": type,
        "giftTypeID": giftTypeId,
        "giftType": giftType?.toMap(),
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
