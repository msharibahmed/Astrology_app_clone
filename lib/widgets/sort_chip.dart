import 'package:flutter/material.dart';
import 'package:india_today_assignment/providers/astrolger_provider.dart';
import 'package:india_today_assignment/utils/constants.dart';
import 'package:provider/provider.dart';

class SortChip extends StatelessWidget {
  const SortChip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.orange[50],
        child: Consumer<AstrologerProv>(
            builder: (context, data, _) => data.sortNamesTag != SortNames.All
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          data.sortNamesTag.name,
                          style: const TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.w400,
                              fontSize: 15),
                        ),
                        InkWell(
                          onTap: () {
                            data.sortBySelection(SortNames.All);
                          },
                          child: const Icon(
                            Icons.clear,
                            color: Colors.orange,
                            size: 16,
                          ),
                        )
                      ],
                    ))
                : const SizedBox(
                    height: 5,
                  )));
  }
}
