import 'package:flutter/material.dart';
import 'package:mining_solutions/theme.dart';
import 'package:mining_solutions/widgets/button_model.dart';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:permission_handler/permission_handler.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int selectedIndex = 0;
  List<Widget> pages = [
    IntroImage(
        height: 300,
        asset: 'assets/rectangle-bg-intro-one.png',
        text: 'Compra sin estrés materiales para tu construcción.'),
    IntroImage(
        asset: 'assets/rectangle-bg-intro-two.png',
        height: 300,
        text: 'Recibe tu pedido en el día y hora que decidas.'),
    IntroImage(
        asset: 'assets/rectangle-bg-intro-three.png',
        height: 300,
        text: 'Obtén el mejor precio y promociones exclusivas.'),
  ];
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
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
          return Stack(
              overflow: Overflow.visible,
              fit: StackFit.loose,
              children: [
                Container(child: pages[position]),
                Positioned(
                    top: 50,
                    right: 30,
                    child: Button(
                        color: Colors.white,
                        text: Text("México", style: buttonTextDarkStyle))),
                Positioned(
                    top: _height * 0.5,
                    right: _width / 2.5,
                    child: Row(
                      children: [
                        DotsIndicator(
                            decorator: DotsDecorator(
                              size: const Size.fromRadius(7),
                              activeSize: const Size.fromRadius(7),
                              color: Colors.white,
                              activeColor: primaryClr,
                            ),
                            dotsCount: pages.length,
                            position: selectedIndex.toDouble())
                      ],
                    ))
              ]);
        },
        itemCount: 3,
      ),
      bottomNavigationBar: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "¿Qué deseas hacer?",
                style: introTitleTextStyle,
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Button(
                          action: () {
                            Navigator.of(context)
                                .pushNamed('select_type_account');
                          },
                          color: Colors.white,
                          text: Text("Regístrate", style: buttonTextDarkStyle),
                          height: _height * 0.06,
                          width: _width * 0.3),
                      Button(
                          action: () {
                            Navigator.of(context).pushNamed('login');
                          },
                          color: primaryLightClr,
                          text: Text("Iniciar sesión",
                              style: buttonTextDarkStyle),
                          height: _height * 0.06,
                          width: _width * 0.3),
                    ]),
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
            color: primaryClr,
            border: Border.all(
              color: primaryClr,
            ),
            borderRadius: BorderRadius.all(Radius.circular(45))),
        height: _height * 0.43,
      ),
    );
  }
}

class IntroImage extends StatelessWidget {
  final String? text;
  final double? height;
  final String? asset;

  const IntroImage({
    this.text,
    this.height,
    this.asset,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(asset.toString()),
          fit: BoxFit.fill,
        )),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(height: height! * 0.5),
            Text(
              "Hubmine",
              style: titleLogoTextStyle,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              "${text}",
              style: introParTextStyle,
              textAlign: TextAlign.center,
            ),
          ]),
        ),
      ),
    );
  }
}
