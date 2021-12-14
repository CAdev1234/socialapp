import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:google_fonts/google_fonts.dart';


ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: cPrimaryColor1,
    scaffoldBackgroundColor: Colors.white,
    iconTheme: const IconThemeData(color: cContentColorLightTheme),
    textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).apply(bodyColor: cContentColorLightTheme),
    colorScheme: const ColorScheme.light(
      primary: cPrimaryColor1,
    )
  );
}


ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: cPrimaryColor1,
    scaffoldBackgroundColor: cContentColorDarkTheme,
    iconTheme: const IconThemeData(color: cContentColorDarkTheme),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme).apply(bodyColor: Colors.blue),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: cPrimaryColor1
    )
  );
}