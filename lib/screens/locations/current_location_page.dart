import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mining_solutions/providers/location_provider.dart';
import 'package:mining_solutions/theme.dart';
import 'package:mining_solutions/widgets/button_model.dart';
import '../../theme.dart';
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
  final _box = GetStorage();
  late String _nameSt, _edo;
  List<Marker> _markers = [];
  late BitmapDescriptor icon;
  late GoogleMapController _controller;

  // Cargar imagen del Marker
  getIcons() async {
    var icon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(6, 6)), "assets/marker-hubmine.png");
    setState(() {
      this.icon = icon;
    });
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(25.7162707, -100.3240342),
    zoom: 13.0,
  );
  void _onMapCreated(GoogleMapController _cntlr) async {
    print("Map created");
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
    Provider.of<LocationProvider>(context, listen: false).setStreetName(
      _placemark[0].street.toString(),
    );

    Provider.of<LocationProvider>(context, listen: false).setColName(
      _placemark[0].subLocality.toString(),
    );
    Provider.of<LocationProvider>(context, listen: false).setPostalCode(
      _placemark[0].postalCode.toString(),
    );
    Provider.of<LocationProvider>(context, listen: false).setCityName(
      _placemark[0].locality.toString(),
    );
    Provider.of<LocationProvider>(context, listen: false).setStateName(
      _placemark[0].administrativeArea.toString(),
    );
    developer.log(_placemark[0].toString());
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
          icon: icon),
    );
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getIcons();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String streetName =
        Provider.of<LocationProvider>(context, listen: true).nameStreet;
    String city = Provider.of<LocationProvider>(context, listen: true).city;
    String edo = Provider.of<LocationProvider>(context, listen: true).edo;
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
                  streetName != null
                      ? Text("${streetName}",
                          style: subHeadingDirectionTextStyle)
                      : Text("${city}", style: subHeadingDirectionTextStyle),
                  city != null
                      ? Text("${city}", style: subDirectionTextStyle)
                      : Text("${edo}", style: subDirectionTextStyle),
                  SizedBox(height: 15),
                  Button(
                    color: Color(0xFF259793),
                    text: Text(
                      "Confirmar dirección",
                      style: buttonConfirmTextStyle,
                    ),
                    width: double.infinity,
                    height: size.height * 0.06,
                    action: () {
                      Navigator.of(context).pushNamed('confirm_location_page');
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
