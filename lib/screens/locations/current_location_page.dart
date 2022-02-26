import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mining_solutions/providers/location_provider.dart';
import 'package:mining_solutions/providers/new_direction_provider.dart';
import 'package:mining_solutions/screens/locations/confirm_location_page.dart';
import 'package:mining_solutions/theme.dart';
import 'package:mining_solutions/widgets/button_model.dart';
import '../../theme.dart';
import 'package:provider/provider.dart';
import 'package:mining_solutions/theme.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:developer' as developer;
import 'dart:io' show Platform;

class CurrentLocationPage extends StatefulWidget {
  const CurrentLocationPage({Key? key}) : super(key: key);

  @override
  State<CurrentLocationPage> createState() => _CurrentLocationPageState();
}

class _CurrentLocationPageState extends State<CurrentLocationPage> {
  final _box = GetStorage();
  List<Marker> _markers = [];
  late BitmapDescriptor icon;
  late GoogleMapController _controller;
  late String _streetName, _city, _edo, _col, _cp, _state, _long, _lat;

  getIcons() async {
    var _iconIOS = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(
          size: Size(6, 6),
        ),
        "assets/marker-hubmine.png");

    var _iconAndroid = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(
          devicePixelRatio: 20.0,
          size: Size(100, 100),
        ),
        "assets/marker-hubmine.png");

    if (Platform.isAndroid) {
      setState(() {
        icon = _iconAndroid;
      });
    } else if (Platform.isIOS) {
      setState(() {
        icon = _iconIOS;
      });
    }
  }

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
        icon: icon,
        markerId: const MarkerId('current_location'),
      ),
    );
    List<Placemark> _placemark =
        await GeocodingPlatform.instance.placemarkFromCoordinates(
      lat.toDouble(),
      long.toDouble(),
    );
    _streetName = _placemark[0].street.toString();
    _city = _placemark[0].locality.toString();
    _col = _placemark[0].subLocality.toString();
    _cp = _placemark[0].postalCode.toString();
    _state = _placemark[0].administrativeArea.toString();
    _long = lat.toString();
    _lat = long.toString();

    setState(() {});
  }

  _handleTap(LatLng tappedPoint) async {
    List<Placemark> _placemark = await GeocodingPlatform.instance
        .placemarkFromCoordinates(
            tappedPoint.latitude.toDouble(), tappedPoint.longitude.toDouble());
    _streetName = _placemark[0].street.toString();
    _city = _placemark[0].locality.toString();
    _col = _placemark[0].subLocality.toString();
    _cp = _placemark[0].postalCode.toString();
    _state = _placemark[0].administrativeArea.toString();
    _long = tappedPoint.longitude.toString();
    _lat = tappedPoint.latitude.toString();
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
          icon: icon),
    );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _streetName =
        Provider.of<LocationProvider>(context, listen: false).nameStreet;
    _city = Provider.of<LocationProvider>(context, listen: false).city;
    _edo = Provider.of<LocationProvider>(context, listen: false).edo;
    getIcons();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // _checkProviders(context);
    return Scaffold(
        body: Column(
      children: [
        Card(
          elevation: 0,
          child: Container(
            height: 100,
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
                    padding: const EdgeInsets.only(left: 60, right: 60),
                    child: Text(
                      'Verifica la ubicación',
                      textScaleFactor: 1.0,
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
          height: 150,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              gradient: LinearGradient(
                  colors: [Colors.white, Colors.white],
                  stops: [0.5, 0.8],
                  begin: FractionalOffset.bottomCenter,
                  end: FractionalOffset.topCenter)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _streetName.isNotEmpty
                      ? Text(_streetName, style: subHeadingDirectionTextStyle)
                      : Text(_city, style: subHeadingDirectionTextStyle),
                  _city.isNotEmpty
                      ? Text(_city, style: subDirectionTextStyle)
                      : Text(_edo, style: subDirectionTextStyle),
                  const SizedBox(height: 15),
                  Button(
                    color: const Color(0xFF259793),
                    text: Text(
                      "Confirmar dirección",
                      style: buttonConfirmTextStyle,
                    ),
                    width: double.infinity,
                    height: size.height * 0.06,
                    action: () {
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  ConfirmLocationPage(
                            city: _city,
                            colName: _col,
                            edo: _edo,
                            latitud: _lat,
                            longitud: _long,
                            postalCode: _cp,
                            streetName: _streetName,
                          ),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            var begin = Offset(2.5, 2.0);
                            var end = Offset.zero;
                            var curve = Curves.bounceIn;
                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));
                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
