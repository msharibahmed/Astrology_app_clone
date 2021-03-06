import 'package:flutter/cupertino.dart';
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
            child: Material(
              elevation: 2,
              child: CupertinoTextField(
                  controller: _astroSeacrhCtrl,
                  placeholder: 'Search Astrolger, name, skills, experience etc.',
                  prefix: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.keyboard),
                  ),
                  suffix: IconButton(
                      onPressed: () {
                        final _prov =
                            Provider.of<AstrologerProv>(context, listen: false);
            
                        if (_astroSeacrhCtrl.text.trim() != '') {
                          _prov.clearTextField();
                        } else {
                          _prov.toggleShowSearchBar();
                        }
                        _astroSeacrhCtrl.clear();
                      },
                      icon: const Icon(
                        Icons.clear_rounded,
                        size: 18,
                      )),
                  // decoration: InputDecoration(
                  //     icon: const Icon(Icons.keyboard),
                  //     hintText: 'Search Astrolger, name, skills, experience etc.',
                  //     suffixIcon: IconButton(
                  //         onPressed: () {
                  //           final _prov = Provider.of<AstrologerProv>(context,
                  //               listen: false);
            
                  //           if (_astroSeacrhCtrl.text.trim() != '') {
                  //             _prov.clearTextField();
                  //           } else {
                  //             _prov.toggleShowSearchBar();
                  //           }
                  //           _astroSeacrhCtrl.clear();
                  //         },
                  //         icon: const Icon(
                  //           Icons.clear_rounded,
                  //           size: 18,
                  //         ))),
                  onChanged: (input) {
                    Provider.of<AstrologerProv>(context, listen: false)
                        .showAstrolgersBySearch(input);
                    // print(input);
                  }),
            )));
  }
}
