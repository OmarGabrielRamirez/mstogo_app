import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mining_solutions/screens/home_page.dart';
import 'package:mining_solutions/screens/login_page.dart';

import 'package:provider/provider.dart';

import 'services/theme_services.dart';
import 'theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        "login": (context) => LoginPage(),
        "home": (context) => HomePage(),
        // "second": (context) => SecondPage(),
      },
    );
  }
}
