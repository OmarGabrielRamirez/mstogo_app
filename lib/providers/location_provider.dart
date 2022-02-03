import 'package:flutter/widgets.dart';

class LocationProvider extends ChangeNotifier {
  String _latitude = '',
      _longitude = '',
      _streetName = '',
      _colName = '',
      _postalCode = '',
      _city = '',
      _edo = '',
      _country = '';

  set currentLatitude(String lt) {
    _latitude = lt;
    notifyListeners();
  }

  set currentLongitude(String lt) {
    _longitude = lt;
    notifyListeners();
  }

  void setStreetName(String n) {
    _streetName = '';
    _streetName = n;
    print('SET NEW NAME STREET');
    notifyListeners();
  }

  String get nameStreet {
    return _streetName;
  }
}
