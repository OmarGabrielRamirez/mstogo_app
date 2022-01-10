import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

const Color darkGreyClr = Color(0xFF6C6969);
const Color midGreyClr = Color(0xFF9A9494);
const Color lightGreyClr = Color(0xFFEAEAEA);
const Color yellowClr = Color(0xFFFFA901);
const Color white = Colors.white;
const Color primaryClr = Color(0xFF012AFF);
Color? darkHeaderClr = Colors.grey[800];
double fontSize = 0;

class Themes {
  static final light = ThemeData(
    backgroundColor: Colors.white,
    primaryColor: primaryClr,
    brightness: Brightness.light,
  );
  static final dark = ThemeData(
    backgroundColor: darkGreyClr,
    brightness: Brightness.dark,
    primaryColor: primaryClr,
  );
}

TextStyle get titleTextStyle {
  return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      color: Get.isDarkMode ? Colors.white : Colors.black);
}

TextStyle get bodyTextStyle {
  return GoogleFonts.inter(color: Get.isDarkMode ? Colors.white : Colors.black);
}

TextStyle get buttonTextStyle {
  return GoogleFonts.inter(
      color: Colors.white, fontWeight: FontWeight.w600, fontSize: fontSize);
}

TextStyle get loginTextStyle {
  return GoogleFonts.inter(
      fontSize: 24, color: primaryClr, fontWeight: FontWeight.w700);
}

TextStyle get subtitleLoginTextStyle {
  return GoogleFonts.inter(fontSize: 14, color: darkGreyClr);
}

TextStyle get passwordLoginTextStyle {
  return GoogleFonts.inter(fontSize: 14, color: primaryClr);
}
