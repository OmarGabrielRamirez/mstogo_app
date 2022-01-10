import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:badges/badges.dart';
import 'package:mining_solutions/screens/cart_page.dart';
import 'package:mining_solutions/screens/login_page.dart';
import 'package:mining_solutions/screens/orders_page.dart';
import 'package:mining_solutions/screens/profile_page.dart';
import 'package:mining_solutions/theme.dart';

import 'demos/buttons_demo_page.dart';

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
      extendBody: true,
      body: PageView.builder(
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
    return Center(child: Text("Home page"));
  }
}
