import 'package:flutter/material.dart';
import 'package:mining_solutions/widgets/text_model.dart';

import '../theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Inicia sesión",
                style: loginTextStyle,
              ),
              Text(
                "Bienvenido de vuelta, entra a tu cuenta",
                style: subtitleLoginTextStyle,
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                "Email",
                style: subtitleLoginTextStyle,
              ),
              InputTexts(),
              SizedBox(
                height: 20,
              ),
              Text("Contraseña"),
              InputTexts(
                icon: Icon(Icons.remove_red_eye),
              )
            ],
          ),
        ),
      )),
    );
  }
}
