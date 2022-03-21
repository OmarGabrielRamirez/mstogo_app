import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mining_solutions/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:mining_solutions/widgets/button_model.dart';

class DetailsProductPage extends StatefulWidget {
  final String imageAsset;
  final String category;
  final String titleProduct;
  final String descrption;
  final String weight;
  final String measures;
  const DetailsProductPage({
    Key? key,
    required this.imageAsset,
    required this.titleProduct,
    required this.descrption,
    required this.weight,
    required this.measures,
    required this.category,
  }) : super(key: key);

  @override
  State<DetailsProductPage> createState() => _DetailsProductPageState();
}

class _DetailsProductPageState extends State<DetailsProductPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(0.0, 0.0),
          child: AppBar(
            // Here we create one to set status bar color
            elevation: 0,
            backgroundColor: Colors
                .white, // Set any color of status bar you want; or it defaults to your theme's primary color
          )),
      bottomNavigationBar: Container(
        height: 10,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(25)),
            gradient: LinearGradient(
                colors: [Colors.white, Colors.white],
                stops: [0.5, 0.8],
                begin: FractionalOffset.bottomCenter,
                end: FractionalOffset.topCenter)),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, top: 20, right: 30),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Button(
                  color: Color(0xFF259793),
                  text: Text(
                    "Guardar dirección",
                    style: buttonConfirmTextStyle,
                  ),
                  width: size.width / 3,
                  height: size.height * 0.06,
                  action: () {
                    Navigator.of(context).pushNamed('confirm_location_page');
                  },
                ),
                Button(
                  color: Color(0xFF259793),
                  text: Text(
                    "Guardar dirección",
                    style: buttonConfirmTextStyle,
                  ),
                  width: size.width / 3,
                  height: size.height * 0.06,
                  action: () {
                    Navigator.of(context).pushNamed('confirm_location_page');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                  child: CachedNetworkImage(
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitWidth,
                    height: 260,
                    imageUrl: widget.imageAsset,
                    placeholder: (context, url) => const Center(
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
              child: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: primaryLightClr,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: primaryClr,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 20,
              right: 20,
              child: Container(
                decoration: const BoxDecoration(
                  color: primaryLightClr,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
                width: 40,
                height: 40,
                child: const Padding(
                  padding: EdgeInsets.only(left: 0),
                  child: Icon(
                    Icons.shopping_cart,
                    color: primaryClr,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 260,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 27, left: 34, bottom: 20, right: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      widget.category,
                                      style: GoogleFonts.inter(
                                          fontSize: 19,
                                          color: primaryClr,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      widget.titleProduct,
                                      style: GoogleFonts.inter(
                                          fontSize: 29,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 103,
                              height: 42,
                              decoration: const BoxDecoration(
                                color: primaryLightClr,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30.0),
                                  bottomRight: Radius.circular(30.0),
                                  topLeft: Radius.circular(30.0),
                                  topRight: Radius.circular(30.0),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: const Icon(
                                      Icons.chat,
                                      color: primaryClr,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                    ),
                                    child: const Text(
                                      'Chat',
                                      style: TextStyle(
                                        color: primaryClr,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 34, right: 34, bottom: 15),
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                'Descripción',
                                style: GoogleFonts.inter(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 34, right: 34),
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                widget.descrption,
                                maxLines: 5,
                                textAlign: TextAlign.justify,
                                textScaleFactor: 1.0,
                                style: GoogleFonts.inter(
                                  color: Colors.black.withOpacity(0.6),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: Container(
                                          height: 200,
                                          width: 400,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Características técnicas',
                                                    style: GoogleFonts.inter(
                                                        fontSize: 16,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                  IconButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      icon: const Icon(
                                                        Icons.close,
                                                        color: Colors.black,
                                                      ))
                                                ],
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    right: 10,
                                                    bottom: 5,
                                                    top: 10),
                                                child: Row(
                                                  children: [
                                                    const SizedBox(
                                                      height: 35,
                                                      width: 35,
                                                      child: Icon(Icons
                                                          .accessible_sharp),
                                                    ),
                                                    Container(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            child: Text(
                                                              'Peso Volumétrico',
                                                              style: GoogleFonts.inter(
                                                                  fontSize: 13,
                                                                  color:
                                                                      darkGreyClr,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              widget.measures,
                                                              style: GoogleFonts.inter(
                                                                  fontSize: 13,
                                                                  color:
                                                                      darkGreyClr,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    right: 10, bottom: 5),
                                                child: Row(
                                                  children: [
                                                    const SizedBox(
                                                      height: 35,
                                                      width: 35,
                                                      child: Icon(Icons
                                                          .accessible_sharp),
                                                    ),
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 10),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            child: Text(
                                                              'Medidas',
                                                              style: GoogleFonts.inter(
                                                                  fontSize: 13,
                                                                  color:
                                                                      darkGreyClr,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              widget.weight,
                                                              style: GoogleFonts.inter(
                                                                  fontSize: 13,
                                                                  color:
                                                                      darkGreyClr,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    });
                              },
                              child: Container(
                                padding: const EdgeInsets.only(
                                    left: 34, right: 34, bottom: 10),
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  'Ver características técnicas',
                                  style: GoogleFonts.inter(
                                      fontSize: 15,
                                      color: Colors.black,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 34, right: 34, bottom: 7),
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                '¿Que cantidad necesitas?',
                                style: GoogleFonts.inter(
                                    fontSize: 15,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        left: 34, right: 10, bottom: 0),
                                    height: 43,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                child: const Icon(Icons.remove),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Text(
                                            '50',
                                            style: GoogleFonts.inter(
                                                fontSize: 16,
                                                color: darkGreyClr,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                child: const Icon(Icons.add),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      'Toneladas',
                                      style: GoogleFonts.inter(
                                          fontSize: 16,
                                          color: darkGreyClr,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding:const EdgeInsets.only(top: 25),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 28,
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      child: MaterialButton(
                                        elevation: 0,
                                        onPressed: () {},
                                        color: primaryLightClr,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                        child: Expanded(
                                          child: SizedBox(
                                            height: 50,
                                            child: Center(
                                              child: Text(
                                                "\$22000 M.N",
                                                style: GoogleFonts.inter(
                                                    fontSize: 17,
                                                    color: primaryClr,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Button(
                                      height: 50,
                                      color: const Color(0xFF259793),
                                      text: Text("Añadir al carrito",
                                          style: GoogleFonts.inter(
                                              fontSize: 15,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 28,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
