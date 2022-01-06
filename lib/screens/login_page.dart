import 'package:flutter/material.dart';
import 'package:mining_solutions/theme.dart';
import 'package:mining_solutions/widgets/button_model.dart';
import 'package:mining_solutions/widgets/text_model.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Inicia Sesión",
                  style: loginTextStyle,
                ),
                Text(
                  "Bienvenido de vuelta, entra a tu cuenta",
                  style: subtitleLoginTextStyle,
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Email",
                  style: subtitleLoginTextStyle,
                ),
                SizedBox(
                  height: 10,
                ),
                InputTexts(
                  obscureText: false,
                ),
                SizedBox(
                  height: 25,
                ),
                Text("Contraseña",
                style: subtitleLoginTextStyle,
                ),
                SizedBox(
                  height: 10,
                ),
                InputTexts(
                  icon: Icon(Icons.visibility_off),
                  obscureText: true,
                ),
                SizedBox(height: 10),
                Container(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () async {},
                      child: Text(
                        "¿Olvidaste tu contraseña?",
                        style: passwordLoginTextStyle,
                      ),
                    )),
                SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    Center(
                      child: ButtonStyles(
                          color: Color(0xFF012AFF),
                          border: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 100, vertical: 15),
                            child: Text(
                              "Iniciar sesión",
                              style: buttonTextStyle,
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("o inicia via"),
                    SizedBox(
                      height: 20,
                    ),
                    ButtonStyles(
                      color: Colors.grey[500],
                      border: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                        child: Text(
                          "Via alterna",
                          style: buttonTextStyle,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    Container(
                        child: InkWell(
                      onTap: () async {},
                      child: Text(
                        "¿Crear una cuenta?",
                        style: passwordLoginTextStyle,
                      ),
                    )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
