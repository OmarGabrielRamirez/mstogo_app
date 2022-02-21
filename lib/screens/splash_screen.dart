import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:mining_solutions/screens/intro/intro_screen.dart';
import 'package:mining_solutions/screens/login_page.dart';
import 'package:mining_solutions/theme.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/LogoSplash.png'),
      logoSize: 80,
      backgroundColor: primaryClr,
      showLoader: true,
      loaderColor: Colors.white,
      loadingText: Text("Versión 1.0", style: loadingStyle),
      navigator: IntroScreen(),
      durationInSeconds: 1,
    );
  }
}
