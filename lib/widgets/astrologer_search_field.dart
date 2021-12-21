import 'package:flutter/material.dart';
import 'package:india_today_assignment/providers/astrolger_provider.dart';
import 'package:provider/provider.dart';

class AstrologerSearchField extends StatefulWidget {
  const AstrologerSearchField({Key? key}) : super(key: key);

  @override
  State<AstrologerSearchField> createState() => _AstrologerSearchFieldState();
}

class _AstrologerSearchFieldState extends State<AstrologerSearchField> {
  final TextEditingController _astroSeacrhCtrl = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _astroSeacrhCtrl.dispose();
  }

  final _formStateKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formStateKey,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: TextFormField(
              controller: _astroSeacrhCtrl,
                decoration: InputDecoration(
                    icon: const Icon(Icons.keyboard),
                    hintText: 'Search Astrolger, name, skills, experience etc.',
                    suffixIcon: IconButton(
                        onPressed: () {
                          _astroSeacrhCtrl.clear();
                          Provider.of<AstrologerProv>(context, listen: false)
                              .clearTextField();
                        },
                        icon: const Icon(
                          Icons.clear_rounded,
                          size: 18,
                        ))),
                onChanged: (input) {
                  Provider.of<AstrologerProv>(context, listen: false)
                      .showAstrolgersBySearch(input);
                  // print(input);
                })));
  }
}
