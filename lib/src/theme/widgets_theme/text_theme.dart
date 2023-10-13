import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    headline3: GoogleFonts.montserrat(
      color: Colors.black,
    ),
    subtitle2: GoogleFonts.poppins(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    bodyText1: GoogleFonts.lato(
      fontSize: 16,
      color: Colors.black,
    ),
    bodyText2: GoogleFonts.lato(
      fontSize: 14,
      color: Colors.black,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headline3: GoogleFonts.montserrat(
      color: Colors.white,
    ),
    subtitle2: GoogleFonts.montserrat(
      color: Colors.white54,
    ),
    bodyText1: GoogleFonts.lato(
      fontSize: 16,
      color: Colors.white,
    ),
    bodyText2: GoogleFonts.lato(
      fontSize: 16,
      color: Colors.white,
    ),
  );
}