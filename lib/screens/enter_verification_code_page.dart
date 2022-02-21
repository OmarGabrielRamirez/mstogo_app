import 'package:flutter/material.dart';
import 'package:mining_solutions/providers/verification_code_info.dart';
import 'package:mining_solutions/theme.dart';
import 'package:mining_solutions/widgets/button_model.dart';

import 'package:provider/provider.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EnterVerificationCode extends StatefulWidget {
  EnterVerificationCode({
    Key? key,
  });

  @override
  _EnterVerificationCodeState createState() => _EnterVerificationCodeState();
}

class _EnterVerificationCodeState extends State<EnterVerificationCode> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final phoneOTP = Provider.of<VerificationCodeInfo>(context);
    TextEditingController otpController = TextEditingController();
    String currentText = "";

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
                    "Ingresa el código de verificación",
                    style: subtitleLoginTextStyle,
                  ),
                  Text(
                    "Enviado a ${phoneOTP.countryCode}${phoneOTP.phone}",
                    style: subtitleLoginTextStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PinCodeTextField(
                    keyboardType: TextInputType.number,
                    textStyle: TextStyle(color: Colors.black),
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      borderWidth: 0,
                      selectedColor: Colors.white,
                      activeColor: Colors.white,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      inactiveColor: Colors.grey,
                      shape: PinCodeFieldShape.box,
                      selectedFillColor: Colors.white,
                      errorBorderColor: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 60,
                      fieldWidth: 50,
                    ),
                    animationDuration: const Duration(milliseconds: 200),
                    enableActiveFill: true,
                    controller: otpController,
                    onCompleted: (value) {
                      debugPrint("Completed");
                      // TODO Mandar a llamar el WebService de verifcación del código
                    },
                    onChanged: (value) {
                      debugPrint(value);
                      setState(() {
                        currentText = value;
                      });
                    },
                    beforeTextPaste: (text) {
                      return true;
                    },
                    appContext: context,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Center(
                        child: Button(
                          // TODO Desabilitar botón
                          color: Color(0xFF259793),
                          text: Text(
                            "Verificar",
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
                      Text("¿No lo recibiste?"),
                      SizedBox(
                        height: 20,
                      ),
                      Button(
                        action: () {
                          //TODO Reenviar código
                          //resend = true y notificar en la misma pantalla que el código se envió de nuevo
                        },
                        color: Color(0xFFD8F6F0),
                        width: double.infinity,
                        height: size.height * 0.07,
                        text:
                            Text("Reenviar código", style: buttonTextDarkStyle),
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
