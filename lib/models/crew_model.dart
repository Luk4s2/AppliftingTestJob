import 'dart:convert';

List<CrewModel> crewModelFromJson(String str) =>
    List<CrewModel>.from(json.decode(str).map((x) => CrewModel.fromJson(x)));

String crewModelToJson(List<CrewModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

/// Model for crew data API
class CrewModel {
  CrewModel({
    required this.name,
    required this.agency,
    required this.image,
    required this.wikipedia,
    required this.launches,
    required this.status,
    required this.id,
  });

  final String name;
  final String agency;
  final String image;
  final String wikipedia;
  final List<String> launches;
  final String status;
  final String id;

  factory CrewModel.fromJson(Map<String, dynamic> json) => CrewModel(
        name: json["name"],
        agency: json["agency"],
        image: json["image"],
        wikipedia: json["wikipedia"],
        launches: List<String>.from(json["launches"].map((x) => x)),
        status: json["status"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "agency": agency,
        "image": image,
        "wikipedia": wikipedia,
        "launches": List<dynamic>.from(launches.map((x) => x)),
        "status": status,
        "id": id,
      };
}
