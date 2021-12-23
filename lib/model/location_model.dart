// To parse this JSON data, do
//
//     final locationModel = locationModelFromJson(jsonString);

import 'dart:convert';

LocationModel locationModelFromJson(String str) => LocationModel.fromJson(json.decode(str));

String locationModelToJson(LocationModel data) => json.encode(data.toJson());

class LocationModel {
    LocationModel({
       required this.placeName,
       required this.placeId,
    });

    String placeName;
    String placeId;

    factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
        placeName: json["placeName"],
        placeId: json["placeId"],
    );

    Map<String, dynamic> toJson() => {
        "placeName": placeName,
        "placeId": placeId,
    };
}
