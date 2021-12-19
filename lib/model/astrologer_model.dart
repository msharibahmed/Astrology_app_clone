// To parse this JSON data, do
//
//     final AstrologerModel = AstrologerModelFromJson(jsonString);

import 'dart:convert';

AstrologerModel AstrologerModelFromJson(String str) => AstrologerModel.fromJson(json.decode(str));

String AstrologerModelToJson(AstrologerModel data) => json.encode(data.toJson());

class AstrologerModel {
    AstrologerModel({
       required this.id,
       required this.urlSlug,
        required this.namePrefix,
        required this.firstName,
        required this.lastName,
      required   this.aboutMe,
      required   this.profliePicUrl,
      required   this.experience,
      required   this.languages,
      required   this.minimumCallDuration,
      required   this.minimumCallDurationCharges,
      required   this.additionalPerMinuteCharges,
      required   this.isAvailable,
      required   this.rating,
      required   this.skills,
      required   this.isOnCall,
      required   this.freeMinutes,
      required   this.additionalMinute,
      required   this.images,
      required   this.availability,
    });

    int id;
    String urlSlug;
    dynamic namePrefix;
    String firstName;
    String lastName;
    String aboutMe;
    dynamic profliePicUrl;
    int experience;
    List<Language> languages;
    int minimumCallDuration;
    int minimumCallDurationCharges;
    int additionalPerMinuteCharges;
    bool isAvailable;
    dynamic rating;
    List<Skill> skills;
    bool isOnCall;
    int freeMinutes;
    int additionalMinute;
    Images images;
    Availability availability;

    factory AstrologerModel.fromJson(Map<String, dynamic> json) => AstrologerModel(
        id: json["id"],
        urlSlug: json["urlSlug"],
        namePrefix: json["namePrefix"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        aboutMe: json["aboutMe"],
        profliePicUrl: json["profliePicUrl"],
        experience: json["experience"],
        languages: List<Language>.from(json["languages"].map((x) => Language.fromJson(x))),
        minimumCallDuration: json["minimumCallDuration"],
        minimumCallDurationCharges: json["minimumCallDurationCharges"],
        additionalPerMinuteCharges: json["additionalPerMinuteCharges"],
        isAvailable: json["isAvailable"],
        rating: json["rating"],
        skills: List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
        isOnCall: json["isOnCall"],
        freeMinutes: json["freeMinutes"],
        additionalMinute: json["additionalMinute"],
        images: Images.fromJson(json["images"]),
        availability: Availability.fromJson(json["availability"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "urlSlug": urlSlug,
        "namePrefix": namePrefix,
        "firstName": firstName,
        "lastName": lastName,
        "aboutMe": aboutMe,
        "profliePicUrl": profliePicUrl,
        "experience": experience,
        "languages": List<dynamic>.from(languages.map((x) => x.toJson())),
        "minimumCallDuration": minimumCallDuration,
        "minimumCallDurationCharges": minimumCallDurationCharges,
        "additionalPerMinuteCharges": additionalPerMinuteCharges,
        "isAvailable": isAvailable,
        "rating": rating,
        "skills": List<dynamic>.from(skills.map((x) => x.toJson())),
        "isOnCall": isOnCall,
        "freeMinutes": freeMinutes,
        "additionalMinute": additionalMinute,
        "images": images.toJson(),
        "availability": availability.toJson(),
    };
}

class Availability {
    Availability({
       required  this.days,
      required   this.slot,
    });

    List<String> days;
    Slot slot;

    factory Availability.fromJson(Map<String, dynamic> json) => Availability(
        days: List<String>.from(json["days"].map((x) => x)),
        slot: Slot.fromJson(json["slot"]),
    );

    Map<String, dynamic> toJson() => {
        "days": List<dynamic>.from(days.map((x) => x)),
        "slot": slot.toJson(),
    };
}

class Slot {
    Slot({
       required  this.toFormat,
       required  this.fromFormat,
       required  this.from,
       required  this.to,
    });

    String toFormat;
    String fromFormat;
    String from;
    String to;

    factory Slot.fromJson(Map<String, dynamic> json) => Slot(
        toFormat: json["toFormat"],
        fromFormat: json["fromFormat"],
        from: json["from"],
        to: json["to"],
    );

    Map<String, dynamic> toJson() => {
        "toFormat": toFormat,
        "fromFormat": fromFormat,
        "from": from,
        "to": to,
    };
}

class Images {
    Images({
      required   this.small,
      required   this.large,
      required   this.medium,
    });

    Large small;
    Large large;
    Large medium;

    factory Images.fromJson(Map<String, dynamic> json) => Images(
        small: Large.fromJson(json["small"]),
        large: Large.fromJson(json["large"]),
        medium: Large.fromJson(json["medium"]),
    );

    Map<String, dynamic> toJson() => {
        "small": small.toJson(),
        "large": large.toJson(),
        "medium": medium.toJson(),
    };
}

class Large {
    Large({
      required   this.imageUrl,
       required  this.id,
    });

    String imageUrl;
    int id;

    factory Large.fromJson(Map<String, dynamic> json) => Large(
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        id: json["id"] == null ? null : json["id"],
    );

    Map<String, dynamic> toJson() => {
        "imageUrl": imageUrl == null ? null : imageUrl,
        "id": id == null ? null : id,
    };
}

class Language {
    Language({
       required  this.id,
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
     required    this.id,
     required    this.name,
      required   this.description,
    });

    int id;
    String name;
    String description;

    factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        id: json["id"],
        name: json["name"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
    };
}
