import 'package:flutter/widgets.dart';

class LocationProvider extends ChangeNotifier {
  double _latitude = 0.0, _longitude = 0.0;
  String _streetName = '',
      _colName = '',
      _postalCode = '',
      _city = '',
      _edo = '',
      _country = '';

  void setCurrentLatitude(double lt) {
    _latitude = lt;
    print(lt);
    notifyListeners();
  }

  void setCurrentLongitude(double lt) {
    _longitude = lt;
    print(lt);
    notifyListeners();
  }

  void setStreetName(String n) {
    _streetName = '';
    _streetName = n;
    notifyListeners();
  }

  String get nameStreet {
    return _streetName;
  }

  double get getCurrentLatituded {
    return _latitude;
  }

  double get getCurrentLongitude {
    return _longitude;
  }
}
