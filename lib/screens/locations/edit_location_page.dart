import 'package:flutter/material.dart';
import 'package:mining_solutions/models/location_data.dart';
import 'package:mining_solutions/services/directions_services.dart';
import 'package:mining_solutions/theme.dart';
import 'package:mining_solutions/widgets/button_model.dart';
import 'package:mining_solutions/widgets/input_model.dart';

class EditLocationPage extends StatefulWidget {
  final LocationData data;
  const EditLocationPage({Key? key, required this.data}) : super(key: key);

  @override
  State<EditLocationPage> createState() => _EditLocationPageState();
}

class _EditLocationPageState extends State<EditLocationPage> {
  TextEditingController _nameLocationController = TextEditingController();
  TextEditingController _detailsController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _edoController = TextEditingController();
  TextEditingController _addressLineOneController = TextEditingController();
  TextEditingController _cpController = TextEditingController();
  bool _isSelectedType = false;
  List dataTags = [
    {'icon': 'assets/icon-casa.png', 'tag': 'Casa'},
    {'icon': 'assets/icon-obra.png', 'tag': 'Obra'},
    {'icon': 'assets/icon-factory.png', 'tag': 'Planta'},
    {'icon': 'assets/icon-corporativo.png', 'tag': 'Corporativo'},
  ];
  int selectedIndex = -1;
  _insertData() async {
    _nameLocationController = TextEditingController(text: widget.data.name);
    _cityController = TextEditingController(text: widget.data.city);
    _edoController = TextEditingController(text: widget.data.state);
    _detailsController = TextEditingController(text: widget.data.details);
    _addressLineOneController =
        TextEditingController(text: widget.data.directionInOneLine);
    selectedIndex = widget.data.tagId;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    _insertData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                  color: const Color(0xFF259793),
                  text: Text(
                    "Editar dirección",
                    style: buttonConfirmTextStyle,
                  ),
                  width: double.infinity,
                  height: size.height * 0.06,
                  action: () async {
                    if (await ServiceDirections.updateDirection(
                      LocationData(
                        id: widget.data.id,
                        city: _cityController.text.isEmpty
                            ? ''
                            : _cityController.text,
                        details: _detailsController.text.isEmpty
                            ? ''
                            : _detailsController.text,
                        directionInOneLine:
                            _addressLineOneController.text.isEmpty
                                ? ''
                                : _addressLineOneController.text,
                        name: _nameLocationController.text.isEmpty
                            ? ''
                            : _nameLocationController.text,
                        state: _edoController.text.isEmpty
                            ? ''
                            : _edoController.text,
                        tagId: selectedIndex,
                        lat: widget.data.lat,
                        log: widget.data.log,
                        haveDetails: _detailsController.text.isEmpty,
                      ),
                    )) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          'home', (Route<dynamic> route) => false);
                    }
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
                          'Editar la ubicación',
                          textScaleFactor: 1.0,
                          style: titlesHomeTextStyle,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
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
                    const SizedBox(height: 20),
                    Input(
                      controller: _cityController,
                      keyboardType: TextInputType.text,
                      label: "Ciudad",
                    ),
                    const SizedBox(height: 20),
                    Input(
                      controller: _edoController,
                      keyboardType: TextInputType.text,
                      label: "Estado",
                    ),
                    const SizedBox(height: 20),
                    Input(
                      controller: _addressLineOneController,
                      keyboardType: TextInputType.streetAddress,
                      label: "Dirección Línea 1",
                    ),
                    const SizedBox(height: 20),
                    Input(
                      controller: _cpController,
                      keyboardType: TextInputType.text,
                      label: "Código Postal",
                    ),
                    const SizedBox(height: 20),
                    Input(
                      controller: _detailsController,
                      keyboardType: TextInputType.text,
                      label: "Detalles (Referencias a la dirección)",
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: Column(
                        children: [
                          Text("Tag", style: subDirectionTextStyle),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 60.0,
                      child: ListView.builder(
                          itemCount: dataTags.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int position) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  _isSelectedType = true;
                                  selectedIndex = position;
                                });
                              },
                              child: Card(
                                shape: (selectedIndex == position)
                                    ? RoundedRectangleBorder(
                                        side:
                                            const BorderSide(color: primaryClr),
                                        borderRadius: BorderRadius.circular(10),
                                      )
                                    : RoundedRectangleBorder(
                                        side: const BorderSide(
                                            color: Colors.white),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                elevation: 0.4,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image(
                                          image: AssetImage(
                                              "${dataTags[position]['icon']}")),
                                      const SizedBox(width: 10),
                                      Text("${dataTags[position]['tag']}",
                                          style: subDirectionTextStyle)
                                    ],
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
      ),
    );
  }
}
