import 'package:flutter/material.dart';
import 'package:india_today_assignment/model/panchang_model.dart';
import 'package:india_today_assignment/utils/constants.dart';



class KaranSection extends StatelessWidget {
  final PanchangModel panchangModel;

  const KaranSection({Key? key, required this.panchangModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final KaranDetails _karanDetails = panchangModel.karan.details;
    EndTime _karanEndTime = panchangModel.karan.endTime;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        panchangDataHeading('Karan'),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue(
            'Karan Number:', _karanDetails.karanNumber.toString()),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue('Karan Name:', _karanDetails.karanName),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue('Special', _karanDetails.special),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue('Deity', _karanDetails.deity),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue('End Time:', returnTime(_karanEndTime)),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
