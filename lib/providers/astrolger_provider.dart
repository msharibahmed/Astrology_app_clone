import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:india_today_assignment/model/astrologer_model.dart';
import 'package:india_today_assignment/utils/constants.dart';

class AstrologerProv with ChangeNotifier {
  bool _showSearchBar = false;

  bool get showSearchBar => _showSearchBar;

  void toggleShowSearchBar() {
    _showSearchBar = !_showSearchBar;
    notifyListeners();
  }

  SortNames _sortNamesTag = SortNames.All;
  SortNames get sortNamesTag => _sortNamesTag;
  void sortBySelection(SortNames selectedName) {
    _sortNamesTag = selectedName;
    switch (selectedName) {
      case SortNames.Increasing_Exp:
        _sortbyExpIncreasing();
        break;
      case SortNames.Decreasing_Exp:
        _sortbyExpDecreasing();
        break;
      case SortNames.Increasing_price:
        _sortbyPriceIncreasing();
        break;
      case SortNames.Decreasing_price:
        _sortbyPriceDecreasing();
        break;
      case SortNames.All:
        _clearSorting();
        break;

      default:
    }

    notifyListeners();
  }

  void _sortbyExpIncreasing() {
    List<AstrologerModel> _tempList = [..._astrologersList];
    _tempList.sort((a, b) => a.experience.compareTo(b.experience));

    _searchAstrolgerList = _tempList;

    notifyListeners();
  }

  void _sortbyExpDecreasing() {
    List<AstrologerModel> _tempList = [..._astrologersList];
    _tempList.sort((a, b) => b.experience.compareTo(a.experience));
    _searchAstrolgerList = _tempList;
    notifyListeners();
  }

  void _sortbyPriceIncreasing() {
    List<AstrologerModel> _tempList = [..._astrologersList];
    _tempList.sort((a, b) =>
        a.additionalPerMinuteCharges.compareTo(b.additionalPerMinuteCharges));
    _searchAstrolgerList = _tempList;
    notifyListeners();
  }

  void _sortbyPriceDecreasing() {
    List<AstrologerModel> _tempList = [..._astrologersList];
    _tempList.sort((a, b) =>
        b.additionalPerMinuteCharges.compareTo(a.additionalPerMinuteCharges));
    _searchAstrolgerList = _tempList;
    notifyListeners();
  }

  void _clearSorting() {
    List<AstrologerModel> _tempList = _astrologersList;
    _searchAstrolgerList = _tempList;
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
            ' ' +
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

  /////
  ///

}
