import 'package:flutter/material.dart';
import 'package:mining_solutions/widgets/input_model.dart';

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
              Input(
                icon: Icon(Icons.person),
                label: "Nombre",
              ),
              SizedBox(
                height: 40,
              ),
              Input(
                label: "Apellido",
              ),
              SizedBox(
                height: 40,
              ),
              Input(
                label: "Contraseña",
                icon: Icon(Icons.remove_red_eye_sharp),
              ),
              SizedBox(
                height: 40,
              ),
              Input(
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
