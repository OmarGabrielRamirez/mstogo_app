import 'package:flutter/material.dart';
import 'package:mining_solutions/models/location_data.dart';
import 'package:mining_solutions/screens/home/home_content_skeleton.dart';
import 'package:mining_solutions/screens/locations/current_location_page.dart';
import 'package:mining_solutions/screens/locations/edit_location_page.dart';
import 'package:mining_solutions/services/directions_services.dart';
import 'package:mining_solutions/theme.dart';
import 'package:mining_solutions/widgets/input_model.dart';
import 'package:mining_solutions/widgets/category.dart';
import 'package:mining_solutions/widgets/input_model.dart';
import 'package:provider/provider.dart';
import '../../providers/location_provider.dart';
import '../../services/location_services.dart';
import '../locations/current_location_page.dart';
import '../demos/buttons_demo_page.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:skeletons/skeletons.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List<LocationData> _dataLocations = [];

  _fetchDataDirections() async {
    _dataLocations = await ServiceDirections.fetchDirectionsAll();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchDataDirections();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> imageList = [
      "https://syncronik.s3.us-east-2.amazonaws.com/Hubmine/hubmine-slider-todo-para-construccion.jpg",
      'https://syncronik.s3.us-east-2.amazonaws.com/Hubmine/hubmine-slider-concreto.jpg',
      'https://syncronik.s3.us-east-2.amazonaws.com/Hubmine/hubmine-slider-rastreo.jpg'
    ];
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30.0,
                      width: 140.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/Logo-Hubmine.png'),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Ver notificaciones");
                      },
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 0.3,
                              color: Colors.black26,
                            ),
                            borderRadius: const BorderRadius.all(
                                Radius.circular(
                                    10.0) //                 <--- border radius here
                                ),
                          ),
                          child: const Icon(Icons.notifications,
                              color: primaryClr)),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Row(children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: SizedBox(
                    height: _height * 0.11,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Ubicación", style: subHeadingTextStyle),
                            const SizedBox(height: 7),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet<void>(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  )),
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height -
                                              250,
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.only(
                                                top: 20, bottom: 10),
                                            child: Text(
                                              'Agrega o escoge una dirección',
                                              style: titlesHomeTextStyle,
                                              textScaleFactor: 1.2,
                                            ),
                                          ),
                                          const Divider(
                                              color: Colors.black45,
                                              thickness: 0.0,
                                              indent: 30.0,
                                              endIndent: 30.0),
                                          Container(
                                            padding: const EdgeInsets.only(
                                                left: 20, right: 20),
                                            child: const SearchInput(
                                              hintText: "Ingresa una dirección",
                                              icon: Icon(Icons.location_on),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(builder:
                                                    (BuildContext context) {
                                                  return const CurrentLocationPage();
                                                }),
                                              );
                                            },
                                            child: ListTile(
                                              leading: const Icon(
                                                  Icons.location_on_outlined),
                                              title: Text(
                                                'Ubicación Actual',
                                                style: titlesHomeTextStyle,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: ListView.builder(
                                              itemCount: _dataLocations.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return ListTile(
                                                  leading: _setIcon(
                                                      _dataLocations[index]
                                                          .tagId),
                                                  trailing: DropdownButton(
                                                    icon: const Icon(
                                                        Icons.more_horiz),
                                                    elevation: 16,
                                                    style: const TextStyle(
                                                        color: Colors.black),
                                                    onChanged:
                                                        (int? newValue) async {
                                                      if (newValue == 0) {
                                                        if (await ServiceDirections
                                                            .deleteDirection(
                                                                _dataLocations[
                                                                        index]
                                                                    .id)) {
                                                          Navigator.of(context)
                                                              .pushNamed(
                                                                  'home');
                                                        }
                                                      } else {
                                                        Navigator.of(context)
                                                            .push(
                                                          MaterialPageRoute(
                                                              builder: (BuildContext
                                                                      context) =>
                                                                  EditLocationPage(
                                                                    data:
                                                                        LocationData(
                                                                      id: _dataLocations[
                                                                              index]
                                                                          .id,
                                                                      city: _dataLocations[
                                                                              index]
                                                                          .city,
                                                                      details: _dataLocations[
                                                                              index]
                                                                          .details,
                                                                      directionInOneLine:
                                                                          _dataLocations[index]
                                                                              .directionInOneLine,
                                                                      name: _dataLocations[
                                                                              index]
                                                                          .name,
                                                                      state: _dataLocations[
                                                                              index]
                                                                          .state,
                                                                      tagId: _dataLocations[
                                                                              index]
                                                                          .tagId,
                                                                      lat: _dataLocations[
                                                                              index]
                                                                          .lat,
                                                                      log: _dataLocations[
                                                                              index]
                                                                          .log,
                                                                      haveDetails:
                                                                          _dataLocations[index]
                                                                              .haveDetails,
                                                                    ),
                                                                  )),
                                                        );
                                                      }
                                                    },
                                                    items: const [
                                                      DropdownMenuItem<int>(
                                                        value: 0,
                                                        child: Text('Eliminar'),
                                                      ),
                                                      DropdownMenuItem<int>(
                                                        value: 1,
                                                        child: Text('Editar'),
                                                      ),
                                                    ],
                                                  ),
                                                  title: Text(
                                                    _dataLocations[index]
                                                        .directionInOneLine,
                                                    style: titlesHomeTextStyle,
                                                  ),
                                                );
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                );
                                // Navigator.of(context).pushNamed('demo_maps');
                                // print("Obteniendo ubicación");
                              },
                              child: SizedBox(
                                child: Row(
                                  children: [
                                    const Icon(Icons.location_on,
                                        color: Colors.red),
                                    const SizedBox(width: 6),
                                    Consumer<LocationProvider>(builder:
                                        (context, locationProvider, child) {
                                      return Flexible(
                                        child: Text(
                                          locationProvider.nameStreet != ""
                                              ? locationProvider.nameStreet
                                              : "Villas de San Jerónimo #203",
                                          style: titlesHomeTextStyle,
                                          textScaleFactor: 0.97,
                                        ),
                                      );
                                    }),
                                    const SizedBox(width: 3),
                                    const Icon(
                                      Icons.arrow_drop_down_outlined,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ))
              ]),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                child: SizedBox(
                  height: _height * 0.067,
                  child: const SearchInput(
                      hintText: "¿Qué deseas comprar hoy?...",
                      icon: Icon(Icons.search)),
                ),
              ),
            ),
            Container(
                color: Colors.white, child: buildCarrousel(imageList, _height)),
            const SizedBox(height: 10),
            Container(
                color: Colors.white, child: buildCategories(_height, _width)),
            Container(
                color: Colors.white,
                child: buildRecommendForYou(_height, _width))
          ],
        ),
      ),
    );
  }

  Column buildRecommendForYou(height, width) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 30.0, top: 20.0, right: 30.0),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("Recomendados para ti", style: subHeadingTextStyle),
              Text("Ver más", style: buttonTextDarkStyle),
            ]),
            const SizedBox(height: 10),
            SizedBox(
              width: width,
              height: height * 0.5 - 95,
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.only(left: 0.0, top: 10),
                childAspectRatio: 8.0 / 9.0,
                // TODO: Build a grid of cards (102)
                children: <Widget>[
                  Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: 18.0 / 11.0,
                          child: Image.asset(
                            'assets/grava.png',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(15.0, 5.0, 1.0, 1.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Grava', style: subHeadingTextStyle),
                              const SizedBox(height: 8.0),
                              const Text("150 pesos por tonelada"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: 18.0 / 11.0,
                          child: Image.asset(
                            'assets/piedra-caliza.png',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(15.0, 5.0, 1.0, 1.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Piedra caliza', style: subHeadingTextStyle),
                              const SizedBox(height: 8.0),
                              const Text("150 pesos por tonelada"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )
    ]);
  }

  Column buildCategories(height, width) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0, top: 20, right: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Categorías", style: subHeadingTextStyle),
              Text("Ver más", style: buttonTextDarkStyle),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Category(
                    assetPath:
                        'https://syncronik.s3.us-east-2.amazonaws.com/Hubmine/categories/cemento-icon.png',
                    title: 'Cemento',
                    idCategory: 1,
                  ),
                  Category(
                    assetPath:
                        'https://syncronik.s3.us-east-2.amazonaws.com/Hubmine/categories/concreto-mix-icon.png',
                    title: 'Concreto',
                    idCategory: 2,
                  ),
                  Category(
                    assetPath:
                        'https://syncronik.s3.us-east-2.amazonaws.com/Hubmine/categories/agregados-icon.png',
                    title: 'Agregados',
                    idCategory: 3,
                  ),
                  Category(
                    assetPath:
                        'https://syncronik.s3.us-east-2.amazonaws.com/Hubmine/categories/prefabricados-icon.png',
                    title: 'Prefabricados',
                    idCategory: 4,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Container buildCarrousel(imageList, height) {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 15),
      child: CarouselSlider.builder(
        itemCount: imageList.length,
        options: CarouselOptions(
            enlargeCenterPage: true,
            height: height * 0.25,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            reverse: false,
            aspectRatio: 16 / 9),
        itemBuilder: (context, i, id) {
          //for onTap to redirect to another screen
          return GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.white,
                  )),
              //ClipRRect for image border radius
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(
                    imageUrl: imageList[i],
                    height: 100,
                    width: 300,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => SizedBox(
                              height: 50.0,
                              width: 50.0,
                              child: Image.asset(
                                'assets/Logo-Hubmine.png',
                                fit: BoxFit.scaleDown,
                              ),
                            )),
                // child: Image.network(
                //   imageList[i],
                //   height: 100,
                //   width: 300,
                //   fit: BoxFit.cover,
                // ),
              ),
            ),
            onTap: () {
              var url = imageList[i];
              print(url.toString());
            },
          );
        },
      ),
    );
  }

  //TODO:Set name type location

//TODO: Set icon by type location
  _setIcon(int typeLocation) {
    switch (typeLocation) {
      case 0:
        return const Image(
            width: 25,
            height: 25,
            color: Colors.black,
            image: AssetImage('assets/icon-casa.png'));

        break;
      case 1:
        return const Image(
            width: 25,
            height: 25,
            color: Colors.black,
            image: AssetImage('assets/icon-obra.png'));
        break;
      case 2:
        return const Image(
            width: 25,
            height: 25,
            color: Colors.black,
            image: AssetImage('assets/icon-factory.png'));
        break;
      case 3:
        return const Image(
            width: 25,
            height: 25,
            color: Colors.black,
            image: AssetImage('assets/icon-corporativo.png'));
        break;
    }
  }
}
