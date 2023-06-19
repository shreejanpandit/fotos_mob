import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static const Color primaryColor = Color(0xFF239DE9);
  static const Color secondaryColor = Color(0xFF2CABDD);
  static const Color otherColor1 = Color(0xFF014011);
  static const Color otherColor2 = Color(0xFFF2B705);
  static const Color otherColor3 = Color(0xFFF29F05);
  static const Color whiteTextColor = Color(0xFFFFFFFF);
  static const Color lightBlackTextColor = Color.fromARGB(255, 41, 39, 39);
  static const Color yellowColor = Color(0xFFF2B705);
  static const Color lightGreenColor = Color(0xFF39BF5E);
  static const Color faintGreenColor = Color(0xFF10B981);
  static const Color pinkColor = Color(0xFFE92382);
  static const Color lightRedColor = Color(0xFFFF0000);
  static const Color faintTextColor = Color(0xFF8F8F9D);

  static final TextStyle xSmall = GoogleFonts.poppins(
    fontSize: 12.0,
    height: 1.2,
    color: Colors.black,
  );

  static final TextStyle small = GoogleFonts.poppins(
    fontSize: 14.0,
    height: 1.2,
    color: Colors.black,
  );

  static final TextStyle base = GoogleFonts.poppins(
    fontSize: 16.0,
    height: 1.2,
    color: Colors.black,
  );

  static final TextStyle h1 = GoogleFonts.poppins(
    fontSize: 84.0,
    height: 1.0,
    color: Colors.black,
  );

  static final TextStyle h2 = GoogleFonts.poppins(
    fontSize: 76.0,
    height: 1.0,
    color: Colors.black,
  );

  static final TextStyle h3 = GoogleFonts.poppins(
    fontSize: 60.0,
    height: 1.0,
    color: Colors.black,
  );

  static final TextStyle h4 = GoogleFonts.poppins(
    fontSize: 48.0,
    height: 1.0,
    color: Colors.black,
  );

  static final TextStyle h5 = GoogleFonts.poppins(
    fontSize: 36.0,
    height: 1.0,
    color: Colors.black,
  );

  static final TextStyle h6 = GoogleFonts.poppins(
    fontSize: 24.0,
    height: 1.0,
    color: Colors.black,
  );

  static final ThemeData themeData = ThemeData(
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: secondaryColor),
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      bodyLarge: base,
      displayLarge: h1,
      displayMedium: h2,
      displaySmall: h3,
      headlineMedium: h4,
      headlineSmall: h5,
      titleLarge: h6,
      titleMedium: small,
      titleSmall: xSmall,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: primaryColor,
      textTheme: ButtonTextTheme.primary,
    ),
    appBarTheme: AppBarTheme(
      color: Colors.white,
      toolbarTextStyle: h6.copyWith(
        color: primaryColor,
      ),
      titleTextStyle: h6.copyWith(color: Colors.white),
    ),
  );
}
