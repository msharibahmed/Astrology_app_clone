import 'package:flutter/material.dart';
import 'package:india_today_assignment/providers/panchang_provider.dart';
import 'package:india_today_assignment/widgets/panchang%20widgets/sunrise_set_item.dart';
import 'package:provider/provider.dart';

class PanchangSunrise extends StatelessWidget {
  const PanchangSunrise({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PanchangProv>(
      builder: (context, data, _) =>
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        SunrRiseAndSetItem(
            icon: Icons.wb_sunny,
            name: 'Sunrise',
            time: data.panchangData.sunrise),
        SunrRiseAndSetItem(
            icon: Icons.wb_sunny_outlined,
            name: 'Sunset',
            time: data.panchangData.sunset),
        SunrRiseAndSetItem(
            icon: Icons.motion_photos_on_rounded,
            name: 'Moonrise',
            time: data.panchangData.moonrise),
        SunrRiseAndSetItem(
            icon: Icons.motion_photos_on_outlined,
            name: 'Moonset',
            time: data.panchangData.moonset),
      ]),
    );
  }
}
