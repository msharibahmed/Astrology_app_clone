import 'package:flutter/cupertino.dart';
import 'package:india_today_assignment/model/astrologer_model.dart';

class AstrologerProv with ChangeNotifier {
  bool _showSearchBar = false;
  bool get showSearchBar => _showSearchBar;

  void toggleShowSearchBar() {
    _showSearchBar = !_showSearchBar;
    notifyListeners();
  }

  final List<AstrologerModel> _astrologersList = [];
  List<AstrologerModel> get astrologersList {
    return [..._astrologersList];
  }

  final List<AstrologerModel> _searchAstrolgerList = [];

  List<AstrologerModel> get searchAstrolgerList {
    return [..._searchAstrolgerList];
  }

  void showAstrolgersBySearch(String input) {
    if (input.trim() == '') {
      _searchAstrolgerList.clear();
    } else {
      // _searchAstrolgerList = _searchAstrolgerList.where((element) {
      //   var b = element.name.toLowerCase().startsWith(input.toLowerCase());
      //   return b;
      // }).toList();
    }
    notifyListeners();
  }

}
