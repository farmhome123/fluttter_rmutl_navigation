// To parse this JSON data, do
//
//     final dataEvens = dataEvensFromJson(jsonString);

import 'dart:convert';

List<DataEvens> dataEvensFromJson(String str) =>
    List<DataEvens>.from(json.decode(str).map((x) => DataEvens.fromJson(x)));

String dataEvensToJson(List<DataEvens> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataEvens {
  DataEvens({
    required this.id,
    required this.name,
    required this.image,
    required this.buildingevens,
    required this.detailevens,
    required this.urlgooglemap,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String name;
  String image;
  String buildingevens;
  String detailevens;
  String urlgooglemap;
  DateTime createdAt;
  DateTime updatedAt;

  factory DataEvens.fromJson(Map<String, dynamic> json) => DataEvens(
        id: json["id"].toString(),
        name: json["name"],
        image: json["image"],
        buildingevens: json["buildingevens"],
        detailevens: json["detailevens"],
        urlgooglemap: json["urlgooglemap"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "buildingevens": buildingevens,
        "detailevens": detailevens,
        "urlgooglemap": urlgooglemap,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
