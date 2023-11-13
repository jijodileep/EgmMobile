// To parse this JSON data, do
//
//     final stateModel = stateModelFromMap(jsonString);

import 'dart:convert';

class StateModel {
  StateModel({
    this.code,
    this.message,
    this.data,
  });

  int? code;
  String? message;
  List<StateData>? data;

  factory StateModel.fromJson(String str) =>
      StateModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StateModel.fromMap(Map<String, dynamic> json) => StateModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<StateData>.from(
                json["data"]!.map((x) => StateData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class StateData {
  StateData({
    this.name,
    this.id,
    this.createdDate,
    this.updatedDate,
  });

  String? name;
  int? id;
  DateTime? createdDate;
  DateTime? updatedDate;

  factory StateData.fromJson(String str) => StateData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StateData.fromMap(Map<String, dynamic> json) => StateData(
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
