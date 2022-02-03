import 'package:flutter/widgets.dart';
import 'package:mining_solutions/providers/location_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as location;
import 'package:geocoding/geocoding.dart';
import 'dart:developer' as developer;
import 'package:provider/provider.dart';

class ServiceLocation {
  static getCurrentLocation(BuildContext context) async {
    final _statusLocation = await Permission.location.request();
    location.Location _locationService = location.Location();
    switch (_statusLocation) {
      case PermissionStatus.granted:
        await _locationService.requestService();
        Position _position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
///
        List<Placemark> _placemark = await GeocodingPlatform.instance
            .placemarkFromCoordinates(
                _position.latitude.toDouble(), _position.longitude.toDouble());
        Provider.of<LocationProvider>(context, listen: false).setStreetName(
          _placemark[0].street.toString(),
        );
        developer.log(
            ' ---- > LATITUD: ' + _position.latitude.toDouble().toString());
        developer.log(
            ' ---- > LONGITUD: ' + _position.latitude.toDouble().toString());
        developer.log(' ---- > CALLE: ' + _placemark[0].street.toString());
        developer
            .log(' ---- > COLONIA: ' + _placemark[0].subLocality.toString());
        developer.log(' ---- > CP: ' + _placemark[0].postalCode.toString());
        developer.log(' ---- > CIUDAD: ' + _placemark[0].locality.toString());
        developer.log(
            ' ---- > ESTADO: ' + _placemark[0].administrativeArea.toString());
        developer
            .log(' ---- > PAIS: ' + _placemark[0].isoCountryCode.toString());
        break;
      case PermissionStatus.denied:
      case PermissionStatus.permanentlyDenied:
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
        openAppSettings();
        break;
    }
  }
}
