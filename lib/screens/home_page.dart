import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:badges/badges.dart';
import 'package:mining_solutions/screens/cart_page.dart';
import 'package:mining_solutions/screens/login_page.dart';
import 'package:mining_solutions/screens/orders_page.dart';
import 'package:mining_solutions/screens/profile_page.dart';
import 'package:mining_solutions/theme.dart';
import 'package:mining_solutions/widgets/input_model.dart';

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
                  leading: CircleAvatar(
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
      "https://syncronik.s3.us-east-2.amazonaws.com/Hubmine/piedra-caliza.jpg",
      'https://syncronik.s3.us-east-2.amazonaws.com/Hubmine/hubmine-slider-retroexcavadora-2.jpeg',
      'https://syncronik.s3.us-east-2.amazonaws.com/Hubmine/hubmine-slider-mina.jpeg',
      'https://syncronik.s3.us-east-2.amazonaws.com/Hubmine/hubmine-concreto.jpeg'
    ];
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    print(_height);
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
                          height: 25.0,
                          width: 130.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('assets/hubmine-logo.png'),
                            fit: BoxFit.fill,
                          ))),
                      GestureDetector(
                        onTap: () {
                          print("Ver notificaciones");
                          //TODO Implementar la sección de notificaciones
                        },
                        child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 0.3,
                                color: Colors.black26,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(
                                      10.0) //                 <--- border radius here
                                  ),
                            ),
                            child:
                                Icon(Icons.notifications, color: primaryClr)),
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
                    child: Container(
                      height: _height * 0.11,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0, left: 16.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Ubicación", style: subHeadingTextStyle),
                              SizedBox(height: 7),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed('demo_maps');
                                  // TODO Abrir pantalla de mapas
                                  print("Obteniendo ubicación");
                                },
                                child: Row(
                                  children: [
                                    Icon(Icons.location_on, color: Colors.red),
                                    SizedBox(width: 6),
                                    Text("San Pedro Garza",
                                        style: titlesHomeTextStyle),
                                    SizedBox(width: 3),
                                    Icon(
                                      Icons.arrow_drop_down_outlined,
                                    ),
                                  ],
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
            Row(children: [
              Text("Recomendados para ti", style: subHeadingTextStyle),
            ]),
            SizedBox(height: 10),
            Container(
              width: width,
              height: height * 0.15,
              child: Card(
                  child: Column(children: [
                ListTile(
                  leading: Container(
                    height: height * 0.09,
                    width: width / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://images.unsplash.com/photo-1590884056072-0248bac7797e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  title: Text('The  is having:'),
                  subtitle: Text('Votes.'),
                ),
              ])),
            ),
            Container(
              width: width,
              height: height * 0.15,
              child: Card(
                  child: Column(children: [
                ListTile(
                  leading: Container(
                    height: height * 0.09,
                    width: width / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://images.unsplash.com/photo-1590884056072-0248bac7797e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  title: Text('The  is having:'),
                  subtitle: Text('Votes.'),
                ),
              ])),
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
                children: [
                  Column(
                    children: [
                      Container(
                        height: height * 0.09,
                        width: width / 5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://images.unsplash.com/photo-1590884056072-0248bac7797e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Cemento")
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: height * 0.09,
                        width: width / 5.5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://images.unsplash.com/photo-1628229896881-b0ef1ad5e777?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1473&q=80'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Concreto")
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: height * 0.09,
                        width: width / 5.5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://images.unsplash.com/photo-1601727096707-d035697f4d8f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Agregados")
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: height * 0.09,
                        width: width / 5.5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://images.unsplash.com/photo-1601727096707-d035697f4d8f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Agregados")
                    ],
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
