import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mining_solutions/providers/register_provider.dart';
import 'package:mining_solutions/screens/demos/buttons_demo_page.dart';
import 'package:mining_solutions/screens/login_page.dart';
import 'package:mining_solutions/screens/demos/textfields_demo_page.dart';
import 'package:mining_solutions/widgets/checkReady.dart';

import 'providers/directions_provider.dart';
import 'providers/verification_code_info.dart';
import 'screens/demos/maps_demo.dart';
import 'screens/enter_verification_code_page.dart';
import 'screens/home_page.dart';
import 'screens/login_with_phone.dart';
import 'screens/registers_page.dart';
import 'screens/step_two_register_page.dart';
import 'services/theme_services.dart';
import 'theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => VerificationCodeInfo()),
        ChangeNotifierProvider(create: (_) => DirectionProvider()),
        ChangeNotifierProvider(create: (_) => RegisterInfo())
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Themes.light,
        darkTheme: Themes.dark,
        themeMode: ThemeService().theme,
        title: 'Material App',
        initialRoute: 'login',
        routes: {
          "login": (context) => LoginPage(),
          "register": (context) => RegisterPage(),
          "step-two-register": (context) => StepTwoRegisterPage(),
          "home": (context) => HomePage(),
          "second": (context) => SecondPage(),
          "login_with_phone": (context) => LoginWithPhone(),
          "enter_verification_code": (context) => EnterVerificationCode(),
          "demo_maps": (context) => DemoMaps(),
          "check-register": (context) => CheckReady()
        },
      ),
    );
  }
}
