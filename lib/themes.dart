import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

TextTheme lessphoneTextTheme = TextTheme(
  headline1: GoogleFonts.dmSans(
      fontSize: 103, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.dmSans(
      fontSize: 64, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.dmSans(fontSize: 51, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.dmSans(
      fontSize: 36, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headline5: GoogleFonts.dmSans(fontSize: 26, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.dmSans(
      fontSize: 21, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.dmSans(
      fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.dmSans(
      fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.dmSans(
      fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.dmSans(
      fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.dmSans(
      fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.dmSans(
      fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.dmSans(
      fontSize: 11, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);

ColorScheme lessphoneLightColorScheme = ColorScheme.light().copyWith(
  primary: Colors.black,
  primaryVariant: TWUIColors.gray.shade500,
  secondary: Colors.black,
  secondaryVariant: TWUIColors.gray.shade200,
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
