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
    print(_statusLocation);
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
        Provider.of<LocationProvider>(context, listen: false).setCityName(
          _placemark[0].locality.toString(),
        );
        Provider.of<LocationProvider>(context, listen: false).setStateName(
          _placemark[0].administrativeArea.toString(),
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
        Provider.of<LocationProvider>(context, listen: false)
            .setCurrentLatitude(
          _position.latitude.toDouble(),
        );

        Provider.of<LocationProvider>(context, listen: false)
            .setCurrentLongitude(
          _position.longitude.toDouble(),
        );
        break;
      case PermissionStatus.denied:
      case PermissionStatus.permanentlyDenied:
        print("Permisos permanentemente denegados");
        break;
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
        print("Permisos limitados");
        openAppSettings();
        // You can request multiple permissions at once.
        break;
    }
  }
}
