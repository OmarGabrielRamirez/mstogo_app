import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mining_solutions/providers/location_provider.dart';
import 'package:mining_solutions/providers/new_direction_provider.dart';
import 'package:mining_solutions/providers/register_provider.dart';
import 'package:mining_solutions/screens/demos/buttons_demo_page.dart';
import 'package:mining_solutions/screens/login_page.dart';
import 'package:mining_solutions/screens/demos/textfields_demo_page.dart';
import 'package:mining_solutions/services/location_services.dart';
import 'package:mining_solutions/widgets/checkReady.dart';

import 'providers/directions_provider.dart';
import 'providers/verification_code_info.dart';
import 'screens/intro/select_type_account.dart';
import 'screens/locations/confirm_location_page.dart';
import 'screens/locations/current_location_page.dart';
import 'screens/intro/intro_screen.dart';
import 'screens/demos/maps_demo.dart';
import 'screens/enter_verification_code_page.dart';
import 'screens/home/home_page.dart';
import 'screens/login_with_phone.dart';
import 'screens/registers_page.dart';
import 'screens/splash_screen.dart';
import 'screens/step_two_register_page.dart';
import 'services/theme_services.dart';
import 'theme.dart';
import 'package:provider/provider.dart';
import 'package:bot_toast/bot_toast.dart';

void main() async {
  await GetStorage.init();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => VerificationCodeInfo()),
        ChangeNotifierProvider(create: (_) => DirectionProvider()),
        ChangeNotifierProvider(create: (_) => RegisterInfo()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        ChangeNotifierProvider(create: (_) => NewDirectionProvider())
      ],
      child: GetMaterialApp(
        builder: BotToastInit(),
        debugShowCheckedModeBanner: false,
        theme: Themes.light,
        darkTheme: Themes.dark,
        themeMode: ThemeService().theme,
        title: 'HubMine',
        initialRoute: 'splash',
        routes: {
          "splash": (context) => const SplashPage(),
          "intro_screen": (context) => const IntroScreen(),
          "select_type_account": (context) => const SelectTypeAccountPage(),
          "login": (context) => const LoginPage(),
          "register": (context) => RegisterPage(),
          "step-two-register": (context) => StepTwoRegisterPage(),
          "home": (context) => HomePage(),
          "second": (context) => SecondPage(),
          "login_with_phone": (context) => LoginWithPhone(),
          "enter_verification_code": (context) => EnterVerificationCode(),
          "demo_maps": (context) => DemoMaps(),
          'current_location_confirm': (context) => CurrentLocationPage(),
          // "confirm_location_page": (context) => ConfirmLocationPage(),
          "check-register": (context) => CheckReady()
        },
      ),
    );
  }
}

// TODO: Añadir validaciones de formularios (Campos requeridos)