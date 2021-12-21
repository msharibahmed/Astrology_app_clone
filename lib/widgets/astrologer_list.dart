import 'package:flutter/material.dart';
import 'package:india_today_assignment/providers/astrolger_provider.dart';
import 'package:provider/provider.dart';

import 'astrologer_list_item.dart';

class AstrologerList extends StatelessWidget {
  const AstrologerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _astroProv = Provider.of<AstrologerProv>(context,);
    return Expanded(
      child: ListView.builder(
        // shrinkWrap: true,
        itemCount: _astroProv.searchAstrolgerList.length,
        itemBuilder: (context, index) => AstroListItem(
          astro: _astroProv.searchAstrolgerList[index],
        ),
      ),
    );
  }
}
