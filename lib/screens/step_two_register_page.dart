import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mining_solutions/providers/register_provider.dart';
import 'package:mining_solutions/screens/home_page.dart';
import 'package:mining_solutions/theme.dart';
import 'package:mining_solutions/widgets/alert_dialog.dart';
import 'package:mining_solutions/widgets/button_model.dart';
import 'package:mining_solutions/widgets/checkReady.dart';
import 'package:mining_solutions/widgets/input_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class StepTwoRegisterPage extends StatefulWidget {
  const StepTwoRegisterPage({Key? key}) : super(key: key);

  @override
  State<StepTwoRegisterPage> createState() => _StepTwoRegisterPageState();
}

class _StepTwoRegisterPageState extends State<StepTwoRegisterPage> {
  TextEditingController _businessNameController = TextEditingController();
  TextEditingController _rfcController = TextEditingController();
  String? bussinessType = "";

  String? selectedValue;

  List<String> options = [
    "Concretera",
    "Constructora",
    "Casa de material",
    "Contratista general",
    "Pedrera",
    "Profesional de construcción",
    "Trituradora"
  ];

  bool _isLoading = false;

  signUp(String name, String lastName, String email, String password,
      String businessName, String businessType, String rfc) async {
    print(email);
    print(password);
    //final SharedPreferences prefs = await _prefs;
    var url = Uri.parse("http://awsms.syncronik.com/api/auth/register/");
    Map body = {
      "first_name": name,
      "last_name": lastName,
      "email": email,
      "password": password,
      "business_name": businessName,
      "business_type": businessType,
      "rfc": rfc
    };
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

        // String urlPhoto =
        //     "http://rotary.syncronik.com/api/v1/profile-pic/${userInfo.uid}";
        // var res_photo = await http.get(urlPhoto);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => CheckReady()),
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
      print("Error");
      showAlertDialog("Ocurrió un error...", context);
    } else if (res.statusCode == 500) {
      print("Error del servidor");
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final registerInfo = Provider.of<RegisterInfo>(context);

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
                  Navigator.of(context).pushNamed("register");
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
                        image: AssetImage('assets/hubmine-logo.png'),
                        fit: BoxFit.fill,
                      ))),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Regístrate",
                    style: loginTextStyle,
                  ),
                  Text(
                    "Cuentanos sobre tu negocio y hagamos trato",
                    style: subtitleLoginTextStyle,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Input(
                      controller: _businessNameController,
                      keyboardType: TextInputType.text,
                      label: "¿Cómo se llama tu negocio?"),
                  SizedBox(height: 15),
                  DropdownButtonHideUnderline(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10)),
                      child: DropdownButton2(
                        hint: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            '¿Que tipo de negocio eres?',
                            style: inputLabelTextStyle,
                          ),
                        ),
                        items: options
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: selectedValue,
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value as String;
                          });
                        },
                        buttonHeight: 60,
                        buttonWidth: width,
                        itemHeight: 40,
                        itemWidth: width * 0.9,
                      ),
                    ),
                  ),
                  /* DropdownInput(
                    value: bussinessType,
                    onChanged: (String? value) {
                      setState(() {
                        bussinessType = value;
                        // state.didChange(newValue);
                      });
                    },
                    hintText: "¿Qué tipo de negocio eres?",
                    options: [
                      "Concretera",
                      "Constructora",
                      "Casa de material",
                      "Contratista general",
                      "Pedrera",
                      "Profesional de construcción",
                      "Trituradora"
                    ],
                    getLabel: (String value) => value,
                  ), */
                  SizedBox(height: 15),
                  Input(
                      controller: _rfcController,
                      keyboardType: TextInputType.text,
                      label: "RFC (Opcional)"),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      Center(
                        child: Button(
                          color: Color(0xFF259793),
                          text: Text(
                            "Finalizar registro",
                            style: buttonTextStyle,
                          ),
                          width: double.infinity,
                          height: size.height * 0.07,
                          action: () {
                            registerInfo.businessName =
                                _businessNameController.text;
                            registerInfo.businessType = selectedValue as String;
                            registerInfo.rfc = _rfcController.text;
                            signUp(
                                registerInfo.name,
                                registerInfo.lastName,
                                registerInfo.email,
                                registerInfo.password,
                                registerInfo.businessName,
                                registerInfo.businessType,
                                registerInfo.rfc);
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
