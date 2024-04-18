import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFont {

  static TextStyle verySmall({double? fontSize=9,FontWeight? fontWeight,Color? color=Colors.grey}) =>
  GoogleFonts.ubuntu(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color
  );

  static TextStyle small({double? fontSize=12,FontWeight? fontWeight,Color? color=Colors.black}) =>
  GoogleFonts.ubuntu(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color
  );
  static TextStyle smallBold({double? fontSize=12,FontWeight? fontWeight=FontWeight.w500,Color? color=Colors.black}) =>
  GoogleFonts.ubuntu(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color
  );

  static TextStyle medium({double? fontSize=12,FontWeight? fontWeight,Color? color}) =>
  GoogleFonts.ubuntu(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color
  );

  static TextStyle larg({double? fontSize=14,FontWeight? fontWeight,Color? color}) =>
  GoogleFonts.ubuntu(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color
  );
  static TextStyle largBold({double? fontSize=14,FontWeight? fontWeight= FontWeight.w500,Color? color}) =>
  GoogleFonts.ubuntu(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color
  );

  static TextStyle big({double? fontSize=16,FontWeight? fontWeight,Color? color}) =>
  GoogleFonts.ubuntu(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color
  );
}
