import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//
import 'package:india_today_assignment/providers/astrolger_provider.dart';
import 'package:india_today_assignment/widgets/astrologer_list.dart';
import 'package:india_today_assignment/widgets/astrologer_search_field.dart';

class AstrologersScreen extends StatelessWidget {
  const AstrologersScreen({Key? key}) : super(key: key);

  Widget iconWidget(String name, double size, double padding) => Padding(
        padding: EdgeInsets.all(padding),
        child: Image.asset(
          'assets/icons/$name.png',
          height: size,
          width: size,
        ),
      );

  @override
  Widget build(BuildContext context) {
    print('Test 1111111111111');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: iconWidget('hamburger', 55, 0),
        title: iconWidget('logo', 60, 0),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: iconWidget('profile', 30, 0),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
                        child: iconWidget('search', 25, 8)),
                    InkWell(onTap: () {}, child: iconWidget('filter', 25, 8)),
                    InkWell(onTap: () {}, child: iconWidget('sort', 25, 8)),
                  ],
                )
              ],
            ),
            Consumer<AstrologerProv>(
                builder: (context, data, _) => data.showSearchBar
                    ? const AstrologerSearchField()
                    : Container()),
            const SizedBox(
              height: 10,
            ),
            const AstrologerList()
          ],
        ),
      ),
    );
  }
}
