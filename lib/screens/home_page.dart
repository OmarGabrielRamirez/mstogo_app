import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:badges/badges.dart';
import 'package:mining_solutions/screens/cart_page.dart';
import 'package:mining_solutions/screens/login_page.dart';
import 'package:mining_solutions/screens/orders_page.dart';
import 'package:mining_solutions/screens/profile_page.dart';
import 'package:mining_solutions/theme.dart';
import 'package:mining_solutions/widgets/category.dart';
import 'package:mining_solutions/widgets/input_model.dart';
import 'package:provider/provider.dart';
import '../providers/location_provider.dart';
import '../services/location_services.dart';
import 'current_location_page.dart';
import 'demos/buttons_demo_page.dart';

import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final padding = EdgeInsets.symmetric(horizontal: 18, vertical: 12);
  int badge = 0;

  List<Widget> pages = [
    HomeContent(),
    CartPage(),
    OrdersPage(),
    ProfilePage(),
  ];
  double gap = 10;

  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(0.0, 0.0),
          child: AppBar(
            // Here we create one to set status bar color
            elevation: 0,
            backgroundColor: Colors
                .white, // Set any color of status bar you want; or it defaults to your theme's primary color
          )),
      extendBody: true,
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (page) {
          setState(() {
            selectedIndex = page;
            // badge = badge + 1;
          });
        },
        controller: controller,
        itemBuilder: (context, position) {
          print(position);
          return Container(child: pages[position]);
        },
        itemCount: 4,
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(100)),
            boxShadow: [
              BoxShadow(
                spreadRadius: -10,
                blurRadius: 60,
                color: Colors.black.withOpacity(.4),
                offset: Offset(0, 25),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3),
            child: GNav(
              duration: Duration(milliseconds: 140),
              tabs: [
                GButton(
                  gap: gap,
                  iconActiveColor: primaryClr,
                  iconColor: Colors.black,
                  textColor: primaryClr,
                  backgroundColor: primaryClr.withOpacity(.2),
                  iconSize: 24,
                  padding: padding,
                  icon: LineIcons.home,
                  text: 'Inicio',
                ),
                GButton(
                  gap: gap,
                  iconActiveColor: primaryClr,
                  iconColor: Colors.black,
                  textColor: primaryClr,
                  backgroundColor: primaryClr.withOpacity(.2),
                  iconSize: 24,
                  padding: padding,
                  icon: LineIcons.shoppingCart,
                  // leading: selectedIndex == 1 || badge == 0
                  //     ? null
                  //     : Badge(
                  //         badgeColor: Colors.red.shade100,
                  //         elevation: 0,
                  //         position: BadgePosition.topEnd(top: -12, end: -12),
                  //         badgeContent: Text(
                  //           badge.toString(),
                  //           style: TextStyle(color: Colors.red.shade900),
                  //         ),
                  //         child: Icon(
                  //           LineIcons.heart,
                  //           color:
                  //               selectedIndex == 1 ? Colors.pink : Colors.black,
                  //         ),
                  //       ),
                  text: 'Carrito',
                ),
                GButton(
                  gap: gap,
                  iconActiveColor: primaryClr,
                  iconColor: Colors.black,
                  textColor: primaryClr,
                  backgroundColor: primaryClr.withOpacity(.2),
                  iconSize: 24,
                  padding: padding,
                  icon: LineIcons.list,
                  text: 'Órdenes',
                ),
                GButton(
                  gap: gap,
                  iconActiveColor: primaryClr,
                  iconColor: Colors.black,
                  textColor: primaryClr,
                  backgroundColor: primaryClr.withOpacity(.2),
                  iconSize: 24,
                  padding: padding,
                  icon: LineIcons.user,
                  leading: const CircleAvatar(
                    radius: 12,
                    backgroundImage: NetworkImage(
                      'https://sooxt98.space/content/images/size/w100/2019/01/profile.png',
                    ),
                  ),
                  text: 'Sheldon',
                )
              ],
              selectedIndex: selectedIndex,
              onTabChange: (index) {
                setState(() {
                  selectedIndex = index;
                });
                controller.jumpToPage(index);
              },
            ),
          ),
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({
    Key? key,
  }) : super(key: key);

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
                                                hintText:
                                                    "Ingresa una dirección",
                                                icon: Icon(Icons.location_on),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(builder:
                                                      (BuildContext context) {
                                                    return CurrentLocationPage();
                                                  }),
                                                );
                                              },
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                  left: 20,
                                                  right: 20,
                                                  top: 20,
                                                  bottom: 10,
                                                ),
                                                child: Row(
                                                  children: [
                                                    const Icon(Icons
                                                        .location_on_outlined),
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 20),
                                                      child: Text(
                                                        'Ubicación Actual',
                                                        style:
                                                            titlesHomeTextStyle,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            const Divider(
                                                color: Colors.black45,
                                                thickness: 0.0,
                                                indent: 30.0,
                                                endIndent: 30.0),
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
                                        return Text(
                                          locationProvider.nameStreet != ""
                                              ? locationProvider.nameStreet
                                              : "Villas de San Jerónimo #203",
                                          style: titlesHomeTextStyle,
                                          textScaleFactor: 0.97,
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
                  child: Container(
                    height: _height * 0.067,
                    child: SearchInput(
                        hintText: "¿Qué deseas comprar hoy?...",
                        icon: Icon(Icons.search)),
                  ),
                ),
              ),
              Container(
                  color: Colors.white,
                  child: buildCarrousel(imageList, _height)),
              SizedBox(height: 10),
              Container(
                  color: Colors.white, child: buildCategories(_height, _width)),
              Container(
                  color: Colors.white,
                  child: buildRecommendForYou(_height, _width))
            ],
          ),
        ));
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
            SizedBox(height: 10),
            Container(
              width: width,
              height: height * 0.5,
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
                              Text("150 pesos por tonelada"),
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
                              Text("150 pesos por tonelada"),
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
      margin: EdgeInsets.only(top: 15, bottom: 15),
      child: CarouselSlider.builder(
        itemCount: imageList.length,
        options: CarouselOptions(
            enlargeCenterPage: true,
            height: height * 0.25,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
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
                child: Image.network(
                  imageList[i],
                  height: 100,
                  width: 300,
                  fit: BoxFit.cover,
                ),
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
}
