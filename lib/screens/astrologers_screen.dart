import 'package:flutter/material.dart';
import 'package:india_today_assignment/utils/constants.dart';
import 'package:india_today_assignment/widgets/sort_astrologers.dart';
import 'package:india_today_assignment/widgets/sort_chip.dart';
import 'package:provider/provider.dart';
//
import 'package:india_today_assignment/providers/astrolger_provider.dart';
import 'package:india_today_assignment/widgets/astrologer_list.dart';
import 'package:india_today_assignment/widgets/astrologer_search_field.dart';

class AstrologersScreen extends StatelessWidget {
  const AstrologersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Talk to an Astrologer',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Provider.of<AstrologerProv>(context, listen: false)
                              .toggleShowSearchBar();
                        },
                        child: iconWidget(SEARCH_ICON, 25, 8)),
                    InkWell(
                        onTap: () {}, child: iconWidget(FILTER_ICON, 25, 8)),
                    const SortAstrologers(),
                  ],
                )
              ],
            ),
            Consumer<AstrologerProv>(
                builder: (context, data, _) => data.showSearchBar
                    ? const AstrologerSearchField()
                    : Container()),
            const SizedBox(
              height: 8,
            ),
            const SortChip(),
            const SizedBox(
              height: 7,
            ),
            const AstrologerList()
          ],
        ),
      ),
    );
  }
}
