import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mining_solutions/providers/register_provider.dart';
import 'package:mining_solutions/screens/home/home_page.dart';
import 'package:mining_solutions/theme.dart';
import 'package:mining_solutions/widgets/alert_dialog.dart';
import 'package:mining_solutions/widgets/button_model.dart';
import 'package:mining_solutions/widgets/input_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final registerInfo = Provider.of<RegisterInfo>(context);
    final size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  child: InkWell(
                onTap: () async {
                  Navigator.of(context).popAndPushNamed("login");
                },
                child: Text(
                  "¿Estás de vuelta? Inicia sesión",
                  style: passwordLoginTextStyle,
                ),
              )),
            ],
          ),
        ),
        elevation: 0,
      ),
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
                      height: 35.0,
                      width: 180.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('assets/Logo-Hubmine.png'),
                        fit: BoxFit.fitWidth,
                      ))),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Regístrate",
                    style: loginTextStyle,
                  ),
                  // TODO Cambiar el texto para que sea más amigable (platicarlo con Marketing)
                  Text(
                    "Crea tu cuenta ",
                    style: subtitleLoginTextStyle,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Input(
                    controller: _nameController,
                    keyboardType: TextInputType.name,
                    label: "Ingresa tu nombre",
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Input(
                      controller: _lastNameController,
                      keyboardType: TextInputType.text,
                      label: "Ingresa tu apellido"),
                  SizedBox(height: 15),
                  Input(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      label: "Ingresa tu correo electrónico"),
                  SizedBox(height: 15),
                  PasswordField(controller: _passwordController),
                  SizedBox(height: 15),
                  Column(
                    children: [
                      Center(
                        child: Button(
                          color: Color(0xFF259793),
                          text: Text(
                            "Siguiente (1/2)",
                            style: buttonTextStyle,
                          ),
                          width: double.infinity,
                          height: size.height * 0.07,
                          action: () {
                            registerInfo.name = _nameController.text;
                            registerInfo.lastName = _lastNameController.text;
                            registerInfo.email = _emailController.text;
                            registerInfo.password = _passwordController.text;

                            Navigator.of(context)
                                .pushNamed('step-two-register');
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
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
