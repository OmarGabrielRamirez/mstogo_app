import 'package:flutter/material.dart';
import 'package:mining_solutions/providers/verification_code_info.dart';
import 'package:mining_solutions/screens/registers_page.dart';
import 'package:mining_solutions/theme.dart';
import 'package:mining_solutions/widgets/button_model.dart';
import 'package:mining_solutions/widgets/input_model.dart';

import 'package:provider/provider.dart';

import 'intro/select_type_account.dart';

class LoginWithPhone extends StatefulWidget {
  const LoginWithPhone({Key? key}) : super(key: key);

  @override
  _LoginWithPhoneState createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> {
  // TODO Crear función para llamar al backend y generar el código

  sendOtp(String phone) async {
    // Function to call WebService to send OTP Code
    Future.delayed(const Duration(milliseconds: 400), () {
      Navigator.of(context).pushNamed("enter_verification_code");
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _phoneController = TextEditingController();
    final phoneOTP = Provider.of<VerificationCodeInfo>(context);
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
                  Navigator.of(context)
                      .pushReplacementNamed("select_type_account");
                },
                child: Text(
                  "¿No tienes una cuenta? Regístrate",
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
                    "Número de teléfono",
                    style: subtitleLoginTextStyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CountryField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Center(
                        child: Button(
                          color: Color(0xFF259793),
                          text: Text(
                            "Enviar código",
                            style: buttonTextStyle,
                          ),
                          width: double.infinity,
                          height: size.height * 0.07,
                          action: () {
                            phoneOTP.phone = _phoneController.text;
                            sendOtp(phoneOTP.phone);
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
                        action: () {
                          Navigator.pop(context);
                        },
                        color: Color(0xFFD8F6F0),
                        width: double.infinity,
                        height: size.height * 0.07,
                        text: Text("Correo electrónico",
                            style: buttonTextDarkStyle),
                      ),
                      SizedBox(
                        height: size.height * 0.1,
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
