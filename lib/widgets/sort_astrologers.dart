import 'package:flutter/material.dart';
import 'package:india_today_assignment/providers/astrolger_provider.dart';
import 'package:india_today_assignment/utils/constants.dart';
import 'package:provider/provider.dart';

class SortAstrologers extends StatelessWidget {
  const SortAstrologers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _astroProv = Provider.of<AstrologerProv>(context);
    return PopupMenuButton(
        offset: Offset.fromDirection(55, -44),
        child:iconWidget(SORT_ICON, 25, 8),
        itemBuilder: (context) => [
              PopupMenuItem(
                  enabled: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sort by:',
                        style: TextStyle(color: Colors.orange),
                      ),
                      Divider(
                        color: Colors.grey[300],
                        thickness: 1,
                      )
                    ],
                  )),
              PopupMenuItem(
                onTap: () {
                  _astroProv.sortBySelection(SortNames.Increasing_Exp);
                },
                child: const SortItem(
                  value: SortNames.Increasing_Exp,
                  itemNumber: 1,
                  text: 'Experience: Low to High',
                ),
                value: 1,
              ),
              PopupMenuItem(
                  onTap: () {
                    _astroProv.sortBySelection(SortNames.Decreasing_Exp);
                  },
                  child: const SortItem(
                    value: SortNames.Decreasing_Exp,
                    itemNumber: 2,
                    text: 'Experience: High to Low',
                  ),
                  value: 2),
              PopupMenuItem(
                  onTap: () {
                    _astroProv.sortBySelection(SortNames.Increasing_price);
                  },
                  child: const SortItem(
                    value: SortNames.Increasing_price,
                    itemNumber: 3,
                    text: 'Experience: High to Low',
                  ),
                  value: 3),
              PopupMenuItem(
                  onTap: () {
                    _astroProv.sortBySelection(SortNames.Decreasing_price);
                  },
                  child: const SortItem(
                    value: SortNames.Decreasing_price,
                    itemNumber: 4,
                    text: 'Price: High to Low',
                  ),
                  value: 4),
            ]);
  }
}

class SortItem extends StatelessWidget {
  final SortNames value;
  final String text;
  final int itemNumber;
  const SortItem(
      {Key? key,
      required this.value,
      required this.itemNumber,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AstrologerProv>(
      builder: (context, _astroProv, _) => RadioListTile<SortNames>(
          value: value,
          activeColor: Colors.orange,
          groupValue: _astroProv.sortNamesTag,
          onChanged: null,
          title: Text(text)),
    );
  }
}
