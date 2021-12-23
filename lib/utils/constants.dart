// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

const String PLACEHOLDER_IMAGE = 'assets/icons/placeholder.png';
const String APP_LOGO = 'assets/icons/logo.png';
const String SEARCH_ICON = 'assets/icons/search.png';
const String FILTER_ICON = 'assets/icons/filter.png';
const String SORT_ICON = 'assets/icons/sort.png';
const String HAMBURGER_ICON = 'assets/icons/hamburger.png';
const String PROFILE_ICON = 'assets/icons/profile.png';
const String TALK_ICON = 'assets/icons/talk.png';
////
///
const String PANCHANG_DESCRIPTION =
    'India is a country known for its festival but knowing the exact dates can sometimes be difficult. To ensure you do not miss out on the critical dates we bring you the daily panchang.';
enum SortNames {
  All,
  Increasing_Exp,
  Decreasing_Exp,
  Increasing_price,
  Decreasing_price
}
 final List<Widget> titleAndDescription = [
    const Text(
      'Daily Panchang',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
    ),
    const SizedBox(
      height: 10,
    ),
    const Text(PANCHANG_DESCRIPTION,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300)),
    const SizedBox(
      height: 15,
    ),
  ];


Widget iconWidget(String path, double size, double padding) => Padding(
      padding: EdgeInsets.all(padding),
      child: Image.asset(
        path,
        height: size,
        width: size,
      ),
    );

AppBar appBarWidget() => AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: iconWidget(HAMBURGER_ICON, 55, 0),
      title: iconWidget(APP_LOGO, 60, 0),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: iconWidget(PROFILE_ICON, 30, 0),
        )
      ],
    );

Widget panchangDataHeading(String heading) {
  return Text(heading,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15));
}

Widget panchangDataKeyValue(String key, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
          flex: 1,
          child: Text(
            key,
            style: const TextStyle(
                fontWeight: FontWeight.w100, color: Colors.grey, fontSize: 14),
          )),
      const SizedBox(
        width: 20,
      ),
      Expanded(
          flex: 2,
          child: Text(value,
              style: const TextStyle(
                  fontWeight: FontWeight.w100,
                  color: Colors.grey,
                  fontSize: 14))),
    ],
  );
}

String returnTime(dynamic dateTime) =>
    '${dateTime.hour} hr ${dateTime.minute} min ${dateTime.second} sec';

String returnChipName(SortNames sort) {
  if (sort == SortNames.Increasing_Exp) {
    return 'Experience: Low to High';
  } else if (sort == SortNames.Decreasing_Exp) {
    return 'Experience: High to Low';
  } else if (sort == SortNames.Increasing_price) {
    return 'Price: Low to High';
  } else {
    return  'Price: High to Low';
  }
}
