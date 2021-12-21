import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:india_today_assignment/model/astrologer_model.dart';

class AstrologerProv with ChangeNotifier {
  bool _showSearchBar = false;
  bool get showSearchBar => _showSearchBar;

  void toggleShowSearchBar() {
    _showSearchBar = !_showSearchBar;
    notifyListeners();
  }

  List<AstrologerModel> _astrologersList = <AstrologerModel>[];
  List<AstrologerModel> get astrologersList {
    return [..._astrologersList];
  }

  Future<void> getAllAstrologers() async {
    const String _uri = 'https://www.astrotak.com/astroapi/api/agent/all';
    final Uri _url = Uri.parse(_uri);
    try {
      final http.Response _response = await http.get(_url);
      final _decodedResponse = jsonDecode(_response.body);

      print(_decodedResponse);

      if (_decodedResponse['httpStatusCode'] == 200) {
        List<AstrologerModel> _tempAstrosList = [];
        for (var astrologer in (_decodedResponse['data'])) {
          _tempAstrosList.add(AstrologerModel.fromJson(astrologer));
        }
        _astrologersList = _tempAstrosList;
        _searchAstrolgerList = _astrologersList;
      } else {
        throw Exception('Failed to load Astrologers data');
      }
    } on SocketException {
      debugPrint('No net');
      throw Exception('No Internet connection');
    } catch (error) {
      debugPrint(error.toString() + 'helllllllo');
    }

    notifyListeners();
  }

  // void assignAstroListToSearchList() {
  //   _searchAstrolgerList = _astrologersList;
  //   notifyListeners();
  // }

  List<AstrologerModel> _searchAstrolgerList = <AstrologerModel>[];

  List<AstrologerModel> get searchAstrolgerList {
    return [..._searchAstrolgerList];
  }

  void showAstrolgersBySearch(String input) {
    if (input.trim() != '') {
      input = input.trim();
      _searchAstrolgerList = _astrologersList.where((e) {
        String lang = e.languages.map((e) => e.name).toList().join('');
        String skill = e.skills.map((e) => e.name).toList().join('');
        String x = e.firstName +
            e.lastName +
            e.experience.toInt().toString() +
            lang +
            skill;
        x = x.toLowerCase();

        String y = input.toLowerCase();

        return x.contains(y);
      }).toList();
    }
    notifyListeners();
  }

  void clearTextField() {
    _searchAstrolgerList.clear();
    _searchAstrolgerList = _astrologersList;
    notifyListeners();
  }
}
