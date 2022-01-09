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
                  Input(
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Contraseña",
                    style: subtitleLoginTextStyle,
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
                        child: Button(
                          color: Color(0xFF012AFF),
                          text: "Iniciar sesión",
                          width: double.infinity,
                          height: size.height * 0.07,
                          action: () {
                            Navigator.of(context).pushNamed('second');
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
                        color: Colors.grey[500],
                        width: double.infinity,
                        height: size.height * 0.07,
                        text: "Número de teléfono",
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
