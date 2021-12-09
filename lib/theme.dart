import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:google_fonts/google_fonts.dart';


ThemeData lightThemeData(BuildContext context) {
  return ThemeData.light().copyWith(
    primaryColor: C_PrimaryColor,
    scaffoldBackgroundColor: Colors.white,
    iconTheme: IconThemeData(color: C_ContentColorLightTheme),
    textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).apply(bodyColor: C_ContentColorLightTheme),
    colorScheme: ColorScheme.light(
      primary: C_PrimaryColor,
    )
  );
}


ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    primaryColor: C_PrimaryColor,
    scaffoldBackgroundColor: C_ContentColorDarkTheme,
    iconTheme: IconThemeData(color: C_ContentColorDarkTheme),
    textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme).apply(bodyColor: Colors.blue),
    colorScheme: ColorScheme.dark().copyWith(
      primary: C_PrimaryColor
    )
  );
}