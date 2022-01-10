import 'package:flutter/material.dart';
import 'package:mining_solutions/theme.dart';
import 'package:mining_solutions/widgets/button_model.dart';
import 'package:mining_solutions/widgets/input_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        child: GestureDetector(
          onTap: () {
            final FocusScopeNode focus = FocusScope.of(context);
            if (!focus.hasPrimaryFocus && focus.hasFocus) {
              FocusManager.instance.primaryFocus!.unfocus();
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 42.0,
                      width: 109.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/logo.png'),
                        fit: BoxFit.fill,
                      ))),
                  Text(
                    "Inicia Sesión",
                    style: loginTextStyle,
                  ),
                  Text(
                    "Bienvenido de vuelta, entra a tu cuenta",
                    style: subtitleLoginTextStyle,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Email",
                    style: subtitleLoginTextStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Input(
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Contraseña",
                    style: subtitleLoginTextStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  PasswordField(),
                  SizedBox(height: 20),
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
                    height: 20,
                  ),
                  Column(
                    children: [
                      Center(
                        child: Button(
                          color: Color(0xFF259793),
                          text: Text(
                            "Iniciar sesión",
                            style: buttonTextStyle,
                          ),
                          width: double.infinity,
                          height: size.height * 0.07,
                          action: () {
                            Navigator.of(context).pushNamed('home');
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("o inicia via"),
                      SizedBox(
                        height: 20,
                      ),
                      Button(
                        color: Color(0xFFD8F6F0),
                        width: double.infinity,
                        height: size.height * 0.07,
                        text: Text("Número de teléfono",
                            style: buttonTextDarkStyle),
                      ),
                      SizedBox(
                        height: size.height * 0.1,
                      ),
                      Container(
                          child: InkWell(
                        onTap: () async {},
                        child: Text(
                          "¿No tienes una cuenta? Regístrate",
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
      ),
    );
  }
}
