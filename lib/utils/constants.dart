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

enum SortNames {
  All,
  Increasing_Exp,
  Decreasing_Exp,
  Increasing_price,
  Decreasing_price
}

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
