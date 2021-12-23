import 'package:flutter/material.dart';
import 'package:india_today_assignment/utils/constants.dart';

class PanchangDataMiscellaneous extends StatelessWidget {
  final String heading;
  final String start;
  final String end;
  const PanchangDataMiscellaneous(
      {Key? key, required this.heading, required this.start, required this.end})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        panchangDataHeading(heading),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue('Start:', start),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue('End', end),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}