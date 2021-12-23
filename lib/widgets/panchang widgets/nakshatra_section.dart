import 'package:flutter/material.dart';
import 'package:india_today_assignment/model/panchang_model.dart';
import 'package:india_today_assignment/utils/constants.dart';


class NakshatraSection extends StatelessWidget {
  final PanchangModel panchangModel;

  const NakshatraSection({Key? key, required this.panchangModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NakshatraDetails _nakshatraDetails = panchangModel.nakshatra.details;
    EndTime _nakshatraEndTime = panchangModel.nakshatra.endTime;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        panchangDataHeading('Nakshatra'),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue(
            'Nakshatra Number:', _nakshatraDetails.nakNumber.toString()),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue('Nakshatra Name:', _nakshatraDetails.nakName),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue('Ruler:', _nakshatraDetails.ruler),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue('Deity:', _nakshatraDetails.deity),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue('Summary:', _nakshatraDetails.summary),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue('Special:', _nakshatraDetails.special),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue('End Time:', returnTime(_nakshatraEndTime)),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
