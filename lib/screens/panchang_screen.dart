import 'package:flutter/material.dart';
import 'package:india_today_assignment/providers/panchang_provider.dart';
import 'package:india_today_assignment/utils/constants.dart';
import 'package:india_today_assignment/widgets/panchang%20widgets/date_location_container.dart';
import 'package:india_today_assignment/widgets/panchang%20widgets/hindu_maah_section.dart';
import 'package:india_today_assignment/widgets/panchang%20widgets/karan_section.dart';
import 'package:india_today_assignment/widgets/panchang%20widgets/location_list_container.dart';
import 'package:india_today_assignment/widgets/panchang%20widgets/miscellaneous_section.dart';
import 'package:india_today_assignment/widgets/panchang%20widgets/nakshatra_section.dart';
import 'package:india_today_assignment/widgets/panchang%20widgets/panchang_sunrise_conatiner.dart';
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
                  mainAxisSize: MainAxisSize.min,
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
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              const PanchangSunrise(),
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
