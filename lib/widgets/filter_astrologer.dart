import 'package:flutter/material.dart';
import 'package:india_today_assignment/model/filter_model.dart';
import 'package:india_today_assignment/providers/astrolger_provider.dart';
import 'package:provider/provider.dart';

class FilterAstrologer extends StatelessWidget {
  const FilterAstrologer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: SizedBox(
                  width: 100,
                  child: Divider(
                    thickness: 5,
                    color: Colors.orange[200],
                  ))),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Consumer<AstrologerProv>(
              builder: (context, data, _) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'Filter',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            letterSpacing: 1),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            data.clearFilters(context);
                          },
                          child: const Text(
                            'Clear All',
                            style: TextStyle(fontSize: 20),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            data.applyFilters(context);
                          },
                          child: const Text(
                            'APPLY',
                            style: TextStyle(fontSize: 20),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Astrologer Skills',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Wrap(
                      children: data.skillName
                          .map((chip) => FilterSkillChip(
                                chip: chip,
                              ))
                          .toList()),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Astrolger Language',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Wrap(
                    children: data.languageName
                        .map((chip) => FilterLanguageChip(
                              chip: chip,
                            ))
                        .toList(),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          )
        ],
      );
    });
  }
}

class FilterSkillChip extends StatelessWidget {
  final FilterChipsModel chip;
  const FilterSkillChip({Key? key, required this.chip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Consumer<AstrologerProv>(
          builder: (context, data, _) => ElevatedButton(
                onPressed: () {
                  data.skillSelected(chip.name);
                },
                child: Text(chip.name),
                style: ElevatedButton.styleFrom(
                    elevation: chip.isSelected ? 5 : 2,
                    primary: chip.isSelected ? Colors.orange : Colors.white,
                    splashFactory: NoSplash.splashFactory,
                    shadowColor: Colors.orange),
              )),
    );
  }
}

class FilterLanguageChip extends StatelessWidget {
  final FilterChipsModel chip;
  const FilterLanguageChip({Key? key, required this.chip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Consumer<AstrologerProv>(
          builder: (context, data, _) => ElevatedButton(
                onPressed: () {
                  data.languageSelected(chip.name);
                },
                child: Text(chip.name),
                style: ElevatedButton.styleFrom(
                    elevation: chip.isSelected ? 5 : 2,
                    primary: chip.isSelected ? Colors.orange : Colors.white,
                    splashFactory: NoSplash.splashFactory,
                    shadowColor: Colors.orange),
              )),
    );
  }
}
