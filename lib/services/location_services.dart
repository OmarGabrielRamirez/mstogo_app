import 'package:flutter/widgets.dart';
import 'package:mining_solutions/providers/location_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as location;
import 'package:geocoding/geocoding.dart';
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
        break;
      case PermissionStatus.restricted:
      case PermissionStatus.limited:
        openAppSettings();
        break;
    }
  }
}
