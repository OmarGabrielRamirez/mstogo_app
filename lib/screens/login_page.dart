import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mining_solutions/screens/home_page.dart';
import 'package:mining_solutions/services/auth_services.dart';
import 'package:mining_solutions/theme.dart';
import 'package:mining_solutions/widgets/alert_dialog.dart';
import 'package:mining_solutions/widgets/button_model.dart';
import 'package:mining_solutions/widgets/input_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:http/http.dart' as http;

import '../services/location_services.dart';
import 'registers_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    ServiceLocation.getCurrentLocation(context);
  }

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;

  signIn(String email, String password) async {
    print(email);
    print(password);
    //final SharedPreferences prefs = await _prefs;
    var url = Uri.parse("http://awsms.syncronik.com/api/auth/login/");
    Map body = {"email": email, "password": password};
    var jsonResponse;
    var res = await http.post(url, body: body);

    print(res.statusCode);

    if (res.statusCode == 200) {
      jsonResponse = json.decode(res.body);
      print("Status code ${res.statusCode}");
      print("Response JSON ${res.body}");

      if (jsonResponse != Null) {
        setState(() {
          _isLoading = false;
        });

        // prefs.setInt("user_id", jsonResponse['id']);
        // prefs.setString("token", jsonResponse['token']);
        // prefs.setString("email", jsonResponse['email']);

        // userInfo.uid = jsonResponse['id'];
        // userInfo.firstName = jsonResponse['first_name'];
        // userInfo.lastName = jsonResponse['last_name'];
        // userInfo.email = jsonResponse['email'];
        // userInfo.company = jsonResponse['company'];
        // userInfo.address = jsonResponse['address'];
        // userInfo.phone = jsonResponse['phone'];

        // String urlPhoto =
        //     "http://rotary.syncronik.com/api/v1/profile-pic/${userInfo.uid}";
        // var res_photo = await http.get(urlPhoto);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => HomePage()),
            (Route<dynamic> route) => false);
        // try {
        //   //var jsonResponsePicture = json.decode(res_photo.body);
        //   //userInfo.urlPicture = jsonResponsePicture['picture'];
        //   print("Picture User info: ${userInfo.urlPicture}");

        // } catch (e) {
        //   Navigator.of(context).pushNamed('/wait');
        // }
      }
    } else if (res.statusCode == 401) {
      setState(() {
        _isLoading = false;
      });
      print("No existe el usuario");
      showAlertDialog("Email o contraseña incorrectos", context);
    } else if (res.statusCode == 500) {
      print("Error del servidor");
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (BuildContext context) {
                    return RegisterPage();
                  }), (route) => false);
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
                  Input(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    label: "Email",
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  PasswordField(controller: _passwordController),
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
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Center(
                        child: Button(
                          color: const Color(0xFF259793),
                          text: Text(
                            "Iniciar sesión",
                            style: buttonTextStyle,
                          ),
                          width: double.infinity,
                          height: size.height * 0.07,
                          action: () async {
                            if (await signInDummy()) {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          HomePage()),
                                  (Route<dynamic> route) => false);
                            }
                            // signIn(_emailController.text,
                            //     _passwordController.text);
                            // Navigator.of(context).pushAndRemoveUntil(
                            //     MaterialPageRoute(
                            //         builder: (BuildContext context) {
                            //   return HomePage();
                            // }), (route) => false);
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
                        action: () {
                          Navigator.of(context).pushNamed('login_with_phone');
                        },
                        text: Text("Número de teléfono",
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
