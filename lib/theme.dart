import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

const Color darkGreyClr = Color(0xFF6C6969);
const Color midGreyClr = Color(0xFF9A9494);
const Color lightGreyClr = Color(0xFFEAEAEA);
const Color yellowClr = Color(0xFFFFA901);
const Color white = Colors.white;
const Color primaryClr = Color(0xFF259793);
Color? darkHeaderClr = Colors.grey[800];

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
      fontSize: 26.0,
      fontWeight: FontWeight.w600,
      color: Get.isDarkMode ? Colors.white : Colors.black);
}

TextStyle get bodyTextStyle {
  return GoogleFonts.inter(color: Get.isDarkMode ? Colors.white : Colors.black);
}

TextStyle get buttonTextStyle {
  return GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.w600);
}

TextStyle get buttonTextDarkStyle {
  return GoogleFonts.inter(
      color: Color(0xFF259793), fontWeight: FontWeight.w600);
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
