import 'package:flutter/material.dart';
import 'package:mining_solutions/widgets/text_model.dart';

class SeconPage extends StatelessWidget {
  const SeconPage({Key? key}) : super(key: key);
  static final String name = "second";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo de cuadros de texto"),
      ),
      body: Column(
        children: [
          InputTexts(
            icon: Icon(Icons.remove_red_eye),
            label: "Nombre",
          ),
          InputTexts(
            icon: Icon(Icons.add_circle_outline_sharp),
            label: "Apellido",
          ),
          InputTexts(
            label: "Contraseña",
          ),
          InputTexts(
            label: "Confirmar contraseña",
          )
        ],
      ),
    );
  }
}
