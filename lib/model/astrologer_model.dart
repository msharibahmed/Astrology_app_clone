// To parse this JSON data, do
//
//     final astrolgerModel = astrolgerModelFromJson(jsonString);

import 'dart:convert';

AstrologerModel astrolgerModelFromJson(String str) =>
    AstrologerModel.fromJson(json.decode(str));

String astrolgerModelToJson(AstrologerModel data) => json.encode(data.toJson());

class AstrologerModel {
  AstrologerModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.experience,
    required this.additionalPerMinuteCharges,
    required this.languages,
    required this.skills,
    required this.images,
  });

  int id;
  String firstName;
  String lastName;
  double experience;
  double additionalPerMinuteCharges;
  List<Language> languages;
  List<Skill> skills;
  Images images;

  factory AstrologerModel.fromJson(Map<String, dynamic> json) =>
      AstrologerModel(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        experience: json["experience"],
        additionalPerMinuteCharges:json["additionalPerMinuteCharges"],
        languages: List<Language>.from(
            json["languages"].map((x) => Language.fromJson(x))),
        skills: List<Skill>.from(
            json["skills"].map((x) => Skill.fromJson(x))),
        images: Images.fromJson(json["images"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "experience": experience,
        "additionalPerMinuteCharges":additionalPerMinuteCharges,
        "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
        "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
        "images": images.toJson(),
      };
}

class Images {
  Images({
    required this.large,
  });

  Large large;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        large: Large.fromJson(json["large"]),
      );

  Map<String, dynamic> toJson() => {
        "large": large.toJson(),
      };
}

class Large {
  Large({
    required this.imageUrl,
    required this.id,
  });

  String imageUrl;
  int id;

  factory Large.fromJson(Map<String, dynamic> json) => Large(
        imageUrl: json["imageUrl"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl,
        "id": id,
      };
}

class Language {
  Language({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
class Skill {
  Skill({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
