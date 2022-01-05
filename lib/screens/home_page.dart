import 'package:flutter/material.dart';
import 'package:mining_solutions/widgets/button_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Escritura"),
      ),
      body: Center(child: ButtonStyles()),
    );
  }
}
