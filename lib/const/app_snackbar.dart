import 'dart:async';

import 'package:attendance/const/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildSnackbar {
  static Completer<void>? _snackbarCompleter;

  static Future<void> showSnackbar(BuildContext context, String message, {Color? backgroundColor = AppColor.primaryColor}) async {
    _snackbarCompleter = Completer<void>();

    ScaffoldMessengerState scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.showSnackBar(
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

    // Wait for the SnackBar to be dismissed
    await _snackbarCompleter!.future;
  }

  static void onSnackbarDismissed() {
    if (!_snackbarCompleter!.isCompleted) {
      _snackbarCompleter!.complete();
    }
  }
}
