import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mining_solutions/providers/location_provider.dart';
import 'package:mining_solutions/theme.dart';
import '../theme.dart';
import 'package:provider/provider.dart';
import 'package:mining_solutions/theme.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:developer' as developer;

class CurrentLocationPage extends StatefulWidget {
  const CurrentLocationPage({Key? key}) : super(key: key);

  @override
  State<CurrentLocationPage> createState() => _CurrentLocationPageState();
}

class _CurrentLocationPageState extends State<CurrentLocationPage> {
  late String _nameSt, _edo;
  List<Marker> _markers = [];
  late GoogleMapController _controller;
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(25.7162707, -100.3240342),
    zoom: 13.0,
  );
  void _onMapCreated(GoogleMapController _cntlr) async {
    double lat = Provider.of<LocationProvider>(context, listen: false)
        .getCurrentLatituded;
    double long = Provider.of<LocationProvider>(context, listen: false)
        .getCurrentLongitude;
    _controller = _cntlr;
    _controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, long), zoom: 17),
      ),
    );
    _markers = [];
    _markers.add(
      Marker(
        position: LatLng(lat, long),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ),
        markerId: const MarkerId('current_location'),
      ),
    );

    List<Placemark> _placemark = await GeocodingPlatform.instance
        .placemarkFromCoordinates(lat.toDouble(), long.toDouble());
    developer.log(' ---- > CALLE: ' + _placemark[0].street.toString());
    developer.log(' ---- > COLONIA: ' + _placemark[0].subLocality.toString());
    developer.log(' ---- > CP: ' + _placemark[0].postalCode.toString());
    developer.log(' ---- > CIUDAD: ' + _placemark[0].locality.toString());
    developer
        .log(' ---- > ESTADO: ' + _placemark[0].administrativeArea.toString());
    developer.log(' ---- > PAIS: ' + _placemark[0].isoCountryCode.toString());
    setState(() {});
  }

  _handleTap(LatLng tappedPoint) async {
    List<Placemark> _placemark = await GeocodingPlatform.instance
        .placemarkFromCoordinates(
            tappedPoint.latitude.toDouble(), tappedPoint.longitude.toDouble());
    developer.log(' ---- > CALLE: ' + _placemark[0].street.toString());
    developer.log(' ---- > COLONIA: ' + _placemark[0].subLocality.toString());
    developer.log(' ---- > CP: ' + _placemark[0].postalCode.toString());
    developer.log(' ---- > CIUDAD: ' + _placemark[0].locality.toString());
    developer
        .log(' ---- > ESTADO: ' + _placemark[0].administrativeArea.toString());
    developer.log(' ---- > PAIS: ' + _placemark[0].isoCountryCode.toString());
    _controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(tappedPoint.latitude.toDouble(),
                tappedPoint.longitude.toDouble()),
            zoom: 17),
      ),
    );
    _markers = [];
    _markers.add(
      Marker(
        markerId: MarkerId(tappedPoint.toString()),
        position: tappedPoint,
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueRed,
        ),
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Card(
          child: Container(
            height: 120,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.cancel,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text(
                      'Verifica la ubicación',
                      textScaleFactor: 1.2,
                      style: titlesHomeTextStyle,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: GoogleMap(
            initialCameraPosition: _kGooglePlex,
            zoomControlsEnabled: false,
            zoomGesturesEnabled: true,
            myLocationEnabled: true,
            mapType: MapType.normal,
            onTap: _handleTap,
            markers: Set.from(_markers),
            onMapCreated: _onMapCreated,
          ),
        ),
        Container(
          height: 120,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white, Colors.white],
                  stops: [0.5, 0.8],
                  begin: FractionalOffset.bottomCenter,
                  end: FractionalOffset.topCenter)),
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('México'),
                  Text('México'),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
