import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mining_solutions/providers/location_provider.dart';
import 'package:mining_solutions/theme.dart';
import 'package:mining_solutions/widgets/button_model.dart';
import 'package:mining_solutions/widgets/input_model.dart';
import 'package:provider/provider.dart';
import 'package:mining_solutions/theme.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:developer' as developer;

class ConfirmLocationPage extends StatefulWidget {
  const ConfirmLocationPage({Key? key}) : super(key: key);

  @override
  State<ConfirmLocationPage> createState() => _ConfirmLocationPageState();
}

class _ConfirmLocationPageState extends State<ConfirmLocationPage> {
  String? text;
  TextEditingController _nameLocationController = TextEditingController();

  TextEditingController _detailsController = TextEditingController();

  List dataTags = [
    {'icon': 'assets/icon-casa.png', 'tag': 'Casa'},
    {'icon': 'assets/icon-obra.png', 'tag': 'Obra'},
    {'icon': 'assets/icon-factory.png', 'tag': 'Planta'},
    {'icon': 'assets/icon-corporativo.png', 'tag': 'Corporativo'},
  ];
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String streetName = Provider.of<LocationProvider>(context, listen: true)
        .nameStreet
        .toString();
    String colName =
        Provider.of<LocationProvider>(context, listen: true).colName;
    String postalCode =
        Provider.of<LocationProvider>(context, listen: true).postalCode;
    String city = Provider.of<LocationProvider>(context, listen: true).city;
    String edo = Provider.of<LocationProvider>(context, listen: true).edo;

    String addressLineOne =
        colName != null ? "${streetName}, ${colName}" : "${streetName}";

    TextEditingController _cityController = TextEditingController(text: city);
    TextEditingController _edoController = TextEditingController(text: edo);

    TextEditingController _addressLineOneController =
        TextEditingController(text: addressLineOne);
    TextEditingController _cpController =
        TextEditingController(text: postalCode);

    bool isSelected = false;

    return Scaffold(
        bottomNavigationBar: Container(
          height: 110,
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
                  Button(
                    color: Color(0xFF259793),
                    text: Text(
                      "Guardar dirección",
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
        body: SingleChildScrollView(
          child: Column(
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
                            Icons.arrow_back_ios,
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
              SizedBox(height: 20),
              Container(
                height: size.height,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Input(
                        controller: _nameLocationController,
                        keyboardType: TextInputType.text,
                        label: "Nombre de la ubicación",
                      ),
                      SizedBox(height: 20),
                      Input(
                        controller: _cityController,
                        keyboardType: TextInputType.text,
                        label: "Ciudad",
                      ),
                      SizedBox(height: 20),
                      Input(
                        controller: _edoController,
                        keyboardType: TextInputType.text,
                        label: "Estado",
                      ),
                      SizedBox(height: 20),
                      Input(
                        controller: _addressLineOneController,
                        keyboardType: TextInputType.streetAddress,
                        label: "Dirección Línea 1",
                      ),
                      SizedBox(height: 20),
                      Input(
                        controller: _cpController,
                        keyboardType: TextInputType.text,
                        label: "Código Postal",
                      ),
                      SizedBox(height: 20),
                      Input(
                        controller: _detailsController,
                        keyboardType: TextInputType.text,
                        label: "Detalles (Referencias a la ubicación)",
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: Column(
                          children: [
                            Text("Tag", style: subDirectionTextStyle),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                      Container(
                        height: 60.0,
                        child: ListView.builder(
                            itemCount: dataTags.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int position) {
                              return InkWell(
                                onTap: () {
                                  setState(() => selectedIndex = position);
                                },
                                child: Container(
                                  child: Card(
                                    shape: (selectedIndex == position)
                                        ? RoundedRectangleBorder(
                                            side: BorderSide(color: primaryClr),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )
                                        : RoundedRectangleBorder(
                                            side:
                                                BorderSide(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                    elevation: 0.4,
                                    color: Colors.white,
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                                child: Image(
                                                    image: AssetImage(
                                                        "${dataTags[position]['icon']}"))),
                                            SizedBox(width: 10),
                                            Text("${dataTags[position]['tag']}",
                                                style: subDirectionTextStyle)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
