import 'package:flutter/material.dart';
import 'package:india_today_assignment/model/panchang_model.dart';
import 'package:india_today_assignment/utils/constants.dart';

class YogSection extends StatelessWidget {
  final PanchangModel panchangModel;

  const YogSection({Key? key, required this.panchangModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final YogDetails _yogDetails = panchangModel.yog.details;
    final EndTime _yogEndTime = panchangModel.yog.endTime;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        panchangDataHeading('Yog'),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue('Yog Number:', _yogDetails.yogNumber.toString()),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue('Yog Name:', _yogDetails.yogName),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue('Special:', _yogDetails.special),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue('Meaning:', _yogDetails.meaning),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue('End Time:', returnTime(_yogEndTime)),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
