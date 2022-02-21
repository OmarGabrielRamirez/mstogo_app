import 'package:flutter/material.dart';
import 'package:mining_solutions/widgets/button_model.dart';

import '../../theme.dart';

class SelectTypeAccountPage extends StatefulWidget {
  const SelectTypeAccountPage({Key? key}) : super(key: key);

  @override
  _SelectTypeAccountPageState createState() => _SelectTypeAccountPageState();
}

class _SelectTypeAccountPageState extends State<SelectTypeAccountPage> {
  // Selecciona el tipo de cuenta del usuario

  int selectedIndex = -1;
  bool isSelectedSomething = false;

  ///

  late List<TypeAccount> typesAccount;

  @override
  void initState() {
    super.initState();
    typesAccount = [
      TypeAccount(
          isSelected: false,
          icon: Icons.shopping_bag_outlined,
          firstWord: 'Quiero ',
          richAction: "comprar ",
          lastWord: "productos",
          description:
              "Si eres Constructora, tienes una obra, o simplemente necesitas material, puedes comprarlo en Hubmine en menos de 5 minutos."),
      TypeAccount(
          isSelected: false,
          icon: Icons.sell,
          firstWord: 'Quiero ',
          richAction: "vender ",
          lastWord: "en Hubmine",
          description:
              "Vende tus productos en nuestra Plataforma y aumenta tu volumen de ventas. Deja de preocuparte por la logística, corre por nuestra cuenta."),
      TypeAccount(
          isSelected: false,
          icon: Icons.alt_route_outlined,
          firstWord: 'Quiero ',
          richAction: "transportar ",
          lastWord: "en Hubmine",
          description:
              "Conduce en Hubmine y genera más ingresos como Conductor. Registra tu o tus camiones y únete a la comunidad de Hubmine Transportistas")
    ];
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[50],
                      border: Border.all(color: Colors.grey[50]!),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.help,
                          color: Colors.grey[500],
                          size: 21,
                        ),
                        onPressed: () {
                          // do something
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Text("Ayuda", style: bodyTextStyle),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: isSelectedSomething
          ? Container(
              height: 110,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  gradient: LinearGradient(
                      colors: [Colors.white, Colors.white],
                      stops: [0.5, 0.8],
                      begin: FractionalOffset.bottomCenter,
                      end: FractionalOffset.topCenter)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Button(
                        color: Color(0xFF259793),
                        text: Text(
                          "Siguiente",
                          style: buttonConfirmTextStyle,
                        ),
                        width: double.infinity,
                        height: size.height * 0.06,
                        action: () {
                          Navigator.of(context).pushNamed('register');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          : null,
      body: Container(
        height: height,
        width: width,
        color: Colors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 25.0, left: 20.0, right: 60),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("¿Cómo te quieres registrar?",
                        style: subHeadingPrimaryTextStyle),
                    SizedBox(height: 8),
                    Text(
                        "Hubmine se adapta a lo que buscas para darte la mejor experiencia de uso, cuéntanos como quieres registrarte.",
                        style: bodyTextStyle),
                  ],
                ),
              ),
              SizedBox(height: 0),
              Container(
                height: height - 350,
                child: ListView.builder(
                    itemCount: typesAccount.length,
                    itemBuilder: (BuildContext context, int position) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = position;
                            isSelectedSomething = true;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15, left: 14.0, right: 14.0),
                          child: Container(
                            decoration: selectedIndex == position
                                ? BoxDecoration(
                                    boxShadow: [
                                        BoxShadow(
                                          color: primaryClr.withOpacity(0.3),
                                          spreadRadius: 4,
                                          blurRadius: 15,
                                          offset: Offset(0,
                                              1), // changes position of shadow
                                        ),
                                      ],
                                    color: Colors.white,
                                    border: selectedIndex == position
                                        ? Border.all(color: Colors.teal[200]!)
                                        : Border.all(color: Colors.white),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)))
                                : BoxDecoration(
                                    color: Colors.grey[50],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                            width: width,
                            height: height * 0.16,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        typesAccount[position].icon,
                                        color: primaryClr,
                                      ),
                                      SizedBox(width: 5),
                                      RichText(
                                        text: TextSpan(
                                          text: typesAccount[position]
                                              .firstWord
                                              .toString(),
                                          style: bodyTextBoldIntroStyle,
                                          children: [
                                            TextSpan(
                                              text: typesAccount[position]
                                                  .richAction
                                                  .toString(),
                                              style: bodyTextPrimaryStyle,
                                            ),
                                            TextSpan(
                                              text: typesAccount[position]
                                                  .lastWord,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    typesAccount[position]
                                        .description
                                        .toString(),
                                    style: bodyTextStyle,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ]),
      ),
    );
  }
}

class TypeAccount {
  bool? isSelected;
  IconData? icon;
  String? firstWord;
  String? lastWord;
  String? description;
  String? richAction;

  TypeAccount(
      {this.isSelected,
      this.icon,
      this.firstWord,
      this.lastWord,
      this.description,
      this.richAction});
}
