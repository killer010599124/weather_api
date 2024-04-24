import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyle {
  // static  TextStyle heading = TextStyle(
  //   fontFamily: 'League Spartan',
  //   fontSize: 40.0,
  //   fontWeight: FontWeight.w700,
  //   letterSpacing: 0.0,
  // );

  static TextStyle heading = const TextStyle(
          fontFamily: 'League Spartan',
          fontWeight: FontWeight.w700,
          fontSize: 40,
          color: Colors.black)
      .merge(GoogleFonts.getFont('League Spartan'));

  static TextStyle smallHeading = const TextStyle(
          fontFamily: 'League Spartan',
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.0,
          color: Colors.white)
      .merge(GoogleFonts.getFont('League Spartan'));

  static TextStyle scanText = const TextStyle(
          fontFamily: 'Raleway',
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.0,
          color: Colors.white)
      .merge(GoogleFonts.getFont('Raleway'));

  static TextStyle emptyText = const TextStyle(
          fontFamily: 'Rubik',
          fontSize: 16.0,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.0,
          color: Colors.white)
      .merge(GoogleFonts.getFont('Rubik'));

  static TextStyle alertText = const TextStyle(
    fontFamily: "League Spartan",
    fontSize: 12.0,
    fontWeight: FontWeight.w700,
    height: 13.0 / 12.0,
    letterSpacing: 0.0,
  ).merge(GoogleFonts.getFont('League Spartan'));

  static TextStyle buttonText = const TextStyle(
          fontFamily: "Arimo",
          fontSize: 14.0,
          fontWeight: FontWeight.w700,
          height: 13.0 / 12.0,
          letterSpacing: 0.0,
          color: Colors.white)
      .merge(GoogleFonts.getFont('Arimo'));

  static TextStyle productName = const TextStyle(
    fontFamily: "League Spartan",
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.0,
    // color: Colors.white
  ).merge(GoogleFonts.getFont('League Spartan'));

  static TextStyle signText = const TextStyle(
          fontFamily: "League Spartan",
          fontSize: 48.0,
          fontWeight: FontWeight.w700,
          color: Colors.black)
      .merge(GoogleFonts.getFont('League Spartan'));

  static TextStyle priceText = const TextStyle(
          fontFamily: "Poppins",
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.0,
          color: Colors.white)
      .merge(GoogleFonts.getFont('Poppins'));

  static TextStyle printerCount = const TextStyle(
          fontFamily: "Poppins",
          fontSize: 36.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.0,
          color: Colors.white)
      .merge(GoogleFonts.getFont('Poppins'));

  static TextStyle operator = const TextStyle(
          fontFamily: "Poppins",
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.0,
          color: Colors.white)
      .merge(GoogleFonts.getFont('Poppins'));

  static TextStyle editText = const TextStyle(
    fontFamily: 'League Spartan',
    fontSize: 15,
    fontWeight: FontWeight.w700,
    // height: 17 / 15,
    letterSpacing: 0,
  ).merge(GoogleFonts.getFont('League Spartan'));

  static TextStyle body = const TextStyle(
    fontFamily: "League Spartan",
    fontSize: 20,
    fontWeight: FontWeight.w700,
    letterSpacing: 0,
  ).merge(GoogleFonts.getFont('League Spartan'));
}
