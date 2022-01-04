import 'package:flutter/material.dart';

import '../theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Escritura"),),
      body: Center(
        child: Text("Hola Mundo", style: titleTextStyle )
      ),
    );
  }
}