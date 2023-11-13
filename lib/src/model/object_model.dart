class ObjectModel {
  List<int> memberID;
  String description;
  String type;

  ObjectModel({
    required this.memberID,
    required this.description,
    required this.type,
  });

  factory ObjectModel.fromJson(Map<String, dynamic> json) {
    return ObjectModel(
      memberID: List<int>.from(json['memberID']),
      description: json['description'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'memberID': memberID,
      'description': description,
      'type': type,
    };
  }
}
