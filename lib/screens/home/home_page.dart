import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:badges/badges.dart';
import 'package:mining_solutions/models/location_data.dart';
import 'package:mining_solutions/screens/cart_page.dart';
import 'package:mining_solutions/screens/home/home_content.dart';
import 'package:mining_solutions/screens/home/home_content_layout.dart';
import 'package:mining_solutions/screens/login_page.dart';
import 'package:mining_solutions/screens/orders_page.dart';
import 'package:mining_solutions/screens/profile_page.dart';
import 'package:mining_solutions/services/directions_services.dart';
import 'package:mining_solutions/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  List<LocationData> _dataLocations = [];
  final padding = const EdgeInsets.symmetric(horizontal: 18, vertical: 12);
  int badge = 0;

  List<Widget> pages = [
    const HomeContentLayout(),
    const CartPage(),
    const OrdersPage(),
    const ProfilePage(),
  ];
  double gap = 10;

  PageController controller = PageController();

  _fetchDataDirections() async {
    _dataLocations = await ServiceDirections.fetchDirectionsAll();
    setState(() {});
  }

  @override
  void initState() {
    _fetchDataDirections();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(0.0, 0.0),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors
                .white, // Set any color of status bar you want; or it defaults to your theme's primary color
          ),
        ),
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
            return Container(child: pages[position]);
          },
          itemCount: 4,
        ),
        bottomNavigationBar: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(100)),
              boxShadow: [
                BoxShadow(
                  spreadRadius: -10,
                  blurRadius: 60,
                  color: Colors.black.withOpacity(.4),
                  offset: const Offset(0, 25),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3),
              child: GNav(
                duration: const Duration(milliseconds: 140),
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
      ),
    );
  }
}
