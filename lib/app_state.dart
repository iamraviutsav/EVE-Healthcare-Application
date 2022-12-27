import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('ff_LoggedInUserData')) {
      try {
        _LoggedInUserData =
            jsonDecode(prefs.getString('ff_LoggedInUserData') ?? '');
      } catch (e) {
        print("Can't decode persisted json. Error: $e.");
      }
    }

    _Token = prefs.getString('ff_Token') ?? _Token;
  }

  late SharedPreferences prefs;

  dynamic _LoggedInUserData;
  dynamic get LoggedInUserData => _LoggedInUserData;
  set LoggedInUserData(dynamic _value) {
    notifyListeners();

    _LoggedInUserData = _value;
    prefs.setString('ff_LoggedInUserData', jsonEncode(_value));
  }

  String _Token = '';
  String get Token => _Token;
  set Token(String _value) {
    notifyListeners();

    _Token = _value;
    prefs.setString('ff_Token', _value);
  }

  bool _SearchActive = false;
  bool get SearchActive => _SearchActive;
  set SearchActive(bool _value) {
    notifyListeners();

    _SearchActive = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
