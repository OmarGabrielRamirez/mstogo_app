import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void showAlertDialog(String message, context) {
  const Color primaryColor = Color(0xFF259793);
  showDialog(
      context: context,
      builder: (buildcontext) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(message),
          actions: <Widget>[
            RaisedButton(
              color: primaryColor,
              child: Text(
                "Cerrar",
                style: GoogleFonts.poppins(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      });
}
