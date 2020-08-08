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

enum LESSPHONE_THEMES { light, black, yellow, blue, wall }

ColorScheme lessphoneLightColorScheme = ColorScheme.light().copyWith(
  primary: Colors.black,
  primaryVariant: TWUIColors.gray.shade500,
  secondary: Colors.black,
  secondaryVariant: TWUIColors.gray.shade100,
  onPrimary: Colors.white,
  onSecondary: Colors.white,
  background: Colors.white,
  onBackground: Colors.black,
);

ColorScheme lessphoneDarkColorScheme = ColorScheme.dark().copyWith(
  primary: Colors.white,
  primaryVariant: TWUIColors.gray.shade300,
  secondary: Colors.white,
  secondaryVariant: TWUIColors.gray.shade500,
  onPrimary: Colors.black,
  onSecondary: Colors.black,
  background: Colors.black,
  onBackground: Colors.white,
);

ThemeData buildLessphoneLightTheme() {
  return ThemeData.from(
    textTheme: lessphoneTextTheme.apply(
      bodyColor: lessphoneLightColorScheme.primary,
      displayColor: lessphoneLightColorScheme.primary,
    ),
    colorScheme: lessphoneLightColorScheme,
  );
}

ThemeData buildLessphoneBlackTheme() {
  return ThemeData.from(
      textTheme: lessphoneTextTheme.apply(
        bodyColor: lessphoneDarkColorScheme.primary,
        displayColor: lessphoneDarkColorScheme.primary,
      ),
      colorScheme: lessphoneDarkColorScheme);
}

ThemeData buildLessphoneTheme(LESSPHONE_THEMES theme) {
  switch (theme) {
    case LESSPHONE_THEMES.light:
      return buildLessphoneLightTheme();
    case LESSPHONE_THEMES.black:
      return buildLessphoneBlackTheme();
    default:
      return buildLessphoneLightTheme();
  }
}
