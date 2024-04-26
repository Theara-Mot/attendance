import 'package:attendance/const/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildSnackbar {
  static void showSnackbar(BuildContext context, String message, {Color? backgroundColor = AppColor.primaryColor}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor, // Default background color is blue
        content: Text(
          message,
          style: GoogleFonts.notoSerifKhmer(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
