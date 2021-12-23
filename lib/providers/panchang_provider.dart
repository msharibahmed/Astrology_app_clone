import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:india_today_assignment/model/location_model.dart';
import 'package:india_today_assignment/model/panchang_date_loacation_model.dart';
import 'package:india_today_assignment/model/panchang_model.dart';

class PanchangProv with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  PanchangDateLocationModel panchangDateLocationModel =
      PanchangDateLocationModel(
          day: DateTime.now().day,
          month: DateTime.now().month,
          year: DateTime.now().year,
          placeId: "ChIJL_P_CXMEDTkRw0ZdG-0GVvw");

  late PanchangModel _panchangData;
  PanchangModel get panchangData => _panchangData;

  List<LocationModel> _locationList = <LocationModel>[];
  List<LocationModel> get locationList {
    return [..._locationList];
  }

  String _choosenLocation = 'Delhi, India';
  String get choosenLocation => _choosenLocation;

  Future<void> fetchPanchang() async {
    const uri =
        'https://www.astrotak.com/astroapi/api/horoscope/daily/panchang';
    final Uri url = Uri.parse(uri);

    try {
      final http.Response _response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: panchangDateLocationModelToJson(panchangDateLocationModel));
      final _decodedResponse = jsonDecode(_response.body);
      // print(_response.body);

      if (_decodedResponse['httpStatusCode'] == 200) {
        PanchangModel _tempPanchang;
        _tempPanchang = PanchangModel.fromJson(_decodedResponse["data"]);
        _panchangData = _tempPanchang;
      } else {
        throw Exception('Failed to load Panchang data');
      }
    } on SocketException {
      debugPrint('No net');
      throw Exception('No Internet connection');
    } catch (error) {
      debugPrint(error.toString() + 'in fetch panchang method');
    }

    notifyListeners();
  }

  Future<void> fetchLocation(String input) async {
    final uri =
        'https://www.astrotak.com/astroapi/api/location/place?inputPlace=$input';
    final Uri url = Uri.parse(uri);

    try {
      final http.Response _response = await http.get(url);
      final _decodedResponse = jsonDecode(_response.body);
      // print(_response.body);

      if (_decodedResponse['httpStatusCode'] == 200 &&
          _decodedResponse['message'] ==
              "Places suggestions fetched successfully.") {
        List<LocationModel> _tempLocationList = [];
        for (var location in (_decodedResponse['data'])) {
          _tempLocationList.add(LocationModel.fromJson(location));
        }
        _locationList = _tempLocationList;
      } else {
        throw Exception('Failed to load Panchang data');
      }
    } on SocketException {
      debugPrint('No net');
      throw Exception('No Internet connection');
    } catch (error) {
      debugPrint(error.toString() + ' in fetch location method');
    }

    notifyListeners();
  }

  Future<void> changeDate(int day, int month, int year) async {
    panchangDateLocationModel = PanchangDateLocationModel(
        day: day,
        month: month,
        year: year,
        placeId: panchangDateLocationModel.placeId);

    _toggleLoading();

    notifyListeners();

    await fetchPanchang();
    _toggleLoading();

    notifyListeners();
  }

  Future<void> changeLocation(LocationModel selectedLocation) async {
    panchangDateLocationModel = PanchangDateLocationModel(
        day: panchangDateLocationModel.day,
        month: panchangDateLocationModel.month,
        year: panchangDateLocationModel.year,
        placeId: selectedLocation.placeId);

    _choosenLocation = selectedLocation.placeName;

    _changeTextFieldText();

    _locationList.clear();

    _toggleLoading();

    notifyListeners();

    await fetchPanchang();
    _toggleLoading();

    notifyListeners();
  }

  void _toggleLoading() {
    _isLoading = !_isLoading;

    notifyListeners();
  }

  TextEditingController ctrl = TextEditingController();
  void disposeCtrl() {
    ctrl.dispose();
  }

   BuildContext? textFieldContext;

  void saveContext(BuildContext ctx) {
    textFieldContext = ctx;
  }

  void removeLocationTextFieldFocus() {
    FocusScope.of(textFieldContext!).unfocus();
  }

  void _changeTextFieldText() {
    ctrl.text = choosenLocation;
    notifyListeners();
  }
}
