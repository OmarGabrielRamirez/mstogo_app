import 'package:flutter/material.dart';
import 'package:mining_solutions/theme.dart';
import 'package:mining_solutions/widgets/button_model.dart';
import 'package:mining_solutions/widgets/text_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Contraseña",
                  style: TextStyle(fontSize: size.aspectRatio),
                ),
                SizedBox(
                  height: 10,
                ),
                PasswordField(),
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
                                horizontal: 115, vertical: 20),
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
                            EdgeInsets.symmetric(horizontal: 115, vertical: 20),
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
