import 'package:flutter/material.dart';
import 'package:mining_solutions/widgets/bottonNavigatorBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: CustomNavigationBar());
  }
}
