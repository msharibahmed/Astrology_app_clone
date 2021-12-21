
import 'package:flutter/material.dart';
import 'package:india_today_assignment/model/astrologer_model.dart';
import 'package:india_today_assignment/utils/constants.dart';

import 'astrologer_detail_item.dart';

class AstroListItem extends StatelessWidget {
  final AstrologerModel astro;
  const AstroListItem({Key? key, required this.astro}) : super(key: key);
  String convertListToString(List<dynamic> list) {
    List<String> _listItems =
        list.map((listItem) => listItem.name as String).toList();
    return _listItems.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FadeInImage.assetNetwork(
                  placeholder: PLACEHOLDER_IMAGE,
                  image: astro.images.large.imageUrl,
                  height: 90,
                  width: 90,
                  imageErrorBuilder: (context, error, stackTrace) => ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      PLACEHOLDER_IMAGE,
                      height: 90,
                      width: 90,
                    ),
                  ),
                )),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    astro.firstName + ' ' + astro.lastName,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  AstrologerDetailItem(
                    icon: Icons.work_outline,
                    text: convertListToString(astro.skills),
                  ),
                  AstrologerDetailItem(
                    icon: Icons.translate,
                    text: convertListToString(astro.languages),
                  ),
                  AstrologerDetailItem(
                    icon: Icons.price_change_outlined,
                    text: '₹ ${astro.additionalPerMinuteCharges.toInt()}/min',
                    isBold: true,
                  ),
                  ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.call_outlined,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Talk on Call',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
            Text('${astro.experience.toInt()} Years')
          ],
        ),
        Divider(
          color: Colors.grey[300],
          thickness: 1,
        )
      ],
    );
  }
}
