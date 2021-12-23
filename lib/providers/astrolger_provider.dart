import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:india_today_assignment/model/astrologer_model.dart';
import 'package:india_today_assignment/model/filter_model.dart';
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
    // clearFilters(null, false);
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
    _searchAstrolgerList.sort((a, b) => a.experience.compareTo(b.experience));

    // _searchAstrolgerList = _tempList;

    notifyListeners();
  }

  void _sortbyExpDecreasing() {
    List<AstrologerModel> _tempList = [..._astrologersList];
    _searchAstrolgerList.sort((a, b) => b.experience.compareTo(a.experience));
    // _searchAstrolgerList = _tempList;
    notifyListeners();
  }

  void _sortbyPriceIncreasing() {
    List<AstrologerModel> _tempList = [..._astrologersList];
    _searchAstrolgerList.sort((a, b) =>
        a.additionalPerMinuteCharges.compareTo(b.additionalPerMinuteCharges));
    // _searchAstrolgerList = _tempList;
    notifyListeners();
  }

  void _sortbyPriceDecreasing() {
    List<AstrologerModel> _tempList = [..._astrologersList];
    _searchAstrolgerList.sort((a, b) =>
        b.additionalPerMinuteCharges.compareTo(a.additionalPerMinuteCharges));
    // _searchAstrolgerList = _tempList;
    notifyListeners();
  }

  void _clearSorting() {
    clearFilters(null, false);
    
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

      // print(_decodedResponse);

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
      debugPrint(error.toString() + ' error in getAllAstrolgers function');
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
    clearFilters(null, false);

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
  ///
  final List<FilterChipsModel> _skillName = [
    FilterChipsModel(isSelected: false, name: 'Coffe Cup Reading'),
    FilterChipsModel(isSelected: false, name: 'Falit Jyotish'),
    FilterChipsModel(isSelected: false, name: 'Kundali Grah Dosh'),
    FilterChipsModel(isSelected: false, name: 'Vastu'),
    FilterChipsModel(isSelected: false, name: 'Vedic Astrology'),
    FilterChipsModel(isSelected: false, name: 'Astrology'),
    FilterChipsModel(isSelected: false, name: 'Palmistry'),
    FilterChipsModel(isSelected: false, name: 'Numerology'),
    FilterChipsModel(isSelected: false, name: 'Face Reading'),
    FilterChipsModel(isSelected: false, name: 'Tarot'),
  ];

  final List<FilterChipsModel> _languageName = [
    FilterChipsModel(isSelected: false, name: 'English'),
    FilterChipsModel(isSelected: false, name: 'Hindi'),
  ];

  List<FilterChipsModel> get skillName => [..._skillName];
  List<FilterChipsModel> get languageName => [..._languageName];
  void skillSelected(String skill) {
    int index = _skillName.indexWhere((element) => element.name == skill);
    _skillName[index].isSelected = !(_skillName[index].isSelected);
    notifyListeners();
  }

  void languageSelected(String language) {
    int index = _languageName.indexWhere((element) => element.name == language);
    _languageName[index].isSelected = !(_languageName[index].isSelected);
    notifyListeners();
  }

  void applyFilters(BuildContext ctx) {
    List<FilterChipsModel> _selectedSkills = [];
    List<FilterChipsModel> _selectedLanguages = [];

    _selectedSkills =
        _skillName.where((skill) => skill.isSelected == true).toList();
    _selectedLanguages =
        _languageName.where((language) => language.isSelected == true).toList();

    _searchAstrolgerList = _searchAstrolgerList.where((astro) {
      String _astroSkills = astro.skills.map((e) => e.name).toList().join('');
      String _astrolanguages =
          astro.languages.map((e) => e.name).toList().join('');

      bool _skillBool = _selectedSkills
          .every((element) => _astroSkills.contains(element.name));
      bool _langBool = _selectedLanguages
          .every((element) => _astrolanguages.contains(element.name));

      if (_skillBool && _langBool) {
        return true;
      } else {
        return false;
      }
    }).toList();

    notifyListeners();
    Navigator.pop(ctx);
  }

  void clearFilters(BuildContext? ctx, [bool pop = true]) {
    _searchAstrolgerList = _astrologersList;
    for (var x in _skillName) {
      x.isSelected = false;
    }
    for (var y in _languageName) {
      y.isSelected = false;
    }

    notifyListeners();
    if (pop) {
      Navigator.pop(ctx!);
    }
  }
}
