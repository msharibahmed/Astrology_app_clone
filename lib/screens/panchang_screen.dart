import 'package:flutter/material.dart';
import 'package:india_today_assignment/providers/panchang_provider.dart';
import 'package:india_today_assignment/utils/constants.dart';
import 'package:india_today_assignment/widgets/panchang%20widgets/date_location_container.dart';
import 'package:india_today_assignment/widgets/panchang%20widgets/hindu_maah_section.dart';
import 'package:india_today_assignment/widgets/panchang%20widgets/karan_section.dart';
import 'package:india_today_assignment/widgets/panchang%20widgets/location_list_container.dart';
import 'package:india_today_assignment/widgets/panchang%20widgets/miscellaneous_section.dart';
import 'package:india_today_assignment/widgets/panchang%20widgets/nakshatra_section.dart';
import 'package:india_today_assignment/widgets/panchang%20widgets/tithi_section.dart';
import 'package:india_today_assignment/widgets/panchang%20widgets/yog_section.dart';
import 'package:provider/provider.dart';

class PanchangScreen extends StatefulWidget {
  const PanchangScreen({Key? key}) : super(key: key);

  @override
  State<PanchangScreen> createState() => _PanchangScreenState();
}

class _PanchangScreenState extends State<PanchangScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<PanchangProv>(context, listen: false).fetchPanchang();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
          child: Consumer<PanchangProv>(builder: (context, data, _) {
            return Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    ...titleAndDescription,
                    const PanchangDateAndLocationConatiner(),
                    data.isLoading
                        ? Column(
                            children: [
                              const SizedBox(
                                height: 150,
                              ),
                              Center(
                                child: CircularProgressIndicator(
                                    color: Colors.orange[200]),
                              )
                            ],
                          )
                        : Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              const SizedBox(
                                  height: 39,
                                  child: Card(child: PanchangWeather())),
                              const SizedBox(
                                height: 25,
                              ),
                              TithiSection(
                                panchangModel: data.panchangData,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              NakshatraSection(
                                  panchangModel: data.panchangData),
                              const SizedBox(
                                height: 10,
                              ),
                              YogSection(panchangModel: data.panchangData),
                              const SizedBox(
                                height: 10,
                              ),
                              KaranSection(panchangModel: data.panchangData),
                              const SizedBox(
                                height: 10,
                              ),
                              HinduMaahSection(
                                  panchangModel: data.panchangData),
                              const SizedBox(
                                height: 10,
                              ),
                              PanchangDataMiscellaneous(
                                  heading: 'Abhijit Muhurta',
                                  start: data.panchangData.abhijitMuhurta.start,
                                  end: data.panchangData.abhijitMuhurta.end),
                              const SizedBox(
                                height: 10,
                              ),
                              PanchangDataMiscellaneous(
                                  heading: 'Rahukaal',
                                  start: data.panchangData.rahukaal.start,
                                  end: data.panchangData.rahukaal.end),
                              const SizedBox(
                                height: 10,
                              ),
                              PanchangDataMiscellaneous(
                                  heading: 'Gulikaal',
                                  start: data.panchangData.guliKaal.start,
                                  end: data.panchangData.guliKaal.end),
                              const SizedBox(
                                height: 10,
                              ),
                              PanchangDataMiscellaneous(
                                  heading: 'Yamghant Kaal',
                                  start: data.panchangData.yamghantKaal.start,
                                  end: data.panchangData.yamghantKaal.end),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          )
                  ],
                ),
                if (data.locationList.isNotEmpty) const LocationListContainer()
              ],
            );
          }),
        ),
      ),
    );
  }
}

class PanchangWeather extends StatelessWidget {
  const PanchangWeather({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PanchangProv>(
      builder: (context, data, _) => ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
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

class SunrRiseAndSetItem extends StatelessWidget {
  const SunrRiseAndSetItem({
    Key? key,
    required this.icon,
    required this.name,
    required this.time,
  }) : super(key: key);

  final IconData icon;
  final String name;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.blue,
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            children: [
              Text(
                name,
                style: const TextStyle(fontSize: 12, color: Colors.blueAccent),
              ),
              Text(
                time,
                style: const TextStyle(fontSize: 12),
              )
            ],
          ),
          VerticalDivider(
            thickness: 1,
            color: Colors.grey[350],
          ),
        ],
      ),
    );
  }
}
