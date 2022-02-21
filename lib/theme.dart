import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

const Color darkGreyClr = Color(0xFF6C6969);
const Color midGreyClr = Color(0xFF9A9494);
const Color lightGreyClr = Color(0xFFEAEAEA);
const Color yellowClr = Color(0xFFFFA901);
const Color white = Colors.white;
const Color primaryClr = Color(0xFF259793);
const Color secondaryClr = Color(0xFF0db1ac);
const Color primaryLightClr = Color(0xFFD8F6F0);
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

TextStyle get bodyTextBoldStyle {
  return GoogleFonts.inter(
      color: Get.isDarkMode ? Colors.white : Colors.black,
      fontWeight: FontWeight.w600);
}

TextStyle get bodyTextBoldIntroStyle {
  return GoogleFonts.inter(
      color: Get.isDarkMode ? Colors.white : Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: 16);
}

TextStyle get bodyTextPrimaryStyle {
  return GoogleFonts.inter(color: primaryClr, fontWeight: FontWeight.w600);
}

TextStyle get bodyTermsStyle {
  return GoogleFonts.inter(fontSize: 14.0, color: Colors.grey);
}

TextStyle get bodyTermsPrimaryStyle {
  return GoogleFonts.inter(
      fontSize: 14, color: primaryClr, fontWeight: FontWeight.w600);
}

TextStyle get buttonTextStyle {
  return GoogleFonts.inter(
      color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600);
}

TextStyle get buttonConfirmTextStyle {
  return GoogleFonts.inter(
      fontSize: 17, color: Colors.white, fontWeight: FontWeight.w600);
}

TextStyle get buttonTextDarkStyle {
  return GoogleFonts.inter(
      fontSize: 16, color: Color(0xFF259793), fontWeight: FontWeight.w600);
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

// Home
TextStyle get subHeadingTextStyle {
  return GoogleFonts.inter(
      fontWeight: FontWeight.w600, fontSize: 18, color: Color(0xFF6C6969));
}

TextStyle get subHeadingPrimaryTextStyle {
  return GoogleFonts.inter(
      fontWeight: FontWeight.w600, fontSize: 18, color: primaryClr);
}

TextStyle get subHeadingDirectionTextStyle {
  return GoogleFonts.inter(
      fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black);
}

TextStyle get subDirectionTextStyle {
  return GoogleFonts.inter(fontSize: 17, color: Color(0xFF6C6969));
}

TextStyle get titlesHomeTextStyle {
  return GoogleFonts.inter(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Get.isDarkMode ? Colors.white : Colors.black);
}

TextStyle get inputLabelTextStyle {
  return GoogleFonts.inter(fontSize: 15.0, color: Colors.grey);
}

TextStyle get introTitleTextStyle {
  return GoogleFonts.inter(
      fontWeight: FontWeight.w600, fontSize: 23.0, color: Colors.white);
}

TextStyle get introParTextStyle {
  return GoogleFonts.inter(
      fontWeight: FontWeight.w500, fontSize: 22.0, color: Colors.white);
}

TextStyle get titleLogoTextStyle {
  return GoogleFonts.inter(
      fontWeight: FontWeight.w600, fontSize: 40.0, color: Colors.white);
}

TextStyle get loadingStyle {
  return GoogleFonts.inter(fontSize: 15.0, color: Colors.white);
}
