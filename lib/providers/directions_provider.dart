import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as maps;
import "package:google_maps_webservice/directions.dart";
import 'package:mining_solutions/theme.dart';

class DirectionProvider extends ChangeNotifier {
  GoogleMapsDirections directionsApi =
      GoogleMapsDirections(apiKey: "AIzaSyBA6tLHw8UqDot-6cPCRtiICDHDQEdfZdw");

  Set<maps.Polyline> _route = Set();

  Set<maps.Polyline> get currentRoute => _route;

  findDirections(maps.LatLng from, maps.LatLng to) async {
    var origin = Location(lat: from.latitude, lng: to.longitude);
    var destination = Location(lat: to.longitude, lng: to.latitude);
    var result =
        await directionsApi.directionsWithLocation(origin, destination);

    Set<maps.Polyline> newRoute = Set();

    if (result.isOkay) {
      var route = result.routes[0];
      var leg = route.legs[0];
      List<maps.LatLng> points = [];

      leg.steps.forEach((step) {
        points.add(maps.LatLng(step.startLocation.lat, step.startLocation.lng));
        points.add(maps.LatLng(step.endLocation.lat, step.endLocation.lng));
      });

      var line = new maps.Polyline(
          polylineId: maps.PolylineId("La mejor ruta"),
          points: points,
          color: primaryClr,
          width: 4);
      newRoute.add(line);

      _route = newRoute;
      notifyListeners();
    }
  }
}