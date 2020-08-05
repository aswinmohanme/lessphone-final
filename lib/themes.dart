import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme lessphoneTextTheme = TextTheme(
  headline1: GoogleFonts.dmSans(
      fontSize: 107, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.dmSans(
      fontSize: 67, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.dmSans(fontSize: 54, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.dmSans(
      fontSize: 38, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headline5: GoogleFonts.dmSans(fontSize: 27, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.dmSans(
      fontSize: 22, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.dmSans(
      fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.dmSans(
      fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.dmSans(
      fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.dmSans(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.dmSans(
      fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.dmSans(
      fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.dmSans(
      fontSize: 11, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);

ColorScheme lessphoneLightColorScheme = ColorScheme.light().copyWith(
  primary: Colors.black,
  secondary: Colors.black,
  onPrimary: Colors.white,
  onSecondary: Colors.white,
  background: Colors.white,
  onBackground: Colors.black,
);
ColorScheme lessphoneDarkColorScheme = ColorScheme.dark().copyWith();

ThemeData buildLessphoneLightTheme() {
  return ThemeData.from(
      textTheme: lessphoneTextTheme.apply(
        bodyColor: lessphoneLightColorScheme.primary,
        displayColor: lessphoneLightColorScheme.primary,
      ),
      colorScheme: lessphoneLightColorScheme);
}
