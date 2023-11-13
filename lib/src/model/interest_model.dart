import 'dart:convert';

class InterestModel {
  InterestModel({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  List<InterestData>? data;

  factory InterestModel.fromJson(String str) =>
      InterestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InterestModel.fromMap(Map<String, dynamic> json) => InterestModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<InterestData>.from(
                json["data"]!.map((x) => InterestData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class InterestData {
  InterestData({
    this.name,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  String? name;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  factory InterestData.fromJson(String str) =>
      InterestData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InterestData.fromMap(Map<String, dynamic> json) => InterestData(
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
