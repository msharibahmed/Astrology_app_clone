import 'package:flutter/material.dart';
import 'package:india_today_assignment/model/panchang_model.dart';
import 'package:india_today_assignment/utils/constants.dart';

class TithiSection extends StatelessWidget {
  final PanchangModel panchangModel;
  const TithiSection({Key? key, required this.panchangModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TithiDetails _tithiDetails = panchangModel.tithi.details;
    EndTime _tithiEndTime = panchangModel.tithi.endTime;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        panchangDataHeading('Tithi'),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue(
            'Tithi Number', _tithiDetails.tithiNumber.toString()),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue('Tithi Name:', _tithiDetails.tithiName),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue('Special:', _tithiDetails.special),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue('Summary:', _tithiDetails.summary),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue('Deity:', _tithiDetails.deity),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue(
          'End Time:',
          returnTime(_tithiEndTime),
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}