// To parse this JSON data, do
//
//     final panchangDateLocationModel = panchangDateLocationModelFromJson(jsonString);

import 'dart:convert';

PanchangDateLocationModel panchangDateLocationModelFromJson(String str) =>
    PanchangDateLocationModel.fromJson(json.decode(str));

String panchangDateLocationModelToJson(PanchangDateLocationModel data) =>
    json.encode(data.toJson());

class PanchangDateLocationModel {
  PanchangDateLocationModel({
    required this.day,
    required this.month,
    required this.year,
    required this.placeId,
  });

  int day;
  int month;
  int year;
  String placeId;

  factory PanchangDateLocationModel.fromJson(Map<String, dynamic> json) =>
      PanchangDateLocationModel(
        day: json["day"],
        month: json["month"],
        year: json["year"],
        placeId: json["placeId"],
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "month": month,
        "year": year,
        "placeId": placeId,
      };
}
