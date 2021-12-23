import 'package:flutter/material.dart';
import 'package:india_today_assignment/model/panchang_model.dart';
import 'package:india_today_assignment/utils/constants.dart';



class HinduMaahSection extends StatelessWidget {
  final PanchangModel panchangModel;

  const HinduMaahSection({Key? key, required this.panchangModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HinduMaah _hinduMaah = panchangModel.hinduMaah;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        panchangDataHeading('Hindu Maah'),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue('Purnimanta:', _hinduMaah.purnimanta),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue('Amanta:', _hinduMaah.amanta),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue('Paksha:', panchangModel.paksha),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue('Ritu:', panchangModel.ritu),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue('Sun sign:', panchangModel.sunSign),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue('Moon sign:', panchangModel.moonSign),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue('Ayana:', panchangModel.ayana),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue('Panchang Yog:', panchangModel.panchangYog),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue(
            'Vikram Samvat:', panchangModel.vikramSamvat.toString()),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue(
            'Vikram Samvat Name:', panchangModel.vkramSamvatName),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue(
            'Shaka Samvat:', panchangModel.shakaSamvat.toString()),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue(
            'Shaka Samvat Name:', panchangModel.shakaSamvatName),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue('Disha Sool:', panchangModel.dishaShool),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue(
            'Disha Sool Remedies:', panchangModel.dishaShoolRemedies),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue('Nak Sool:', panchangModel.nakShool.remedies),
        const SizedBox(
          height: 5,
        ),
        panchangDataKeyValue('Moon Nivas:', panchangModel.moonNivas),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
