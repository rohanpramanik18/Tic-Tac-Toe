import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Design {
  static AppBar appBarData = AppBar(
    leading: Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 6.0, bottom: 6.0),
      child: Container(
        child: Image.asset("assets/images/logo.png"),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    ),
    title: Text(
      "Tic Tac Toe",
      style: GoogleFonts.alikeAngular(
        textStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w800,
        ),
      ),
      textScaleFactor: 1.4,
    ),
  );

  static Widget xFilled = Center(
    child: Text(
      "X",
      style: GoogleFonts.prompt(
        textStyle: TextStyle(
          fontSize: 75,
          fontWeight: FontWeight.w800,
          color: Colors.black,
        ),
      ),
    ),
  );

  static Widget oFilled = Center(
    child: Text(
      "O",
      style: GoogleFonts.prompt(
        textStyle: TextStyle(
          fontSize: 75,
          fontWeight: FontWeight.w800,
          color: Colors.black,
        ),
      ),
    ),
  );
}
