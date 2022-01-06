import 'package:flutter/material.dart';
import 'package:mining_solutions/widgets/text_model.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo de cuadros de texto"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              InputTexts(
                obscureText: false,
                icon: Icon(Icons.person),
                label: "Nombre",
              ),
              SizedBox(
                height: 40,
              ),
              InputTexts(
                obscureText: false,
                label: "Apellido",
              ),
              SizedBox(
                height: 40,
              ),
              InputTexts(
                obscureText: false,
                label: "Contraseña",
                icon: Icon(Icons.remove_red_eye_sharp),
              ),
              SizedBox(
                height: 40,
              ),
              InputTexts(
                obscureText: false,
                label: "Confirmar contraseña",
                icon: Icon(Icons.lock),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
